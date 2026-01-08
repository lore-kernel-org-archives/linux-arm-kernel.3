Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7E9D1489E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lzc+HCU/UMiCZqanaq1/Hyk80NttsM3prspmFkSZ1dM=; b=yoQh9Wmw5zmx/a95RTxa9PDfkQ
	XPFkm6rQSLMhNdAmxruE7nexAOJ0/EX5ucMcpHEZiCSyKmIMQEqmgly65t/HH7rVHkHqeKrZZETxN
	/zfw0J51moQhuwT1VUBfR52rQxOVAL6dkl03TYP3ZmrMZOJdG4lcTMl0yGZed9Nl+nT6iYrsRMLc6
	ZJjIyJDnxHERbOUxuFcr99BjBfHI6ty1k/wIXqWbRFsVp8MxfP7OfVh34PHtIKe3UARFbi6zNhmE0
	V8UNY/ru4zJUETAHGEJfi2tS+Eb4r0osUYV1Oqtp7G7v4bU4o7/AAnlfsFwm60eJJFOIRd374JIxD
	tW3EayrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdj8p-0000000FyDr-2oIa;
	Thu, 08 Jan 2026 06:05:03 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdj8m-0000000FyCg-157G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 06:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767852298;
	bh=Lzc+HCU/UMiCZqanaq1/Hyk80NttsM3prspmFkSZ1dM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FPvChj9QFoYELv4NmJ0HWX4qTD4n8uT2clQe2BuBk2aDz3PVF8Ry8moGU6xwAI7H5
	 MMH5yumSsONLqGEgMIiqfxAh9Dn4CdPhwzQeP3gi6/T3aHhCr27XkY95VVg4xUezQV
	 QGKMyyzP5v+/xq/b4u+QROxP7YbForn4nLzIsXArRg/z+VwzcUI58n2TwjMt5vkdRX
	 Ac4cAXty41G8FHnWcWF7jU8eoyGu61VaBx6z1K8IEreEIRCxQ4AHB/uJ/cHlqggX9a
	 6GOg9qnkpB0b2RAXEWf13igTQnR4S0UUAg/fZACzLE9iNmDS9ZfU/DyYZpgBj4dw7E
	 i6vlPPAuW0yYQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B16BA7C834;
	Thu,  8 Jan 2026 14:04:57 +0800 (AWST)
Message-ID: <3d6aaf558fd8b60ec7010f976a747d9f0a727f98.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/2] arm: dts: aspeed: add an alt 128M flash layout
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 08 Jan 2026 16:34:57 +1030
In-Reply-To: <20251218-alt-128-v2-1-10499a0b7eb9@nvidia.com>
References: <20251218-alt-128-v2-0-10499a0b7eb9@nvidia.com>
	 <20251218-alt-128-v2-1-10499a0b7eb9@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_220500_520985_F1A4D651 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Marc,

Regarding the subject prefix, can you please capitalise the 'ARM' portion, =
so:

   ARM: dts: aspeed: add an alt 128M flash layout

That way it's consistent with the rest of history.

On Thu, 2025-12-18 at 10:48 -0800, Marc Olberding wrote:
> Add a 128M layout for the BMC flash chip we didn't boot from. Including
> this allows the user to write to each partition on the alternate spi
> chip. This dtsi follows the existing standard of using the same layout
> as non alt version and prepending `alt` to each partition's name.
>=20
> Testing: Include this in msx4 and cat size, offsets and name

I think this would be better with s/Testing/Tested by/ and associated
grammar fixes.

> ```
> for devdir in /sys/class/mtd/mtd*; do
> > =C2=A0=C2=A0=C2=A0 [[ -d $devdir && -r $devdir/name ]] || continue
> > =C2=A0=C2=A0=C2=A0 name=3D$(<"$devdir/name")
> > =C2=A0=C2=A0=C2=A0 [[ $name =3D=3D alt* ]] || continue
> >=20
> > =C2=A0=C2=A0=C2=A0 size=3D$(<"$devdir/size")
> > =C2=A0=C2=A0=C2=A0 offset=3D0
> > =C2=A0=C2=A0=C2=A0 [[ -r $devdir/offset ]] && offset=3D$(<"$devdir/offs=
et")
> >=20
> > =C2=A0=C2=A0=C2=A0 dev=3D$(basename "$devdir")
> > =C2=A0=C2=A0=C2=A0 printf "%s name=3D%s offset=3D0x%X size=3D0x%X\n" "$=
dev" "$name" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "$offset" "$size"
> > done
> mtd10 name=3Dalt-rofs offset=3D0xA00000 size=3D0x5600000
> mtd11 name=3Dalt-rwfs offset=3D0x6000000 size=3D0x2000000
> mtd7 name=3Dalt-u-boot offset=3D0x0 size=3D0xE0000
> mtd8 name=3Dalt-u-boot-env offset=3D0xE0000 size=3D0x20000
> mtd9 name=3Dalt-kernel offset=3D0x100000 size=3D0x900000
> ```

Can you rather remove the markdown codeblock and instead indent the
code snippet (IMO 4 spaces is fine)?

Also the shell continuation markers seem a little unfortunate. Maybe
just drop them for clarity? You can separate the output from the
script.

I also found this helpful:

    diff -u arch/arm/boot/dts/aspeed/openbmc-flash-layout-128{,-alt}.dtsi

Andrew

