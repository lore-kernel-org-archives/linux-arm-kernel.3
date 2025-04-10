Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1415C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbqT13J53edS+fyf8egJnUeNsEUgrz/xn8khgjeEXAg=; b=XZkOYg2P/UYmG1k9poM0HiJLix
	yYB6BcnDMzF8nqU+6+zTBjJCw6OXJxI5O1i7xNpyifXq8Wbxisw1qMaD84VOAX955S9tG6y4gnmTg
	9QPnzpxnt3Ox/Shfoa3DjRB2hCwomjiat+ljSV6v124vT91iv65UNuD76nj05lwxvchqmOcWe9x+o
	SeXv2Z/iduC726AFO8QBfGqp7jkkwa3JsA+BL59Poh+i0/HzSlaHVwWG0Yo03Qq63hQ8E7qY7n7+O
	8Muc0CGI8RZnx5QGpJGe9ZMKe6jDeJiGB1S55v/rxDAjCmXqllFL2CmLuddi7/iyR7krxAUYp8WgY
	dUYUUKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tzL-0000000B3Ba-0DZx;
	Thu, 10 Apr 2025 15:38:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tGj-0000000Aue0-48os;
	Thu, 10 Apr 2025 14:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LbqT13J53edS+fyf8egJnUeNsEUgrz/xn8khgjeEXAg=; b=1j55grGE4MwHPAJ2hPmeqFUSqy
	kJIuCz/HcNHsilRUwpBcCXkzEl2+/avBMc3y7fqXyZyQtAhRah8t6CIWh3GDwYG4CjhX5Y5IKxWWg
	vJQTHTeb5TLL2ANMNQJuOTH44e4hqaDGiJMK9F4EzGMRKkLVr7Q8bltrP4bUbA9wYxDisAUbPyrLl
	sM2fwxdbYn0tDi65vm2lu7YoNoXIZz/VCp84TPjLvWFuPoYLs43RRGba3ps1uejdChyr9RQm0oPKb
	Vq4YXgrHZ2X/ZH0rMIGOg/aRckis1GXNvt9m4haNSa+qOU0Vutk+66lsMlgMc9xIawylVv+SeeXDu
	HNdRIBxQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGi-00012N-1m; Thu, 10 Apr 2025 16:52:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: px30-engicam: Use "regulator-fixed" for vcc3v3-btreg
Date: Thu, 10 Apr 2025 16:52:26 +0200
Message-ID: <174429674408.910874.6701444480288043126.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250409205047.1522943-1-robh@kernel.org>
References: <20250409205047.1522943-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_075242_045507_61B144A1 
X-CRM114-Status: GOOD (  11.70  )
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


On Wed, 09 Apr 2025 15:50:46 -0500, Rob Herring (Arm) wrote:
> The vcc3v3-btreg regulator only has 1 state and no state gpios defined,
> so "regulator-gpio" is not the correct binding to use. "regulator-fixed"
> is the correct binding to use. It supports an enable GPIO which is
> needed in this case.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: px30-engicam: Use "regulator-fixed" for vcc3v3-btreg
      commit: c8c59bcac9300c22abf1afd7e236978a413c3644

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

