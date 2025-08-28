Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6C1CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCl/Zqf3cy1GqacBdD6E5ji+678H9QHvDvFzVAbpmkA=; b=KkjSP0R+GGOdtHnTPJKNMButKP
	mxDRDRF5lGnKWgaE319IewthbwjF56cwB0f+wzSEDhJPpjC6i2ehbpCNpnlhMuUxsDA/8KGCVwANx
	Db5LyFL1NzpzKn+z05P7Z253SkjzF9hFd5IyCK4Rb4XikEwRyd1P63Qmkl6OFFhsjtCMGewt4FL33
	8osUvYflHSTe2Y3FNneocMka1/jOWCTM1Q1BjZ811JQzfsIbIiE5PU2xNGFhZGiFFfBtQNT7yWr+R
	7PvDMStiGH7uQS4LCe8Uqyp65IkFlr3EzPXQRAplMi9lc3TPz6KL3H4rxpm/dPMfUg5xiR7W/tLon
	0drW81dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWP-00000002oHX-1QjZ;
	Thu, 28 Aug 2025 18:38:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urci4-00000001kQF-2HxN;
	Thu, 28 Aug 2025 13:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MCl/Zqf3cy1GqacBdD6E5ji+678H9QHvDvFzVAbpmkA=; b=J8LKpzDbGrKXGcpmawPb1/KmCv
	8Qt9lx2aETiDd03fvKU09I7gmFhUToP/HvbiPEybXDx79pwaNVNk9nAL6VePDI371vhx0MM5z/gDy
	0AAgBX3a0gTu8bRgRZh2+EqYpkWCuncxZR2N8/Gfcci8WY3qs1qXdosdYIshdKlBwxsaSUNdwX4ok
	wn7lmsp2701YRJ8X+ucKCMYYMt7aBPFFpG14hdRWYEllZvtvhYmxKZqQlqYNsgaOLgEaNLruaa0gY
	LJadONHKm9o9DZHpVvZTDUjmX1j3R90GGDvioXQWKH0oAGKbwuIqMOzdTnVNXv04Ybj7IiBIsftUD
	fY89WXfw==;
Received: from [185.205.242.134] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1urchz-0004qj-Ds; Thu, 28 Aug 2025 15:30:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Diederik de Haas <didi.debian@cknow.org>,
	dsimic@manjaro.org,
	Peter Robinson <pbrobinson@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro
Date: Thu, 28 Aug 2025 15:30:28 +0200
Message-ID: <175638782390.3533599.13934230022202341141.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827143040.1644867-1-pbrobinson@gmail.com>
References: <20250827143040.1644867-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_063036_581664_6A405B1D 
X-CRM114-Status: UNSURE (   9.18  )
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


On Wed, 27 Aug 2025 15:30:37 +0100, Peter Robinson wrote:
> Update the wake-up pin and associated interupt details for the
> Pinebook Pro WiFi module.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro
      commit: 6d54d935062e2d4a7d3f779ceb9eeff108d0535d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

