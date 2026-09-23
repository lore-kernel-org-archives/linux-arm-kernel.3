Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76268C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PPxBgUPMs5vchL7SR1fadKjrntsb9RgCKzLY/cjVMM=; b=abBN+obTOt0VEFwGRVq97owItW
	uykH7+cWXClYsSCM4X7xWwixKe9tMn5vBX7wQPIVKrgRuYennqG65du4yT8db0EMgZiY0GD2/ppmR
	ayJ/zbCoomBdHRSkEGfyeI3OOLuaY9GT1Q60leYtgc1lVpONhPjVBv0Goopyt8TLz0qk2V2rWXEeI
	Yc4SnxuaCLONg7AU/eADrb8RTzuteQHKjaz1A/CoYecE18ShlzpOfAbzEw+idF3nT9CKACrpFYJ+T
	9wQ8TA5g94jMSv5z7oC5vkoIL7o21aiaIMDtjdzVngVFTyNuWmjAOklBpqSoxG2AqabaVSiOGwID+
	lKltC3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P97-00000008n5R-27wJ;
	Wed, 23 Sep 2026 15:44:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P96-00000008n5J-0ixC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:44:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8738E4152C;
	Wed, 23 Sep 2026 15:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAAF1F000FF;
	Wed, 23 Sep 2026 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178271;
	bh=9PPxBgUPMs5vchL7SR1fadKjrntsb9RgCKzLY/cjVMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZCvKnDvyFD4Ed5hludzd7plkpUV5xgTorV53CLht/02a3pPU8pxjsaNP+vl3RM6u0
	 HHdcQrXYtJlRDswS+twP65Os5BLKtpUkF0NliYzgprI821NcdMJy4ICi0Vyzz/Ki+5
	 n1f4aAAXIIPaqAuzkYZte48uwP0JSDtUbo9VMn8frp3k0UNWEggB00c8b+uH5t+6mT
	 /b+nrhZH7sqBUiqOVota1eT4fe1qPNYIZ7ZQUoKJvp/Y4Y+OyFw57kNdnnPO6C0ONW
	 TsqtVuNCK4mnlbY5ovdQ9umxwMjqtOuKpkvHSbiM4JQSx7VjoVvL4JZoHzwGDxCOPa
	 JL/cPq7+7qwgg==
Date: Wed, 23 Sep 2026 16:44:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Message-ID: <20260923-strenuous-faceless-dfad20f6b872@spud>
References: <20260921232540.3128596-1-robh@kernel.org>
 <20260922-cheer-reference-c31fc6fb946d@spud>
 <20260923150409.GD27237-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fXQyoIfMWTM8pali"
Content-Disposition: inline
In-Reply-To: <20260923150409.GD27237-robh@kernel.org>
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

--fXQyoIfMWTM8pali
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:04:09AM -0500, Rob Herring wrote:
> On Tue, Sep 22, 2026 at 07:06:02PM +0100, Conor Dooley wrote:
> > On Mon, Sep 21, 2026 at 06:25:39PM -0500, Rob Herring (Arm) wrote:
> > > Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board. =
The
> > > node only contains the compatible string and one register window on t=
he
> > > local bus.
> > >=20
> > > Assisted-by: LLM
> >=20
> > Guidance to the LLM should probably include including the reason that
> > this is being added to the commit message.
>=20
> Not sure what you are looking for... I told it to convert all the .txt=20
> bindings to schema. Then I told it fix all the errors. Then I fixed some=
=20

I meant that it should say something like "Add schema for ... node that
is undocumented but appears in the ... board dts".
Otherwise this seems like a completely random addition, other than the
submitter being you pointing towards it being cleanup for undocumented
stuff.

> things throughout the 900 commit branch upstreaming things bit by bit. =
=20
> Then it mostly sat for a year and I told a new model to review them and=
=20
> fix these common problems a, b and c. Then I said fix all the=20
> dtbs_checks warnings on arm64. Then I said there's still warnings, do it=
=20
> again. Repeated that ~10 times. Now I'm going thru to weed out all the=20
> wrong and sometimes unnecessary changes.
>=20
> So LLM did all the easy parts and I did everything that requires any=20
> judgement. The hardest part is typically just figuring out the=20
> correct maintainers...
>=20
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++=
++
> > >  1 file changed, 35 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/h=
isilicon,hip05-cpld.yaml

--fXQyoIfMWTM8pali
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarPz2wAKCRB4tDGHoIJi
0qo5AQDoHJLM3dY0FK4aNlll5Vp276wV+D0l/vFY92imoN9xJwD/S/lJE2a7bcHD
Q7vOIv9sEQqziJ6J3fePaQYs5nrnIw8=
=v+dZ
-----END PGP SIGNATURE-----

--fXQyoIfMWTM8pali--

