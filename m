Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B117CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3hysh1IuHC3Dp9XzTNJn7TLfYrR5FrB1YWba0t3M3k=; b=CrmEmjhtj4rvczPwIhm6+W/mCN
	a3fKu3jIGFN2hGD4PU3zhPDK3GkLQEkVSHHmb2CPFNuxBhEhIUDObN+Uekzf9Xg7v+IXP5xLKkPFR
	QPY/yJ9xl7n0pSuzSRENP98c0y2vhQZ/AWKzvjYyiH5D9g8aDoLeA8I/yQE1Q2gkZQkOlExR7yUrP
	uIfpv0c1DzGw5oa3TuuyqZ8VcQTXphH+1RCP4ewDU4eAZHOaLuVAZLk8J6I5lQCkBDbOXWkInnXgO
	uOw24BCG6DnTSohTnsihcm0rrkiv87SYT/HhtiR/k8aD5JRfZcnV7sGH3f8QyL6oMRgdgFNepHqnv
	24ZprCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKsc-0000000FcBk-0Zoj;
	Tue, 02 Sep 2025 06:52:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKpr-0000000Fbdt-2OXV;
	Tue, 02 Sep 2025 06:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=L3hysh1IuHC3Dp9XzTNJn7TLfYrR5FrB1YWba0t3M3k=; b=cjdiXPnWzvSvRuv8Q6fPuIwF/4
	sHkk1gs59SSS6D16goSAnv08ppr71gIlpiKtrGwjWSvhv/ZyOouGVsLmf/Y429du9uAXmv4M0fI6m
	3MGd0rZ+b1Ov/laSJ9w6G6KiRBdYw0EY9D+m8gLKaNAmsu7ZVCx4rTzWsZUT9tg5QP3vjCPShjeVM
	yjDna1BAzyPmkD7XPvRdHZJbHHl/nR2PPOubn74Tcg9ShSIoAb5F4xv6GPHW+CcBaXkr++nwz/IyV
	FYAFPYqj9qz8406lYoZvNonf6I4XZKG8SUeRI1mjUFsr+hYGhtOlCSJbmM0HHuS3kLH+pIXpjwEgE
	r7DFLeNg==;
Received: from [61.8.145.255] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1utKpf-0003Qz-Ke; Tue, 02 Sep 2025 08:49:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
Date: Tue, 02 Sep 2025 08:49:29 +0200
Message-ID: <5052759.PIDvDuAF1L@phil>
In-Reply-To: <CAPEOAkQYA+XSx9QJSmNFLypH0ifE1jvui=MHiEHZ+5a3SR7=uA@mail.gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <2235041.irdbgypaU6@diego>
 <CAPEOAkQYA+XSx9QJSmNFLypH0ifE1jvui=MHiEHZ+5a3SR7=uA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_234943_630720_5740CD5E 
X-CRM114-Status: GOOD (  24.29  )
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

Hi,

Am Montag, 1. September 2025, 02:17:00 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb =E6=9D=8E=E7=BB=B4=E8=B1=AA:
> I actually used script to get the maintainer list, but I was not sure
> whether I should send-to or cc every maintainer, so I consulted the
> AI, and the AI said to try not to do so because it might be considered
> noise email, and only send it to the main maintainers.

please don't top-post :-)
https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interle=
aved-replies-in-email-discussions


> Should I cc all the devicetree maintainers with the next patches?

Looks like we did get an Ack still with even only one maintainer listed,
so don't need a resend ... but yeah, please include people listed as
direct maintainers in the future.

Workflows differ, so when submitting a patch you can't know if maintainers
work from patchwork or directly from their inbox.

So it's safer to include more people than not enough :-)

Some trimming of the list can be done though, for example your drm patches
would list the core drm maintainers who most likely do not really care
about individual driver patches ;-) .

get_maintainers.pl thankfully does list the role, so you can decide based
on that.


Heiko


> Best regards,
> WeiHao
>=20
> Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B48=E6=9C=8831=
=E6=97=A5=E5=91=A8=E6=97=A5 23:00=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> > Am Sonntag, 31. August 2025, 12:48:51 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb WeiHao Li:
> > > Add a clock id for mipi dsi reference clock, mipi dsi node used it.
> > >
> > > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> >
> > you missed a number of devicetree maintainers, Rob thankfully does
> > not need to do this on his own anymore.
> >
> > so please get the appropriate list of maintainers via scripts/get_maint=
ainer.pl
> >
> > Change itself looks fine though.
> >
> > Heiko
> >
> > > ---
> > >  include/dt-bindings/clock/rk3368-cru.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bind=
ings/clock/rk3368-cru.h
> > > index ebae3cbf8..b951e2906 100644
> > > --- a/include/dt-bindings/clock/rk3368-cru.h
> > > +++ b/include/dt-bindings/clock/rk3368-cru.h
> > > @@ -72,6 +72,7 @@
> > >  #define SCLK_SFC             126
> > >  #define SCLK_MAC             127
> > >  #define SCLK_MACREF_OUT              128
> > > +#define SCLK_MIPIDSI_24M     129
> > >  #define SCLK_TIMER10         133
> > >  #define SCLK_TIMER11         134
> > >  #define SCLK_TIMER12         135
> > >
> >
> >
> >
> >
>=20





