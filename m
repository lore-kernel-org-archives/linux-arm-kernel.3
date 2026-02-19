Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A8EC531E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 22:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsuYpqBzhHCrA5NOoErB6qWr93G3ME/F8oMqLaTn5dw=; b=1Z1dg+gpOba7PHxCNhlbsmCvwi
	sWBzBGrzDAH3KQE4v5KiMkEtaiwCNV4C41fcQ1Sn+O3ktCV6s15udls1OWSnFoQuB3Sfd2pThuoGK
	GR8toKSDER+Jq2KY4ROUBNAV3GcjMmIDVjsG1R585YiNEAmXASOwR4G+8/g2+ox7jBrwzjUSPWqM9
	28XEdiDrIqHDnv7PbH0V5kCDKbG58QYtQtmMtiphKwDqtehuEpfouBVbXw/ijukV/FSBEf/NbGCyy
	7vvMXBZIk7nqF20fx045jUoCD2oRHcJn7GKnTC0Htqi0XyTAEsFt+RT73P5ppTSC+iUQXI7TH6iMh
	HcKHgVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCw5-0000000CEGw-47h6;
	Thu, 19 Feb 2026 22:55:53 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCw3-0000000CECn-2N3a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 22:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1771541742;
	bh=SsuYpqBzhHCrA5NOoErB6qWr93G3ME/F8oMqLaTn5dw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UJ8Qx9VOxZXNGx2/KPPqarJ91onDtc/c91tR9XStg93O0F1PqgJ+gMaRUYKw8KAG+
	 JdhtuaUIov9nn66tpAvtBOIVvSjTaj+LKGdUseStOl1nbaRROrZt+7HtHWzMmhwA2A
	 XNGS4Ynv4pnpbB03RKhnj3n4C0U1FVQ68TvFvkgKyYlDSn+eKuufiN9va4TuahBbUm
	 cC4wg9fuXIARy+r/3i0NWLUeLEBgqmWx20em5jd2a3xnIP4GJsh973uEurQUmSUEfp
	 v/N05EpZ+l4VNk/PtqsKQGzOhhAe11vAFRUAk/Id4QHlykWQyZ+vlGIAGC1Q1/VwmF
	 qHIPlrhpXS5eQ==
Received: from [192.168.68.114] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 08C16600E1;
	Fri, 20 Feb 2026 06:55:41 +0800 (AWST)
Message-ID: <7fb15c01c586fb7d4a3ee506b17d87151d50bfe6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Chen, Dirk" <Dirk.Chen@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Fri, 20 Feb 2026 09:25:41 +1030
In-Reply-To: <MN2PR12MB403103EC90C803E3FA6CE6B9E76BA@MN2PR12MB4031.namprd12.prod.outlook.com>
References: <20260209-b4-anacapa-dts-fix-v2-1-fe446a7038bf@amd.com>
	 <6192440acc150d216de5e074299e579e891fc845.camel@codeconstruct.com.au>
	 <MN2PR12MB403103EC90C803E3FA6CE6B9E76BA@MN2PR12MB4031.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_145551_808223_63321979 
X-CRM114-Status: GOOD (  12.78  )
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

Hi Dirk,

On Thu, 2026-02-19 at 15:54 +0000, Chen, Dirk wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]

Please have a read through [1], in particular:

[1]: https://subspace.kernel.org/etiquette.html

   Do not include =E2=80=9Cconfidentiality disclaimers=E2=80=9D

   When posting to public mailing lists the boilerplate confidentiality
   disclaimers are not only meaningless, they are absolutely wrong for
   obvious reasons.
  =20
   If that disclaimer is automatically inserted by your corporate e-mail
   infrastructure, talk to your manager, IT department or consider using a
   different e-mail address which is not affected by this policy. Many IT
   companies have dedicated e-mail infrastructure for kernel developers to
   specifically avoid this situation.

>=20
> Hi Andrew,
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0 eeprom@50 {
> > Please order these nodes by ascending address. The node currently above=
 this one is i2c-mux@70 - eeprom@50 should go before it.
> > https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order=
-of-nodes
>=20
> Thanks for the reminder.
> I've reordered the nodes by ascending address in v3.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D "atmel,24c2048";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D <0x50>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pagesize =3D <128>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 };
> > =C2=A0};
> > +=C2=A0=C2=A0=C2=A0=C2=A0 eeprom@50 {
> > Same for this one.
>=20
> Fixed in v3 as well.
>=20

Thanks,

Andrew

