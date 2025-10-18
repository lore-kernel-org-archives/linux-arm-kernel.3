Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6286CCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcQFWVZGs08q/95sXCl8FOxL8CeUh4aHnSknN21+alc=; b=mt6sRe3Rd6VPX6Vs5HU/7dvU5J
	lkEeQx54ksorLXe0JrN0rNuHmat8oISdNdy9wxHYzb/77D7ctlOnzCC2+pMpXc6KgcMNSScvgkznE
	b7fa05ZmoOeqV2RitqbTdUnVFuCGJ5stE6E3w6R+SnTve65rkyY3e1FCekN1T5LfblOGFPGceGxuX
	qEp+EE/EScQeBKb4m4EA4aOLgX8sBOMr1WLkFCHtrQK9dBcEf0Y3cPsf2X4QwEvZFvyqqWXKrhKOm
	qFYZaH8tyMmoKd/N5yWUrmtOCKFrmvMR03aFFv2cZf8M9282I7I7KXpYgAO/yD9SbHQHPkh3LTfIw
	AkHJQP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9zq-0000000A9e8-0OIk;
	Sat, 18 Oct 2025 16:41:34 +0000
Received: from mail-43167.protonmail.ch ([185.70.43.167])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9zn-0000000A9dF-0ghD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 16:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1760805682; x=1761064882;
	bh=TcQFWVZGs08q/95sXCl8FOxL8CeUh4aHnSknN21+alc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k0Ut4LycV//jYlWaBMAJ2hJ8M5LPwV7IhEgdYXu7kaePsIzKfZXMOgK80sdAk9BBO
	 SNjUVe1Os7HeLVHr8e2nny4qK002WgWpSHm45f1bPEvTkzQZ2aiqoO7CGwBlyF7pmw
	 DOi7pfWbV8vZ9J+wiagJH7NtPiFL6hP64egxmGqqx6RXoRmAdw4bnA7Ykr2GqdoCQt
	 ps0FiehroiVMdDqIotmq0mwgst4q3eiqHxrukqTUadXqRNCqBoiVHNFZUWFMQ3C9Rt
	 6+4ocmLZhYXp5ry1D7aHHyJNWigcANkQwHnMzFvQgYoiynmMPKqW518f9BitSCc3Er
	 UcvBNInyV7OBA==
Date: Sat, 18 Oct 2025 16:41:17 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: "~postmarketos/upstreaming@lists.sr.ht" <~postmarketosupstreaming@lists.sr.ht>, "cristian_ci@protonmail.com" <cristian_ci@protonmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
Subject: Re: [PATCH 00/10] ARM: Add support for yarisxl mt6582 board
Message-ID: <lOMHa6mcw10H8qfGsi25ljIEyIsio6vgGzJvT9FXWc_B4uI2kpes8OP2z_2VqnkVvQWwmQUInen4YOGg92ZgN8vbZDc1KuWNvwxjFIpBhgU=@protonmail.com>
In-Reply-To: <6657bfa7-9a6e-49a1-890f-81cf655940a7@collabora.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com> <6657bfa7-9a6e-49a1-890f-81cf655940a7@collabora.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 7710293a5ab96e00a613212a51e9b751d2db05ca
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_094131_344214_1A41873A 
X-CRM114-Status: GOOD (  17.20  )
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

On Monday, September 22nd, 2025 at 13:05, AngeloGioacchino Del Regno <angel=
ogioacchino.delregno@collabora.com> wrote:

> Il 20/09/25 20:23, Cristian Cozzolino via B4 Relay ha scritto:
>=20
> > This series adds support for Alcatel Pop C7 (OT-7041D) smartphone
> > board, named yarisxl, based on MT6582 SoC. It also includes some
> > preliminary patches. More in detail:
> > - patches 1 and 2 add support for mt6582 to platform code
> > (verified by looking at generic mt6582 downstream source code)
> > - patches 3-6 do some maintenance work to mt6582.dtsi
> > (I was unsure if squashing timer node patches into one)
> > - patches 7 and 8 add devicetree and dt-bindings support for yarisxl
>=20
>=20
> That's simply great! Nice cleanup and nice addition - the only thing I ca=
n say here
> is that seeing simple-framebuffer is a pity, and that I hope that your pl=
ans are to
> continue with systimer, clocks, spi, i2c, apdma, mediatek-drm components,=
 etc :-)
>=20
> In the meanwhile, for the whole series
>=20
> Reviewed-by: AngeloGioacchino Del Regno angelogioacchino.delregno@collabo=
ra.com
>=20
>=20
> Keep up the good work!
>=20
> Cheers,
> Angelo
>=20

Hi (sorry for being late)!
It'd be nice add more support for this old platform, though I've to say tha=
t I've got inspiration from MT6572 patch series and this series is mostly b=
ased on that work.
BTW, I've tested this series together with mt6582 u-boot port (installed as=
 2nd stage bootloader), always derived from mt65xx u-boot work.
Since original port has been tested on mt6580 and mt6572, it's not too much=
 hard making a port for sibling SoCs like mt6582 (done) and mt6592.
(I've also managed to boot successfully a 1st stage bootloader mt6582 u-boo=
t port but I've not yet tried loading linux - and testing these patches - w=
ith that).
AS mt65xx platforms share many similarities, I hope more people could take =
part and extend mainline linux hardware support for mt6580, mt6572 and mt65=
82 as you wish.

In the meantime,

Thank You very nuch and=20

Best Regards,

Cristian.

P.S. I've made a mistake about cover letter by making reference to a number=
 of eight patches, while actually there are ten patches. BTW, that's not im=
portant at this point.

