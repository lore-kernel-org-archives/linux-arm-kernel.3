Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A8DC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 16:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itwqJx2tzman+sJPKbBqoRjHwiTIXUQ73v+2UV1gBF8=; b=QWciH/r+CBfQMwPHDztfvLPKn7
	8ClRUpmnAhE2WvzkcTlmjEPSQ6ZIaKF1gk+0Pusy6q7D+TO9VhVvfAwzRCf+zd5WcT5w9s5lPKT2V
	8T0lvrUihQg+MSFUFOKRy9CRPMC7cJFyaO5Nk2OdIivuBTv67KgcsPOE3YPrPuml0AteDYanObWdG
	RBUiuyYD6NlYNcX62pVQ1Wiavo0ya4SrBz0h9i4pbzxjJJwk/MJN+v0aqnbeRn0a/OkYgUX8xrlf+
	AAqtjnnvU/WeOYQx9yy3ejCuy0OdO3SGwRwk9snSfp+gtfUficobl9mbcui1pVzRGmJ8TVg3K6jTC
	Okl1/GIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb01z-0000000Cp2E-0vCB;
	Thu, 23 Jan 2025 16:26:11 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb00g-0000000Cou2-3jAk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 16:24:53 +0000
Message-ID: <46a7eba6-a705-4543-b967-e83ccc89e7d4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737649482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itwqJx2tzman+sJPKbBqoRjHwiTIXUQ73v+2UV1gBF8=;
	b=WICPg1uNcTyIIa143qvd7TIyaPFypFvnjpzy2TBctTOcb+kibsxGs0GtRCDR5mzy1ic0x5
	HxwPLGbYXF6KzWKNxsZtOgH/O2oXtnJYDciC/0Vs0N+Rv2rVZD/a02VOWGw/eL9mzWusBL
	F5Dd+yqZBd3Zd895GP44LkdQ38RmxQ8=
Date: Thu, 23 Jan 2025 11:24:36 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] dt-bindings: spi: zynqmp-qspi: Split the bus
To: David Lechner <dlechner@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-2-sean.anderson@linux.dev>
 <9f40295b-484a-48e8-b053-ff8550e589d7@baylibre.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <9f40295b-484a-48e8-b053-ff8550e589d7@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_082451_357940_97E01011 
X-CRM114-Status: GOOD (  30.32  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 1/21/25 19:16, David Lechner wrote:
> On 1/16/25 5:21 PM, Sean Anderson wrote:
>> This device supports two separate SPI busses: 
> 
> ...
> 
>> @@ -84,5 +94,32 @@ examples:
>>          resets = <&zynqmp_reset ZYNQMP_RESET_QSPI>;
>>          reg = <0x0 0xff0f0000 0x0 0x1000>,
>>                <0x0 0xc0000000 0x0 0x8000000>;
>> +
>> +        spi-lower {
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +          num-cs = <2>;
>> +          cs-gpios = <0>, <&gpio 5>;
>> +
>> +          flash@0 {
>> +            reg = <0>;
>> +            compatible = "jedec,spi-nor";
>> +          };
>> +
>> +          flash@1 {
>> +            reg = <1>;
>> +            compatible = "jedec,spi-nor";
>> +          };
>> +        };
>> +
>> +        spi-upper {
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          flash@0 {
>> +            reg = <0>;
>> +            compatible = "jedec,spi-nor";
>> +          };
>> +        };
>>        };
>>      };
> 
> In the IIO subsystem, we've been recently working on several "advanced" ADCs
> that could use a SPI controller like this. These ADCs have multiple input
> channels that perform conversions in parallel and the data for each channel
> needs to be read back on a separate serial line (MISO) at the same time. Another
> similar case is to have two separate chips, but they share a conversion trigger
> and essentially operate as a single composite device rather than two distinct
> devices [1]. This would be similar to some ADCs that are daisy-chained where we
> consider all of the chips in the chain as a single composite device, but they
> would be in parallel rather than chained.
> 
> [1]: https://lore.kernel.org/linux-iio/e5e8eba7-2455-488b-a36f-e246844e11fd@baylibre.com/
>
> For those use cases though, as mentioned above, we only have a single device
> that would be connected to both buses. So for such a SPI controller with
> multiple buses, I was envisioning that instead of adding child nodes for each
> of the child buses, that we would do something like add a spi-buses property
> to the spi peripheral bindings where you could specify one or more buses that
> a device was connected to.
> 
> e.g. a device connected to the lower bus would be spi-buses = <0>; one connected
> to the upper bus would be spi-buses = <1>; and a device connected to both would
> be spi-buses = <0>, <1>;.  This would also work for SPI controllers that have
> 4 or 8 busses.
> 
> SPI controllers like these have a striping feature that allows to control both
> buses at the same to either mirror the same data on both buses at the same
> time when writing, e.g. for configuration or to read and write two different
> bytes at the same time. A peripheral driver for device that was connected to
> both buses could make use of this feature to craft a single SPI message with
> transfers containing (new) parameters that specify which bus to use (one or
> both) and, in the case of using both buses, to mirror or stripe the data.
> 
> Could we make a single device connected to both buses like this work using
> the proposed spi-lower and spi-upper or should we consider a different binding
> like the one I suggested?

If you are willing to do the work to rewrite the SPI subsystem to handle
this, then I don't object to it in principle. Using a property would
also help with forwards compatibility. On the other hand, separate
busses are easier to implement since they integrate better with the SPI
subsystem (e.g. you can just call spi_register_controller to create all
the slaves).

There have been some previous patches from Xilinx to handle this
use case [1], but IMO they were pretty hacky. They got this feature
merged into U-Boot and it broke many other boards and took a lot of
cleanup to fix. So I have intentionally only tackled the unsynchronized
use case since that requires no modification to areas outside of this
driver. I don't need the "parallel" use case and I am not interested in
doing the work required to implement it.

--Sean

[1] https://lore.kernel.org/linux-spi/20221017121249.19061-1-amit.kumar-mahapatra@amd.com/

