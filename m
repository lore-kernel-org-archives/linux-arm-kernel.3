Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF00CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsX+ssrACzBNObLTnlh8OdW9eS/lR9QUnQa2VKVvgho=; b=jewVycsTzauE+yAMca7Y1Wa3Kq
	/aWjFkGHt6RVN9ITcqkVkp6zoNRj8uO/LttLN/CbpCk/zX/EKgzAYQ7Ub/ZXr97mf7ZWVdOWc8gyT
	klL5enzoXCTF538xXAZIv1lDFXC+howBEpJWo6ZzKAp3Ut8hODjsQzfPkv+Qo4Dqof/jcgRlTizIH
	lx2iZnVcttFSBHkOCOcUgdZ/mUEcBIAQSD2Mhm7aReGU68bgDSDLPaNR9HnEisfiAnP5KjNew8qdG
	JQEzHXYnqOSZciBRm+kRnrfQFwj6kvS4b3Nkq0f6aXRY7oQomXdk5tsDf1BKS+N/lRY5AJSweBuex
	/yqXOHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3Jd-00000009Nxr-0KcY;
	Fri, 12 Sep 2025 12:55:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3Ja-00000009NvM-2RyB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:55:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1EA0F4E40CA2;
	Fri, 12 Sep 2025 12:55:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D111C60638;
	Fri, 12 Sep 2025 12:55:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CAF9102F28D5;
	Fri, 12 Sep 2025 14:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757681743; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jsX+ssrACzBNObLTnlh8OdW9eS/lR9QUnQa2VKVvgho=;
	b=10fdBOnuIf9+TVb81hqwJj3lBVctWbHP/drlzP4YF8djSP0qBOtdyRjAQQ2TXTb668LYDl
	ERqXEk45aSNq7G70RdaPsxMcVzRvgm8K1YieTHpMssjR8kMF9ZwRLChMlmnwwnsWkq5Lm5
	MiLHpR97JcRbFjSWK/ZaQqHFTy5jYaFslBZX5IltHF964cqUxImiwVgO3fRFLbSsXanywt
	PAsyIg9SAoOsINqhaFNdQR/5ll4wPk52At8E++uhEHT4awsqsCKwvfVzmNJ1RGtjbJxXQz
	X7EERm9cfp7gqy6Ck90KN3/QPuLZ1wVlqOUWZ3WiyxDzl1/QqIiufA7IWX0Ftg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Josua Mayer <josua@solid-run.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Wunderlich <frank-w@public-files.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Josua Mayer
 <josua@solid-run.com>
Subject: Re: [PATCH] arm64: dts: marvell: cn913x-solidrun: fix sata ports
 status
In-Reply-To: <87tt17oms0.fsf@BLaptop.bootlin.com>
References: <20250911-cn913x-sr-fix-sata-v1-1-9e72238d0988@solid-run.com>
 <87tt17oms0.fsf@BLaptop.bootlin.com>
Date: Fri, 12 Sep 2025 14:55:40 +0200
Message-ID: <87qzwbomnn.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_055546_758294_4163EE31 
X-CRM114-Status: GOOD (  14.26  )
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

Gregory CLEMENT <gregory.clement@bootlin.com> writes:

