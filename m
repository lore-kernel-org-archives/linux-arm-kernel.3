Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83756CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 05:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOuJIl5jH5w0bJhhr/fG3QSJrybAdR7bz58Ih+9yIBw=; b=x5cy1Xq1lLIGRpgj46RIH8J/+5
	jfc0a/v2kmvfzsewPRJTxF8MkRWGFfGfSI7QM7husocbo+c/td67tArgQszGykQetA0+b8/YUh/uG
	tEmupHMd3HV9G0E/oD2R4j2jWQDU8hH8JUyzRn0sUkDjGawoJvixE9WHjS0LFNQeu5ghfMNbjcuT+
	m0tcxE9ZyQ/MUDLBPsIzrj45EKuoVFfmlGfiZUzazCzikP5O8nzh5wMhR7YYEO76+jxhx4tjFV77Q
	jBCD701qiD9ovFOG6Nqat8/QLblCUjcvYFjLgeoGnuZCFH9V0iZE8wnuxV5S7oHZwx5GUxEc8ubge
	aw/DVkzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwH2-00000007AaO-479a;
	Fri, 12 Sep 2025 05:24:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwH0-00000007AZC-0TdQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 05:24:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8FB7EC8EC44;
	Fri, 12 Sep 2025 05:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 759F160638;
	Fri, 12 Sep 2025 05:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 497E3102F2833;
	Fri, 12 Sep 2025 07:24:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757654674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bOuJIl5jH5w0bJhhr/fG3QSJrybAdR7bz58Ih+9yIBw=;
	b=oj6uZAMeRU86ySa3dYaj3uhMj9lSFjdaVDg8pxBN8qjlH3go9bYu/MsJwNpzp5CTYnZtFH
	2IRxGoq9ua5LU9fhsu4yWtm/Oe46UCwav5KzGcuA3ml4iZbky28O/mBiQGIQtxv1PKtqll
	VWQ5MaeA/Xc9X/JKVc5qooxiG7FDluuSU2jGEGs9476RsuKbeIoweAp5xfsMO3ikFBzuJB
	gzmX0wI0N1alUvQrXtnxyI2YiOkTzVQrqadVp0rkisCyWk06RC+rZ0jqHgiZgSfOJ/xpxd
	aKcm11BHH7/lh54OVM9W54+oCxxIJcx/NGGNlr3yTX1LYuHB0SWvGX/ytQLieA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org, jihed.chaibi.dev@gmail.com
Subject: Re: [PATCH] ARM: dts: kirkwood: Fix sound DAI cells for OpenRD clients
In-Reply-To: <20250830203750.239890-1-jihed.chaibi.dev@gmail.com>
References: <20250830203750.239890-1-jihed.chaibi.dev@gmail.com>
Date: Fri, 12 Sep 2025 07:24:27 +0200
Message-ID: <87348sp7jo.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_222438_349564_9E980AB1 
X-CRM114-Status: GOOD (  14.38  )
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

Jihed Chaibi <jihed.chaibi.dev@gmail.com> writes:

> A previous commit changed the '#sound-dai-cells' property for the
> kirkwood audio controller from 1 to 0 in the kirkwood.dtsi file,
> but did not update the corresponding 'sound-dai' property in the
> kirkwood-openrd-client.dts file.
>
> This created a mismatch, causing a dtbs_check validation error where
> the dts provides one cell (<&audio0 0>) while the .dtsi expects zero.
>
> Remove the extraneous cell from the 'sound-dai' property to fix the
> schema validation warning and align with the updated binding.
>
> Fixes: e662e70fa419 ("arm: dts: kirkwood: fix error in #sound-dai-cells s=
ize")
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Applied on mvebu/fixes

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/kirkwood-openrd-client.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-openrd-client.dts b/arch/=
arm/boot/dts/marvell/kirkwood-openrd-client.dts
> index d4e0b8150a8..cf26e2ceaaa 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-openrd-client.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-openrd-client.dts
> @@ -38,7 +38,7 @@ sound {
>  		simple-audio-card,mclk-fs =3D <256>;
>=20=20
>  		simple-audio-card,cpu {
> -			sound-dai =3D <&audio0 0>;
> +			sound-dai =3D <&audio0>;
>  		};
>=20=20
>  		simple-audio-card,codec {
> --=20
> 2.39.5
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

