Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB615C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 00:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsLbrEcDHR1CqcdDrTwnQzpK6jcP3o5E5bXCv2mXd5Y=; b=RNZsnRffMlYzDqY8Az94ydoCp4
	1T2DRUmA2jQ7HFpiUoVAVadAK/8zZ4MEEIkURAiLB/9xS7q0oaYpsEyC8ftij1wyWUut72isFQSVn
	euFvYsPaLBK4HftHkUf57WSesxjKY/deaWFn0/xU1U3Km/EU1FIBQiXLslutJTs2o3JcsRCfzV8ky
	lIIo9XpFlUPyeTKVfNlCRjZfupN9D/cCpKRioS9eBgK5e8dkro0WXcW0byJ5j82+rISM7FbsgYSh4
	sxHbJFGlr5EWAMAtFUpm/yRIgKMUO0y7Oe9qowQHRI9q6G9pN+YVCXm0WPwdZHjxZMd661e+FclxN
	yimu36bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjpHK-00000002ukH-2kVy;
	Mon, 17 Feb 2025 00:46:30 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjpFr-00000002uZ9-11o8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 00:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739753097;
	bh=FsLbrEcDHR1CqcdDrTwnQzpK6jcP3o5E5bXCv2mXd5Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e12xb8n0CJf/RnYIfowfnxv1ZGM+A7mQVlP9zgn8rTq9f1NSNUWQQiC1+0SKi5LZF
	 BpjqJElLlN25eGELSxpbovzmH1pPT/XFbRvbs5PDMgMIl8ojEUeS67GavpurJrry0G
	 UC2EK31KM+F86fSM5j2fYSWDYkqBCd/cAZUcwXT7b/MZB1FAOmLCvj1EgXLEppQDDv
	 gF/8m7Xf78pPYZ/y0yKUo1TSlpNGAYM2lJWxGXe+ygURPUDlOpNkOJAkbvn3v28+cy
	 BPARfhX9p04L45+dl6+JbAev5GJUaQ/1Mlf6ApFXfTPOpeMccWRIeJhV3gth9w/t3A
	 d/BSMCO6hBy1Q==
Received: from [192.168.68.112] (ppp118-210-170-58.adl-adc-lon-bras34.tpg.internode.on.net [118.210.170.58])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B9F5C64E5C;
	Mon, 17 Feb 2025 08:44:56 +0800 (AWST)
Message-ID: <24d2d411365004f11498777501da54d6a9c6e758.camel@codeconstruct.com.au>
Subject: Re: [PATCH dev 6.6 v3] ARM: dts: aspeed: yosemite4: add I3C config
 in DTS
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 17 Feb 2025 11:14:56 +1030
In-Reply-To: <20250214011556.1891113-1-marshall_zhan@wiwynn.com>
References: <20250214011556.1891113-1-marshall_zhan@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_164459_485558_C5C4FDEC 
X-CRM114-Status: GOOD (  14.12  )
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

Hi Marshall,

On Fri, 2025-02-14 at 09:15 +0800, MarshallZhan-wiwynn wrote:
> Set I3C config in yosemite4 DTS.
>=20
> Test plan:
> Tested pass with aspeed I3C patches and I3C hub driver.

Can you please expand the commit message to provide details? This
statement is quite vague, and I don't find it terribly helpful as it
stands. Which aspeed patches? What tests?

>=20
> Signed-off-by: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>
> ---
> =C2=A0.../aspeed/aspeed-bmc-facebook-yosemite4.dts=C2=A0 | 88
> +++++++++++++++++++
> =C2=A01 file changed, 88 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-
> yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-
> yosemite4.dts
> index ab4904cf2c0e..3f98e67674d0 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -1317,6 +1317,94 @@ eeprom@50 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0};
>=20
>=20
...
> =C2=A0&adc0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&pinctrl_adc0_d=
efault &pinctrl_adc1_default
> --
> 2.25.1
>=20
> WIWYNN PROPRIETARY
> This email (and any attachments) contains proprietary or confidential
> information and is for the sole use of its intended recipient. Any
> unauthorized review, use, copying or distribution of this email or
> the content of this email is strictly prohibited. If you are not the
> intended recipient, please notify the sender and delete this email
> immediately.

Please avoid including these confidentiality clauses:

https://subspace.kernel.org/etiquette.html#do-not-include-confidentiality-d=
isclaimers

Andrew

