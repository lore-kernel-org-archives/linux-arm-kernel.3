Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9F0C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wk+PX1t5YjNrLbu3fw7I3HTDSpUrF4EYuLzp9K2iLrw=; b=MbgV/4smW3uj5XPqeZS1eoG28P
	esLq3JBEP3/0EtHfsiQot7PhbuaPN3y+IqzCypxMga9xHmX/Jx6yy/bDx6d+T7jsVS19xnyFgzMa0
	x3xNIzXYqheVg5byXHyeuG//e1iTK2ykS6QWYuDdcb3/YoGcfQEYcRG2nkgV1qR9Otdj9RJrLQvnR
	cOQUsEHbr5Vw8Cm2SFPwXnrSzh54GVoR/T0EocKs0csBcBArLZ2kPP+vCCk39zVtpU08dL/bI5RaS
	PkzUipkpCKz0Df7CfmRmrOKpGD6hCdQRmhask52ej9Z/l2eFj16zHdFIwkPWvL1tQRaK4or0LXdlc
	uLIb+T/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNx2-00000003ne8-0gj0;
	Fri, 09 May 2025 13:39:44 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDN4d-00000003cdi-3YGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:43:33 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e78e6396d36so1497193276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 05:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746794610; x=1747399410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk+PX1t5YjNrLbu3fw7I3HTDSpUrF4EYuLzp9K2iLrw=;
        b=ASUhs4EpKTQWdh9Ep+GglsSwWT1pJgYZKD0zB9yLzc8vKUfJiZlERCfCCXVLHH2MUL
         OuIIv3vIURS5bvy++q1egjp5dfTlBltbyCFMzO2ip+kMeg4XoZHL0a1icYzG7w9iXi0f
         AQ5/u4hPGxw2opmzeW2OZqYKgi/4vJsqt6Y8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794610; x=1747399410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wk+PX1t5YjNrLbu3fw7I3HTDSpUrF4EYuLzp9K2iLrw=;
        b=Vr4kw96fmeH1KCwYGTE1m++pkl4+QGv4R6grx7nADxyWZZrOWeU9jNGBfiQoRSZaFG
         Lt7GV6KBpym9Ak0PvOVDj3fOSekCCai6EeFMEjuMCwTf+ZWHyhMgPss4PoxKbwohZBHj
         w/w/ZNfetBod4khiBGr31N50+DQEdRQK0BudBaZs1A9EPjo3gQ2cjcShqKQl7AxCSfwz
         5clFKq8YQHLMJ1HQHQdE2+QxjgC6FHFOo8mnmljm7FO60yjmIXK/9Tc21fjsZjJ1ET7P
         Og4W9SI4CKx/nzpI24+K4fO5q7L22PYqyr/YEvY3L9Kp7uceN8Fieb2uvICojxD189Aq
         aGsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtYh46W1Bg5VPj6ISqAN4YXw43h1unyFiwLYwlHLt2h0KnQcnWbXW7CCIefdp+bhzDN7z3NeboT6t8Ey7llQwl@lists.infradead.org
X-Gm-Message-State: AOJu0YxbajQEPv9052HDW49c6SAleDO2D93rSrxrBxhkNg8VDNgSszsC
	Qxv1MrDjWhK3HLAYDpyKkfo+4hqAeBkF4PzydYN/8Dpy//4L/bDTrXHl96dG7GwkfZ/AFfkHhUo
	KWadrnAhTDPJB3O4p2eo+jjFagXWXjICjYZfM1g==
X-Gm-Gg: ASbGncv8JN5qxzQriyD07SHTQCQnzKFHGh6w8UHEeEBYrXDb2CuclvjVwgRobsA6+0s
	454xtHjKeeV6WLoLTy4hcnmvVrEHqSisc60DOWjvxxL6ud1hA5NHdSxxXbHKAse0P7tjsTujnt9
	QwS7ZIkumU4HJAhbkmog==
