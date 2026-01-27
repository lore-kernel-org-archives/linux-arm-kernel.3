Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FD8D25931
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKT+iclIkSdV8c83ayGvWA3kBucltRdTlZe/rREsEHU=; b=Sq+BJFCc9L01qOp7Yhc5ESXcjd
	4hqkUQE1cvWlF0wcrcWrqQx9jXfwW7Ucw9sJ4138wvu1UKdh2HaHx2gYxbMs4gs+O5N1/McmB6zhQ
	CBgL124qQC4xxJ90CQELsjpDB3QinxnWmnm0lTcSEDNbnKh49zVkrVGPIQ1i38z4bNaJWRs9+x4wK
	/IQc+Y4VU20vNRv9vQ+j4zoszviNJIYttNz3fZSfMGpv3Jhk4+3jKbfpBgGuIDQBaXqGtSHaJGtxo
	0vPepEMcS3TEAIdvRBABem7fzc+qc3QUk1bgkATutoN9Cazu+o5s7M/FivppGTegH/e1P4PGHO0DS
	g7fD7Pwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkkc-0000000EVu7-3ud5;
	Tue, 27 Jan 2026 15:13:06 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkkW-0000000EVrx-3zlh;
	Tue, 27 Jan 2026 15:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YKT+iclIkSdV8c83ayGvWA3kBucltRdTlZe/rREsEHU=; b=ohP/YcbhZlaXjUOdIKusH5/749
	BUSEOC+y9mXd9+qYms4ENrSUy33ONfAxB1JM+bRRDYpCFrQuF15e6FbcgjPOZHHDmev4FLDdi5C+b
	C+zV02RVLkK8T8CnNom7bLyUn+VFE/CxhzO1eIxPgkNE/vOG6pbhcdbrjIU3Sa1P9B0AV4X02dwBt
	7XrMskavy3jhcrolfvOSpGFOtJTlZrFGwpwJ00XsbZC6n3go8LhIuoclGaB1nKzH2tTXPycyY1Ed8
	X+dlACmr8lNv+E7+eZynuvI0brbbJhOP62X+KexrTEt6wIBnJmrm3wBsiOi9h3pR+E1lccR0SzcB6
	lMblik8A==;
Received: from [189.89.57.42] (helo=[192.168.18.14])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vkkk9-00AW7o-Gv; Tue, 27 Jan 2026 16:12:37 +0100
Message-ID: <53fce710-8b0f-490a-b48d-9c5a17802533@igalia.com>
Date: Tue, 27 Jan 2026 12:12:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Power Management for Raspberry Pi V3D GPU
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_071302_893828_FA32076A 
X-CRM114-Status: GOOD (  23.94  )
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



