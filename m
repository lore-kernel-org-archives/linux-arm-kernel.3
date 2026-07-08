Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B908C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zN2oUR8BAiRUPpmi+aVokh9lPchc4FxbHbJed38llJA=; b=g+jUiuFsSa1/JGF76v6SfoHPtC
	SME3qVvjPA2RseY7P0ve0qacSs27QliyyN0NhI9uNa3ERp6YfNj5m2gGftXG6xjJsb4be4X6/sZ5i
	1ouDRMHbUasErpHwtZdNp+numZHtjvAsLy0AmVjC4Dg76hn66i4FaqBLrw1p/3cNWDsxtCReOKqCR
	ivUbGC7w9GJvG8BUU49ur1BIGlKS2f1uCRyeGXWjUfcloF3cDdzsIClgkaz4Row/M10IUDXLG4aAU
	uY4FP6ULDrfejrIxpmCamK60aW5R3WOVn33NFhWuC6H14l1NxI4LRq8n+0Et4bOAGkrFNucJZZYzq
	dh/1Wbcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUoX-0000000HZ1Q-2Njn;
	Wed, 08 Jul 2026 16:07:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUoU-0000000HYzk-2ySB;
	Wed, 08 Jul 2026 16:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783526871;
	bh=LLe4ZfwptTpf0NWitnBIO04oMxVgHdZxrrmVHykXx0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SOlau34c6QE620EznPcJ0xr0xPA24/oz7+z5o3T+l8V2P9wCG5jkHP5XJUWuJvICD
	 LEJceHjcaIr3ka+gQPqfMml43CkkQrTOcUmwLEmZxLvunbJ3M2KVCCRlY7ghzu/kcC
	 1laSSsXCU6SjRocHxoGFmPCxaaNy7GUF1lcTkmpsFMRi/KoFrwHr8lB2Hd7uZEXQui
	 vXECFWFoQe4TKHXyoxbQ+MfVV/UV2QqH+bVFB3jBUlKisKVLbG5f9bVUIkxKupZJHB
	 pR9Fxmg4405I+WSZtjfnQHWbhtHQhXTNDHLtUsGL2YDLlzMlfurmRs5Y8PNM3vYaTX
	 qh6j45v0wwilw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D84D17E05D3;
	Wed, 08 Jul 2026 18:07:50 +0200 (CEST)
Message-ID: <eb16fada-f33f-47cc-98c9-2c2bfa91b4c5@collabora.com>
Date: Wed, 8 Jul 2026 19:07:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/39] Add HDMI 2.0 support to DW HDMI QP TX
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, daniels@collabora.com,
 dave.stevenson@raspberrypi.com, diederik@cknow-tech.com,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, kernel-list@raspberrypi.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, luca.ceresoli@bootlin.com,
 maarten.lankhorst@linux.intel.com, mcanal@igalia.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <VI0P189MB368755F862D5D09583250AA3E3F12@VI0P189MB3687.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <VI0P189MB368755F862D5D09583250AA3E3F12@VI0P189MB3687.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_090754_913559_4C182BE8 
X-CRM114-Status: GOOD (  14.34  )
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

On 7/6/26 11:33 AM, Maud Spierings wrote:
>> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) on the Synopsys DW HDMI QP
>> TX controller, as found in Rockchip RK3576 & RK3588 SoCs, by adding SCDC
>> management for high TMDS clock ratio and scrambling.
>>
>> Since SCDC state is lost on sink disconnects, the bridge driver needs to
>> trigger a CRTC reset during connector detection.  To support this, the
>> series introduces the connector and bridge scrambling infrastructure
>> (patches 1-8), wires it up through the bridge connector layer with an
>> atomic-aware detect_ctx hook (patches 9-11), then implements the SCDC
>> scrambling feature in the DW HDMI QP bridge driver (patches 12-15).
>>
>> Patches 16-18 are minor cleanups in the Rockchip platform driver.
>> Patches 19-23 improve HPD handling by deferring IRQ registration until
>> the connector is fully initialized, adding .enable_hpd()/.disable_hpd()
>> PHY ops, and restricting HPD events to the affected connector.
>>
>> Patches 24-25 convert vc4 HDMI to the common SCDC scrambling helpers as
>> a proof of reuse, replacing the driver-local scrambling implementation.
>>
>> Patches 26-30 add KUnit tests: connector scrambler validation, a new
>> 4K@60Hz 600MHz EDID, hdmi_state_helper scrambling tests, and EDID
>> conformity fixes for some of the existing test blobs.
>>
>> This has been tested on the following boards:
>>
>> * Radxa ROCK 5B (RK3588)
>> * Radxa ROCK 4D (RK3576)
>> * Raspberry Pi 5 Model B Rev 1.1 (BCM2712 D0)
>>
>> Note that commit d87773de9efe1 ("clocksource/drivers/arm_arch_timer:
>> Default to EL2 virtual timer when running VHE"), introduced in v7.2-rc1,
>> causes Raspberry Pi 5 to hang during boot.  Reverting the commit
>> restores normal boot.  This issue has already been reported in [1];
>> alternatively, the workaround proposed in [2] can be applied.
>>
>> Regards,
>> Cristian
>>
>> [1] https://lore.kernel.org/all/ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com/
>> [2] https://lore.kernel.org/all/20260619204832.586079-1-dan@reactivated.net/
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Tested on an Orangepi 5+ board (rk3588), with a 4k60 tv and a 1440p100 monitor.
> 
> To all applicable patches:
> 
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>

Thanks for checking this out!

b4 will apply the tag to all patches, but I'll manually drop it from the VC4 and
KUnit related patches, and probably some others that aren't really testable
as-is.

Cristian

