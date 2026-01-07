Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C0BD0D145
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 17:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwcnYIMg4p/wxTYG2J5mPwCBb8Jlp4L/ffmhwtbSJMM=; b=U78CiLTjQcrTavayGK6zvR6hqW
	LhkQiyoEOcTchaDFt/KEx4pNAUWevENAYGzuO7WUoiH5HRJiforSmxT1fW/XItSMp8dwdj0UHXFxl
	Vk1gAeuln6YvzXeZqXewJiZJT7ZdDoIZzQ14ZQBNfMK3Ka8HvxsFYyl663DwBJtZ8U/O3/Dl81zQ/
	c0BSI6y130vK+LZjZgIKlc1snD66QMSKP8q4GIV4NtUqT8yb3mKr3tToYIgMStwif6FPg9L3kXiGw
	O1/lBNMM6sXjwNDuhBVoYHBwvEaW/zg3cg++VYDb70oul4OGJPlp4ASedGO7gbjT6x0gNdJgWi/Dk
	aoG/GOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXEB-0000000FMxf-0XJn;
	Wed, 07 Jan 2026 17:21:47 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXE6-0000000FMx3-3lxa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 17:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1767806500; x=1768065700;
	bh=hwcnYIMg4p/wxTYG2J5mPwCBb8Jlp4L/ffmhwtbSJMM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cUiiqkxD5RWdKaZpoFfblPMOx3+CSszdr0z0LqbhwzR5RB1Fv2mU1H1pXDD93ngaP
	 PGr5mWeBr2x3wuS7p7+6jXmbIxnA/LrIbO5uAXKq+AdCYAoLtD86CZqJE5sdRVw+JW
	 +XF6i1+utW4sv6hKKBgeX2rmKXhkd6Mx8ML33XpUWCVlC6oTc51BLeuU0Hu8/5SeyT
	 JBma0QcOV201HmZBm1dxFSecC8e7n1mGgF4aN5RTsSQ+RWkCpWCW8KREz/+ztFgxgD
	 W2eyKHHp/S9flZp8GyzK6r5JBwNRxhf7HuLZbS6O1mdb/ITZlrLy/R9NyVhYXDh7RH
	 xy8HlTmgVHCqw==
Date: Wed, 07 Jan 2026 17:21:38 +0000
To: Michal Simek <michal.simek@amd.com>
From: kylebonnici <kylebonnici@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>, Peter Korsgaard <peter@korsgaard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kyle Bonnici <kylebonnici@hotmail.com>
Subject: Re: [PATCH] Coding Style: Format arch/arm/boot/dts/xilinx
Message-ID: <o8y30D8GjOUPC9Rfl9zl5DcR8KOH7XCc3nbb0KcWZ1FGxHgzDtgt-tFZ8GEbT_C_5JeLbLfjgsSExFtoZ4s9DFPJ-mq1tcy4k9gp9mJ7HQs=@proton.me>
In-Reply-To: <f514d490-75d8-408e-99ba-ee44916395fc@amd.com>
References: <20251218125034.248-1-kylebonnici@proton.me> <5262fa29-4094-4c5d-be3f-2c73ee322ef6@amd.com> <zUWWtNtMhwr9_g1C6mdaGPvyls1-H_tCHfdMuWC35MYUzv88iiaEzS9RTUiucp4QU_RhvuTGiNcl_GV684b6h4-DmdnKPeCLGKB1RHEG6G8=@proton.me> <f514d490-75d8-408e-99ba-ee44916395fc@amd.com>
Feedback-ID: 172426429:user:proton
X-Pm-Message-ID: b2577ab4b27c7a4271bd8399374e50e0d35f26c2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_092145_002500_9D451EFA 
X-CRM114-Status: GOOD (  21.47  )
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

On 1/7/26 08:49, Michal wrote:
>=20
>=20
> Hi,
>=20
> On 1/6/26 21:28, kylebonnici wrote:
>=20
> > Hi,
>=20
>=20
> first of all please don't do top posting.

Noted=20

>=20
> > Thanks for the feedback.
> >=20
> > with regard to subject I am not sure in what subsystem file formatting =
would go (especially if we run it on even more files and more systems are m=
odified) Your guidance would be appreciated.
>=20
>=20
> arm: xilinx:
>=20
> or for 64 bit version
>=20
> arm64: xilinx:

At this point how does one go about changing subject ? by creating a new pa=
tch or is there some other process?

>=20
> > With regard to improving the line wrapping, can you share some examples=
 so that I can start looking on improving this?
>=20
>=20
>=20
> run it over zynqmp.dtsi file
> And focus on pcie node
>=20
> @@ -958,8 +979,10 @@ pcie: pcie@fd0e0000 {
> <0x0 0xfd480000 0x0 0x1000>,
>=20
> <0x80 0x00000000 0x0 0x10000000>;
>=20
> reg-names =3D "breg", "pcireg", "cfg";
> - ranges =3D <0x02000000 0x00000000 0xe0000000 0x00000000
> 0xe0000000 0x00000000 0x10000000>,/* non-prefetchable memory */
>=20
> - <0x43000000 0x00000006 0x00000000 0x00000006
> 0x00000000 0x00000002 0x00000000>;/* prefetchable memory */
>=20
> + ranges =3D <0x02000000 0x00000000 0xe0000000 0x00000000
> 0xe0000000 0x00000000
> + 0x10000000>,/* non-prefetchable memory */
>=20
> + <0x43000000 0x00000006 0x00000000 0x00000006
> 0x00000000 0x00000002
> + 0x00000000>;/* prefetchable memory */
>=20
> bus-range =3D <0x00 0xff>;
>=20
>=20
> 1. sometimes commens are using space,tab or nothing. Same style would be =
useful.

Comments are currently untouched when the comment first token is not the fi=
rst token on the line.=20

This is because some users wanted comments to align within a property value=
s e.g. `foo =3D <...> /* ...*/\n,<...>; /* ...*/`and some wanted to also al=
ign comments across multiple properties in the same node. Hence no rule on =
how this should be formatted was reached when this tool was applied to form=
at the  Zephyr project.=20

I am open to discuss some rule that can be followed and looking applying th=
at.

> 2. last cell on next line looks weird to me. I think you can decode
> address-cells/size-cells for ranges and do indentation base on it.

This is not necessarily always possible with out parsing the full context i=
.e all the includes from the root of this context.

Reasons:=20
- This values found in this node in this file might be overridden by some l=
ater definition.

- The omission of these values can mean a value of 2 and 1 respectively or =
again these may have been defined in some other instance in the full dts co=
ntext.

Currently the rule to wrap is a follows:=20
  - Wrap Value (e.g ...., <0xf00 (0xc - 0xb) 0xaa>) > if value length + ind=
entation exceeds the wrap column
  - Wrap Expression (e.g. ...(0xc - 0xb) 0xaa>, Note that expression are wr=
apped outside in when we have nested expressions and nested expression will=
 be indented to be aligned with the parent expression group > if value leng=
th + indentation exceeds the wrap column,
  - Warp Value e.g ....0xaa>
>=20
> > To run on more files I will wait for feedback from Rob, Krzysztof and C=
onor.
>=20
>=20
> yep.
>=20
> Thanks,
> Michal

