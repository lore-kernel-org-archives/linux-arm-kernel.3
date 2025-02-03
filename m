Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB97C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93epfxqDvQkA4VstYuNsyHFiuxB63dG0Zy3P5Z6o61s=; b=DQv8xpm5/RRMe3hqp8VBKodFKG
	JUvInQGV88lp4n01RvfTiipBv3+X5suSl/GoBPArlf8zkiuqH2ARFRbQS+vD6m3dOyGauQdV2bTGC
	1vnqDkHKuhMG3w8ioPIU53CExVR4YZHgeK1/lwEbBCjroDTp/CAqn10bfLB4r0+bgjyqxu3CgNecL
	i3xRq1zkYabw/4oUEOynTb+i4lTUf9IKXS9fCIqdQUOboIA3qqlwtTVL3G88QZu3Q+cB6d9PkiT7I
	jTH3RuKmnwpJUHWiw+yqQSBmVb2spJfH9JWbEXDnqRYo1NWFLhNd79MSK/HKusWrZ26D0LzqYON0y
	8MoCuiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terku-0000000EpSC-3VmO;
	Mon, 03 Feb 2025 08:24:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1terct-0000000EnZv-3HM0;
	Mon, 03 Feb 2025 08:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=93epfxqDvQkA4VstYuNsyHFiuxB63dG0Zy3P5Z6o61s=; b=sGBlaUI8ZjlKrnUPITkJHL/AMn
	KyyeIUx/q14lm4YW+5pg1N/iPJYvZtJ5pJ59pW0qeKrHZ93/0xZjFLfQYlH3BFQOd++rXAPnv5zBT
	0Z7sQqsqV9seYcVkur8UoAgB/HjVLHyJIo2MyON9y1kqhEyhNsVWLLkeAZPVwnc7UKDmECcK7EguJ
	fwocgksbC/tCwDmdsiPbZQAWU8ozdjJBfANhMCpUHG/Jik1+asX5hTD3CBVpfJ+0Zjfvj3JtD+rqP
	cxW6X3iW67WKYlgEZNUX+s5BalDrF1Apj01zh/Gwyw6kVpFzjJdOCos7AV21OrEnnw95NlsLbjX8A
	ndHCvhlA==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1terck-0005Vr-UI; Mon, 03 Feb 2025 09:16:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	maz@kernel.org,
	tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Use "dma-noncoherent" in base RK3588 SoC dtsi
Date: Mon,  3 Feb 2025 09:15:56 +0100
Message-ID: <173857053623.78657.5406481342048846452.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <fa1a672dae3644bb3caa58f03216d0ca349db88b.1736279094.git.dsimic@manjaro.org>
References: <fa1a672dae3644bb3caa58f03216d0ca349db88b.1736279094.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_001615_815415_D6EC4989 
X-CRM114-Status: GOOD (  10.96  )
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


On Wed, 08 Jan 2025 05:26:45 +0100, Dragan Simic wrote:
> The preferred way to denote hardware with non-coherent DMA is to use the
> "dma-noncoherent" DT property, at both the GIC redistributor and the GIC ITS
> levels, [1] instead of relying on the compatibles to handle hardware errata,
> in this case the Rockchip 3588001 errata. [2]
> 
> Let's have the preferred way employed in the base Rockchip RK3588 SoC dtsi,
> which also goes along with adding initial support for the Rockchip RK3582 SoC
> variant, with its separate compatible. [2][3]
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Use "dma-noncoherent" in base RK3588 SoC dtsi
      commit: 33b561eb66f1e271f2899e103c857d20425076f4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

