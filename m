Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2A3D65C63
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 22:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0ZQpPnP6V0VHVG4T/qTaG7HGafVff3MtURtDkNB+7o=; b=VXTqWSSA3EYzi7RxzmZYlqJ8kf
	vtuGG3CUYOKSRMCZyxy7tZUUNqAQCDIA+9deTvcLnkrFH92SQVURuiSWcF2CaV84SuE1h6QxrskG0
	HC8K83RGjCjgUIcfXe/bgLfX25w06OFyFliQE2aNwUdVbuaFi85oM+tgP5nxEUmqBsrxc14DsaHVQ
	oWXO+FGXJHycomm6pYdfAEqfMEuMp+XbncuvPJuF7Dv6/ALQyoTMvnzbJbC3u/wmao790H9bc5rJ0
	7vxI1IzXAum+IAAGgzV/yuGu82/3dE+5gQ2Pq5JZYp1t1gDSDxM5gM14PqfM7HCrRFEbW0eB5N+Tn
	ZiyMcCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0Uo-00000007VCp-1tB2;
	Wed, 17 Dec 2025 22:59:50 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0Ul-00000007VC4-2Juu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 22:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1766012385;
	bh=h0ZQpPnP6V0VHVG4T/qTaG7HGafVff3MtURtDkNB+7o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D6L574KlgyqzSiWjJnQy9D8H7anarJ75r5sI+bRpxh5ii3G2KVXGenqFNpIFW03G3
	 9chSFdeSExk1LhJTLixQa0Rtkp4mZ2cTamqmy5LpgLXeYrixa0LPPmSt8Xgo7IcBW9
	 MK6vkDTNKvWpvhFM5H2RA2XD1EdhQkSbudltYdehH/6CuVxo0WKxqJNreLhyRLeoS7
	 HdcZ3w01f1DmE7Zc8BDo9aqKFP6S9R0wg6Ffq/A5LT+r2YltNEcbfMBYYjA9pvqxZZ
	 pmpJW+MRqyE3y8C38vClToSpNSfFpu+Cb2dENC6tga6iEcr6qT4j2gSgDdz6jSsf55
	 z7DKlQOWcuHVw==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 03A677C1B2;
	Thu, 18 Dec 2025 06:59:44 +0800 (AWST)
Message-ID: <61f561d95af86a46f1e1075df39e1ce0f1324098.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm: dts: aspeed: add an alt 128M flash layout
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 18 Dec 2025 09:29:44 +1030
In-Reply-To: <20251211-alt-128-layout-v1-1-100f57d2bc4a@nvidia.com>
References: <20251211-alt-128-layout-v1-1-100f57d2bc4a@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_145947_811958_08F32245 
X-CRM114-Status: GOOD (  18.13  )
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

On Thu, 2025-12-11 at 13:35 -0800, Marc Olberding wrote:
> Add a 128M layout for the BMC flash chip we didn't boot from.
> Including
> this allows the user to write to each partition on the alternate spi
> chip. This dtsi follows the existing standard of using the same
> layout
> as non alt version and prepending `alt` to each partition's name.
>=20
> Testing: Include this in msx4 and cat size, offsets and name
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
>=20
> Also ran dtbs_check on an existing dts with this included.
>=20
> Signed-off-by: Marc Olberding <molberding@nvidia.com>
> ---
> Add a layout for an alternate 128M flash layout. This is
> useful for the aspeed ast2500[2] and ast2600[1] SoCs,
> where it has the ability to boot from one of two spi chips,
> nominally the primary and backup SPIs. Adding a layout allows
> userspace
> to flash the alternate spi by partition and switch over to it,
> allowing
> lower downtime for firmware flash, or for updating the primary
> flash from the golden backup flash. This is already an established
> scheme for the 32M and 64M layouts, where the layout is the same
> but each partition has `alt` prepended to its name. This allows
> userspace to just prepend alt to the images in the update process
> to specify which flash chip to update.
>=20
> References:
>=20
> [1] https://www.aspeedtech.com/server_ast2600/
> [2] https://www.aspeedtech.com/server_ast2500/
> ---
> =C2=A0.../dts/aspeed/openbmc-flash-layout-128-alt.dtsi=C2=A0=C2=A0 | 32
> ++++++++++++++++++++++
> =C2=A01 file changed, 32 insertions(+)

This may be fine, but please add it in a series that also introduces a
board that consumes it.

Andrew

