Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE38C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bONJCKHnckgLkdBk08LH2QQDMh0PHxgkXZaLFSfLRws=; b=NgJAjARevAl/okC/sM23vflBNp
	oDiBcR43bjf4dHoGEFGkNxCDx+snahjYOU/gp907frbvcNVasU1OGo6l5IwaGzCmRYFi7NEG4zsfu
	wssHyYC4J3hftGTxA/TiJ7PJVcRUWdqo1/L3DmCxWsicytkT7+UBdn82RMtbFl7fDQBq4Q8XFPRcE
	UlAYEZ8dQToENp/vtsr9YtvYWDdyiQFfEolnlNzMpBOBEZJdnMZTFTgoKtVdmTxg8g4E2RjCPP5LA
	7P17NzEkDs5ZDtCHKCQXbRmCcFqgF+vn9meLhh+iE+o0cQMXh/+wkyxYghUr2OZasdSaaxBnpGGHL
	hLBQ6s7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trwlZ-00000005K4i-3tF8;
	Tue, 11 Mar 2025 10:23:17 +0000
Received: from mx1.emlix.com ([178.63.209.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trwg5-00000005Iq1-1foM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 10:17:39 +0000
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id DF2925F845;
	Tue, 11 Mar 2025 11:17:32 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Yuntao Liu <liuyuntao12@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm32: simplify ARM_MMU_KEEP usage
Date: Tue, 11 Mar 2025 11:17:32 +0100
Message-ID: <2225298.Mh6RI2rZIc@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <CACRpkdaAMu9WtD3a_XXGEwMfyFx6F-a263COna13eUWB0vqbcQ@mail.gmail.com>
References: <2200295.irdbgypaU6@devpool47.emlix.com>
 <1811814.VLH7GnMWUR@devpool47.emlix.com>
 <CACRpkdaAMu9WtD3a_XXGEwMfyFx6F-a263COna13eUWB0vqbcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3678204.R56niFO833";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_031737_580988_E7CFD98E 
X-CRM114-Status: GOOD (  15.90  )
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

--nextPart3678204.R56niFO833
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] arm32: simplify ARM_MMU_KEEP usage
Date: Tue, 11 Mar 2025 11:17:32 +0100
Message-ID: <2225298.Mh6RI2rZIc@devpool47.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0

On Dienstag, 24. Dezember 2024 20:25:19 Mitteleurop=C3=A4ische Normalzeit L=
inus=20
Walleij wrote:
> On Wed, Dec 18, 2024 at 1:13=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wro=
te:
> > On Montag, 7. Oktober 2024 15:11:40 Mitteleurop=C3=A4ische Normalzeit R=
olf Eike
> >=20
> > Beer wrote:
> > > All current users need to add a KEEP() around the argument so the val=
ue
> > > is
> > > actually kept, which doesn't feel very natural and is prone to upcomi=
ng
> > > bugs as the name suggests that this macro alone already keeps things.
> > > Move that directly into the definition.
> > >=20
> > > Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> > > ---
> >=20
> > Ping?
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Please put the patch into Russell's patch tracker so he can apply it.

Ping?

It's available in the tracker here:=20
  https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=3D9439/1
=2D-=20
Rolf Eike Beer

We are nominated for the embedded award Visit us at the embedded=20
world 2025 March 11th to 13th, 2025 | Nuremberg Find us in hall 4 at=20
booth 336

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner
--nextPart3678204.R56niFO833
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZ9ANvAAKCRCr5FH7Xu2t
/PHoA/993Ou2lJsA0KucMXYTORvPiVIyVOFrdJcivrILl9JVVwlu4labkgljU32D
VDA9k1/sWIEo/dSJR5lkZxyGPbx8t70fjEZdjXYGzqvFksHLJJW6sWn9KhPgdlkF
pbfy56d2Jym8q/AzdQJcdAyKdTnEE/vtgzmiMirdcsnQvMzNSg==
=CFUV
-----END PGP SIGNATURE-----

--nextPart3678204.R56niFO833--




