Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21013E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6iG3dvDjNjTNtk0IMyCf+/wWXsMSA8Fz5H1e91qnKU=; b=xvhTIXiDhUVFPjormUzWecbdyA
	Fygwi4iBUEp9N3fTr3V4SR9f+SbtwhvrXLNdzl9ebi7Gfrb6qfis7MpFy3POm7actluRpamSEVWIG
	p6qrteyuS0tUIuJO90QYfm1/C1l/LL5tcpU7zDBqSg1BPl4K0DKJPUZdyEMdQFxowlBe5TROvBzgv
	JfNk83otNqSXCLFgYKQd5o5QhgdjlTuKtLBurEU/vedM8Ibo2Ngvezc4JgMffUSdrRohdOF7sJDlb
	KUe9XvBUt/7n4wbqEpI9fuzGkK79rlS1VC/jpZhGddFFkn0nvvswXPFlM0HpTnv/PkXh3CUX7IVA9
	fdUPtkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRIb-00000007Wz3-3Xj2;
	Wed, 08 Jan 2025 08:20:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRHN-00000007WoE-3qPr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:19:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59B52C0004;
	Wed,  8 Jan 2025 08:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736324339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m6iG3dvDjNjTNtk0IMyCf+/wWXsMSA8Fz5H1e91qnKU=;
	b=Etj9eUPuKvWQW+jtgmXty90yegxXd/DTNdnvN0CXinHbIxtERael7Ypambb4J2H4HiCN2T
	EOnzD4J/Q1kSseqJxP41+WhiK2XZeRz+qqbu9QhmCEchYi9fntmgctQbe9CRdAnv66LFDW
	LAxit1aWNa/h0Vdav5dgzXb9fevekH/mkz6Gw3q8awNqPxLOedRQ5mDX4M2fCPBkFRuGOt
	Tju9v0Npzdq44ytLx8YAnfXtxCYQZGgbWwYaI0Ln+PGU4057RyiVWIV08KF+1E3eF0WjEm
	rpVOwnhVEd7/bmfQ+sJgHdTJYo52MxwBVkMB7NeTRCMOBeYDTF4KZjGl1IugGw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Josua Mayer <josua@solid-run.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
Subject: Re: [PATCH] arm64: dts: marvell: cn9131-cf-solidwan: fix cp1 comphy
 links
In-Reply-To: <20241119-cn9131-solidwan-comphy-fixup-v1-1-6e7446434204@solid-run.com>
References: <20241119-cn9131-solidwan-comphy-fixup-v1-1-6e7446434204@solid-run.com>
Date: Wed, 08 Jan 2025 09:18:58 +0100
Message-ID: <87o70hyaz1.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_001906_094329_B7599D4D 
X-CRM114-Status: GOOD (  14.34  )
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

Josua Mayer <josua@solid-run.com> writes:

> Marvell CN913x platforms use common phy framework for configuring and
> linking serdes lanes according to their usage.
> Each CP (X) features 5 serdes lanes (Y) represented by cpX_comphyY
> nodes.
>
> CN9131 SolidWAN uses CP1 serdes lanes 3 and 5 for eth1 and eth2 of CP1
> respectively. Devicetree however wrongly links from these ports to the
> comphy of CP0.
>
> Replace the wrong links to cp0_comphy with cp1_comphy inside cp1_eth1,
> cp1_eth2.
>
> Fixes: 1280840d2030 ("arm64: dts: add description for solidrun cn9131 sol=
idwan board")
> Signed-off-by: Josua Mayer <josua@solid-run.com>


Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts b/arch/ar=
m64/boot/dts/marvell/cn9131-cf-solidwan.dts
> index b1ea7dcaed17dc0205d1ae91d4178dd1f8313a5b..47234d0858dd2195bb1485f25=
768ad3c757b7ac2 100644
> --- a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
> +++ b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
> @@ -435,7 +435,7 @@ &cp1_eth1 {
>  	managed =3D "in-band-status";
>  	phy-mode =3D "sgmii";
>  	phy =3D <&cp1_phy0>;
> -	phys =3D <&cp0_comphy3 1>;
> +	phys =3D <&cp1_comphy3 1>;
>  	status =3D "okay";
>  };
>=20=20
> @@ -444,7 +444,7 @@ &cp1_eth2 {
>  	managed =3D "in-band-status";
>  	phy-mode =3D "sgmii";
>  	phy =3D <&cp1_phy1>;
> -	phys =3D <&cp0_comphy5 2>;
> +	phys =3D <&cp1_comphy5 2>;
>  	status =3D "okay";
>  };
>=20=20
>
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20241119-cn9131-solidwan-comphy-fixup-aa1870913d0a
>
> Best regards,
> --=20
> Josua Mayer <josua@solid-run.com>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