X-Google-Smtp-Source: AGHT+IFrjZ49BKORpGjnuIsEC44rpN9s+TBJde8pml0KWAikxDuw2695c1SnudEFBoIfDQFFwneLL6Ms7ZC7MJFaDXI=
X-Received: by 2002:a05:690c:4587:b0:703:ace3:150a with SMTP id
 00721157ae682-70a3fb605e9mr40252827b3.34.1746794610485; Fri, 09 May 2025
 05:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
 <CABGWkvrkVLRocFsZs9JLni4KDZCDyYDZxMzwA9AzAwipmUyTzQ@mail.gmail.com> <aB3unsCzCFUkdp9i@dragon>
In-Reply-To: <aB3unsCzCFUkdp9i@dragon>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 May 2025 14:43:19 +0200
X-Gm-Features: AX0GCFvVFue8wdjYB0ISSFwk7W4pX-EIs3Ikr6iut0B47FJnqLkddmDVofMWjCc
Message-ID: <CABGWkvqfyH=dcuw6EDZaFVVebj8SZhJF0P944+mmzL5YK3-Pug@mail.gmail.com>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_054331_890309_E1653BD6 
X-CRM114-Status: GOOD (  28.15  )
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

On Fri, May 9, 2025 at 2:02=E2=80=AFPM Shawn Guo <shawnguo2@yeah.net> wrote=
:
>
> On Thu, May 08, 2025 at 10:32:10AM +0200, Dario Binacchi wrote:
> > Hello Shawn,
> >
> > On Mon, May 5, 2025 at 9:52=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org>=
 wrote:
> > >
> > >
> > > On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> > > > This version keeps the version v9 patches that can be merged and
> > > > removes the patches that will need to be modified in case Peng's
> > > > PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted=
.
> > > > The idea is to speed up the merging of the patches in the series
> > > > that have already been reviewed and are not dependent on the
> > > > introduction of the assigned-clocks-sscs property, and postpone
> > > > the patches for spread spectrum to a future series once it becomes
> > > > clear what needs to be done.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
> > >         commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
> > > [02/19] clk: imx8mm: rename video_pll1 to video_pll
> > >         commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
> > > [03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
> > >         commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
> > > [04/19] clk: imx8mp: rename video_pll1 to video_pll
> > >         commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
> > > [05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
> > >         commit: 2ba124053687c933031a6dc5b2e16ceaca250934
> > > [10/19] clk: imx: add hw API imx_anatop_get_clk_hw
> > >         commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
> > > [11/19] clk: imx: add support for i.MX8MM anatop clock driver
> > >         commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
> > > [12/19] clk: imx: add support for i.MX8MN anatop clock driver
> > >         commit: 80badb1d7264e83b512475898e7459f464a009c9
> > > [13/19] clk: imx: add support for i.MX8MP anatop clock driver
> > >         commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
> > > [14/19] clk: imx8mp: rename ccm_base to base
> > >         commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
> > > [16/19] dt-bindings: clock: imx8m-clock: add PLLs
> > >         commit: 6a55647af3334f1d935ece67de4a838a864b53fc
> > >
> >
> > Please check the remaining patches, as they are required for correctly
> > building the
> > ones merged by Abel. The kernel test robot has already reported build e=
rrors.
>
> I assume the remaining patches are DTS ones?
Yes
> If so, I do not see how
> clock drivers would require DTS change to build correctly.  Do you have
> a pointer to the reported build errors?

https://lore.kernel.org/oe-kbuild-all/202505090537.ss8RbFln-lkp@intel.com/

DTC compilation fails. I think it's because of the patch
[16/19] dt-bindings: clock: imx8m-clock: add PLLs
which was merged without the corresponding DTS changes.

Thanks and regards,
Dario
>
> My understanding about the build dependency is the opposite, i.e. the
> DTS changes require clock defines merged by Abel to build?  In that
> case, I suggest Abel pick up the whole series with my ack on DTS changes.
>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
>
> Alternatively, I can pick up the remaining patches after clock changes
> land on mainline (the next -rc1).
>
> Shawn
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

