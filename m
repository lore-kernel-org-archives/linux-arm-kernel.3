Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39797C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 19:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktVslNyishmwLJIWQZVyJyZGaF8VrnNN5PLCkW5qv1c=; b=It0/fB+rucHUZgCOSFmXAPofjN
	8UfrInrHaIiEEMiUnMmX6+mKXSQtdFNEkDxrLLsDyDZh+CL60MtSi0YQJwHZQOoASzhspU0h/xO2W
	ga08pqPEG3vn8f7VQbpN1VDOcCPzOxkpPiSFinoSmTSOvKOAfdXJqGZq99B6cfYka2krpVfMG+8Gt
	FFP1nUCj4V69tuIY+Ln4J9H/vZlI6Cwxpc8AX12FImVMPyHKdryIeFdwSc3aR4eIxaafJKIXWAQiK
	IiObiA2ekgMbhlxDIdtpKXHGRFSQ4qbZzdSnV4JbK2UnHQOsB6BLlYGKemE/ImlP9CpUVOV2syKNA
	whIvRr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonIu-00000006840-3ZMe;
	Tue, 28 Jul 2026 19:17:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonIB-000000067cK-3ek8;
	Tue, 28 Jul 2026 19:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ktVslNyishmwLJIWQZVyJyZGaF8VrnNN5PLCkW5qv1c=; b=yvf0oo6JI9hw6HVT8BbmF4Bx2Q
	XB5AplJBXaXF8KQpdH0HOyXSi89oHtRraPaGkI+oGxC9JCqPPXKpi8aPLAQZDjmgjXVm3qgUttCTP
	2YWyBf5fgmASVSXe1pq40vY5gDe7AtnCF2TyCXjvxJFizhgvwOPHB7BaZKLAtNtQ9fJVVZjZVFpCj
	d6xqqdqG+eLT8WT49qGVVdVPv+oQ/WgoIC9oi/Bq8J/x4QzjLkH/3CxYvJTgG2dsdASs5ruOxLTBd
	oLCefYR3Ou8tlCRmvygo2PXPbBWmpJxTQOG6Aw0zf6P5VIJ/ZUn9sz2yTn8bZ3YbXyPQFVgezc6Sa
	fzZ0s2LQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Tue, 28 Jul 2026 21:16:33 +0200
Message-ID: <178526609457.300371.12562771898279698820.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714053419.265523-1-hrushirajg23@gmail.com>
References: <20260714053419.265523-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_121644_049490_B0534867 
X-CRM114-Status: GOOD (  10.80  )
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


On Tue, 14 Jul 2026 11:04:17 +0530, Hrushiraj Gandhi wrote:
> This series adds initial device tree support for the Vicharak Axon
> single-board computer, which is based on the Rockchip RK3588 SoC.
> 
> The Vicharak Axon is a feature-rich SBC targeting developer and embedded
> use cases. It ships with:
> 
>   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
>   - RK806 PMIC providing all SoC power domains
>   - eMMC 5.1 (on-board) and microSD slot
>   - Gigabit Ethernet via RGMII (RTL8211F)
>   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
>   - PCIe 3.0 x4 and two PCIe 2.0 slots
>   - SATA 3.0
>   - USB 2.0 host ports (EHCI/OHCI)
>   - NXP PCA9554 I/O expander for status LEDs
>   - Haoyu HYM8563 RTC
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
      commit: 58db5a28c85150411f3b6035b9a7eb3b23ca7789
[2/2] arm64: dts: rockchip: add Vicharak Axon board
      commit: c42f01f053a7be77f534c850911cd8d54777af19

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

