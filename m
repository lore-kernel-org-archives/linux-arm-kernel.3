Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E23FCD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xzua1hygqM8RuAqAAV48+yyYvIAPfnUqYZRu2TfQ+q8=; b=dCkWriPXamRCVvywE9iZLdPxwe
	MymqC54DRE1OzZ+6+Drw3L/2F02RylX68z8xQtTs2Jz1Kw259oEVa5/huaik9XS3f13odyxEmTtWY
	LQ+tM+Bb1/o8mAzOtis2azG2yUVqKzxOeYpf8FASfwxBqtFFWV1pkfbCy1QQc4OkFK58MA56uGU80
	txyRT2oLt1FhvesUDzIhTFwZN/BTM0ygM7HfvAGhob615Cw0e4hK9eF6+UnwOZNhiDwrtVYpYJZ9C
	hYk5Y6p5i7mML4zVbOY/ZMTyu4LAoaHxADwVGm6V1wKReEsx8j9IJg1RPpkGNUglbtj/hGQWja2Ks
	69F/r3sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4q5-00000003DeI-3nLd;
	Wed, 27 May 2026 03:21:49 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4q3-00000003Ddn-3Ai8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779852105;
	bh=Xzua1hygqM8RuAqAAV48+yyYvIAPfnUqYZRu2TfQ+q8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Pz8x7EVmIcrBA2iTj1Djxy+Fbwc0BvS+azjCJJSL0HLnUGZMgut3ibADjcHzAPjMP
	 WTdYKnCv3Bp1sMmMl9mUZ5yoYR9JuvNETEyzGfRE578L1VhH2O2Zuq53V+eZ5npK7K
	 8oMoNDRqp9BmRhvZQtvVzIGRri9cWOa9YBiaKzgme/4wQVw86KsvSoVOx/i8qSs6ja
	 7LrQkvjn1sob4m0XV8aSkE3Qw8BbExXl5U9rscxvM22uE4RbcBVOpBgBMmcDCje8E/
	 NWmXoFHfA1OE/aHYJHVqgL9j4T6j8N3+tUaXCNjhk3UPTYmQl/5ic4KVFY2GcoLyjr
	 vx34ADFD5+E3g==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 140216001B;
	Wed, 27 May 2026 11:21:45 +0800 (AWST)
Message-ID: <a25ff66bee5a2047296eb239c10a7ccafc6d0b30.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT
 linename
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai
	 <potin.lai@quantatw.com>
Date: Wed, 27 May 2026 12:51:44 +0930
In-Reply-To: <20260523-potin-update-sanmiguel-dts-20260522-v1-2-169f5fceb5f9@quantatw.com>
References: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
	 <20260523-potin-update-sanmiguel-dts-20260522-v1-2-169f5fceb5f9@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_202147_991285_A5A89420 
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

Hi Potin,

On Sat, 2026-05-23 at 10:28 +0800, Potin Lai wrote:
> Fix the GPIO linenames for CPU_CHIPTHROT signals.
>=20
> The signals were incorrectly marked as output ("-O") while they are
> actually input signals ("-I").
>=20
> - B0_M0_CPU_CHIPTHROT_L-O -> B0_M0_CPU_CHIPTHROT_L-I
> - B1_M0_CPU_CHIPTHROT_L-O -> B1_M0_CPU_CHIPTHROT_L-I

I dropped this list when applying the patch because it's evident from
the diff.

Andrew

>=20
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> index 61dbef45f8b0..d7ed497d7227 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> @@ -224,7 +224,7 @@ hpm0_ioexp_20: gpio@20 {
> =C2=A0			"B0_M0_LEAK_DETECT_ALERT_L-I",
> =C2=A0			"B0_M0_RUN_POWER_EN-O",
> =C2=A0			"B0_M0_RUN_POWER_PG-I",
> -			"B0_M0_CPU_CHIPTHROT_L-O",
> +			"B0_M0_CPU_CHIPTHROT_L-I",
> =C2=A0			"B0_M0_SHDN_REQ_L-O",
> =C2=A0			"B0_M0_CPU_SHDN_OK_L-I",
> =C2=A0			"B0_M0_CPLD_READY-I",
> @@ -398,7 +398,7 @@ hpm1_ioexp_20: gpio@20 {
> =C2=A0			"B1_M0_LEAK_DETECT_ALERT_L-I",
> =C2=A0			"B1_M0_RUN_POWER_EN-O",
> =C2=A0			"B1_M0_RUN_POWER_PG-I",
> -			"B1_M0_CPU_CHIPTHROT_L-O",
> +			"B1_M0_CPU_CHIPTHROT_L-I",
> =C2=A0			"B1_M0_SHDN_REQ_L-O",
> =C2=A0			"B1_M0_CPU_SHDN_OK_L-I",
> =C2=A0			"B1_M0_CPLD_READY-I",

