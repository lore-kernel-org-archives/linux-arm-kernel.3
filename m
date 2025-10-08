Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD76CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BbUQ1sbIEiZdvednMpykwdPfppjg6kEPexbapnTXsE=; b=I1TjYF2WoRb2P4rzQhz0ahOJb3
	/gjtNhNxJ4FIIv/0UwckVATG21dYq4FgtdS/8XmKubPEO1giKta7zoMAvXRNujUV8145irxVWUlpz
	ezHDrlr5kJdFkc2SDf4gQkRtubalROlxM+MN5LSNh9+JM90z2+CibXbbdQvS/3HJrta3sKw51kfQ1
	xpQhYwdtVRmoqfkN4AK2FIScjgpderqSqhZZzPuDzbfgCKD3598JxsPIKFWcFTtP4LGtSfODXZNzb
	b9Mp5DtsSaQbcU5Fs9TCNA9FphbHq0oLw+7FrgDyN0n/OcnAFC1bCFn7HQUJ1RlEZLKcRZU7US/zj
	rs/0NBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Vst-000000046ay-18Zd;
	Wed, 08 Oct 2025 15:15:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Vsq-000000046ZP-0ImW;
	Wed, 08 Oct 2025 15:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759936512;
	bh=VdzRbghzx9tKG45gmYan50SlLliMvfwAY1/jwnx03WQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GCRBxZ6gEVeXI5Y4D5QXlQ1dTLzCttbxT8c6CUN0Bmux0aCaFpQhS04l3ergWCr9Y
	 PzieyrQymwBIP/zGk9GRt+u4UeRxj+BS4YBb5d3IL6Z8E6p0TWV9gWgBAj0wxeWu+Y
	 au9ujWJr7qyAjLTj8gvnrgxwcRu4PTXbny+L+lYOGy8V8E/+q0mWxFlVCyOUgdmknr
	 bXssCD00QO9a2NHHzamwOzwBHSZxbulmVCzQ9lrdGIczYiKW16eHCy8G8rUYW+pNzy
	 TSxVIs5Lz7SIPt0piguMyO6JufsHWZzqonvFJSBBWV6MKbmGKbeEdLvFopcrNpMoZE
	 ye+3RO44AhAHw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 41EB317E0DB7;
	Wed,  8 Oct 2025 17:15:11 +0200 (CEST)
Message-ID: <1c064a20-15bc-4e7d-ab76-bdbcc2a2465c@collabora.com>
Date: Wed, 8 Oct 2025 17:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/13] media: rockchip: rkcif: add support for mipi
 csi-2 capture
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-8-62d8a7b209b4@collabora.com>
 <rpaa2jspgmw3do5y367kq4pvvtpboeu7gjd4chmh6pgztmj6ar@ckh7jxvfuhlg>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <rpaa2jspgmw3do5y367kq4pvvtpboeu7gjd4chmh6pgztmj6ar@ckh7jxvfuhlg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_081516_625747_D6AB60C4 
X-CRM114-Status: GOOD (  33.20  )
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

Hi Mehdi,

On 8/19/25 18:46, Mehdi Djait wrote:
> Hi Michael,
> 
> I am seeing IOMMU page faults: See below.

Sorry for the late reply. I had to get a similar setup first. Now I have
a Radxa ROCK 3A and a Radxa Camera 8M (with the Sony IMX219 sensor,
should be 100% compatible to the RasPi Cam v2.1) on my table.

