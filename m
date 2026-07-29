Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAECC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0Ou3cti2nZ+lei7jUHnYP6r65E3olkMwoazGqJ6vwo=; b=ExmIvgwjfZ2u1V+JgZuBQGasHB
	gzkr+4U2UK8kkEPoJTiJbKRf41WN5eqakK+rzUHIE55OodQjzhOQ3lThbIIZbOewnExGAZ8DyN1AW
	YlTM1WggSqhd+nW7191v9kLuZDu3B7bsY1ObrLtOXg5cKm8lUcANJ2Q/yioV2sd+FL3o1tokb8dh2
	ttGrRaqtFo8my5iYK6FyeQo9we/3QN2tIiMbZJb5htjjdEnVS2ZN/rQeUI2Wdq/dgz25bJ0hV1qkU
	sXgN3nQ35e+4dKNeZ0R9/ZCCXtR16gY0Mm1Habi8zCfwHH2q5gyMgzQYCv9EUroX+7SegxeAP+bE/
	skqENkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Qh-00000007X1M-2gbA;
	Wed, 29 Jul 2026 10:22:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Qe-00000007X0h-1uma;
	Wed, 29 Jul 2026 10:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=X0Ou3cti2nZ+lei7jUHnYP6r65E3olkMwoazGqJ6vwo=; b=WzlDx4SjVZV00n9O2n9t83GIN7
	4Py9ad600bdDcgR1nKuMH8N9BS3EqooCtm0SHmDk3U1dxoWmIKkhnm9aBI+UvwjDY/kGaZYCku//M
	TwHfxg/YTGBkNNoKWZNnhGpd/4GTPySagtPwCLD4OFBZFV/qc7b9UtlFlTrI1vPMTV5ZkRbW5XzHR
	af6duw8MrX1Ohw1xgLMDQz1CPKTIz/kbJX4vAAbvJpD6JX6raOEJqcVLyqY+/IqjkRaSHtCfpKulj
	4e4h/ljmMkkkC9ILsikLCIEAXAA56JtMOidBPo/RXvAV1jRiNX6IXtLj/8f1UP/BvU+kCAmedZ/qu
	TBwqLPDQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: hugo@ahdrone.com, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Yashin <dmt.yashin@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 0/3] pinctrl: rockchip: add support for RK3308B SoC
Date: Wed, 29 Jul 2026 12:22:19 +0200
Message-ID: <5689456.tWeucmBOSa@diego>
In-Reply-To: <CAD++jL=ASH7jx8YOL2Z5i4K8w4RQd4eWKEGtY1KRBwM-JDaw-g@mail.gmail.com>
References: <20260717075918.1869879-1-hugo@ahdrone.com>
 <CAD++jL=ASH7jx8YOL2Z5i4K8w4RQd4eWKEGtY1KRBwM-JDaw-g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_032224_510848_FA86129E 
X-CRM114-Status: GOOD (  12.84  )
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

Am Samstag, 25. Juli 2026, 00:13:39 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Linus Walleij:
> On Fri, Jul 17, 2026 at 9:59=E2=80=AFAM Hugo VALTIER <hugo@ahdrone.com> w=
rote:
>=20
> > The RK3308B is a silicon revision of the RK3308 with a different iomux
> > register layout: several pins (GPIO2_A2, GPIO2_A3, GPIO2_C0, GPIO3_B2,
> > GPIO3_B3) gained 3-bit mux fields in new GRF registers that override
> > the original 2-bit fields. I believe the bootloader enables the new
> > registers via the sel_src_ctrl bits, after which the kernel's writes
> > to the old iomux registers are silently ignored. Whatever the exact
> > mechanism, on RK3308B boards (e.g. current Radxa ROCK Pi S revisions)
> > SPI1, I2C3 and other peripherals on the affected pins are
> > non-functional without this series.
> >
> > This is a continuation of Dmitry Yashin's series from 2024 [1], which
> > was never resubmitted after review and got dropped. Following the
>=20
> No reactions for a week so patches applied.

=46or the record, looks good.

Too late for the git history, but nevertheless
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Heiko



