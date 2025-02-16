Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EB2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3B5AHta8iT81vmhTEO3/fEUlWSWkvof26s+ONKqoy0=; b=SW8b3JielQPFgvuaf2aX7sPu2t
	0+Ds8B77VG8+EqgnVgLfY0hw3Z2/wyQPaoOnr9xxn/6LYwcfwtqSNVZOI1M+AmChy68wtQtuZ+YET
	U8RnujiNE5fOiePj3Ui565oCWD/n/GoWI2LKPJnNb35jSPHlP2eMCIOxGRurJy9aKg62r+hbGsIIZ
	cK4Aku4tbvyPWE4GCQ3yEtt9v9iPSCcYTvomtrBk0nJxg/s1h1a4GJMUTgqem5T5S74rBlEDQ43VT
	mUIKrJIZT1zfjVjL+xsOwjbrz5ID+r+piVq9i8ba/tk+bnWOkTnHGjko5mk9jaVjILeAoN6s1m3Xf
	wSfz6JwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjggO-000000021sd-0dFc;
	Sun, 16 Feb 2025 15:35:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjgew-000000021hL-2C4l;
	Sun, 16 Feb 2025 15:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X3B5AHta8iT81vmhTEO3/fEUlWSWkvof26s+ONKqoy0=; b=sfEtQBKPCi+F28t1DCWdgzr+rS
	ZT0m+CgsJ/TAjHBJfAkL6XIWqlm/gAVG5gbA+jSKTjOdO4i+LUPw8dt/+bBPYbwrK+2wI6wbshOA/
	7ctZhdsbaEuwtMXbdPxMLmdres3KxLyF2I6nJM6A4TDFXXnCUDGTSCIVhFFIlmCdG7y4wfDkhb4aA
	VJExjfyLn6B5NmvNQz9hctvZyUeAeZZlLH+MU4Q5n5T5fYy0Af+9kKZHwBvzvxbkGp5RwRHvzh6or
	rxb/WfRFI1i1xanjQxM9Vq0db8NSVOTLPSg0IbP8dpaVtkm6oyWhGbW3OEAEni1qpbRoV7NwtiIOi
	Xqwl+HNA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tjgeS-0007m6-5F; Sun, 16 Feb 2025 16:33:48 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	XiaoDong Huang <derrick.huang@rock-chips.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lin Jinhan <troy.lin@rock-chips.com>
Subject: Re: (subset) [PATCH v2 0/7] RK3588 Hardware Random Number Generator Driver
Date: Sun, 16 Feb 2025 16:33:37 +0100
Message-ID: <173971983108.1865604.1801020506672691939.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250204-rk3588-trng-submission-v2-0-608172b6fd91@collabora.com>
References: <20250204-rk3588-trng-submission-v2-0-608172b6fd91@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_073418_615016_B53214D2 
X-CRM114-Status: GOOD (  19.16  )
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


On Tue, 04 Feb 2025 16:35:45 +0100, Nicolas Frattaroli wrote:
> This series adds support for the Rockchip RK3588's standalone hardware
> random number generator to the existing mainline rockchip-rng driver.
> 
> The RK3588 has several hardware random number generators, one in each
> the secure-world and non-secure-world crypto accelerator, and one
> standalone one in each the secure-world and non-secure-world, so 4
> hwrngs in total. This series adds support for the standalone hwrng,
> which is an entirely new IP on this SoC and distinct from the one in the
> Crypto IP.
> 
> [...]

Applied, thanks!

[6/7] arm64: dts: rockchip: Add rng node to RK3588
      commit: 6ee0b9ad3995ee5fa229035c69013b7dd0d3634b

I've dropped the status=okay - this is the default so not needed
on always-on blocks

Also dropped the rng phandle, as boards should not need to change
the rng.

And I've changed the reset-id constant to its "48" numeric equivalent.
The reset-id change is making its way through the crypto tree
(needed by the binding-example).
I've also queued a patch for 6.16 to change that back once the
header is available to everything after 6.15-rc1.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

