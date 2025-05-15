Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D69C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4rwDJq3pbg55Yo2g2267mrIWdXYEpDyoX3ONJqyKdA=; b=cFegllg0WG71gnzzJQOftBgQFl
	GAq348luKfldXYID08xmkMCL2avTR4uCGMzOWx5trr5sVLoXDJaU4V7jriG61dQla/nXsTjUGEBSw
	WP8oqmT6QZMrDT8WAdFKhZpgev8vQ83TzPTxgxC1HWD4L7W4FUO7pd20wrw64RHdBrnuyNtlCkv+G
	GGNzGwHD2qBHccKNLwSrPkdZEOrrw/ePCJCWdEmp4/UitqfftIFLy8RQ2IV6UIx38c8N01svLYSS3
	OJKCvLlj+yyrrojExzRj3lld5fHhCGD6juhhAEb0uRsiDJNSTdzpN4UHXXZ9IwuEPoX+CoQbp8HfP
	JQSIx+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFY9Y-00000000eQL-1a9m;
	Thu, 15 May 2025 12:57:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFY3A-00000000cwl-49BY;
	Thu, 15 May 2025 12:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=M4rwDJq3pbg55Yo2g2267mrIWdXYEpDyoX3ONJqyKdA=; b=TjRmRqag+mIisO5kJBdgCmE6K0
	r13pxMuEsOR7Ckq4gKYUV6vxh11ScjFRAQo635hxe+soIxmLYQ4q+v2OYmMN6BEEOWUZW+/lPDnXQ
	gODEfplZWGFjUFmMuXW+t6YGQNAj8L/dqSsMWBzRXQplTtuVQTW/WteXuEGojZV4mGiI+GVKwuOPK
	duPBZlUIIlhp/vefZSnGOcRjYccYdPjQGGi181AJcDto6ADt2LhOcgQPPqN0pKWp1fnXwtNuKUfm6
	nu/oZJb6T88bLXJfi0yHZAVRSTA1H7htxjlY2Gkz5hT8wnnv21GymCV1mji8kLkF/IwUSmz4mUZQV
	L20bYLXw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFY38-0004ph-Mr; Thu, 15 May 2025 14:50:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] Add two board-families from Theobroma-Systems
Date: Thu, 15 May 2025 14:50:44 +0200
Message-ID: <174731343062.2524804.6752535988560416961.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514150745.2437804-1-heiko@sntech.de>
References: <20250514150745.2437804-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_055101_023744_ADF545D3 
X-CRM114-Status: GOOD (  12.21  )
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


On Wed, 14 May 2025 17:07:39 +0200, Heiko Stuebner wrote:
> Both the Cobra and PP1516 boards are based around the PX30 SoC and can be
> found with a variety of display options.
> 
> As new boards should not use the deprecated snps,reset-* properties
> in the gmac node, I also added a core mdio-node for the gmac and
> converted the Theobroma Ringneck board over.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: rockchip: add basic mdio node to px30
      commit: ede4837a504ca7e5811217060aa8300b8d0cf7f2
[2/6] arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
      commit: e463625af7f92c4a9f097f7fb87f6baaad6e762a
[3/6] dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma Systems
      commit: e2a6b301ca6054fc72905810d084690ec0ee1aed
[4/6] arm64: dts: rockchip: add px30-cobra base dtsi and board variants
      commit: bb510ddc9d3eda3d6e1276d301e923e7021e9972
[5/6] dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma Systems
      commit: b8310e4d391ad123048de738ac023ef8b7ebdbfc
[6/6] arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants
      commit: 56198acdbf0d57200e49311e16d6bf16498128f7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