> On Tue, Aug 19, 2025 at 01:26:00AM +0200, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> The RK3568 Video Capture (VICAP) unit features a MIPI CSI-2 capture
>> interface that can receive video data and write it into system memory
>> using the ping-pong scheme. Add support for it.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> 
> [..]
> 
>>  irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
>>  {
>> +	struct device *dev = ctx;
>> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
>>  	irqreturn_t ret = IRQ_NONE;
>> +	u32 intstat;
>> +
>> +	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
>> +		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
>> +		struct rkcif_interface *interface = &rkcif->interfaces[index];
>> +
>> +		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
>> +		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
>> +
>> +		for (unsigned int j = 0; j < interface->streams_num; j++) {
>> +			struct rkcif_stream *stream = &interface->streams[j];
> 
> In the TRM you can see in the MIPI_INTSTAT interrupts to detect
> overflows: why not activate them ?
> 
> something like this:
> 
> #define RKCIF_MIPI_INT_Y_OVERFLOW(id)          BIT(16)
> #define RKCIF_MIPI_INT_UV_OVERFLOW(id)         BIT(17)
> #define RKCIF_MIPI_INT_FIFO_OVERFLOW(id)       BIT(18)
> #define RKCIF_MIPI_INT_CSI2RX_FIFO_OVERFLOW(id)        BIT(20)
> 
> and then OR them with the int_mask in rkcif_mipi_start_streaming()
> 
> and then you can log the err if something happened ?

I have not needed these interrupts yet. They can be added any time
whenever they are required. (Patches welcome :-))

>> +
>> +			if (intstat & RKCIF_MIPI_INT_FRAME0_END(stream->id) ||
>> +			    intstat & RKCIF_MIPI_INT_FRAME1_END(stream->id)) {
>> +				ret = IRQ_HANDLED;
>> +
>> +				if (stream->stopping) {
>> +					rkcif_mipi_stop_streaming(stream);
>> +					wake_up(&stream->wq_stopped);
>> +					continue;
>> +				}
>> +
>> +				rkcif_stream_pingpong(stream);
>> +			}
>> +		}
>> +	}
>>  
>>  	return ret;
>>  }
> 
> Now to the IOMMU page faults:
> 
> Camera Sensor: IMX219
> Frame Size: 1920x1080
> Format: SRGGB10P
> 
> Packed SRGGB10
> --> Every four consecutive samples are packed into 5 bytes
> --> Stride = 2400 bytes (1920 * 5/4)
> 
> So the imagesize = 1080 * 2400 = 2 592 000
> 
> in __vb2_buf_mem_alloc() the size of the buf will be PAGE_ALIGNED in:
> PAGE_ALIGN(vb->planes[plane].length);
> 
> So we allocate a buffer with the size: 2 592 768 -> hex = 0x297000
> 
> In rkcif_mipi_queue_buffer():
> We will queue a total of two buffers to the HW (2 because of pingpong)
> The first buffer will have the address: 0x00000000ffc00000
> 
> We start to capture and then this happens:
> 
> rk_iommu fdfe0800.iommu: Page fault at 0x00000000ffe79000 of type write
> rk_iommu fdfe0800.iommu: iova = 0x00000000ffe79000: dte_index: 0x3ff pte_index: 0x279 page_offset: 0x0
> rk_iommu fdfe0800.iommu: mmu_dte_addr: 0x0000000012cc8000 dte@0x0000000012cc8ffc: 0x11a0d001 valid: 1 pte@0x0000000011a0d9e4: 0x31b79006 valid: 0 page@0x0000000000000000 flags: 0x0
> 
> With:
> 0xffe79000 = 0xffc00000 (buffer address) + 0x297000 (buffersize)
> 
> --> So the VICAP is overflowing the buffer even though everything was
> correctly configured ?! (If I understood everything correctly ofc.)

I could reproduce this behavior and found that the (hardcoded) virtual
line width needs to be adjusted accordingly. It was set to width * 2,
and it needs to be set to width * 10 / 8.

> I also see the same problem with the SRGGB8 format. It also happens in
> the downstream Radxa/Rockchip Kernel.

Strange that the downstream kernel has issues with that. Anyway, this
shouldn't be the issue here...

> Do you see the same problem ?

... but I could reproduce this behavior as well and trace it back to the
same root cause. Here, we need width * 1, of course.

I'll integrate the fix in v12, please stay tuned!

Best regards,
Michael


