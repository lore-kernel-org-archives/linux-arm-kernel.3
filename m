Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE65EFD238
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2FVw1Jjv4YamguvXiaYBNnqdEOuqllBWzjW+UVlpnc=; b=GZyM53eYZXEKVfxrw11ojLvHWK
	ZbuouZIkcE9SxX8amMHpWqA6Zhdekv37Mib07xZaSq8yHhPZ9AyHGupEANOG6c6TmJYU+a78+kFJZ
	pLXVjyjCPNVYic+eJhrzyuJ5pKtN96ecyN52yys1+rKYsH2mdrqRXfnRAKgAm1leVGQN0r+2FKCK0
	zaxy41AaxHtvZQSnsXybXb0c/A3BUvuOs4MMPcfEvd4clZGB8kuFCBIeil4ugbhnE34YBWOAAL+Jo
	xOdnrnQPtdYjTv3l3RoK2I+bvciKMERIdhub5lCPaNzEWbvCGydBVEsDD7yrtcFYi/MXV+8O5Ssb2
	tzhRFrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBPv-00000003iSD-25Uh;
	Wed, 25 Feb 2026 09:42:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBPt-00000003iS5-1qk2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 09:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=A2FVw1Jjv4YamguvXiaYBNnqdEOuqllBWzjW+UVlpnc=; b=Ta9EgB0zbsH+bMNEQzQXptU/R/
	rEheCZjM+r/A/rjHuSTYN9gX8x9X8U1ggQpGjiCvWI1k3JohRXWTOmj0VTpN0gtGo9YLTuZa/g/JC
	LzyLELg9vfaTEfdFOZUba53UpsWOZgQkddxhT9KEFmoDKhMwnrebUBCCe9UnV6cUKCtYyg12pR/kn
	qywireXiusy+61Y/Vwl+IYoeRYFgEmAaOpnNLg2uywc+B83QBEddcGZNr0cVN/XQgUoKmBFyuxyff
	qSBnGP/2JnMW2ZoToGMeidRJIP96UnG9RKr6wLTRuezi5GdDuyPlb28tkNUEUvNPQLh23XSY59K3O
	AHIIbdCg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBPq-00000008i3C-1plY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:42:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9C3743E01
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3EFC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772012562;
	bh=K9a2s9JYkj0KSLlC0p3v78WuyHO3yDxajztaUeqowf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mT9SpqfgCsu/X3E++A3RmEyNDeS1Jlb38T25+6EctL4aTNtrYmIn9sJwobi0Kjivc
	 SIWlIil8HD6rI4tZWkASdHUvWoNLME+BBS77ASy39EdP9AEAvu8Grv97sZx0mgt4gA
	 FeuVzd0nOinFN0twGSxBNd48CSosm2UTZtSO4BSCkLC9t3U6SY6VNPtrfdwBTtZPix
	 cjoD2KrAApoFMf/6vraGzPtSqKDsk0JAwdh9JUpg0jU9012elBvMgLfvKfToNyDphC
	 cRF+6q6DtW/u0Fl2wkp2IU3lxk1cSXZg3CgiNc7XIWbaJI8xW6WZRbGZZKtucy4U+G
	 mWWi1ENNudy+g==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38709888abeso54625911fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 01:42:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJlQmOJpE1fxGO1wsufyVfamkYsRMeITsO9Me104VB/oVIhFR71IucYwx3PfmjxZjMj7gjQt63ObSpboKBF+7n@lists.infradead.org
X-Gm-Message-State: AOJu0YwGQT8xrczAE0/WriuvMU8ys5Dt0bYPOLUyGnOguEYJtaII1s9z
	ee1QubOToa2tIC3sMondfWur6wNcox1eQ/zcVcO6A0VXu6QLDLilB704SrPPaJPFbGtdGuhhsGs
	ZbXVVtdIT4LQIrKVEDm3Fo02ODRpIQJFa22W6kh7Xsw==
X-Received: by 2002:a2e:9e46:0:b0:388:25c1:d969 with SMTP id
 38308e7fff4ca-389a5d14de0mr32354961fa.9.1772012560925; Wed, 25 Feb 2026
 01:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com> <20260224183213.GA3239922-robh@kernel.org>
In-Reply-To: <20260224183213.GA3239922-robh@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 25 Feb 2026 10:42:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
X-Gm-Features: AaiRm52qiNgvNEan0Ja9tgnzlKTIzAcLn92f5zLzhmXEy4_h8wLWb64Qeoqf4C4
Message-ID: <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_094246_855360_B3CB46A0 
X-CRM114-Status: GOOD (  21.49  )
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

On Tue, Feb 24, 2026 at 7:32=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Feb 23, 2026 at 02:37:23PM +0100, Bartosz Golaszewski wrote:
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
> >
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/soc/renesas/renesas-soc.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/re=
nesas-soc.c
> > index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10ed=
d0d58b064650085cf 100644
> > --- a/drivers/soc/renesas/renesas-soc.c
> > +++ b/drivers/soc/renesas/renesas-soc.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/io.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> > @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
> >       const char *soc_id;
> >       int ret;
> >
> > -     match =3D of_match_node(renesas_socs, of_root);
> > +     struct device_node *root __free(device_node) =3D of_find_node_by_=
path("/");
> > +     if (!root)
> > +             return -ENOENT;
> > +
> > +     match =3D of_match_node(renesas_socs, root);
>
> Doesn't of_machine_device_match() work here?
>

No, because we're using the returned address of the matching struct
of_device_id later in the function. If you think it's a better idea to
introduce of_machine_match_node(), let me know but I think that should
be done separately.

Bart

