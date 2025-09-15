Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9D2CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmVruXWZwomDqWpCKL+nSH44GpL8x2r1avW+KCVZDnw=; b=jhiDeMr4qcXOqrsuY1cI134fLR
	3LXvhnE00Q72SvkByMxj41DLfLEVpN+e2LCT7QA7lV3D4Q9fw2oKYA1j/3LMugLvRWrNCf+vkjI07
	+9dqfFhjQX5Ezaw/EYFuGXucwF2v2VVjSOuyJQH0Sje9csdiDwTei+Jvb0yx2X8OqBY0SQMeUadDA
	tuXE4rF/U/djLzJ72Q47Yub3ofrEpd+Ey/w/ss4XqUN++FzfYwlThdTdE3sd+si447mWsARcwUYEP
	Vjdl7QthKDtgrSb709aDfcywsn0gYmrkYf9taW6oudLqVw0rtYWJuMrWCeWhJNsPxIyuwb6xGVfuo
	83jnjNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9Ne-00000004MID-1rRJ;
	Mon, 15 Sep 2025 13:36:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9Nb-00000004MFo-230p;
	Mon, 15 Sep 2025 13:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757943385;
	bh=RrQWimjg2kK8bT3Tfn+05zZzA3ddMAkW4+eVTyyOWPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g44Ap7LRaJTyVhfQoQoHGsejO64m2J31G53D78xrOr4+FFz4z3xOCvP4AfA6tvVkx
	 gp1dmAgOLj1cWESNMyhHcijNuakbwwWg5vSW+8ly1TrM1ECoCeEw7H5AhQ8SYNRm+n
	 UH58C+OeagVyoxteY4LZyXDhSflPlQtiHkW7d1f0URvTQk32T+EvxdkjLliRgQ8Qn3
	 9zLZvdGDFfpNhwIYwGDsyZsy6vQTy7nzeXTPkS6qSP/c4gSJS8q3nnLsXlcs+Uic+U
	 KP7ROkE2G8EfPe56NT6tMariLZl7QG8EklpWtbeehk8aqjpLe+HXBsdVi9X/TJz5N0
	 lwH/OvYImXJhA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D73C17E1067;
	Mon, 15 Sep 2025 15:36:24 +0200 (CEST)
Message-ID: <a2f77d1b-26aa-47cb-a2b3-9495abbe78be@collabora.com>
Date: Mon, 15 Sep 2025 15:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] drm/panthor: add support for MediaTek
 MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-10-779a8a3729d9@collabora.com>
 <ae482072-c13f-4cb4-be26-50592b086fe6@collabora.com>
 <117198807.nniJfEyVGO@workhorse>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <117198807.nniJfEyVGO@workhorse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_063627_700599_881E5B39 
X-CRM114-Status: GOOD (  37.44  )
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

