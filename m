Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C00E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKy2kDXPQg5LSJ+WcxFbAZTOLG7mg+guZsqD/SyCt7Y=; b=gzoTHoO1iOiPJX05VTld517beK
	ioWbSYOtB9D1dKQHrfanipUtTFugOIqPnkwskLXFXuKcKFT9Kjp4l+Y3OOX3s+yDMNFg6sZYTmX2V
	iM5C1afCJvw5vvxDDLV9jYa9ap8FPEoKUtY5zRizgwUXb0ipzTaNV3uNi3J83Cx/52XkhLsGUHJvE
	/NdV2rJu6MGW0R0cI13UzQLe7G1W/ZrmRmj4Ox7vOK7DgdwP+2mnjH/8GiC0ONPraasQekfCKwpOc
	d+dX/56S57jlEkMvKx+m83UyzMr39eMS3pytk9NFa5vcB+BLirMoNdrgGRU2B7N/XA/ZuHpQ9HHEF
	C5yQ3LMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRBTd-00000000Oo3-0qw9;
	Fri, 27 Dec 2024 14:38:09 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRBSR-00000000OeI-1Ttv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 14:36:57 +0000
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id R78YtXWn7xoE1RBSPtlokM; Fri, 27 Dec 2024 14:36:53 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id RBSMt8mvjlDL5RBSOtUNz5; Fri, 27 Dec 2024 14:36:53 +0000
X-Authority-Analysis: v=2.4 cv=LLtgQoW9 c=1 sm=1 tr=0 ts=676ebb85
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=VwQbUJbxAAAA:8
 a=vU9dKmh3AAAA:8 a=CPlf_J6x6-pEMq4byrgA:9 a=QEXdDO2ut3YA:10
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wKy2kDXPQg5LSJ+WcxFbAZTOLG7mg+guZsqD/SyCt7Y=; b=YG1iVMf9n8nyhxGhXJ9JXjShIz
	CyyVHB+uRKIVJ9+f3o66/63AWQ+e2tf91kaQlq03ZafdNpCFtSO20QO3/hkxSe3kZz2cMuN+OzSV/
	gCH7NCp2ujKMEdg+x2fu58mSTaHD3ySNgyVpsQoPtbpHHFpHKT0CqpPYN+MJQ2Y2GY4JyMpuRZHsf
	QfzCR7j02pPHzgiDiLeZeI3ubt//2OyB5LFWqTbPTRkhmqJoJi+H28/pzQGqEdZlyWTWH6CgYlj7m
	YYTVSgzuV+COIIuZLeZcXAFZ+Qdrq9iKj3Z4UoIxMCpDDNX1ckqDTEzZVBcEcp5tYbwQ5s/Ibe/N6
	9vkQx57Q==;
Received: from [122.165.245.213] (port=40816 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tRBS8-003aTF-2w;
	Fri, 27 Dec 2024 20:06:36 +0530
Message-ID: <314b6bbe-613e-41a6-955e-50db6e11ef8e@linumiz.com>
Date: Fri, 27 Dec 2024 20:06:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 00/22] Add support for A100/A133 display
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tRBS8-003aTF-2w
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:40816
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 8
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMu/f115ySCRoNQwm2Ab5Vxxu39pwUzd28W/T0kVy5bG7kWHTaM44GRPV3EM0Tok02OaSUYi8YVHu54xvQdlVvNHKiQ8r6M4/mtERwwhqtaoAHRESOAX
 jNmfJGfaEiqdkWAzSToU2KBrHfPmqI9/IK3dRFQ53TD5U4EgHRdxMrcioRUsvQXZwnLzLddP0bIq8h6Xj0++vG0EuapWHnvfxENPaIwQiZJ7fOm55Eb44PpI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_063655_475456_51D440DC 
X-CRM114-Status: GOOD (  13.66  )
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

On 12/27/24 6:30 PM, Parthiban Nallathambi wrote:
> This series depends on [1] for the eMMC/MMC controller to work and
> [2] (lined up for 6.14) which adds support for the sram nodes and
> display engine extends it's usage. Idea of this series to get initial
> feedback and adjust, which will be rebased for 6.14 once [2] is merged.
> 
> This patch series adds support for A133 display pipeline based on
> LVDS. dt-bindigs are organized in the start and later with code
> changes.
> 
> PHY is shared between DSI and LVDS, so to control the PHY specific
> to DSI/LVDS, phy_ops set_mode is introduced. To enable the DSI
> using set_mode, analog control register MIPI Enable is used, which
> may not be available for A31 (shares the same driver).
> 
> Otherwise, A133 also got hidden independent display engine i.e
> mixer + tcon top to handle parallel display. But this patch series
> adds only support for the 1 mixer which is documented.
> 
> [1]: https://lore.kernel.org/linux-sunxi/20241109003739.3440904-1-masterr3c0rd@epochal.quest/
> [2]: https://lore.kernel.org/linux-sunxi/20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest/
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
Apologize for polluting with resend again. My internal mail server got blocked due to
volume count, which resulted in incomplete series again.

I will fix the mail server issue before resending the series. Sorry.

Thanks,
Parthiban


