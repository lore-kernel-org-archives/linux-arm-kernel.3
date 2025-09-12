Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BDCCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoHUgNG9WFK5tEtf5uuz+0UQZUlRc0I+gT4+ZBrhy8w=; b=dGjxp/K4O2lhasIurWZtRUuSDu
	lCrqcJ7qXEJmuC2sNwLr60vU02r0+914xbmTIca3bMabRyNT5T/pM160fDopHyDcKzJt8/kewOzp9
	cgV2aYPCdOmbqxB+IfLn88eIHWCdrmGI6f9r91yFKjUxZGrO58RnzEkEEtIFgiHeIW0cpLjJl/zpm
	znxghTN6+eaqdKXZ+NXLSD/U38iUJs6fqzvaEnDp/x+7WDxi0ToRFyvR0Ippj2ShhUFkAYqKrQ1kd
	PN6/XA6kyGGxk9SSgJKTPnEmu3QRtVaJQWv2FuWYm0n2dMYlD/nHad8kGjrbqBJCYVzTTKZeyYWE9
	fXekRQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3Mt-00000009PPK-0XPg;
	Fri, 12 Sep 2025 12:59:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3Mq-00000009PNj-03ej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:59:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 508214E40CA2
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 12:59:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2729660638;
	Fri, 12 Sep 2025 12:59:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06B31102F2917;
	Fri, 12 Sep 2025 14:59:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757681945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uoHUgNG9WFK5tEtf5uuz+0UQZUlRc0I+gT4+ZBrhy8w=;
	b=ZveLJ4RBhUtqzF96HXkM+O5wLKip5ngyZJXe4iaQQFtCMo4FAQNjw5aow394Vvhu/SbKGN
	SmMVPBOReDj+IERGLmk8c8kd89JeA0rUa/ltr1nahdIQNWAWgymVCjCbu8Kb/3EwO8VsHw
	wbTGQwnODdz32i4oL7kMWw9mDZDYMtVgRcbUMdHrN+oZG2k8pLRobG3iD7d/P3c+RoT2ZO
	TF0gA1QNMNWYRlRMuvyraRp6U3vsuwhS0+I9pLqTxFS16j1FfhHwzXdhzvPhhwTYZ2runo
	ngQP8Q+ZJ96nOSTkxEII6XHRMQMPmbIKHM348gWGX193JH+poSCtgs4dbrJIZQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Josua Mayer <josua@solid-run.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Wunderlich <frank-w@public-files.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: marvell: cn9130-sr-som: add missing
 properties to emmc
In-Reply-To: <20250911-cn913x-sr-fix-sata-v2-4-0d79319105f8@solid-run.com>
References: <20250911-cn913x-sr-fix-sata-v2-0-0d79319105f8@solid-run.com>
 <20250911-cn913x-sr-fix-sata-v2-4-0d79319105f8@solid-run.com>
Date: Fri, 12 Sep 2025 14:59:02 +0200
Message-ID: <87frcromi1.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_055908_187365_E3FE5528 
X-CRM114-Status: GOOD (  10.63  )
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

> CN9130 System on Module connects an eMMC to ap_sdhci0, but the common
> properties indicating eMMC were not added to device-tree.
>
> Add no-sdio and non-removable as applicable to eMMC.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi b/arch/arm64/=
boot/dts/marvell/cn9130-sr-som.dtsi
> index a997bbabedd8a9679e9d209225666d7696dd7da2..f95202decfceb5cc9dc777ddd=
1870d5972a1bc54 100644
> --- a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
> @@ -61,6 +61,8 @@ &ap_sdhci0 {
>  	pinctrl-0 =3D <&ap_mmc0_pins>;
>  	pinctrl-names =3D "default";
>  	vqmmc-supply =3D <&v_1_8>;
> +	no-sdio;
> +	non-removable;
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

