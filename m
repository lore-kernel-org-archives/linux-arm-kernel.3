Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A2EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQbVUX9DGectl4cZrWM+928q6CAZcLW6ZWeZi0G8Co0=; b=t1B5tBFRJ87mdNQ8ds6XhzNk3v
	VTEKQy8likuhXTeQ91rSbaFWHK+n931RHv5YuqyhBOQVlKteGH3en++dV0TSywPEVe5Ro47VPpeTs
	epNJestXXSaIsqNrhVs145jCBrL0miA9zx4CvCgzla7S+c1BpW78ArYmQC7+mVH2UP55NcrOVuK+x
	10W83+VpmappLlIw5hckvnJg5X+KLjomd4bLT5zyEsG5UO+fISRlt3JP3T0OIZMFTJ/TmEE/wRlJY
	Xe5tHqiJc221hUx8Kb7YfEfmJ+efdjCJKUVNNwPfOnjLEryAtPJO8ILfh6vNvLMJrctkNnSiUGYIL
	cpw5gjzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toMPW-0000000DxCU-3f23;
	Sat, 01 Mar 2025 12:57:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toMNw-0000000Dx2y-2hG3;
	Sat, 01 Mar 2025 12:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QQbVUX9DGectl4cZrWM+928q6CAZcLW6ZWeZi0G8Co0=; b=yrqnQ9n8A3aSrv/NYvybjVGf10
	ts1rw/5eQKEt40caJ4d+/dnSv5q4UHtWYEnHaUjswye8w0xjrMQOvq1E+6Sqg1as1RA0jOK1Mfmyk
	rj1pt6cCZJQzHUf3kAuQ6ngCUWaLVl6EOn8dY5P/b6rrJPXbV70H38nAyAZaE0Crv9hNoRA9msWZc
	9MOL5/Tcv3jQR/Xceg5I8sINY48k0koIl1W4wQ7syhBdlYbfB8LmVvMYMZqCU0cuyQPI5qJNdQglR
	994u4Xh9A8I0AO3O4X65sHENstTs9ALMWwoh6wdMspFTG/MIgKVU3sUl9eC+vMd/0DTkaIvwisBVU
	sa0ITHTw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1toMNm-0008HZ-Vb; Sat, 01 Mar 2025 13:55:55 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Yao Zi <ziyao@disroot.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Frank Wang <frank.wang@rock-chips.com>,
 Shresth Prasad <shresthprasad7@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: rockchip: Add SDMMC/SDIO controllers for RK3528
Date: Sat, 01 Mar 2025 13:55:53 +0100
Message-ID: <3574922.QJadu78ljV@diego>
In-Reply-To: <9fd51bcb-3e6a-46b6-b1f7-ff16fa562d9e@kwiboo.se>
References: <20250301104250.36295-1-ziyao@disroot.org>
 <20250301104749.36423-1-ziyao@disroot.org>
 <9fd51bcb-3e6a-46b6-b1f7-ff16fa562d9e@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_045604_698195_15903536 
X-CRM114-Status: GOOD (  22.38  )
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

Hey Joas,

Am Samstag, 1. M=C3=A4rz 2025, 13:47:47 MEZ schrieb Jonas Karlman:
> On 2025-03-01 11:47, Yao Zi wrote:
> > RK3528 features two SDIO controllers and one SD/MMC controller, describe
> > them in devicetree. Since their sample and drive clocks are located in
> > the VO and VPU GRFs, corresponding syscons are added to make these
> > clocks available.
> >=20
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 62 ++++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3528.dtsi
> > index 5b334690356a..078c97fa1d9f 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > @@ -7,6 +7,7 @@
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
> > +#include <dt-bindings/reset/rockchip,rk3528-cru.h>
> > =20
> >  / {
> >  	compatible =3D "rockchip,rk3528";
> > @@ -122,6 +123,16 @@ gic: interrupt-controller@fed01000 {
> >  			#interrupt-cells =3D <3>;
> >  		};
> > =20
> > +		vpu_grf: syscon@ff340000 {
> > +			compatible =3D "rockchip,rk3528-vpu-grf", "syscon";
>=20
> vpu_grf is also used for gmac1, so should possible be a "syscon",
> "simple-mfd", or have I misunderstood when to use simple-mfd ?

simple-mfd is needed when the additional device is completely contained
inside the particular syscon.

=46or example, the usb2phy0 on rk3588 is completely living inside the
usb2phy0-grf.

Similarly the power-domains are living inside the rk3588 pmugrf.
But the pmugrf also contains more stuff, so the power-domains are a
subset of the pmugrf.

Both of these above are a case for a simple-mfd.


Similarly, gmac1 on rk3588 is ethernet@fe1c0000 , so a completely separate
io-memory area, but references both the sysgrf as well as the php-grf
as syscons for additional settings.

So here the syscon does not need to be a simple-mfd.


Hope that helps a bit
Heiko



