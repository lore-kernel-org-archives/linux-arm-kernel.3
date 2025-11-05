Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F856CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 23:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqGD0QYI7TiTsk6Wh+7QyORQeVGQ1Q1viVMxjGD/NsM=; b=Ejh12RBPHxPBf74ZeqRXv+nYbN
	VcPLElBcMP5u8uWTuzVhdUtUdCjASkRzeDzpiOAmEinGQWanhX/3QR/iVUAtTln9WDw+v5el93Viq
	fWop2EIaiMm2nIrWNiA9tWBrM+yqUbZqLtHptoeAcx0lB980nWWqPMtn9cAZWjlVIRAzSSwDcBZ5e
	ZSuTERqHkPMidrO9IYXx4wUlxA4u1q3LVkYpBhVc/OID5BNjCqlAu0a6S+myGr0mF8FH8Y7uVoNAz
	rTFqMw0kHC/b2JnekpZ/k5norheR0y29cAaBBHyWsQlI/WLQNBbcx6VwSpPXxv5aCKdj+DSnQoRcL
	fZI4Erww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGnA8-0000000EcbB-1tCw;
	Wed, 05 Nov 2025 23:43:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGnA6-0000000Ecai-2kEt;
	Wed, 05 Nov 2025 23:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vqGD0QYI7TiTsk6Wh+7QyORQeVGQ1Q1viVMxjGD/NsM=; b=cfli0nwcgYEtYaOCBzK2Fuw+we
	hezAoitjvDzh6bFK9jUW/nj2qqVYaDTVNY1sOs/SOeFcH8JhQjbA7aZrby9THQVAGI+C0JlQNOvce
	h4g3Sz7OcY/x78yJxDFeZ8pt1BLLt0MVb1A9TOGWFjkZ6xDSqAkIBfO9nrPuKKCeg4ZTFn8CwvoFG
	MpD0mgzYOAsLqnW7yWE2ZRq4hr8EWFp3uomyB+EvGHHlTu0S1QWMg8dgAex5Rcqp7Nm/ymvtTFlGU
	Q+eGzHOpp+CmMTSrrmsvX2vppJoJfUriPDuzid+V3hs3kZv/2QV1bFN+rt2LskszVrOdW/ymSePrd
	kAHdXf8w==;
Received: from i53875bde.versanet.de ([83.135.91.222] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vGn9z-0001MR-L9; Thu, 06 Nov 2025 00:43:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, michael.riesch@collabora.com
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: use SCMI clock id for cpu clock on
 rk356x
Date: Thu, 06 Nov 2025 00:43:26 +0100
Message-ID: <5996423.DvuYhMxLoT@phil>
In-Reply-To: <DE0SFV203UMS.1ZV2JE6QEPN29@cknow-tech.com>
References: <20251103234926.416137-1-heiko@sntech.de>
 <20251103234926.416137-3-heiko@sntech.de>
 <DE0SFV203UMS.1ZV2JE6QEPN29@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_154334_696748_09F87F22 
X-CRM114-Status: GOOD (  18.60  )
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

Am Mittwoch, 5. November 2025, 14:16:42 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Diederik de Haas:
> Hi Heiko,
>=20
> On Tue Nov 4, 2025 at 12:49 AM CET, Heiko Stuebner wrote:
> > Instead of hard-coding 0, use the more descriptive ID from the binding
> > to reference the SCMI clock for the cpu on rk356x.
>=20
> Any particular reason you only did it for the cpu, but not the gpu?

Didn't think of if at the time :-) .

Will prepare another one for the GPU.


Heiko

>=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64=
/boot/dts/rockchip/rk356x-base.dtsi
> > index a3361527d4fe..d0c76401b45e 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > @@ -53,7 +53,7 @@ cpu0: cpu@0 {
> >  			device_type =3D "cpu";
> >  			compatible =3D "arm,cortex-a55";
> >  			reg =3D <0x0 0x0>;
> > -			clocks =3D <&scmi_clk 0>;
> > +			clocks =3D <&scmi_clk SCMI_CLK_CPU>;
>=20
> Regardless of the above comment, feel free to add
>=20
> Reviewed-by: Diederik de Haas <diederik@cknow-tech.com>
>=20
> Cheers,
>   Diederik
>=20
> >  			#cooling-cells =3D <2>;
> >  			enable-method =3D "psci";
> >  			i-cache-size =3D <0x8000>;
>=20
>=20





