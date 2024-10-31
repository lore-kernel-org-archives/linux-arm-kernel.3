Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD47E68955
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 11:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIwdYgqrSCvO0w0cPugYjgRg4vwcTagWndmY5Hgtr7E=; b=LtBY4RE/FkkGmOAf3E5vMauzQ5
	b7xYu5XLy+Mz5E4zOCVYaM1JIV1mjvQb7OzVGqIeZNkjo9j2CjkfW66qMJxgelPg2HHZkeW4rKHFZ
	swRVp5CU7203W1rsRzUCrhospf0CUfzmsimgLFQ8y7PDIY4ebGpr7E34PATm7T9CjICf7YVlKpENW
	jwqtU+PZAojbqAqp4fg7ivr/yvxlw0lMiNNYo5oZ5MEBVLq7c7hISHJyCEfLjkGyaQRE0keFguL2m
	sw7KT8jvU0uDoCi5mJx/L0Ozh2BPCJyyTww5kuN5Bc9CMRWrzlPPfVjkbs/79EBZ+GKxYXx8M+AJS
	4kTjGaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TXK-00000003Ptu-24tJ;
	Thu, 31 Oct 2024 11:40:22 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TU4-00000003PQ3-2fTV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 11:37:02 +0000
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 676B288DEE;
	Thu, 31 Oct 2024 12:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730374619;
	bh=cIwdYgqrSCvO0w0cPugYjgRg4vwcTagWndmY5Hgtr7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nWrE7/MdiYBoDALSdAHrhbb3tO7ZX/Lmnm0sa0V6D5Aaxo+D5YkwOXnjnlWOtnwtR
	 yWuXpXvtbYht3pNxwfSMii4W52F3zbQvpQnHiigIBQdAvKU5PJtnsjiUiY/EAyTOe8
	 WxKTUSsKSppIT+merh3fVy0RzdVvkKt75BdVXFfu11vcg3twYqQ5QPaRUNpspTCZ3R
	 9sMBGn/YADg7sSu6Y2TioFZBStghy8vaOXCND9SSpV3lml9YLHFwPrp0f6h4cT61NT
	 gbkyNXubKXTStiKBsbOpHd23OvyCoTeECY8/p//HbQ0++hYyWplkrd7ZPFt0BV6lsq
	 38T22Br2uneug==
Date: Thu, 31 Oct 2024 12:36:57 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/4] ARM: dts: mxs: Add descriptions for imx287
 based btt3-[012] devices
Message-ID: <20241031123657.337c816e@wsk>
In-Reply-To: <0cb1e74f-1163-4a80-8c62-9c7b0a0584f9@gmx.net>
References: <20241022133040.686562-1-lukma@denx.de>
	<20241022133040.686562-4-lukma@denx.de>
	<20241031094236.17ed927d@wsk>
	<806770fc-3830-4e89-a3ee-487b662685ed@gmx.net>
	<20241031113425.1e3d1da5@wsk>
	<0cb1e74f-1163-4a80-8c62-9c7b0a0584f9@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g3B9Qex0+pwrL7MIg=gQKwE";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_043701_008957_829CBBEF 
X-CRM114-Status: GOOD (  30.77  )
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

--Sig_/g3B9Qex0+pwrL7MIg=gQKwE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Oct 2024 11:57:22 +0100
Stefan Wahren <wahrenst@gmx.net> wrote:

> Hi Lukasz,
>=20
> Am 31.10.24 um 11:34 schrieb Lukasz Majewski:
> > Hi Stefan,
> > =20
> >> Am 31.10.24 um 09:42 schrieb Lukasz Majewski: =20
> >>> Dear Community,
> >>> =20
> >>>> The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are
> >>>> to some extend similar to already upstreamed XEA devices, hence
> >>>> are using common imx28-lwe.dtsi file.
> >>>>
> >>>> New, imx28-btt3.dtsi has been added to embrace common DTS
> >>>> properties for different HW revisions for this device.
> >>>>
> >>>> As a result - changes introduced in imx28-btt3-[012].dts are
> >>>> minimal.
> >>>>
> >>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >>>>
> >>>> ---
> >>>> Changes for v2:
> >>>> - Rename dts file from btt3-[012] to imx28-btt3-[012] to match
> >>>> current linux kernel naming convention
> >>>> - Remove 'wlf,wm8974' from compatible for codec@1a
> >>>>
> >>>> Changes for v3:
> >>>> - Keep alphabethical order for Makefile entries
> >>>>
> >>>> Changes for v4:
> >>>> - Change compatible for btt3 board (to 'lwn,imx28-btt3')
> >>>>
> >>>> Changes for v5:
> >>>> - Combine patch, which adds btt3-[012] with one adding board
> >>>> entry to fsl.yaml
> >>>>
> >>>> Changes for v6:
> >>>> - Make the patch series for adding entry in fsl.yaml and btt3
> >>>>
> >>>> Changes for v7:
> >>>> - Use "panel" property as suggested by the community
> >>>> - Use panel-timing to specify the display parameters
> >>>> - Update subject line with correct tags
> >>>>
> >>>> Changes for v8:
> >>>> - Use GPIO_ACTIVE_HIGH instead of '0'
> >>>> - Add the comment regarding mac address specification
> >>>> - Remove superfluous comment
> >>>> - Change wifi-en-pin node name
> >>>>
> >>>> Changes for v9:
> >>>> - Remove not used 'pm-ignore-notify'
> >>>> - Add display names for 'panel-dpi' compatible to avoid Schema
> >>>> warnings
> >>>>
> >>>> Changes for v10:
> >>>> - Drop new line with panel-timing definitions
> >>>> - Add new lines with 'sound' node
> >>>> - Change 'codec' to 'audio-codec'
> >>>> - Change order of properties for saif1 node =20
> >>> Are there any more comments regarding this patch? =20
> >> Sorry, i wasn't aware that you are waiting for reviews after Rob's
> >> request. =20
> > I did not received any mail from Rob's automated DTS test script, so
> > this is a good thing :-). =20
> I meant his comment to patch 2 V10. This patch "depends" on the
> binding.

Yes on patch 1.

> >
> >
> > Best regards,
> >
> > Lukasz Majewski
> >
> > --
> >
> > DENX Software Engineering GmbH,      Managing Director: Erika Unter
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > lukma@denx.de =20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/g3B9Qex0+pwrL7MIg=gQKwE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmcja9kACgkQAR8vZIA0
zr0mzgf8C+6D8Jl3ixvC1AXYJa1PyLIjhfmmi53I1Xl15NDAn3gCQlS1O9ECkLIf
yRoMrH2mfxq+s2R+bo9APQvVzRzO5r8E8/XFoMrMmiVxPFXBEwNvOPvZsCNup4ZM
SIDDl/MNhyOBX8ejc7vlmjvMfOGRdzGwvXUJIAmfEtqH3qufup/WWaMfs5uVgZzQ
jQfcLiaDqSfVBpt9Q0TvIxJurOfkyD41D2O4sOiJT0UQ5FvRbAbYLo104pUrTK45
LPBTeR8Xf3i3N9mPKgkAAxaGmMCj3sb3VGRclSlN9C/fz9TDVM7wDIvTgjdjslMI
6aRcdTRro/cKd0s2b3LkPWloO5y1Og==
=Fg8h
-----END PGP SIGNATURE-----

--Sig_/g3B9Qex0+pwrL7MIg=gQKwE--

