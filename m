Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D35EA794A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 21:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XFMh8wOGIk8OtS0B2DBDV74jiHs9qoXDPf51DmnW24=; b=nGGpgZvzCqo/v+bUoCxZP0j03k
	jCm6iBuk1R00iFsFe5rXQ4kbhGVOtELQdMjVDXwRSTfshYMR2OAE4p0P8shzMTgB3FK0sxcu9Wfsz
	Uk/vUKyPo9V9AyiCVCexlMXIfZnqFJ8m3Rf5HP3JiUA8BlUZpumI0NT5FT7Hgdq9W8fmu1HaBoy+Q
	DKhFclQsrIVacEKO6SRrKT3yrOXaUN1A55GDWOm5W4hcSfF1Q0bF7erqEnc7FEqYZYU5Nyozk/sel
	sdhEssBFN7x78w46qpzZR5viYAwg4tXkYOVNXVnNl1EcAXMeeAH7PLQzy7ud29Hm/mHD+KmMWLkjb
	n8oTB8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkq8-000000097G4-15Rt;
	Wed, 04 Feb 2026 21:55:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkq5-000000097F3-3phS;
	Wed, 04 Feb 2026 21:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/XFMh8wOGIk8OtS0B2DBDV74jiHs9qoXDPf51DmnW24=; b=keup7KAvGA9+FZiipfKpK5e3Cv
	qINYcuYGtC7GaTnJwqtZ3YIlPw+ASc9VtOCmxEB7ZakuoUmdUO/8yzG3IFwQXrx7HZPuh9BAwnp3m
	Q28m1MM0fGiywdmpeQSnFObnheEV7tXnFkX8Dg6Ackta6bhM4z5BO9Ex1BU979Q3DoQ8kGnQN2w1j
	XNQkOpoItp28C463m4Nfeq+gt6doyWgLH6PmMrxTGTomzlJfXabGkd1/f/mGN3RQeBd+UgLqYPI9A
	Ha/8MXWq47pebtcHvu7vc9lKATwjjueR1Fin0Y9ktKSnn+OPYdfmbTiAIlGjFouJKuv16XTGBA/R7
	HAMmwo8Q==;
Received: from i53875ac7.versanet.de ([83.135.90.199] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vnkpv-0071Uq-7Y; Wed, 04 Feb 2026 22:54:59 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 6/6] net: stmmac: rk: rk3506,
 rk3528 and rk3588 have rmii_mode in clock register
Date: Wed, 04 Feb 2026 22:54:58 +0100
Message-ID: <3238497.eGJsNajkDb@diego>
In-Reply-To: <E1vnYyB-00000007hpF-1dwK@rmk-PC.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYyB-00000007hpF-1dwK@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_135509_974472_0E48CAD0 
X-CRM114-Status: GOOD (  11.36  )
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

Am Mittwoch, 4. Februar 2026, 10:14:43 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Russell King (Oracle):
> rk3506, rk3528 and rk3588 have the rmii_mode bit in the clock GRF
> register rather than the gmac GRF register. Provide a mask for this
> field in the clock register, and convert these SoCs to use this.
> Add the necessary code in rk_gmac_powerup() to write this field.
>=20
> This allows us to get rid of these SoCs set_to_rmii() function. As
> such, we need to mark these SoCs as supporting RMII mode.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de> #px30,rk3328,rk3568,rk3588