On 26/01/2026 14:26, Maíra Canal wrote:
> This series introduces Runtime Power Management (PM) support for the
> Raspberry Pi V3D GPU.
>
> Currently, the V3D clock remains enabled for the entire system uptime,
> even when the GPU is idle. With the introduction of Runtime PM, the
> clock can now be disabled during idle periods. For example, with this
> series applied on a Raspberry Pi 5, if we check `vcgencmd measure_clock
> v3d`, we get:
>
> (idle)
>
> $ vcgencmd measure_clock v3d
> frequency(0)=0
>
> (running glmark2)
>
> $ vcgencmd measure_clock v3d
> frequency(0)=960016128
>
> One particular change was required in v3 to ensure a meaningful
> reduction in idle power consumption: the V3D clock rate must be
> explicitly set to the minimum rate during suspend. As explained in an
> inline comment, this is needed as some firmware versions may not fully
> power off the clock when its state is set to off. This issue can be
> mitigated by setting the clock rate to 0 during suspend. For this same
> reason, PATCH 1/6 has been added in v3.
>
> Apart from that, the v3d patches are mostly identical to v2, but rebased
> on top of drm-misc-next.
>
> To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
> backporting this series to rpi-6.18.y [1].
>
> [1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-6.18

The whole series is:

Reviewed-by: Melissa Wen <mwen@igalia.com>

>
> Best regards,
> - Maíra
>
> ---
> v1 -> v2: https://lore.kernel.org/r/20250728-v3d-power-management-v1-0-780f922b1048@igalia.com
>
> - [1/5] NEW PATCH: "clk: bcm: rpi: Add missing logs if firmware fails" (Stefan Wahren)
> - [2/5] Remove the "Fixes:" tag (Stefan Wahren)
> - [2/5] dev_err_ratelimited() instead of dev_err() (Stefan Wahren)
> - [2/5] Instead of logging the clock ID, use clk_hw_get_name(hw) to log the name (Stefan Wahren)
> - [2/5] Add a newline character at the end of the log message (Stefan Wahren)
> - [2/5] Use CLK_IS_CRITICAL for all clocks that can't be disabled (Maxime Ripard)
> - [3/5] NEW PATCH: "clk: bcm: rpi: Maximize V3D clock"
> - [4/5] Use devm_reset_control_get_optional_exclusive() (Philipp Zabel)
> - [4/5] Make sure that resource are cleaned in the inverse order of allocation (Philipp Zabel)
>
> v2 -> v3: https://lore.kernel.org/r/20250731-v3d-power-management-v2-0-032d56b01964@igalia.com
>
> - Rebased on top of drm-misc-next
> - Patches "[PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware
>    fails", "[PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
>    preparing/unpreparing", and "[PATCH v2 3/5] clk: bcm: rpi: Maximize
>    V3D clock" were applied to clk-next.
> - [1/4] NEW PATCH: "clk: bcm: rpi: Let V3D consumers manage clock rate"
> - [2/4] NEW PATCH: "clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED"
> - [3/4] Added Philipp's R-b (Philipp Zabel)
> - [4/4] s/drm_err/DRM_ERROR
> - [4/4] Set the clock rate to 0 during suspend and to the maximum rate
>    during resume
>
> v3 -> v4: https://lore.kernel.org/r/20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com
>
> - Rebased on top of drm-misc-next
> - [1/6, 3/6] Add Melissa's A-b (Melissa Wen)
> - [2/6] NEW PATCH: "clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE
>    behavior" (Stefan Wahren)
> - [4/6] NEW PATCH: "drm/v3d: Use devm_reset_control_get_optional_exclusive()" (Melissa Wen)
> - [5/6] Include more context to the commit message (Melissa Wen)
> - [5/6, 6/6] Instead of creating the function v3d_gem_allocate(), use v3d_gem_init()
>    and move HW initialization out of it (Melissa Wen)
>
> ---
> Maíra Canal (6):
>        clk: bcm: rpi: Let V3D consumers manage clock rate
>        clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE behavior
>        clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED
>        drm/v3d: Use devm_reset_control_get_optional_exclusive()
>        drm/v3d: Allocate all resources before enabling the clock
>        drm/v3d: Introduce Runtime Power Management
>
>   drivers/clk/bcm/clk-raspberrypi.c |  15 ++--
>   drivers/gpu/drm/v3d/Makefile      |   3 +-
>   drivers/gpu/drm/v3d/v3d_debugfs.c |  23 +++++-
>   drivers/gpu/drm/v3d/v3d_drv.c     | 163 ++++++++++++++++++--------------------
>   drivers/gpu/drm/v3d/v3d_drv.h     |  21 +++++
>   drivers/gpu/drm/v3d/v3d_gem.c     |  25 +++---
>   drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
>   drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
>   drivers/gpu/drm/v3d/v3d_power.c   |  96 ++++++++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
>   10 files changed, 273 insertions(+), 119 deletions(-)
> ---
> base-commit: 68e28facbc8ab3e701e1814323d397a75b400865
> change-id: 20250728-v3d-power-management-eebb2024dc96
>


