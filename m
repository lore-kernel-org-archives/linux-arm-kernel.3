Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2873CCDE012
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lq4RapmBc+PELXWN5H6lcSbDpd3RAz4mvTQtiJsUWWc=; b=RUOBT44c4p6XzXW+35RUi7pzFa
	wO3+0CantDBIqNbecScx+tqclJeHZK2DN2M9TeGGyE09bCo49Woyskuvg5kKpNx6umOlApGwVDjuf
	gSJYalTs7YMYH+WY9hio9IQIxnjt9N6R8rGgJt2qqUDHjEaNTeHoUrzN9lb296CHAR24Ng57lyWI9
	GPBam6XVTGI7YgoMn/0VEVXdmp1mtptEI1kT8LSGS1cYabDpxyPw+M1oJdfZMZYU7DXzj0wO2U4B5
	uFPkVSCX3vGhekPJ+hKri5ceRBKohN6oqMY/7YojpYqDonZ23jYngwbXrjrzFjUoHVzH2kZcECl4N
	f1cwQvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3Q5-0000000B3FP-1GyS;
	Fri, 26 Jun 2026 10:04:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3Q2-0000000B3Ex-30BH;
	Fri, 26 Jun 2026 10:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782468256;
	bh=ReCFqVhpToxEGsTwmHeMOcGqZ65zmC9b4kBYnQWBNUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dR8P3rx57/HUhEnpfMIr3OwFel1uxC8cVbfYgwmqN4//ed9ARA+lvLVThPPT2jyoe
	 pWkK9oY8DTaqSikeHpKN5i7aSvkWKtRBYKDBS0f7x5KyVdGVuDvmrEfg2MV4r4fyox
	 G+vsLLZ8SW2b2MIJlBIr6cBG6oV/qO2x1keLQ43YFiFcu14llPpH/kuiZO3b+q247k
	 NP6VEVPPQ5stMmKg7HLY9AoaiGdwLXjiqJMOLHLyodvEU8WGIvcBdsLQ/ePSttJQsf
	 S/fxBMGlVJ8KlEInSlMj1mP1xRuAX69hm95dAhPAIFqoXLGOmoq/p9FuKlh7aCn1RF
	 +BtkzevBLt+/g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7125917E0C88;
	Fri, 26 Jun 2026 12:04:15 +0200 (CEST)
Message-ID: <ad1a6a17-aff4-4dbf-9cdb-62765064b670@collabora.com>
Date: Fri, 26 Jun 2026 12:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/32] pinctrl: mediatek: Enable module build support
 for all drivers
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260626040112.2436185-1-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260626040112.2436185-1-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_030418_921143_32E53B88 
X-CRM114-Status: GOOD (  17.25  )
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

On 6/26/26 06:00, Justin Yeh wrote:
> Sorry for the quick v4 - v3 was sent with an incomplete cover letter
> (template placeholders) by mistake. This v4 also unifies MODULE_LICENSE
> to consistently use "GPL v2" across all patches.
> 
> This series enables all MediaTek pinctrl drivers to be built as loadable
> kernel modules. This is required for Android GKI (Generic Kernel Image) +
> vendor_dlkm deployments where vendor-specific drivers must be kept separate
> from the GKI vmlinux.
> 
> Each patch adds MODULE_LICENSE("GPL v2") and MODULE_DESCRIPTION() macros where
> missing, and changes the Kconfig option from bool to tristate. This allows
> these drivers to be properly packaged as vendor kernel modules while
> maintaining the existing built-in option.
> 

The entire series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...but I'm not sure if one commit for each is ok, makes reverting easy but that
may be too much noise. Should Linus ask for joining them all, feel free to still
keep my R-b tag, as I'd be fine with that as well.

Cheers,
Angelo

> Changes in v4:
>    * Fix cover letter content (v3 accidentally sent with template placeholders)
>    * Unify MODULE_LICENSE to use "GPL v2" consistently across all drivers
>    * Update all commit messages to reflect "GPL v2" instead of "GPL"
> 
> Changes in v3:
>    * Add MODULE_DESCRIPTION() for all drivers (even those that already had MODULE_LICENSE)
>    * Update commit messages to reflect that we're adding MODULE_DESCRIPTION too
> 
> Changes in v2:
>    * Squash MODULE_LICENSE and tristate changes into single patch per driver
>    * Extend fix to all MediaTek pinctrl drivers (32 total), not just MT8189
>    * Add Android GKI + vendor_dlkm context to cover letter
>    * Add MODULE_DESCRIPTION() where it was missing
>    * Add Fixes: tags referencing the original commits that added each driver
> 
> Justin Yeh (32):
>    pinctrl: mediatek: mt8189: Enable module build support
>    pinctrl: mediatek: mt6878: Enable module build support
>    pinctrl: mediatek: mt6893: Enable module build support
>    pinctrl: mediatek: mt7622: Enable module build support
>    pinctrl: mediatek: mt7981: Enable module build support
>    pinctrl: mediatek: mt7986: Enable module build support
>    pinctrl: mediatek: mt7988: Enable module build support
>    pinctrl: mediatek: mt8167: Enable module build support
>    pinctrl: mediatek: mt8173: Enable module build support
>    pinctrl: mediatek: mt8183: Enable module build support
>    pinctrl: mediatek: mt8186: Enable module build support
>    pinctrl: mediatek: mt8188: Enable module build support
>    pinctrl: mediatek: mt8192: Enable module build support
>    pinctrl: mediatek: mt8195: Enable module build support
>    pinctrl: mediatek: mt8196: Enable module build support
>    pinctrl: mediatek: mt8365: Enable module build support
>    pinctrl: mediatek: mt8516: Enable module build support
>    pinctrl: mediatek: mt2701: Enable module build support
>    pinctrl: mediatek: mt7623: Enable module build support
>    pinctrl: mediatek: mt7629: Enable module build support
>    pinctrl: mediatek: mt8135: Enable module build support
>    pinctrl: mediatek: mt8127: Enable module build support
>    pinctrl: mediatek: mt7620: Enable module build support
>    pinctrl: mediatek: mt7621: Enable module build support
>    pinctrl: mediatek: mt76x8: Enable module build support
>    pinctrl: mediatek: rt2880: Enable module build support
>    pinctrl: mediatek: rt305x: Enable module build support
>    pinctrl: mediatek: rt3883: Enable module build support
>    pinctrl: mediatek: mt6397: Enable module build support
>    pinctrl: mediatek: mt2712: Enable module build support
>    pinctrl: mediatek: mt6795: Enable module build support
>    pinctrl: mediatek: mt6797: Enable module build support
> 
>   drivers/pinctrl/mediatek/Kconfig          | 64 +++++++++++------------
>   drivers/pinctrl/mediatek/pinctrl-mt2701.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt2712.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt6397.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt6795.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt6797.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt6878.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt6893.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt7620.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7621.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7622.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7623.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7629.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt76x8.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7981.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7986.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7988.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8127.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8135.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8167.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8173.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8183.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8186.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8188.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8189.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8192.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8195.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8196.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8365.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8516.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-rt2880.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-rt305x.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-rt3883.c |  3 ++
>   33 files changed, 114 insertions(+), 32 deletions(-)
> 


