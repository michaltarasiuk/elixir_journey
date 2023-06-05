defmodule ElixirJourney.Challenges.FirstOfJune2023.ForumTask do
  @trades %{
    "3QvxP6YFBKpWJSMAfYtL8Niv8KmmKsnpb9uQwQpg8QN2" => [
      %{
        asset: "3QvxP6YFBKpWJSMAfYtL8Niv8KmmKsnpb9uQwQpg8QN2",
        last_price: 0.09019287,
        priced_in: "WAVES",
        volume: 13918.3182330112
      },
      %{
        asset: "3QvxP6YFBKpWJSMAfYtL8Niv8KmmKsnpb9uQwQpg8QN2",
        last_price: 0.1313214,
        priced_in: "DG2xFkPdDwKUoBkzGAhQtLpSGzfXLiCYPEzeKH2Ad24p",
        volume: 9986.99466236054
      },
      %{
        asset: "3QvxP6YFBKpWJSMAfYtL8Niv8KmmKsnpb9uQwQpg8QN2",
        last_price: 1.268e-5,
        priced_in: "8LQW8f7P5d5PZM7GtZEBgaqRPGSzS3DfPuiXrURJ4AJS",
        volume: 9786.93694331709
      }
    ],
    "474jTeYx2r2Va35794tCScAXWJG9hU2HcgxzMowaZUnu" => [
      %{
        asset: "474jTeYx2r2Va35794tCScAXWJG9hU2HcgxzMowaZUnu",
        last_price: 192.01,
        priced_in: "WAVES",
        volume: 137_852.319057268
      },
      %{
        asset: "474jTeYx2r2Va35794tCScAXWJG9hU2HcgxzMowaZUnu",
        last_price: 279.152165,
        priced_in: "DG2xFkPdDwKUoBkzGAhQtLpSGzfXLiCYPEzeKH2Ad24p",
        volume: 77018.2552159809
      },
      %{
        asset: "474jTeYx2r2Va35794tCScAXWJG9hU2HcgxzMowaZUnu",
        last_price: 0.02768054,
        priced_in: "8LQW8f7P5d5PZM7GtZEBgaqRPGSzS3DfPuiXrURJ4AJS",
        volume: 38723.9182969945
      },
      %{
        asset: "474jTeYx2r2Va35794tCScAXWJG9hU2HcgxzMowaZUnu",
        last_price: 459.22,
        priced_in: "Ft8X1v1LTa1ABafufpaCWyVj8KkaxUWE6xBhW6sNFJck",
        volume: 513.413421879477
      }
    ],
    "4LHHvYGNKJUg5hj65aGD5vgScvCBmLpdRFtjokvCjSL8" => [
      %{
        asset: "4LHHvYGNKJUg5hj65aGD5vgScvCBmLpdRFtjokvCjSL8",
        last_price: 0.05171444,
        priced_in: "WAVES",
        volume: 14110.9296573005
      },
      %{
        asset: "4LHHvYGNKJUg5hj65aGD5vgScvCBmLpdRFtjokvCjSL8",
        last_price: 7.5e-6,
        priced_in: "8LQW8f7P5d5PZM7GtZEBgaqRPGSzS3DfPuiXrURJ4AJS",
        volume: 9722.17123718049
      },
      %{
        asset: "4LHHvYGNKJUg5hj65aGD5vgScvCBmLpdRFtjokvCjSL8",
        last_price: 0.075459,
        priced_in: "DG2xFkPdDwKUoBkzGAhQtLpSGzfXLiCYPEzeKH2Ad24p",
        volume: 8482.23199810624
      }
    ]
  }

  def solution do
    excluded = [
      "DG2xFkPdDwKUoBkzGAhQtLpSGzfXLiCYPEzeKH2Ad24p",
      "8LQW8f7P5d5PZM7GtZEBgaqRPGSzS3DfPuiXrURJ4AJS",
      "2tR9EKvDPMThfrFSb96CSBGYNwNPtzwkGcdhQjv4dVoj"
    ]

    # %{
    #   "3QvxP6YFBKpWJSMAfYtL8Niv8KmmKsnpb9uQwQpg8QN2" => [
    #     %{
    #       asset: "3QvxP6YFBKpWJSMAfYtL8Niv8KmmKsnpb9uQwQpg8QN2",
    #       last_price: 0.09019287,
    #       priced_in: "WAVES",
    #       volume: 13918.3182330112
    #     }
    #   ],
    #   "474jTeYx2r2Va35794tCScAXWJG9hU2HcgxzMowaZUnu" => [
    #     %{
    #       asset: "474jTeYx2r2Va35794tCScAXWJG9hU2HcgxzMowaZUnu",
    #       last_price: 192.01,
    #       priced_in: "WAVES",
    #       volume: 137_852.319057268
    #     },
    #     %{
    #       asset: "474jTeYx2r2Va35794tCScAXWJG9hU2HcgxzMowaZUnu",
    #       last_price: 459.22,
    #       priced_in: "Ft8X1v1LTa1ABafufpaCWyVj8KkaxUWE6xBhW6sNFJck",
    #       volume: 513.413421879477
    #     }
    #   ],
    #   "4LHHvYGNKJUg5hj65aGD5vgScvCBmLpdRFtjokvCjSL8" => [
    #     %{
    #       asset: "4LHHvYGNKJUg5hj65aGD5vgScvCBmLpdRFtjokvCjSL8",
    #       last_price: 0.05171444,
    #       priced_in: "WAVES",
    #       volume: 14110.9296573005
    #     }
    #   ]
    # }

    Enum.reduce(@trades, %{}, fn {k, l}, acc ->
      Map.put(acc, k, Enum.reject(l, &(&1.priced_in in excluded)))
    end)
  end
end
