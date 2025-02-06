Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62919C02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1Ia8rkI+1aqp/BE7ykJwCWC2yFoWhBOndDQb5udbXE=; b=t0SCNYylfmp2HBFCzG8g/BmXqV
	ZqPEhIMUdwubIBuc7y/Nh8KZdC417HzGUUM3wvbGPMx8XfphK1PvfrSQE0JWxF+MwgB0turFRysib
	frLAOpAbqxNIkEXTz5gf/XmqErhBDVkSJCcPPujntiDV71YPAIXIsX3ppPAmF7OSIkg6QJDyPZfTd
	ET3wydhH3GMoUg3Zyg/kjyFuldzbL5pIfs79kRV3MgCT62bDInjGvDM1Kh2Z3fqhbxH74wbm96UHy
	VgtOKptmvG1qZKMQHGnsDRUKt7yOPFqZOl3pkH3GUh5g762Opl9YJSG1SQS5x8kJxOfFKg2E5n02X
	atPXPx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg68n-000000074Hr-49xo;
	Thu, 06 Feb 2025 17:58:17 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg67O-000000073z1-3T5z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 17:56:52 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738864601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1Ia8rkI+1aqp/BE7ykJwCWC2yFoWhBOndDQb5udbXE=;
	b=Zcruyz62rIFMRV7nP0cqLglClrweMo/C1yT3rMF6lT888HLeDTO8Ll6t5GGgjgYHB+xdaj
	i9qilqbOok7wWndAewqrqlcDnfYzmFaiO7UGn6ficjBM+CnUiskqgvRMB1Edi4ZYk7O+Yb
	sup2AYZODDtaPUHwfseE3VyQy4o5plRhZF6duBEqrKKl0NN1sQ+K1MLGCyc6MwMk0SbVj+
	b3qT0cDf2urdQMZpVpJHjkqcFvulLIR1wpOvAZx+Q0/IrnVUtm9Mkz/yHOeBlxKpEd6t54
	6JPQEFBazVkvE9vfrzXZBdWwcuwt5Srtq3zlnaH5dlQKcrzVDiGrNe00fyX9vA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Feb 2025 17:55:48 +0000
Message-Id: <D7LK1DPOAAG5.3EUG8X7DVSDO5@postmarketos.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Christian Hewitt"
 <christianshewitt@gmail.com>
To: "exxxxkc" <exxxxkc@getgoogleoff.me>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
References: <20250203174346.13737-1-funderscore@postmarketos.org>
 <20250203174346.13737-3-funderscore@postmarketos.org>
 <19c8e021-d2c8-44b4-968b-153d798c140d@getgoogleoff.me>
In-Reply-To: <19c8e021-d2c8-44b4-968b-153d798c140d@getgoogleoff.me>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_095651_420500_790EB63D 
X-CRM114-Status: GOOD (  10.92  )
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

On Thu Feb 6, 2025 at 4:14 PM UTC, exxxxkc wrote:
>  =C2=A0um it seem the sdio wifi module/chip connected to sd_emmc_a it is=
=20
> actually connected to sd_emmc_b
>
> i tried to enable sd_emmc_a but nothing showed up in the kernel thus i=20
> tried to enabled sdd_emmc_b and there are a sdio device showed in the=20
> kernel (sdio:c07v8888d8888)
>
> <https://matrix.to/#/!bDDAcbaDDYYwsVgelj:pixie.town/$YUSQIZ-pF22j9-ElrCst=
8XCUg1pac7CzWbUinNZL9HI?via=3Dpixie.town&via=3Dmatrix.org&via=3Ddissonant.d=
ev>
>
> acc to https://paste.coreelec.org/CoolersHurry=20
> <https://paste.coreelec.org/CoolersHurry> it seem it is amlogic w1 chip ?
>
> (well on my board it is amlogic w1. there are some variant that use=20
> other wifi chip )

Good catch!  I'll see if I can mess around with that stuff a bit more at
some point.

Cheers!

