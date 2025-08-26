Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA192CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtlWd1f4QUk/q9tiYzSXCRAuxQq8+9vZ8gqlgXf6znc=; b=UL2JSfyN6AOtx60t+GUxoihvv9
	qIvL1zrjEMSRaSJN7XdmI671JZTz2Kc1R1Z8lpSssorc6ge8y3HK7/0TzB27pmqbM1mFeucqfzBTs
	xLgootXCjkso43GtW4TSocGSo2oUswnIUfi/LZ0XlpgjXk34qFma1hU5fasB3i9dES7JmnGgm5O1a
	Um9RrRlSjTauENpaNPDQ6Ee0++rmCDiwNvxqpiUVE4rEKLHpe5KGe4brqbVwcJfYJ/jOHex9WgdgV
	utR8j4LqJyZhNOs+lE2fRxkk6Mx8CirQNhtO00wF0N6c32Ki4sGxtvZ6cKapkTJhny3gUFNKymA4c
	puFDz54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpQZ-0000000B7xZ-1dSA;
	Tue, 26 Aug 2025 08:53:15 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpNs-0000000B6rr-0tNZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 08:50:29 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57Q8o8xO1495853;
	Tue, 26 Aug 2025 03:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756198208;
	bh=PtlWd1f4QUk/q9tiYzSXCRAuxQq8+9vZ8gqlgXf6znc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VrlNHF/QXyWUAw6cin7+412iuqD//LNrxFYQIaU1U5tq+gc1sJyu/JpqQHVxErlf9
	 evXt5zCBk+izDndKmqr8ROQxXaq8LYGLFvAuw6gM6d4nrundzafzkB0B5fcQ0fYs90
	 2f2pBp+kWoL3o1kwPRe3zYizD+nMkry2MznZC9ek=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57Q8o5mk1556543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 26 Aug 2025 03:50:05 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 26
 Aug 2025 03:50:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 26 Aug 2025 03:50:05 -0500
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57Q8nwfm1163034;
	Tue, 26 Aug 2025 03:49:58 -0500
Message-ID: <3bdc9ef0-d5a6-4836-b3b1-c0114aa330f6@ti.com>
Date: Tue, 26 Aug 2025 14:19:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/4] Add support for VIP
To: Hans Verkuil <hverkuil+cisco@kernel.org>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <ea673976-49a6-44f6-8e6c-8d11abe46620@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <ea673976-49a6-44f6-8e6c-8d11abe46620@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_015028_337760_4DD1A4B1 
X-CRM114-Status: GOOD (  25.94  )
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

Hi Hans,
Thanks for the review.

On 25/08/25 20:04, Hans Verkuil wrote:
> Hi Yemike,
> 
> On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:
>> This patch series add support for the TI VIP video capture engine.
>> VIP stands for Video Input Port, it can be found on devices such as
>> DRA7xx and provides a parallel interface to a video source such as
>> a sensor or TV decoder.
>>
>> Each VIP can support two inputs (slices) and a SoC can be configured
>> with a variable number of VIP's. Each slice can support two ports
>> each connected to its own sub-device.
>>
>> The first patch in this series updates the outdated MAINTAINERS entry
>> for the TI VPE and CAL drivers. The subsequent three patches introduce
>> support for the TI VIP (Video Input Port) driver.
> 
> I'll pick up the MAINTAINERS patch, but the others need more work, so
> v3 is needed for that.
> 

Thanks, I am working on v3. I plan to incorporate the additional
feedback you provided on the driver before submitting the v3.

>>
>> Link for v1: https://lore.kernel.org/all/20200522225412.29440-1-bparrot@ti.com/
>> The v1 patch series was posted in the year 2020. This v2 series resumes the
>> effort to upstream VIP support by addressing all previous review comments
>>
>> Changelog:
>> Changes in v2:
>> - Remove array and just use hsync: true in bindings (Patch 3/5)
>> - Remove array and use enum for bus width in bindings (Patch 3/5)
>> - Use pattern properties since properties across ports are same (Patch 3/5)
>> - Remove vip_dbg, vip_info, vip_err aliases and just use v4l2_dbg, v4l2_info
>>    and v4l2_err instead (Patch 4/5)
>> - Remove color space information from vip_formats struct (Patch 4/5)
>> - Use g_std instead of g_std_output (Patch 4/5)
>> - Do not touch pix.priv (Patch 4/5)
>> - Remove all comments with just register values (Patch 4/5)
>> - Remove support for vidioc_default ioctl (Patch 4/5)
>> - In case of any error while streaming, push all pending buffers to vb2 (Patch 4/5)
>> - Address some minor comments made by Hans throughout the driver (Patch 4/5)
>> - Update copyright year at various places
>>
>> v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/b0791cb465fadc11d4c995197cb22f29
> 
> Also run v4l2-compliance with the -s option to check compliance while streaming.
> 

Thanks for pointing this out. Will run as part of v3.

Thanks and Regards,
Yemike Abhilash Chandra

> Regards,
> 
> 	Hans
> 
>>
>> v4l2-compliance cropping and composing tests are failing likely
>> due to OV10635 sensor supporting several discrete frame sizes,
>> fail: v4l2-test-formats.cpp(1560): node->frmsizes_count[pixfmt] > 1
>>
>> Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/98504ab56416aef38b851036aef5eeb1
>>
>> Dale Farnsworth (2):
>>    dt-bindings: media: ti: vpe: Add bindings for Video Input Port
>>    media: ti-vpe: Add the VIP driver
>>
>> Yemike Abhilash Chandra (2):
>>    MAINTAINERS: Update maintainers of TI VPE and CAL
>>    Revert "media: platform: ti: Remove unused vpdma_update_dma_addr"
>>
>>   .../devicetree/bindings/media/ti,vip.yaml     |  211 +
>>   MAINTAINERS                                   |    3 +-
>>   drivers/media/platform/ti/Kconfig             |   13 +
>>   drivers/media/platform/ti/vpe/Makefile        |    2 +
>>   drivers/media/platform/ti/vpe/vip.c           | 3824 +++++++++++++++++
>>   drivers/media/platform/ti/vpe/vip.h           |  719 ++++
>>   drivers/media/platform/ti/vpe/vpdma.c         |   32 +
>>   drivers/media/platform/ti/vpe/vpdma.h         |    3 +
>>   8 files changed, 4806 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
>>   create mode 100644 drivers/media/platform/ti/vpe/vip.c
>>   create mode 100644 drivers/media/platform/ti/vpe/vip.h
>>
> 


