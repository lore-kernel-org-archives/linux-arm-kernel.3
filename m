Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A977DCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:To:References:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DAWkrc+N8tUJTGiRO0t0/nGYDS5HxyK1Gg23GVsX3k=; b=1v2qAiMVj4gq7L+U9o68fcFMmV
	HPUvl4kVBw9VjVw/7HezoKYx2PREo51T12lLD4w6+/X/B8aE1qJYfVn59vLdGfe0+UP9UXASiIgzX
	M++c4tHrE+hpVph9ARlfrQf6goRz17NghSwEuTcizVL6XYEKRuUNKKIFuMyjbgZ7TScGqxuHv6OyY
	eCQG1KLfi5WmIc/hAgcKtFD6ZWCicbh68witCw/OKoRza2lLcEeCgW0pmA37n04wwaQ7PVKMXIGns
	Zj24AtxLi0yVQWBIkzPC+Hplqs/CKSrQf+BTHLGz3KL/OSZNOjyYX+BP0Jjx34Ab50vN8L9vWqzzR
	d1maDJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78ZV-000000080Dx-2n7R;
	Fri, 10 Oct 2025 08:33:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78ZS-000000080D1-2AvV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 08:33:51 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v78Z3-0001WS-D9; Fri, 10 Oct 2025 10:33:25 +0200
Message-ID: <a97780fa-5261-44ed-b54d-fd699d3cbb82@pengutronix.de>
Date: Fri, 10 Oct 2025 10:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Subject: Re: [PATCH 00/16] media: platform: rga: Add RGA3 support
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
 <3c62e3c837d534ef5bc21a95ec1dc408c38cb8a0.camel@ndufresne.ca>
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
In-Reply-To: <3c62e3c837d534ef5bc21a95ec1dc408c38cb8a0.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_013350_722064_F7068FDD 
X-CRM114-Status: GOOD (  37.20  )
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

Hi Nicolas,

On 10/7/25 8:06 PM, Nicolas Dufresne wrote:
> Hi,
>
> Le mardi 07 octobre 2025 à 10:31 +0200, Sven Püschel a écrit :
>> This series adds support for the Raster Graphic Acceleration 3 (RGA3)
>> peripheral, which is included in the RK3588 SoC. Unlike the RGA2 it
>> can use the existing rockchip-iommu-v2 driver to handle iommu mappings.
>> Also the RK3588 contains two independent RGA3 cores.
> Thanks for working on this.
>
>> Only scaling and format conversions between common 8bit RGB/YUV formats
>> are implemented. Also the color space conversion is fixed to BT601F.
>> This already allows a practical usage of the RGA3.
> This seems quite limiting, can we expect an update on this, can't be that hard
> to fully implement.

Sorry, but currently there is no need to have a fully featured 
implementation from our side. As the datasheet mentions that the RGA3 
should do 4 or 2 pixel/cycle depending on the operation

>> This was tested on a Radxa Rock 5T. With the increased clock speeds in
>> the devicetree around 160 fps were measured when scaling and converting
> This is quite vague, I've checked the patch and you didn't extend either there.
> Is that an overclock or was it miss-configured ? Does RK implement a devfreq ?
> Should that be moved with a voltage adjustement ? Is there any thermal nearby we
> should monitor ?

This is mainly the result of a very low performance in the initial 
testing. We were quite disappointed looking at 30 fps output. The 
datasheet mentions the core should do 2 or 4 pixel/cycle, so we looked 
if the clock speed could be increased. The TRM Part1 mentions that the 
RGA3 clock uses a default divider of 2, so I've tweaked the dtsi to 
avoid the clock divider and run it on the fastest clock.

But this tweaking only increased the frame rate to around 36fps. After 
some brainstorming and testing we found the culprit being the 
RGA3_WR_SW_OUTSTANDING_MAX value in the command. With this value maxed 
out and without the clock tweaks I've got around 80fps. As the clock 
increase resulted in the expected doubling of the fps and my few tests 
worked, I've included it in the patch set.

I haven't done any stress testing and don't mind to remove the clock 
speed adjustments from the dtsi.

>> from RGBA 480x360 to NV12 3840x2160. Without the clock speed scaling a
>> default clock division factor of 2 is used and only around 80 fps are
>> reached with one core. The v4l2-compliance tests only complain about
>> the already failing colorspace propagation:
> Did you do any more format testing to validation all supported combinations ?
> This is a tool [0] you can use to test this using GStreamer and how to use it
> [1].

Thanks for the link!

I've did some simple format conversion tests with a static test pattern.

