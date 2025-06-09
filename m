Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840DEC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjZzOQzZWRh5mMcDH3uFDboy3B8BcepsHqYvGyZHYfc=; b=hd7auKmYa2iZeHHZFtZyEsVURk
	UmkLQAQCAQhujPcS2g0A3wfq6zCfFUk/tRnuAU70J4R/EzoxxGmKOosEC+GPyjhP9cL/o0ufJmbRZ
	2KWVcyzPE3JvGwAxwMe4XiAS6EQXub1EH67zzBFXQ1Nwz4oF/b0ejrtB/qcYk/jo/4Zg3zXj2108q
	mizxgsVGMsc4e3+soAF/vzdDyG7ZzA+9qLXHM4awCvh02MX13cxl4OWj3d4aOHguL/1Ya0RCEM1ks
	AFSS5GTlZqrYmwRAOhhVRlKiYDyhRNRJVyQK/ZZPeVO0creURDkRPIgojlyRR2U1ld4+tDQ0tUv0y
	6SMuqPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZwH-00000003vqj-0tS8;
	Mon, 09 Jun 2025 10:41:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZfI-00000003tWA-17Kk;
	Mon, 09 Jun 2025 10:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mjZzOQzZWRh5mMcDH3uFDboy3B8BcepsHqYvGyZHYfc=; b=L/54NyHg4/S2CZeYLrvPzigM4A
	AskTWkXdc6S60+ZR2ivHXR4hj4khflxiVRHUcAmrsHswvGE0GOtYMGGYmx15l0DiCQ2OPKa2GP1gr
	HwHbG9HBfdQWgNlSInLdgVNHstwutdJ8tWB+0OxHiMZ4HcBKspXnsVaiYWsfQhKfZlvM6iTu7aaQz
	aR8Y6yoP7US++iQgygcdI5jsBlpUKIRnOAflOD6ehtv4msQdOndRTfOffhQITFUeU8eUjhY+9p1Vy
	4k173vpgvFAJF5ZpFr5CrpahjVV3YpLECaEnV85JVliuZL/bi7sJ6he/iLXfPdWZt2xh1JTsi6WDn
	0C6agjmg==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfE-0006Av-Ai; Mon, 09 Jun 2025 12:23:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	John Clark <inindev@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: Use standard PHY reset properties for RK3576 ArmSoM Sige5
Date: Mon,  9 Jun 2025 12:23:02 +0200
Message-ID: <174946455542.762051.1386623405149622238.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250520003332.163124-2-inindev@gmail.com>
References: <20250520003332.163124-1-inindev@gmail.com> <20250520003332.163124-2-inindev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_032340_303509_19EC5A71 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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


On Mon, 19 May 2025 20:33:32 -0400, John Clark wrote:
> Replace deprecated snps,reset-gpio, snps,reset-active-low, and
> snps,reset-delays-us in gmac0 and gmac1 nodes with standard reset-gpios,
> reset-assert-us, and reset-deassert-us in rgmii_phy0 and rgmii_phy1 nodes.
> Add pinctrl properties to PHY nodes and define gmac0_rst and gmac1_rst in
> pinctrl node. Reorder phy-handle for consistency.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Use standard PHY reset properties for RK3576 ArmSoM Sige5
      commit: 63136c6fecf44b4f2cb458b01cfdbc2cb0ddd29c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

