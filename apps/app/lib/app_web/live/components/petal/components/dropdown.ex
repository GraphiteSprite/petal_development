defmodule AppWeb.Petal.Components.Dropdown do
  use AppWeb, :surface_component

  @moduledoc """
  A dropdown of links or buttons. Use with <DropdownMenuItem />.

  <Dropdown label="Dropdown">
    <DropdownMenuItem type="Button" label="Option 1" />
    <DropdownMenuItem type="Button" label="Option 2" />
    <DropdownMenuItem type="Button" label="Option 3" />
  </Dropdown>
  """

  @doc "Add a label if you want the dropdown trigger to be a button with a label. Blank if you want to use the 3 dots icon"
  prop label, :string

  @doc "CSS class on the outer div for margin or padding mostly"
  prop class, :css_class

  @doc "Only put <DropdownMenuItem /> inside this slot"
  slot default

  def render(assigns) do
    ~F"""
    <div
      x-data="{ open: false }"
      @keydown.escape.stop="open = false"
      @click.outside="open = false"
      class={"relative z-10 inline-block text-left", @class}
    >
      <div>
        {#if @label}
          <button
            type="button"
            class="inline-flex justify-center w-full px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"
            x-ref="button"
            @click="open = !open"
            aria-haspopup="true"
            x-bind:aria-expanded="open.toString()"
          >
            {@label}
            <svg class="w-5 h-5 ml-2 -mr-1" x-description="Heroicon name: solid/chevron-down" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
            </svg>
          </button>
        {#else}
          <button
            type="button"
            class="flex items-center text-gray-400 rounded-full hover:text-gray-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"
            id="options-menu"
            @click="open = !open"
            aria-haspopup="true"
            x-bind:aria-expanded="open.toString()"
          >
            <span class="sr-only">Open options</span>
            <svg
              class="w-5 h-5"
              x-description="Heroicon name: solid/dots-vertical"
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 20 20"
              fill="currentColor"
              aria-hidden="true"
            >
              <path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z" />
            </svg>
          </button>
        {/if}
      </div>
      <div
        x-show="open"
        x-transition:enter="transition ease-out duration-100"
        x-transition:enter-start="transform opacity-0 scale-95"
        x-transition:enter-end="transform opacity-100 scale-100"
        x-transition:leave="transition ease-in duration-75"
        x-transition:leave-start="transform opacity-100 scale-100"
        x-transition:leave-end="transform opacity-0 scale-95"
        class="absolute right-0 w-56 mt-2 origin-top-right bg-white rounded-md shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
        role="menu"
        aria-orientation="vertical"
        aria-labelledby="options-menu"
        style="display: none;"
      >
        <div class="py-1" role="none">
          <#slot />
        </div>
      </div>
    </div>
    """
  end
end