The tests mainly converts any combination of RGB/YUV formats (hope I 
didn't miss anything) to each other. Then I convert it back to rgba with 
gstreamer and compare it's hash.

For scaling I've just tested one upscale, downscale and scale to a non 
aligned width/height.

> [0]https://gitlab.collabora.com/mediatek/aiot/lava-test-definitions/-/tree/main/avvideocompare?ref_type=heads
> [1]https://gitlab.collabora.com/mediatek/aiot/linux/-/blob/mediatek-next/.gitlab-ci.yml?ref_type=heads#L282
>>    v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>>    ...
>>    		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() !=
>> col
>>    	test VIDIOC_S_FMT: FAIL
>>    ...
>>    Total for rockchip-rga device /dev/video0: 47, Succeeded: 46, Failed: 1,
>> Warnings: 0
>>
>>    v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>>    ...
>>    		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() !=
>> col
>>    	test VIDIOC_S_FMT: FAIL
>>    ...
>>    Total for rockchip-rga device /dev/video1: 47, Succeeded: 46, Failed: 1,
>> Warnings: 0
>>
>>    v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>>    ...
>>    		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() !=
>> col
>>    	test VIDIOC_S_FMT: FAIL
>>    ...
>>    Total for rockchip-rga device /dev/video2: 47, Succeeded: 46, Failed: 1,
>> Warnings: 0
>>
>> Each RGA core is a separate /dev/video device. To distinguish the RGA2
>> core from the RGA3 cores the Card type is set accordingly. Combining all
>> cores into a single device and scheduling tasks to the best core might
>> be a future improvement, if it is desired by upstream to handle the
>> scheduling and selection in kernel space.
> It took me some time to understand why you spoke about multicore here. You
> forgot to say here that you add RGA3 into RGA2 driver. Some information on why
> you went that path instead of a separate driver.

Mostly as I've started by using the rga driver as a basis and just 
adjusted the command stream and register values to the RGA3. I was 
unsure, if I should create a separate driver.
As it didn't seem unfeasible to have the existing driver handle both 
units, I've decided to add it to the existing driver to avoid code 
duplication.

But looking at your comments about the wrong announcement of e.g. color 
space conversion, I now think that a new driver is probably better to 
avoid adding too much of the differences to the struct.

>  From high level view, I don't think its a good idea to multi-plex over
> heterogeneous core. They may not even produce the exact same pixels for the same
> operation. They also don't share the same MMU, and at first glance, the use of
> rkiommu in RGA3 means it can no longer handle CPU cache (though I don't know if
> this is implemented/supported in upstream RGA2 driver).

Thanks for the insight. This gives me another reason to create a 
separate driver. I'll probably also look into multiplexing the 2 RGA3 
cores to only expose one RGA3 video device to userspace (the current 
implementation exposes both cores individually to the userspace)

Sincerely

     Sven

>> Patch 1-2 are general cleanups
>> Patch 3-12 prepare the rga driver for the RGA3
>> Patch 13 documments the RGA3 compatible value
>> Patch 14 adds the RGA3 cores to the rk3588 dtsi
>> Patch 15 increases the RGA3 core clock speeds
>> Patch 16 adds RGA3 support to the rga driver
>>
>> Signed-off-by: Sven Püschel<s.pueschel@pengutronix.de>
>> ---
>> Sven Püschel (16):
>>        media: rockchip: rga: use clk_bulk api
>>        media: rockchip: rga: use stride for offset calculation
>>        media: rockchip: rga: align stride to 16 bytes
>>        media: rockchip: rga: move hw specific parts to a dedicated struct
>>        media: rockchip: rga: use card type to specify rga type
>>        media: rockchip: rga: change offset to dma_addresses
>>        media: rockchip: rga: support external iommus
>>        media: rockchip: rga: remove size from rga_frame
>>        media: rockchip: rga: remove stride from rga_frame
>>        media: rockchip: rga: move rga_fmt to rga-hw.h
>>        media: rockchip: rga: add iommu restore function
>>        media: rockchip: rga: handle error interrupt
>>        media: dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga3
>>        arm64: dts: rockchip: add rga3 dt nodes
>>        arm64: dts: rockchip: increase rga3 clock speed
>>        media: rockchip: rga: add rga3 support
>>
>>   .../devicetree/bindings/media/rockchip-rga.yaml    |   1 +
>>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  50 +++
>>   drivers/media/platform/rockchip/rga/Makefile       |   2 +-
>>   drivers/media/platform/rockchip/rga/rga-buf.c      |  78 ++--
>>   drivers/media/platform/rockchip/rga/rga-hw.c       | 356 ++++++++++++---
>>   drivers/media/platform/rockchip/rga/rga-hw.h       |  15 +-
>>   drivers/media/platform/rockchip/rga/rga.c          | 404 ++++++-----------
>>   drivers/media/platform/rockchip/rga/rga.h          |  74 ++--
>>   drivers/media/platform/rockchip/rga/rga3-hw.c      | 490
>> +++++++++++++++++++++
>>   drivers/media/platform/rockchip/rga/rga3-hw.h      | 186 ++++++++
>>   10 files changed, 1246 insertions(+), 410 deletions(-)
>> ---
>> base-commit: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
>> change-id: 20251001-spu-rga3-8a00e018b120
>>
>> Best regards,