Il 15/09/25 15:32, Nicolas Frattaroli ha scritto:
> On Monday, 15 September 2025 12:28:09 Central European Summer Time AngeloGioacchino Del Regno wrote:
>> Il 12/09/25 20:37, Nicolas Frattaroli ha scritto:
>>> MediaTek uses some glue logic to control frequency and power on some of
>>> their GPUs. This is best exposed as a devfreq driver, as it saves us
>>> from having to hardcode OPPs into the device tree, and can be extended
>>> with additional devfreq-y logic like more clever governors that use the
>>> hardware's GPUEB MCU to set frame time targets and power limits.
>>>
>>> Add this driver to the panthor subdirectory. It needs to live here as it
>>> needs to call into panthor's devfreq layer, and panthor for its part
>>> also needs to call into this driver during probe to get a devfreq device
>>> registered. Solving the cyclical dependency by having mediatek_mfg live
>>> without knowledge of what a panthor is would require moving the devfreq
>>> provider stuff into a generic devfreq subsystem solution, which I didn't
>>> want to do.
>>>
>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>> ---
>>>    drivers/gpu/drm/panthor/Kconfig        |   13 +
>>>    drivers/gpu/drm/panthor/Makefile       |    2 +
>>>    drivers/gpu/drm/panthor/mediatek_mfg.c | 1053 ++++++++++++++++++++++++++++++++
>>>    3 files changed, 1068 insertions(+)
>>>
>> [ ... snip ...]
>>> +static int mtk_mfg_eb_on(struct mtk_mfg *mfg)
>>> +{
>>> +	struct device *dev = &mfg->pdev->dev;
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	/*
>>> +	 * If MFG is already on from e.g. the bootloader, we should skip doing
>>> +	 * the power-on sequence, as it wouldn't work without powering it off
>>> +	 * first.
>>> +	 */
>>> +	if ((readl(mfg->rpc + RPC_PWR_CON) & PWR_ACK_M) == PWR_ACK_M)
>>> +		return 0;
>>> +
>>> +	ret = readl_poll_timeout(mfg->rpc + RPC_GHPM_RO0_CON, val,
>>> +				 !(val & (GHPM_PWR_STATE_M | GHPM_STATE_M)),
>>> +				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
>>> +	if (ret) {
>>> +		dev_err(dev, "timed out waiting for EB to power on\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	mtk_mfg_update_reg_bits(mfg->rpc + mfg->ghpm_en_reg, GHPM_ENABLE_M,
>>> +				GHPM_ENABLE_M);
>>> +
>>> +	mtk_mfg_update_reg_bits(mfg->rpc + RPC_GHPM_CFG0_CON, GHPM_ON_SEQ_M, 0);
>>> +	mtk_mfg_update_reg_bits(mfg->rpc + RPC_GHPM_CFG0_CON, GHPM_ON_SEQ_M,
>>> +				GHPM_ON_SEQ_M);
>>> +
>>> +	mtk_mfg_update_reg_bits(mfg->rpc + mfg->ghpm_en_reg, GHPM_ENABLE_M, 0);
>>> +
>>> +
>>> +	ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
>>> +				 (val & PWR_ACK_M) == PWR_ACK_M,
>>> +				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
>>
>> I wonder if you can check how much time does the GPUEB really take to poweron,
>> just so that we might be able to reduce delay_us here.
> 
> I already did, that's where the 50us value is from as far as I remember.
> 

Ah, perfect.

>>
>>> +	if (ret) {
>>> +		dev_err(dev, "timed out waiting for EB power ack, val = 0x%X\n",
>>> +			val);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = readl_poll_timeout(mfg->gpr + GPR_LP_STATE, val,
>>> +				 (val == EB_ON_RESUME),
>>> +				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
>>
>> Same here - and I think this one is more critical, as I can see this suspend/resume
>> control being used more extensively in the future.
>>
>> Specifically, I'm wondering if we could add runtime PM ops that will request EB
>> suspend/resume - and also if doing so would make any sense.
>>
>> I am guessing that the "suspend" LP_STATE stops the internal state machine, making
>> the EB MCU to either go in a low-power state or to anyway lower its power usage by
>> at least suspending the iterations.
> 
> I think I briefly fiddled with this but then it did nothing other than
> break everything. Is the current time it takes to resume a problem?
> 
>>
>> Of course - here I mean that we could have
>> 1. System suspend ops that powers off the EB completely like you're doing here and
>> 2. Runtime PM op that may be called (very) aggressively
>>
>> ...this would obviously not be feasible if the EB suspend/resume (without complete
>> poweron/off) takes too much time to actually happen.
> 
> We probably don't want to aggressively suspend the thing doing DVFS
> while a workload is running, and if no workload is running, it
> already suspends. I can't really say how normal desktop usage will
> play out yet, but generally speaking I think it's a bit early to
> find a comfortable place on the transition latency vs power draw
> curve at this point.
> 

Okay let's leave it for now and revisit that after everything is upstreamed.
It's only an improvement anyway, not critical for functionality, and maybe
not even feasible.

>> [... snip ...]
>>> +static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
>>> +{
>>> [... snip ...]
>>> +
>>> +	dev_info(dev, "initialised mem at phys 0x%016llX\n", mfg->sram_phys);
>>
>> I don't like exposing addresses in kmsg. Please just don't.
> 
> It's a physical address. This is not a kernel pointer, but something
> that can be read from the DTS. But sure, I'll remove it I guess?
> 

Yeah, please.

>> [... snip ...]
>>
>> Cheers,
>> Angelo
>>
> 
> You can assume me not responding to a part of the feedback in this
> e-mail means I'll address it in the next revision of the patch
> series.
> 

Alright!

Cheers,
Angelo

> Kind regards,
> Nicolas Frattaroli
> 
> 



