Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE3ECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fGibqKE+FAjIZ49uwUJtvQhXhXO0YneIbfrt6lUIe0=; b=0CSC2wWaydhu4ZcXv2CSwgDXSg
	+6k/pSS5rwLiskoJAaHmF3FauFujzncUq7sEzLUpS/iccAR9mTSDzpwJ/Yi+LyP9MzS5yYmFiKdLG
	V1FTP91MAAY1Zw6wqloYtmJtexP0ZwJ7Dd+WhdtyxZhbibXYscytiyuD5ykwx2WAMAto67TCwcm48
	m8Hi3wx+c1Savu241rgvigPRDvMADJXJIjob1eVULVp9ufqk0n4qMLnwXQCW9rJ0RRYjZ9Mz6BMkX
	NzyZNdF/aJPPluJuvnQlNQuivx36bZE87yWfJ6C+ZrV/kHBBZ3JDnTTiBHFD828MVs8Y3x0KU1HfJ
	XZzo1HzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3MJ-00000009P9X-33yN;
	Fri, 12 Sep 2025 12:58:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3MH-00000009P7j-0Mrn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:58:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6647F1A0DD2;
	Fri, 12 Sep 2025 12:58:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CA4760638;
	Fri, 12 Sep 2025 12:58:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FBB5102F29CD;
	Fri, 12 Sep 2025 14:58:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757681910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6fGibqKE+FAjIZ49uwUJtvQhXhXO0YneIbfrt6lUIe0=;
	b=eBVMVMl3UH5oHD9LuDgoIy2GiDvmkt/hXSeYR5TRsDwcSzzQIqeZ7fa8W/16Tk0D3A9pZB
	bkcbZuJfu3QuDFrz8h8PMjzVj67dLPXkyThpVFKVEcX+l1uJWHTelo65UGi9wMrGSf99Cs
	+0MSUngd9EtG5VlsD3o3aX9pQfPyjWut46To8mYVBoBh/QULATE2gUhufdteISsIb3kFjS
	XsHIz5UINFa1OrS44PmCUEpA5wzK5vNn8uV+9wCu7heCTqBCLfWBlok6raJIQ06HHfKcrN
	0kdgReYhf9PjTBQgEbaM5t3N2ZlJbBvVJ5YWt+5VoxPydJIAOTVV59AwUsF5iQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Josua Mayer <josua@solid-run.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Wunderlich <frank-w@public-files.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: marvell: cn9132-clearfog: fix
 multi-lane pci x2 and x4 ports
In-Reply-To: <20250911-cn913x-sr-fix-sata-v2-3-0d79319105f8@solid-run.com>
References: <20250911-cn913x-sr-fix-sata-v2-0-0d79319105f8@solid-run.com>
 <20250911-cn913x-sr-fix-sata-v2-3-0d79319105f8@solid-run.com>
Date: Fri, 12 Sep 2025 14:58:29 +0200
Message-ID: <87ikhnomiy.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_055833_261388_AAC2C6CC 
X-CRM114-Status: GOOD (  15.60  )
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

> The mvebu-comphy driver does not currently know how to pass correct
> lane-count to ATF while configuring the serdes lanes.
>
> This causes the system to hard reset during reconfiguration, if a pci
> card is present and has established a link during bootloader.
>
> Remove the comphy handles from the respective pci nodes to avoid runtime
> reconfiguration, relying solely on bootloader configuration - while
> avoiding the hard reset.
>
> When bootloader has configured the lanes correctly, the pci ports are
> functional under Linux.
>
> This issue may be addressed in the comphy driver at a future point.
>
> Fixes: e9ff907f4076 ("arm64: dts: add description for solidrun cn9132 cex=
7 module and clearfog board")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied on mvebu/fixes

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/cn9132-clearfog.dts | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts b/arch/arm64=
/boot/dts/marvell/cn9132-clearfog.dts
> index 115c55d73786e2b9265e1caa4c62ee26f498fb41..6f237d3542b9102695f8a4845=
7f43340da994a2c 100644
> --- a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> +++ b/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> @@ -413,7 +413,13 @@ fixed-link {
>  /* SRDS #0,#1,#2,#3 - PCIe */
>  &cp0_pcie0 {
>  	num-lanes =3D <4>;
> -	phys =3D <&cp0_comphy0 0>, <&cp0_comphy1 0>, <&cp0_comphy2 0>, <&cp0_co=
mphy3 0>;
> +	/*
> +	 * The mvebu-comphy driver does not currently know how to pass correct
> +	 * lane-count to ATF while configuring the serdes lanes.
> +	 * Rely on bootloader configuration only.
> +	 *
> +	 * phys =3D <&cp0_comphy0 0>, <&cp0_comphy1 0>, <&cp0_comphy2 0>, <&cp0=
_comphy3 0>;
> +	 */
>  	status =3D "okay";
>  };
>=20=20
> @@ -475,7 +481,13 @@ &cp1_eth0 {
>  /* SRDS #0,#1 - PCIe */
>  &cp1_pcie0 {
>  	num-lanes =3D <2>;
> -	phys =3D <&cp1_comphy0 0>, <&cp1_comphy1 0>;
> +	/*
> +	 * The mvebu-comphy driver does not currently know how to pass correct
> +	 * lane-count to ATF while configuring the serdes lanes.
> +	 * Rely on bootloader configuration only.
> +	 *
> +	 * phys =3D <&cp1_comphy0 0>, <&cp1_comphy1 0>;
> +	 */
>  	status =3D "okay";
>  };
>=20=20
>
> --=20
> 2.51.0
>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