> Josua Mayer <josua@solid-run.com> writes:
>
>> Commit "arm64: dts: marvell: only enable complete sata nodes" changed
>> armada-cp11x.dtsi disabling all sata ports status by default.
>>
>> The author missed some dts which relied on the dtsi enabling all ports,
>> and just disabled unused ones instead.
>>
>> Update dts for SolidRun cn913x based boards to enable the available
>> ports, rather than disabling the unvavailable one.
>>
>> Further according to dt bindings the serdes phys are to be specified in
>> the port node, not the controller node.
>> Move those phys properties accordingly in clearfog base/pro/solidwan.
>>
>> Fixes: 30023876aef4 ("arm64: dts: marvell: only enable complete sata nod=
es")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Josua Mayer <josua@solid-run.com>
>
> Applied on mvebu/fixes
Actually this version not was not applied

>
> Thanks,
>
> Gregory
>
>
>> ---
>>  arch/arm64/boot/dts/marvell/cn9130-cf.dtsi         | 7 ++++---
>>  arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 6 ++++--
>>  arch/arm64/boot/dts/marvell/cn9132-clearfog.dts    | 6 ++----
>>  3 files changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/marvell/cn9130-cf.dtsi b/arch/arm64/boo=
t/dts/marvell/cn9130-cf.dtsi
>> index ad0ab34b66028c53b8a18b3e8ee0c0aec869759f..bd42bfbe408bbe2a4d58dbd4=
0204bcfb3c126312 100644
>> --- a/arch/arm64/boot/dts/marvell/cn9130-cf.dtsi
>> +++ b/arch/arm64/boot/dts/marvell/cn9130-cf.dtsi
>> @@ -152,11 +152,12 @@ expander0_pins: cp0-expander0-pins {
>>=20=20
>>  /* SRDS #0 - SATA on M.2 connector */
>>  &cp0_sata0 {
>> -	phys =3D <&cp0_comphy0 1>;
>>  	status =3D "okay";
>>=20=20
>> -	/* only port 1 is available */
>> -	/delete-node/ sata-port@0;
>> +	sata-port@1 {
>> +		phys =3D <&cp0_comphy0 1>;
>> +		status =3D "okay";
>> +	};
>>  };
>>=20=20
>>  /* microSD */
>> diff --git a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts b/arch/a=
rm64/boot/dts/marvell/cn9131-cf-solidwan.dts
>> index 47234d0858dd2195bb1485f25768ad3c757b7ac2..338853d3b179bb5cb742e975=
bb830fdb9d62d4cc 100644
>> --- a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
>> +++ b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
>> @@ -563,11 +563,13 @@ &cp1_rtc {
>>=20=20
>>  /* SRDS #1 - SATA on M.2 (J44) */
>>  &cp1_sata0 {
>> -	phys =3D <&cp1_comphy1 0>;
>>  	status =3D "okay";
>>=20=20
>>  	/* only port 0 is available */
>> -	/delete-node/ sata-port@1;
>> +	sata-port@0 {
>> +		phys =3D <&cp1_comphy1 0>;
>> +		status =3D "okay";
>> +	};
>>  };
>>=20=20
>>  &cp1_syscon0 {
>> diff --git a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts b/arch/arm6=
4/boot/dts/marvell/cn9132-clearfog.dts
>> index 0f53745a6fa0d8cbd3ab9cdc28a972ed748c275f..115c55d73786e2b9265e1caa=
4c62ee26f498fb41 100644
>> --- a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
>> +++ b/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
>> @@ -512,10 +512,9 @@ &cp1_sata0 {
>>  	status =3D "okay";
>>=20=20
>>  	/* only port 1 is available */
>> -	/delete-node/ sata-port@0;
>> -
>>  	sata-port@1 {
>>  		phys =3D <&cp1_comphy3 1>;
>> +		status =3D "okay";
>>  	};
>>  };
>>=20=20
>> @@ -631,9 +630,8 @@ &cp2_sata0 {
>>  	status =3D "okay";
>>=20=20
>>  	/* only port 1 is available */
>> -	/delete-node/ sata-port@0;
>> -
>>  	sata-port@1 {
>> +		status =3D "okay";
>>  		phys =3D <&cp2_comphy3 1>;
>>  	};
>>  };
>>
>> ---
>> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
>> change-id: 20250911-cn913x-sr-fix-sata-5c737ebdb97f
>>
>> Best regards,
>> --=20
>> Josua Mayer <josua@solid-run.com>
>>
>>
>
> --=20
> Gr=C3=A9gory CLEMENT, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

