Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462D7C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBYMe8AWciFRbGt/UH6lyqSHdnAGgD4jpjABIeG45Ss=; b=3jENQ7EKK7XfBjmCx2d8ol0hry
	mcEgB4krLfW2lMVxJ2UJM9qcwcoyxc6vTOoP2sh/SOgdRKsh34uotPpXoOAqWPoRWx/V7Msb3oavs
	xRJHpNGddPatoifsTGP6GVIacXy13l0TVbA9WSoORVjucVUE6WXlr0H1N4PKhr68j+cyKGWJnAvai
	FUxgGVlIHTNm9UmrMCLEEFSWu4VZE3PMF+AeUa2Sl4rMuD0rGzuDOqebDLPGLiucFSUcyyZ8+OKHM
	X90CQ/VZBGlqjUlKWzduBTsxSJScDYMlkJvkd3MAdI1xswqTFyIcR6YOS7T208r/9WJFZwFrAXTVs
	9RtUkYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkk-00000007S2o-2U74;
	Mon, 05 May 2025 13:21:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvS7-00000007Pye-1W0Z;
	Mon, 05 May 2025 13:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WBYMe8AWciFRbGt/UH6lyqSHdnAGgD4jpjABIeG45Ss=; b=G/pbePtf629UUQemqdlgBwP/jR
	MZV+7whYgmJ/tAJLSU+DLyqCxZ/wfKCgiDyKBYAfD1wpq88Eu8+7hPhfNwcNJcHvbYUTsRYld6gyi
	Vzt9xbaQYFL6tKFKTRveu/knLvUBh+thg5wLRJpoEpgJadUBlIRLHtza6Kizff+5la/rQMNIFEiCO
	GKL5qQMaJ75xsZpMB81aB0HsJoV6bL6kEpR5OC6723rGQezQeFzKGcqEL9COaPSx2ITSiX21OoIC0
	Uc0vDch+cxHvVi5mbuRSPsEouddLoxf80+lxq6bWHL0wFwh0+9xub7lByQds7VRztvPVUAWJ3gn1c
	K6hodFqg==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBvRd-0006mT-UT; Mon, 05 May 2025 15:01:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] RK3576 Hardware RNG
Date: Mon,  5 May 2025 15:01:07 +0200
Message-ID: <174645006215.1225797.3007982185133849135.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430-rk3576-hwrng-v1-0-480c15b5843e@collabora.com>
References: <20250430-rk3576-hwrng-v1-0-480c15b5843e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_060147_421713_3A9448D3 
X-CRM114-Status: GOOD (  12.01  )
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


On Wed, 30 Apr 2025 18:16:33 +0200, Nicolas Frattaroli wrote:
> Gee Nicolas, how come your mom lets you write two Rockchip HWRNG drivers
> in a year?
> 
> In short, RK3576 (and RK3562 and RK3528) introduce another HWRNG IP. It
> actually has quite a few cool features, but I ignored the cool bits and
> went straight for the true entropy. Some of the cool bits someone else
> may wish to add in the future: AES-CTR PRNG that's regularly reseeded
> from the entropy, adjustments for oscillator and oscillator ring lengths
> to maximise entropy generation, automatic continuous quality checking of
> the produced entropy by the hardware itself, etc.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: rockchip: add RK3576 RNG node
      commit: 5268f3b5d29887480011b44567bcbf0d422cda94

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

