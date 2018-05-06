defmodule FastimageTest do
  use ExUnit.Case, async: true
  doctest Fastimage

  @expected_jpeg_size %Fastimage.Dimensions{
    width: 283,
    height: 142,
    channels: 3,
    bits_per_pixel: 24
  }
  @expected_png_size %Fastimage.Dimensions{
    width: 283,
    height: 142,
    channels: 3,
    bits_per_pixel: 24
  }
  @expected_png_alpha_size %Fastimage.Dimensions{
    width: 544,
    height: 184,
    channels: 4,
    bits_per_pixel: 32
  }
  @expected_gif_size %Fastimage.Dimensions{
    width: 283,
    height: 142,
    channels: nil,
    bits_per_pixel: 8
  }
  @expected_bmp_size %Fastimage.Dimensions{
    width: 283,
    height: 142,
    channels: nil,
    bits_per_pixel: 24
  }

  @fastimage_task_timeout 3_000

  @jpg_url "https://raw.githubusercontent.com/stephenmoloney/fastimage/master/priv/test.jpg"
  @jpg_url_with_query "https://avatars0.githubusercontent.com/u/12668653?v=2&s=40"
  @jpg_with_redirect "http://seanmoloney.com/images/cover1.jpg"
  @png_url "https://raw.githubusercontent.com/stephenmoloney/fastimage/master/priv/test.png"
  @gif_url "https://raw.githubusercontent.com/stephenmoloney/fastimage/master/priv/test.gif"
  @bmp_url "https://raw.githubusercontent.com/stephenmoloney/fastimage/master/priv/test.bmp"

  @jpg_file "./priv/test.jpg"
  @png_file "./priv/test.png"
  @gif_file "./priv/test.gif"
  @bmp_file "./priv/test.bmp"

  @jpg_binary File.read!("./priv/test.jpg")
  @png_binary File.read!("./priv/test.png")
  @png_alpha_binary File.read!("./priv/googlelogo_color_272x92dp.png")
  @gif_binary File.read!("./priv/test.gif")
  @bmp_binary File.read!("./priv/test.bmp")

  @tag :jpeg
  test "Get type and size of remote jpeg url" do
    actual_type = Fastimage.type(@jpg_url)
    actual_size = Fastimage.size(@jpg_url)

    expected_type = {:ok, :jpeg}
    expected_size = {:ok, @expected_jpeg_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote image with query in url" do
    actual_type = Fastimage.type(@jpg_url_with_query)
    expected_type = {:ok, :jpeg}

    actual_size = Fastimage.size(@jpg_url_with_query)

    expected_size =
      {:ok, %Fastimage.Dimensions{width: 40, height: 40, channels: 3, bits_per_pixel: 24}}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local jpeg file" do
    actual_type = Fastimage.type(@jpg_file)
    actual_size = Fastimage.size(@jpg_file)

    expected_type = {:ok, :jpeg}
    expected_size = {:ok, @expected_jpeg_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of a binary jpeg object" do
    actual_type = Fastimage.type(@jpg_binary)
    actual_size = Fastimage.size(@jpg_binary)

    expected_type = {:ok, :jpeg}
    expected_size = {:ok, @expected_jpeg_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote png url" do
    actual_type = Fastimage.type(@png_url)
    actual_size = Fastimage.size(@png_url)

    expected_type = {:ok, :png}
    expected_size = {:ok, @expected_png_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local png file" do
    actual_type = Fastimage.type(@png_file)
    actual_size = Fastimage.size(@png_file)

    expected_type = {:ok, :png}
    expected_size = {:ok, @expected_png_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of binary png object" do
    actual_type = Fastimage.type(@png_binary)
    actual_size = Fastimage.size(@png_binary)

    expected_type = {:ok, :png}
    expected_size = {:ok, @expected_png_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of binary png with alpha object" do
    actual_type = Fastimage.type(@png_alpha_binary)
    actual_size = Fastimage.size(@png_alpha_binary)

    expected_type = {:ok, :png}
    expected_size = {:ok, @expected_png_alpha_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote gif url" do
    actual_type = Fastimage.type(@gif_url)
    actual_size = Fastimage.size(@gif_url)

    expected_type = {:ok, :gif}
    expected_size = {:ok, @expected_gif_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local gif file" do
    actual_type = Fastimage.type(@gif_file)
    actual_size = Fastimage.size(@gif_file)

    expected_type = {:ok, :gif}
    expected_size = {:ok, @expected_gif_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of a binary gif object" do
    actual_type = Fastimage.type(@gif_binary)
    actual_size = Fastimage.size(@gif_binary)

    expected_type = {:ok, :gif}
    expected_size = {:ok, @expected_gif_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote bmp url" do
    actual_type = Fastimage.type(@bmp_url)
    actual_size = Fastimage.size(@bmp_url)

    expected_type = {:ok, :bmp}
    expected_size = {:ok, @expected_bmp_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local bmp file" do
    actual_type = Fastimage.type(@bmp_file)
    actual_size = Fastimage.size(@bmp_file)

    expected_type = {:ok, :bmp}
    expected_size = {:ok, @expected_bmp_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of a binary bmp object" do
    actual_type = Fastimage.type(@bmp_binary)
    actual_size = Fastimage.size(@bmp_binary)

    expected_type = {:ok, :bmp}
    expected_size = {:ok, @expected_bmp_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get the size of multiple image files synchronously" do
    list_results =
      list()
      |> Enum.map(fn image -> Kernel.elem(Fastimage.size(image), 1) end)

    assert(list_results, list_expected_results())
  end

  test "Get the size of multiple image files asynchronously" do
    list_results =
      list()
      |> Enum.map(&Task.async(Fastimage, :size, [&1]))
      |> Enum.map(&handle_task/1)

    assert(list_results, list_expected_results())
  end

  test "Get the size of an image behind a redirect" do
    actual_size = Fastimage.size(@jpg_with_redirect)
    expected_size = {:ok, %Fastimage.Dimensions{width: 1200, height: 1230, channels: 24}}

    assert(actual_size == expected_size)
  end

  # private

  defp list do
    Enum.reduce(1..10, [], fn _i, acc ->
      Enum.concat(acc, [
        @jpg_url,
        @jpg_url_with_query,
        @jpg_with_redirect,
        @png_url,
        @gif_url,
        @bmp_url
      ])
    end)
  end

  defp list_expected_results do
    result = [
      %Fastimage.Dimensions{width: 283, height: 142, channels: 24},
      %Fastimage.Dimensions{width: 40, height: 40, channels: 24},
      %Fastimage.Dimensions{width: 1200, height: 1230, channels: 24},
      %Fastimage.Dimensions{width: 283, height: 142, channels: 24},
      %Fastimage.Dimensions{width: 283, height: 142, channels: 24},
      %Fastimage.Dimensions{width: 283, height: 142, channels: 24}
    ]

    Enum.reduce(1..10, [], fn _i, acc ->
      Enum.concat(acc, result)
    end)
  end

  defp handle_task(task) do
    with {:ok, {:error, error}} <-
           Task.yield(task, @fastimage_task_timeout) || Task.shutdown(task) do
      {:error, error}
    else
      {:ok, val} ->
        val

      other ->
        other
    end
  end
end
