Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BF9CEE340
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Content-Transfer-Encoding:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ikbxpjo8LZrHbmpy/V6/tjg+g8DY5QC0BL15d4mFkik=; b=Nek9KMNmvvROVeSW6NJWumAILq
	lg+l9a+9aG4oiKedxd6T8U0OQS8vq/W987pcddK00uHbjxDeDv908E/VrzAJff2hNR9S2LzQWP8io
	F/50JyoP8qg15TA91dxAH5D0uijWKqBBVVunhQ6BMRbVrkcE0h5LvBzX0X6DQUu35TxEKpe8w7K9A
	236zdiZSRtUrgZZVQWAzgadTcytUd83f/R2jXrPZM7B2PFEwUTvXJQqC+MR5xdRak7c8FGf4pDUVl
	psilS3qPYZqzFDFkwHhhKB0GFnQCgB0dcACuSoJ/uqmuMJYcUVXJQCGGOCMRXeH5FVK+x7xWVHmjQ
	dIVoW26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLP6Q-00000000naV-3N06;
	Tue, 18 Nov 2025 17:02:50 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLP6N-00000000nZD-2XK2;
	Tue, 18 Nov 2025 17:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1763485361; x=1764090161; i=frank-w@public-files.de;
	bh=Ikbxpjo8LZrHbmpy/V6/tjg+g8DY5QC0BL15d4mFkik=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:Content-Transfer-Encoding:In-Reply-To:
	 References:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=dsWkv5A9CxaTOv7R9y0hIEIvFze/tYuelAcl6Y4yJIc+Pb9VY2etBnCwnG/+2nlG
	 cZEMAVbn2VK5EZsNbsd7QgFVB0naEt/14dpeQlmu30FVQQZ79BhrP5aZ+cE/eilBc
	 49sAHyQo+CsOc3pSCGCCBMAN/RHphO8OhIEqRow7VL1QtQpGBUrxmRjObAKMxaomP
	 tytBEvaMQm2puem4yuCMU1ueTCAKajLIyQnb/vUa360+7EIVNvZMZQeZE+KPxDQXt
	 ae9HZGTvDXfIPApNBEe2POI0Lsu557SI1+iMVqsSDqeXEEF3tWYrge5I9ZlJBmM2V
	 SUehdnu2r263l/+cKA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [194.15.86.107] ([194.15.86.107]) by
 trinity-msg-rest-gmx-gmx-live-56d984c6fb-85gcg (via HTTP); Tue, 18 Nov 2025
 17:02:41 +0000
MIME-Version: 1.0
Message-ID: <trinity-dfca2931-a7e8-4b33-b722-c22105569d82-1763485361461@trinity-msg-rest-gmx-gmx-live-56d984c6fb-85gcg>
From: Frank Wunderlich <frank-w@public-files.de>
To: robh@kernel.org, angelogioacchino.delregno@collabora.com
Cc: matthias.bgg@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Aw: Re: [PATCH] arm64: dts: mediatek: Apply all DT overlays at
 build time
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Nov 2025 17:02:41 +0000
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAL_JsqK4jvZQTQAXCjPgxBCUiENGKgkgaDgZ680QqL1XpS6bbw@mail.gmail.com>
References: <20251117211306.725678-1-robh@kernel.org>
 <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com>
 <CAL_JsqK4jvZQTQAXCjPgxBCUiENGKgkgaDgZ680QqL1XpS6bbw@mail.gmail.com>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:+NZVXvxPM7sHFnKfKMqInMumSSaXpCyIpkrfgPSpZJDAq6/hfd0ipTLFhIOBzIQSUYnUL
 NR7WDPb/NlOcAcXT/Lw5vmFwTdD07ljrc2TD0WWlNVilbTgVd8hg79IafV7iuLRKG6yv7H49KqRL
 U6WxfzvZiejuJtFsDKfXyzseFgdPahmDc2pHlW9IpSdPKOFaUx+aY5smlnC4YMvsuM8Gjn82ShQT
 6vOUVNJn12KClhocoxezWQaM8gYGKtR2eGr1RNUhzw6zfCwy6pu3dxi5lrLZf0QMgcX/bxaOcy4S
 seEucBHcm9Gv/Q+jSrWKKdQUsvDiQRfo2np5HwfhHnUSq1H0/Nd8qs90tU3AlpnM7s=
UI-OutboundReport: notjunk:1;M01:P0:O+byDxN+m3E=;FPg10a5UBLeIHxc671s5gwpvCNP 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_090248_002350_50D32259 
X-CRM114-Status: GOOD (  22.41  )
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

this looks similar to my attempt i did here

https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/patch/202406080805=
30=2E9436-2-linux@fw-web=2Ede/

But in my case i added full dtb with 2 overlays as there can be 2 devices =
(1 mmc + 1 spi) at one time=2E
So usable as dtb for bootloader config without overlays, not only for vali=
dation=2E=2E=2E

regards Frank


> Gesendet: Dienstag, 18=2E November 2025 um 13:31
> Von: "Rob Herring" <robh@kernel=2Eorg>
> An: "AngeloGioacchino Del Regno" <angelogioacchino=2Edelregno@collabora=
=2Ecom>
> CC: "Matthias Brugger" <matthias=2Ebgg@gmail=2Ecom>, "Krzysztof Kozlowsk=
i" <krzk+dt@kernel=2Eorg>, "Conor Dooley" <conor+dt@kernel=2Eorg>, linux-ke=
rnel@vger=2Ekernel=2Eorg, linux-arm-kernel@lists=2Einfradead=2Eorg, linux-m=
ediatek@lists=2Einfradead=2Eorg, devicetree@vger=2Ekernel=2Eorg
> Betreff: Re: [PATCH] arm64: dts: mediatek: Apply all DT overlays at buil=
d time
>
> On Tue, Nov 18, 2025 at 3:36=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino=2Edelregno@collabora=2Ecom> wrote:
> >
> > Il 17/11/25 22:13, Rob Herring (Arm) ha scritto:
> > > It's a requirement that DT overlays be applied at build time in orde=
r to
> > > validate them as overlays are not validated on their own=2E
> > >
> > > Add targets for all the Mediatek overlays=2E
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel=2Eorg>
> > > ---
> > > This will soon be a warning[1]=2E
> > >
> > > Note that if it is desired that the combined =2Edtb is not installed=
, then
> > > the combined =2Edtb should be added to 'dtb-' variable instead=2E
> > >
> >
> > Uhm, sorry, can't we do something such that we don't generate a DTB wi=
th a
> > preapplied overlay?
> >
> > Even something like generating those and deleting before build finaliz=
ation
> > could work, I guess, though that'd be hacky maybe=2E
> >
> > I don't know if this is the case, but I'm worried that various people =
have
> > scripts to copy DTBs somewhere (in some partition) or embed those in i=
mages,
> > and if they get the preapplied overlay dtbs in the same place, havoc c=
ould
> > happen as the bootloaders might be selecting wrong dtbs (as a plus, th=
ere is
> > no dtbo that varies machine compatible strings, rightfully)=2E
>=20
> If they aren't using dtbs_install for that, then that is their
> problem=2E When we moved all the arm32 DTs to vendor directories,
> dtbs_install maintained the old structure which seemed sufficient to
> not break folks=2E The same should apply here=2E
>=20
> Rob
>=20
>

