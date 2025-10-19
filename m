Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EC2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 17:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89pcnqHw6GeCqqkxoyyYoM031ZknkpS6TyEdPScCLBQ=; b=w9ki6xKH5k+Pst5AwCshWmQ4H5
	L5gnjLK9KBi6DPeUDY8MfFBTpdPXEaeELak9T/oPh5yhxUMVO9Uol8WECdNcD/xlrLLCp6F25PxH+
	CpNdffPphIFA/oJlmLA+vN6slseYyoyOiM4Wfew++5UNoqEocIWBmAAbPZ/tywYfsf/ojjcqcClGh
	dBihsp/rFwZAI+oy1+9B2tc5qdeQM/1StNLAhPHa9nD7QuTKiMRNeyO76WPXUUnFiyCQoduM2p40c
	C1OsRzeuz2JhCbRgXeCMzTyFLDUczIjaRGiyfjmejMqQuve9ALTzT5A5874em2UJM5WAHM4Yup5je
	+z54DeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWpr-0000000BEYm-2uh3;
	Sun, 19 Oct 2025 17:04:47 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWpo-0000000BEXO-43CW;
	Sun, 19 Oct 2025 17:04:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 798F640D07;
	Sun, 19 Oct 2025 19:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1760893480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=89pcnqHw6GeCqqkxoyyYoM031ZknkpS6TyEdPScCLBQ=;
	b=feN0m9vz9xepdNVeyszgt4J9lygxtJJV4M+epGRMOa/A1mU8wSgxMaNeobaWfiG9n32OW0
	0BLpORvYv4TtSZ7ulhp94Crw24Xgj8BDInMP27qsN3RrdY3uaLkakvR9sUOeFvdpBOmT1J
	DEOnZb5bW2C/grjE8ZOajzOxFmkGubtqYxF/p49k4pv749kwBVwu9lX6credP+5/nFPZxy
	Q1U4MX2GYVdyyFyCZyKUibY6+2blN2b/qe0viwN079Bz8wWffKpz5h9wT2tAmya7snNdQm
	CUCSr87CTMvAUoQguQ8FO+I1Wt7UNal84mfHgsD3UZp8bRWTaK2aLofYIWW41w==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <CABGV7H_pTkJ_-WQNgVbGE+Ys7jOZaKcRrnMtPr8idfKoYMgKjg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20251017073954.130710-1-cnsztl@gmail.com> <7f0b1747-87eb-0b0b-6fb0-304811a4be21@manjaro.org> <CABGV7H_pTkJ_-WQNgVbGE+Ys7jOZaKcRrnMtPr8idfKoYMgKjg@mail.gmail.com>
Date: Sun, 19 Oct 2025 19:04:30 +0200
Cc: "Tianling Shen" <cnsztl@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Grzegorz Sterniczuk" <grzegorz@sternicz.uk>, "Jonas Karlman" <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Grzegorz Sterniczuk" <grzegorz.sterniczuk@gmail.com>
MIME-Version: 1.0
Message-ID: <f26601b4-c589-5909-5432-378c496e9010@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= fix eMMC corruption on NanoPC-T6 with A3A444 chips
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_100445_221730_5FCE9673 
X-CRM114-Status: GOOD (  20.99  )
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

Hello Grzegorz,

On Sunday, October 19, 2025 12:05 CEST, Grzegorz Sterniczuk <grzegorz.s=
terniczuk@gmail.com> wrote:
> [image: image.png]
> [image: IMG=5F0471.jpeg]

Nice, thanks for the pictures!  BTW, I'm hoping to get the quirk
patch(es) done and submitted to the MLs in the next few days.  Of
course, I'll Cc your and everyone else's email addresses so you
can perform the required testing and provide Tested-by tags.

> On Fri, 17 Oct 2025 at 12:25, Dragan Simic <dsimic@manjaro.org> wrote=
:
> > On Friday, October 17, 2025 09:39 CEST, Tianling Shen <cnsztl@gmail=
.com>
> > wrote:
> > > From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> > >
> > > Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O error=
s and
> > > corruption when using HS400 mode. Downgrade to HS200 mode to ensu=
re
> > > stable operation.
> >
> > Could you, please, provide more details about the troublesome eMMC
> > chip that gets identified as A3A444, i.e. what's the actual brand
> > and model?  Maybe you could send a picture of it?  It might also
> > help if you'd send the contents of "/sys/class/block/mmcblkX/device
> > /manfid" from your board (where "X" should equal two).
> >
> > I'm asking for that because I'd like to research it a bit further,
> > if possible, because some other eMMC chips that are also found on
> > the NanoPc-T6 seem to work fine in HS400 mode. [1]  It may be that
> > the A3A444 chip has some issues with the HS400 mode on its own,
> > i.e. the observed issues may not be caused by the board.
> >
> > [1] https://github.com/openwrt/openwrt/issues/18844
> >
> > > Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> > > Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> > > index fafeabe9adf9..5f63f38f7326 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> > > @@ -717,8 +717,7 @@ &sdhci {
> > >       no-sd;
> > >       non-removable;
> > >       max-frequency =3D <200000000>;
> > > -     mmc-hs400-1=5F8v;
> > > -     mmc-hs400-enhanced-strobe;
> > > +     mmc-hs200-1=5F8v;
> > >       status =3D "okay";
> > >  };


