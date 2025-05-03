Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EABC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pdxIyWmwuDL50rxGKzi6rJDYaKtwnSK7YaPW/+Ab3M=; b=bFGQSAshcusaN5CbuTzf39fD7N
	RZ02nkTIzySGJsI0Rhun7rJJvXUIuGosEXTvj6YVfcPmSJ0QRGQikY52gIqDEqesgxlBJCW2OfsVY
	YZxIxhmPsa+0cXujHvrzHC2GyUjo4tSZU6XK8thCe60P62b0VSw6NXiph0qD6+4jOSY5huerD08vT
	HB2tZouPei8Tkm9x/2osvbUjs9/dVINVPmhyX/IPnjIbxalXIA/VAOhKEt+4a6JFqDDkoCyHx5/7B
	MPozwh1wXOIfFF+6jahKS4Y65cNwBBlmRAi/tWvjhMnU4S9EKC1Ey8fo/+CYeZIe6UmsAY7NyG1IJ
	iH5Kp1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBFFn-000000045eI-2nnw;
	Sat, 03 May 2025 15:58:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBFDo-000000045LV-1i1G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 15:56:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E25105C06A9;
	Sat,  3 May 2025 15:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FADC4CEE3;
	Sat,  3 May 2025 15:56:08 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 822275F863;
	Sat,  3 May 2025 23:56:05 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
References: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
Subject: Re: (subset) [PATCH v3 0/5] allwinner: Add EMAC0 support to A523
 variant SoC
Message-Id: <174628776539.3898418.13280613195656914749.b4-ty@csie.org>
Date: Sat, 03 May 2025 23:56:05 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_085612_493782_FD3E68B9 
X-CRM114-Status: GOOD (  10.14  )
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

On Wed, 30 Apr 2025 13:32:02 +0800, Yixun Lan wrote:
> This patch series is trying to add EMAC0 ethernet MAC support
> to the A523 variant SoCs, including A523, A527/T527 chips.
> 
> This MAC0 is compatible to previous A64 SoC, so introduce a new DT
> compatible but make it as a fallback to A64's compatible.
> 
> In this version, the PHYRSTB pin which routed to external phy
> has not been populated in DT. It's kind of optional for now,
> but we probably should handle it well later.
> 
> [...]

Applied to sunxi/dt-for-6.16 in sunxi/linux.git, thanks!

[1/5] dt-bindings: sram: sunxi-sram: Add A523 compatible
      https://git.kernel.org/sunxi/linux/c/02f27ea7fa02
[3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
      https://git.kernel.org/sunxi/linux/c/56766ca6c4f6
[4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
      https://git.kernel.org/sunxi/linux/c/acca163f3f51
[5/5] arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1 board
      https://git.kernel.org/sunxi/linux/c/c6800f15998b

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


