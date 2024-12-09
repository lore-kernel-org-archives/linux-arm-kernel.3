Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08208E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuMhiC0OhEfpPn44QIc8qMlaFvp2wk3+ZDJWj+PnNQI=; b=hJ/3HocdNua9F2itNafzHX/5W1
	wrREI+2XR6/VUEONAc0vmXVw2ea+W7vEMnWfLbGz+kZthVQ6XNi5ir9za5bkEAQd34NEVMastnfHM
	dYv2hLH0WYvUGhDb55Tvn79DX9vYp3BTvBPG2lfTrjMc/NbxrSjzPCKWzrJrEdO23wVw5rvINITx+
	g8eWcUzc/bGhjnae/yd5Vp0tCQszRHs+TiR0bW50Wp0EZILcg3Wobk+ahJ60Yox3j9X9dd5xMwcon
	6n+u4iri5VmFPpAEAJgvJeclRBIb34iwZ4kcY/kw62m5ZX2fGLSASZ0OGUmQoFA8hxkChByKGcUWl
	AEdjSPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKblX-00000007SnH-18E4;
	Mon, 09 Dec 2024 11:17:27 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbkU-00000007Sb7-0CK6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:16:23 +0000
Received: from wsk (095160158109.dynamic-2-waw-k-4-2-0.vectranet.pl [95.160.158.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7BDE6888D5;
	Mon,  9 Dec 2024 12:16:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1733742980;
	bh=BuMhiC0OhEfpPn44QIc8qMlaFvp2wk3+ZDJWj+PnNQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gkNTOy1idlOOFdrQ8uawL2OO6XsQ3+vYNDYjvlh5yAxwGmyL3ojcnrV880kfujf1o
	 Oa6EjJ1p9HieoK3rQhHyB0hzjIkitFlBRJzm2CAaMIicc0ioQIrL9iRJTYq2RVktDm
	 sSC7aCb4crgGekjuQbs9yhMI1rA+HuvyehXvi/oTJjgNM6EEARaAeSMwBQ9Lh/kcVh
	 D+Lx6PdOWcGpX/ikTclmufyxRJYo47yAI0D0g6Uqi6jRa2/O5BA2LuimbuTqjn0zNT
	 FvZTJU0YGZI76OJfALGsITRdJxH//e2mbjp8wqwEfu8TYztbI/fDxfQu7saINd2hco
	 QmVZ+lobvzuoQ==
Date: Mon, 9 Dec 2024 12:16:19 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/3] ARM: dts: mxs: Add descriptions for imx287
 based btt3-[012] devices
Message-ID: <20241209121619.623886a4@wsk>
In-Reply-To: <c8fd371f-fd36-48c4-ad49-1e8f8db01383@gmx.net>
References: <20241107085705.490940-1-lukma@denx.de>
	<20241107085705.490940-3-lukma@denx.de>
	<20241119165236.69438f75@wsk>
	<c8fd371f-fd36-48c4-ad49-1e8f8db01383@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jBN468d=YevV1Tnfk/xCbGe";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_031622_243342_EB88E1D6 
X-CRM114-Status: GOOD (  22.78  )
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

--Sig_/jBN468d=YevV1Tnfk/xCbGe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> Am 19.11.24 um 16:52 schrieb Lukasz Majewski:
> > Dear Community,
> > =20
> >> The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
> >> some extend similar to already upstreamed XEA devices, hence are
> >> using common imx28-lwe.dtsi file.
> >>
> >> New, imx28-btt3.dtsi has been added to embrace common DTS
> >> properties for different HW revisions for this device.
> >>
> >> As a result - changes introduced in imx28-btt3-[012].dts are
> >> minimal.
> >> =20
> > Are there any more comments / suggestions for this patch set? =20
> I've send my RB for this patch on October 31th for V10, but it didn't
> made it into V11.

Sorry, I've just noticed it.

When the yaml patches are applied/accepted, I will either resend the
dts patches with your Reviewed-by or maybe this tag can be added when
applying the code by the maintainer (Shawn).


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/jBN468d=YevV1Tnfk/xCbGe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmdW0YMACgkQAR8vZIA0
zr2THAf+JgmJiwwSis3XQnIdKHJG+zMF3IYWmEQqljal+UWYz6CmPygErJFdSZI9
p7Nj+OtF4Vnv4gCGw2WSRHiQD4tA1gjFXmLByhkaTke1vKEa6kSbQTb9kvFAT6Ss
O95SBMZoePdu4c1uEYpSvuYNUVPkImpw+Is20TjrLHm/Jepxbpjh445DaKhNYQQR
kC9Hb1i1uum13rH0gRwT0HRCXqlBwAYZTMXdqR4gwc3ogJVLsvuY0ujC+1JNNmmp
BkYM22XM7CY5qeIa0PUEBwS9C2UQwsPWw1KQ4NgZ/1uEN+4iFkNNFGBgWzqeL+wn
pmTLrePIuUqCthhv5c83HpXCfamRVQ==
=8U55
-----END PGP SIGNATURE-----

--Sig_/jBN468d=YevV1Tnfk/xCbGe--

