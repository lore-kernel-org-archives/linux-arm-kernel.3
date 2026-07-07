Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17138C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzSD/WRXSlgKfw1SIJ9ztQiHBCfypInUCvizihETDao=; b=BNR/WPIdAxgifnqJWbUQdIfY5h
	aiO54vciOiI72eB0WhCFuSreVnQ0IrIv9UyOOOASUIc/cNAjQA6iyyzaS079h9G6QHtFEYYic9aR8
	aoBtqQbJ3GY5jWr0X9+4bTnZVyhQ4uVTbILKr0z7ecyvJjc2x5E7iwf1nZSr54BiNW01SoAWOGcAH
	c4Gby84abPrs9G4FoCo7KMdZI8QIYWXsLqkzaDKr4KNFchfkb3Ru0a7grJz5D1Ox0vEhseSWCJSBq
	t7JB3/gPiDTCAv/tfpzcb5377Pc6d2X/k0hgyfX/9aZMNU0MzLY6feDfMIQRtV4YGQZg4YwsdLbDS
	LUZsXPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBCR-0000000Fjf7-04Wc;
	Tue, 07 Jul 2026 19:11:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBCO-0000000Fjdd-0x0S;
	Tue, 07 Jul 2026 19:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CzSD/WRXSlgKfw1SIJ9ztQiHBCfypInUCvizihETDao=; b=0tNkP0sM9hr4FZjY++IN4eXAym
	vUXoSgMGph9rYpY5YQiICFxdvkb4gWX5CkBKDtyzVM95S6pBYN3Tg6g4mEHcUCkogYvGpdWjP4bW9
	D6xOzbUOg0NJZMg12EspXxOL9FEq0QPcmXEHq5mmSVwRlxEsyiGwE0t985yqwAbAXTlUUv56B1wxg
	Wko+DbvaIYA0Q07bIRq8H1ArSEHrkXFHBHUm1gLrtWzk8xnSeRU8fE+RJXY5KiqzDyLdHoZJ15+6v
	FS5nYLb1LZPj45gwqQa9ItRL6q5n1lTyXfUaAhjfu/Mz8dn13ZFXOsi4XTtX8pnUquUUPnHRef3GM
	E0IQcJVw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Diederik de Haas <diederik@cknow-tech.com>,
 Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 00/12] arm64: dts: rockchip: Add NanoPi M6 board
Date: Tue, 07 Jul 2026 21:11:10 +0200
Message-ID: <118899013.nniJfEyVGO@phil>
In-Reply-To: <CAPSPb=tZ1FenNfEM5P+DWcksKvpQjyQQjAWTRdyxb7=YYxY_rw@mail.gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
 <DJOWHH5K7P76.3JPJVO47K1SZE@cknow-tech.com>
 <CAPSPb=tZ1FenNfEM5P+DWcksKvpQjyQQjAWTRdyxb7=YYxY_rw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_121116_262869_DB6790D2 
X-CRM114-Status: GOOD (  21.42  )
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

Am Freitag, 3. Juli 2026, 22:23:32 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Joachim Eastwood:
> Hi Diederik,
>=20
> On Fri, 3 Jul 2026 at 13:30, Diederik de Haas <diederik@cknow-tech.com> w=
rote:
> >
> > On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrot=
e:
> > > This patch series add support for the NanoPi M6. This board is very
> > > similar to the NanoPi R6C and R6S boards which are already supported.
> > >
> > > Main differences:
> > > * M.2 M-key slot with PCIe (Also present on R6C)
> > > * M.2 E-key slot with PCIe and USB (from hub)
> > > * 1 additional USB 2.0 port from an on-board USB hub
> > > * RT5616 audio CODEC
> >
> > This seems to be the M6 (2405 aka 'V1')?
> Yes, correct. This patch set is for the original M6 board. V1 if you like.
>=20
> > Because there is now also a M6V2 (2603), which uses an ES8389 CODEC:
> > https://www.friendlyelec.com/index.php?route=3Dproduct/product&path=3D6=
9&product_id=3D319
> I did notice there was a new version, but I hadn't given it much thought.
>=20
> > Is it useful to already take the 2 M6 variants into account with this p=
atch set?
> Yes, I think you are right.
>=20
> How about this setup:
> rk3588s-nanopi-m6.dtsi
> rk3588s-nanopi-m6v1.dts
> rk3588s-nanopi-m6v2.dts
> This mimics the setup for the R6 series boards with rk3588s-nanopi-r6.dtsi
> and rk3588s-nanopi-r6[cs].dts.

yes, that would be the nicest way I think.

Thanks for taking this into account
Heiko



