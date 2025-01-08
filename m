Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CC1E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEKuUp6eK4AQc3wwaf4maYj/ZOeK94EgW3nX9qE7bw0=; b=j2dUl3vTGA/SNXTxbFLPIY+Gtu
	BBAjpNOgIYhcJM3kqFIyD53pnMcjbebFGIocuqUj+x3WwGZx3t5HTiHGtEqJghBLrWPmi8qoFKM/K
	4W6UrAVscGOBwP+2Dj6DHGcEka6sWhFOExZpZc1uqdC+HneOKpOLOvijLabkvSr+Jl+I3YblN8VuW
	np4jZJ8pDRFv8MKTkRyGbByPL8hv7CdTWv7lQXGQmXZNEUXHBxLJ1QZQ1k8/kQVKGrjloH2Cb4hgQ
	SoSVZLaFnjQkpE+wrxO6Ao0Wtf8/H9ZrBf8ufPUP/HhATPNgfXpUkfJyjIrUBkhZVyncuh/OggNgR
	8/KKXzYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVnH-00000008YE0-1UVu;
	Wed, 08 Jan 2025 13:08:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV7s-00000008PuZ-1RDQ;
	Wed, 08 Jan 2025 12:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SEKuUp6eK4AQc3wwaf4maYj/ZOeK94EgW3nX9qE7bw0=; b=VLb8w03rUpvuGFHfO6zrkXhWWk
	RN6z6K7Tc5qV+AH0xvLxLsGDWieWszSbVa5zw3eBMrlLB0cwYtrnX9vbeiGmslFn9kJy3EhyPR3qM
	PQ97EFsJWNGDctB+8Ww7Nqx+SBcd+GAHeTvqeHRRWtKcD5DiVB1BPeoNJUf84OYOGVOhK60GsGell
	JcJbtGl945ZlEfs4xNfK0L6tgRm5A+/5SOEhO7bkj30lR1rxcsCQrAlWaYRs1kVRQHSSmfK3mAyxR
	vryR8Nk4tcCaXxWTxnT2nbANk74MCuisgGqtPITqKF+42FGgF4KRMoAgmfvsfz9ZSB96GMn+ZpsBC
	eCv5UOYA==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVV7p-0005gn-53; Wed, 08 Jan 2025 13:25:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Rebmann <jre@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: Re: [PATCH 0/2] Add FRAM to Protonic MECSBC device-tree
Date: Wed,  8 Jan 2025 13:25:16 +0100
Message-ID: <173633908211.2779821.7196542630655064232.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219-mb85rs128ty-mecsbc-v1-0-77a0e851ef19@pengutronix.de>
References: <20241219-mb85rs128ty-mecsbc-v1-0-77a0e851ef19@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_042532_381793_8C3E846D 
X-CRM114-Status: GOOD (  11.95  )
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


On Thu, 19 Dec 2024 13:34:55 +0100, Jonas Rebmann wrote:
> The MECSBC single board computer is equipped with a Fujitsu MB85RS128TY
> FRAM. This series adapts the devicetree accordingly.
> 
> Tested on current mtd/next which contains the required driver and
> bindings update:
> - 5b68d4d2db29 ("dt-bindings: mtd: mchp48l640 add mb85rs128ty compatible")
> - 02ba194feacb ("mtd: mchp48l640: add support for Fujitsu MB85RS128TY FRAM")
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: MECSBC: Remove i2c2 node
      commit: 60f7293a3da9eb1d8127cb8e331ddfc4ed605ff8
[2/2] arm64: dts: rockchip: MECSBC: Add FRAM MB85RS128TY
      commit: bd266303f7a44bd033f9580ce4ef161684aaf468

Moved the new &spi node to its correct alphabetical position

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

