Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0B5CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTh+tXr46//GOyd7Vcd0mrE3XkaJndURpnazP5uiamU=; b=mt2GgLS7e5BzmNYPyl6xodwipO
	iFrfEmF0AEEobX9vkkcW6wcN2bT4BsaV6TEq5cTzpSWXGSlFE7SbbYZlqoM6hisILO7BX30VDXP2U
	b4Mq0YilgxoULVpwDrnmHxcdnmdOxerxTgVDiudOjCs0f3/aT4JwrUxBooM2i0ryo1lSrax0T8yrt
	AEg8eeqzPd58sYeRBZOVSRFRxoYGHuYv1bdwWZvMeF5Pr5znjjuOWlu2gdslyv0H+KxdSZrgUsGiu
	rNcayl62lVCsXY/HVxD2le8zzFFei2lYlZ1AukDexmVnK6jc6Izrt8bN80BBadt+HCDEanTGpKKLO
	vQtUfFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN4D-0000000Cx0H-30cH;
	Mon, 11 May 2026 09:36:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN43-0000000Cwvo-2N2Y;
	Mon, 11 May 2026 09:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492197;
	bh=5jGiJLidsSBB080XIP887x11ViSwlqcV9GjyoUO70lQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oliBWciVS1A3g8/cdFc2H162/uUG9zbvTWQSxj+bk3twuhewNz5Ar6sIKtbHxfUfu
	 inpPHTeqG8+bwjEqjOn+R+JpkLGbh//PiSwRltPyVpSNkUgCDLKYbnelxh1rWa3xSV
	 COSXaMpVNsrc9FKHIOZVZ9fiHi72rGkew//4OpXhR/fBNAZG8I7XoTJjPjCobARrie
	 uI58icH1lm+tYvFk2pQ6Sl/C9kYk5Ebo/u2rcaWgk4hJvLC/2DfcCsORNb34w9evOr
	 HhNb2eBbg3fzNDqt9TJOzuj6PM6FTkxcrP/bR7JXyCkFOEYBk2tUFBX5MkuC1V9SsP
	 p4WGmeNMeY2Ug==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D106417E0CA9;
	Mon, 11 May 2026 11:36:36 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, 
 Andrew LaMarche <andrewjlamarche@gmail.com>
In-Reply-To: <20260412092333.6371-1-linux@fw-web.de>
References: <20260412092333.6371-1-linux@fw-web.de>
Subject: Re: [PATCH v2 0/4] some BPI-R4Pro dts updates
Message-Id: <177849219680.115964.494791829955697509.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:36:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_023639_799422_3065FE5D 
X-CRM114-Status: GOOD (  10.19  )
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

On Sun, 12 Apr 2026 11:23:28 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> There are some parts of BPI-R4Pro DTS that need to be changed. Currently
> there should be not much users of the mainline-dts and we noticed some
> things while openwrt integration.
> 
> v2:
> - added mgmt port renaming as this patch is still outstanding to keep
>   all in one series
>   https://patchwork.kernel.org/project/linux-mediatek/patch/20260303202006.37515-1-linux@fw-web.de/
> - dropped default-state in gpio-leds patch as suggested by daniel
> 
> [...]

Applied to v7.1-next/dts64, thanks!

[1/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
      commit: 3ee1389fb19691cddc437dd6ba9979100d691051
[2/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
      commit: f639e17553da08eff5957e8a2657253a26d47c12
[3/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
      commit: 993d54a4f987959998cb47d9cf5f9bb1d35287df
[4/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling
      commit: 2df54c0b376c2691f6887a4f445d36935b9e8f87

Cheers,
Angelo



