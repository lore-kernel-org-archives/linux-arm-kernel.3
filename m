Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D7FC1B0FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqrpVcukWiPJHZAYarKFFVSdPnEDo55grdH2sUNNyGU=; b=JUBdw+ZASUtiQ6/FG66IHdcUPs
	hbBHjl0T8OWxuN2fg700GRm37npxCK+Qd+OIVEITTqXLLDyeMK1SiCgaA/QHSX3STuLCFsGlbnRZO
	3mxvHeQ0Xeb3RBzVJ0EHd3b/Ey/8xDPI/8KyXRtRqesp19ZgB2msirMnMc66Z6HsmtyhVNe9zwXuX
	WbmoOtGpsUzAWZfRrYxe9yJ3RXRcGsQEeJjBoxwaWt42R6vzu6PBZ01anjHjypH6EFkK15Y4YTuW8
	m9g3WHzRnKhvcA/daseKab8cqoaYhcE/JjY+gwSmJX4CoJjls/nJQB8ybByJh/Qm28XtPH5r6Teuu
	phdFBv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tneOi-00000007cSf-13Fs;
	Thu, 27 Feb 2025 13:57:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tne5i-00000007Yo7-1tNU;
	Thu, 27 Feb 2025 13:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EqrpVcukWiPJHZAYarKFFVSdPnEDo55grdH2sUNNyGU=; b=aZ3vtivB+XgSXInEOjW01ujZzv
	L5CT2fPsvG8DkgwlFzHlgNaCpePMzTvbxuvMSP4LvayGKg8k0dh0aCmGnqkM4XCGtiZEcVfjgREiv
	xZRQPa/vXFQ/MX4SLyKHr6lAGrDJCcA28V3g7xNW1jhuPgzw8FMnKV0lFs+9xnlHfVirfCqflteRW
	PQo7XyklEH5JkHwFqT+gNB+vAkA2spnvszkITg6J4R+PavD5t3zxiVrb+hhk+PUdINu3SN2+/ZWPA
	Rthh9I/Imy7oNe+TycnWKm1U4I7Dxz2M0nYUyWLbbedGa5RL4bQgqvBKS66C77FQVyoZkPdJhhmie
	+9WcH+8g==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tne5a-00018T-D8; Thu, 27 Feb 2025 14:38:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Tianling Shen <cnsztl@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Justin Klaassen <justin@tidylabs.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: fix u2phy1_host status for NanoPi R4S
Date: Thu, 27 Feb 2025 14:37:55 +0100
Message-ID: <174066344876.4164500.4889326027410145249.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250225170420.3898-1-justin@tidylabs.net>
References: <48c705e65cc8e8d4716b41a4a87170e3@manjaro.org> <20250225170420.3898-1-justin@tidylabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_053818_489202_7ADA547A 
X-CRM114-Status: GOOD (  12.08  )
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


On Tue, 25 Feb 2025 17:03:58 +0000, Justin Klaassen wrote:
> The u2phy1_host should always have the same status as usb_host1_ehci
> and usb_host1_ohci, otherwise the EHCI and OHCI drivers may be
> initialized for a disabled usb port.
> 
> Per the NanoPi R4S schematic, the phy-supply for u2phy1_host is set to
> the vdd_5v regulator.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix u2phy1_host status for NanoPi R4S
      commit: 38f4aa34a5f737ea8588dac320d884cc2e762c03

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

