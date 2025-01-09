Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15791E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qIQP4o8cPCcK84STUOS+5JskiZRRSumAKuNK/Xi2io=; b=lI2aU48Tup8jk8d9btsPwyX230
	3VCXN1aku46R5fXI069o8/v3dKWBfqJnbIQqxhtwuAPb7JFY4ZTPZGHL5hifiW97DpEDknWdeKMzp
	GwJlTThoMT+ChG3SdtCiXlOcrO5fqXzz5f33NnzmBq4WRbGWkTCRgPkHDfStj863UWp3vwdraDjem
	ZBtyENgmL/zapw0g/vJT+RfYx6AvHdrzD5ut9LsY3WAlOdGtc42zLd02pFpIO9kHTEEdAY37V7sR+
	AJCSRWtysw9o9UWN8jp23kwrQpBSsctSYgYc7UCWWHZNrJJQfN4Ht2SROknlOA88dIxYxe+hdEj+W
	Y81QsYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuZO-0000000CUtQ-35j9;
	Thu, 09 Jan 2025 15:35:38 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuW8-0000000CUJe-1HVX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:32:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2900C1040DBDB;
	Thu,  9 Jan 2025 16:32:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736436733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6qIQP4o8cPCcK84STUOS+5JskiZRRSumAKuNK/Xi2io=;
	b=drknysd0IoZnLaRgsToztlyqJxLx4IHPiJhqIK3UmFsqqzRZOkWOKFbRxN8iNWWLneD7om
	twjqlg62pARiKDodOxy7DMj5Gf9U7rP1B9YpjBdZyQwrvliKbbi9Ack8TUfL+ePJ7zrk1i
	JSJUxxYErz+Eg+Jc+7Z7UESVgib4BBN7eblcvPrYDPt1vBdLyrx1d7JLOTAuVwRZGDG4jR
	CWdlscCAMxYxUTLDohyFdAm68gRXqfBguMoHUfoa52FLxiIMl63VKN1RwbTiBgHtFJuMzm
	UxXT9klNMQcTBYCRn+0bQfx0l9PvuXjEhwVX01EZiSswQ4YH6B1s+6pe3XoiYQ==
Date: Thu, 9 Jan 2025 16:32:10 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20250109163210.4c547941@wsk>
In-Reply-To: <CAOMZO5ABPnB9ov7jtEmDSZ=efNh_yx3JcqqS_UMTXgie=8PcTA@mail.gmail.com>
References: <20241107085705.490940-1-lukma@denx.de>
	<20241209105240.72d8d84a@wsk>
	<20241220112950.4673bb3f@wsk>
	<20250109153702.2d149023@wsk>
	<CAOMZO5ABPnB9ov7jtEmDSZ=efNh_yx3JcqqS_UMTXgie=8PcTA@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4jR4l4k1/ssXQBq5AITFnzz";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_073216_494528_FBE5D144 
X-CRM114-Status: GOOD (  14.64  )
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

--Sig_/4jR4l4k1/ssXQBq5AITFnzz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Thu, Jan 9, 2025 at 11:37=E2=80=AFAM Lukasz Majewski <lukma@denx.de> w=
rote:
>=20
> > Gentle ping on this patch ... =20
>=20
> You missed copying the drm folks:
>=20

Ech....

Thanks for pointing it out...

> ./scripts/get_maintainer.pl
> Documentation/devicetree/bindings/display/panel Neil Armstrong
> <neil.armstrong@linaro.org> (maintainer:DRM PANEL DRIVERS) Jessica
> Zhang <quic_jesszhan@quicinc.com> (reviewer:DRM PANEL DRIVERS) David
> Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS) Simona Vetter
> <simona@ffwll.ch> (maintainer:DRM DRIVERS) Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> (maintainer:DRM DRIVERS AND MISC
> GPU PATCHES) Maxime Ripard <mripard@kernel.org> (maintainer:DRM
> DRIVERS AND MISC GPU PATCHES) Thomas Zimmermann <tzimmermann@suse.de>
> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS)
> Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS)
> Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS)
> dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/4jR4l4k1/ssXQBq5AITFnzz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmd/6/oACgkQAR8vZIA0
zr0f4gf/f8yftAgVjy6z69N/UrrRfN2tMTztQtXrjdV0XCD5sm67rgsZL5NQKzet
2AzvICsWK+dZYUSRXnolPAKQEsOiRhBQskEi4q6GlmnHYQE7cIH8P9pTo01QXmYv
K6qYnujJDAD0sqB1cVPbRVcn0a4vKq3oQqJ8EkfZcJhmkZ90gbheaoYri5rcat3z
qw5UolyLN0xQ0WH49k2fWUDIVh5gwCdmrbOCfB8zi6rTjdbpAThRSim7ZVBqVblC
y4mT4zfG3xd2x71vvpNb95bcgfw5sG/slrQaZOU6W+BlmL3ov9MHBFOk1xdQIUEe
yIT60upWr2ovwklJlyeKFywq/99fwA==
=TdZH
-----END PGP SIGNATURE-----

--Sig_/4jR4l4k1/ssXQBq5AITFnzz--

