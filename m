Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDCA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NHYO7h5/;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cOQxbd/1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f1PVTEPEeT+k0NIsjo13PPlcE4G2CKOtf71KBMqhCMg=; b=NHYO7h5/sIUWht
	ZPtlSK1uF+nqBijyxV5h2r2UXXSmRE/H1fy8AFpacnpoQN9NymBfgAU0itIJnt/I4Q65fE4SqJwlX
	E+6+LYuUTX9tVHlb0wU3QONgQjCAjigXQ8eoEfpNqRZjnkDC6qX/sv4mtXUe1m97lh/iCeAoAFyRs
	zfQ63+mDSoWunJYX0GzIbesjMGovFFIpP5FRYbnW1A6oeRJUfNdcFDcuhr6JvCwX0azv73aXYm0ac
	RRTMU0jsriKjTIhi8NOP1Du3o3GZ+R4pxJ693sOalyjSdqphX3tDACak1EPbF0+Bm2Cov+bXuVVW0
	ja6m6XDXAQi5yvO71Wfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqnH-0000000CK48-2Q2b;
	Fri, 30 Oct 2026 17:53:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqnF-0000000CK2s-3qOL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:53:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso587171f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793382811; x=1793987611; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f1PVTEPEeT+k0NIsjo13PPlcE4G2CKOtf71KBMqhCMg=;
        b=cOQxbd/1Y6U0i5ZZC9C79G0BY64TTb8FYVmAy07nIxeLX8cr1404+/ni++kPtfdabB
         y/SCv56E7SXBpYebzBO7bS0U5uN8s3NuEcxzBoipyrfqgTI+gxooF5lSs4PVA8W2uJcQ
         EOzZVYAb+Dk3TUDYFJJSfckYh53UaYifxO70yGuXiCtg069ZRu2Dt8iPp+8Zwis0oifX
         oKsuFphuMnKgYbsPYnb8/Oea8oEiUp56otSDh8jSH44A4qCI4blChMgKk+WkEvdEML6d
         t9VBrMJqvB6jM3iDd/2q/xlIf8pt+zc21YJLeF3uc3fArlExg8Jyln+nXY6EWy6xDl8F
         5uZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382811; x=1793987611;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1PVTEPEeT+k0NIsjo13PPlcE4G2CKOtf71KBMqhCMg=;
        b=gwe4XGrk8ajraGtBqVmGz4AC8/H5OJcnNVoyVEZ4N1CWF8E6UnW3up58iHePfEB024
         vzslAheNJzeHB+DQ0ROq+E3cNHGCJz82GR+w8L2NxsDDPQuP2FyK9nAvjSEXFuPBj593
         g4h80wdCNeW7HlFxhuY4MX1/J59mnxuCUN/nxxezxjHJ8ED7nZNIFzT3lAP+hVBhwD97
         Eb6OdB/kDV0Lv06C3b+mFFOFawsOkrCLWYX8+LWVyWW+41dr61MXaiti7cW/GRKGvjUR
         SL0ELVYb0FSbVcP+GLihtl9fSpxke6Cz9hYDwRaqDKxS4l3XJ4Z4v/PGB6gJyjyBipeJ
         EGcw==
X-Forwarded-Encrypted: i=1; AKwUvBxKttDAYumc99aCGNPtP7Pyo/slYSv7+n1pVNdGMvNVoZux1QTj2b7hm8zQDcQiKTW2F2Td4qMIl7dHpl5o8vCw@lists.infradead.org
X-Gm-Message-State: AFq9FYJs9bWvgohHK9PV7bIT6pbTSO6tj2702CgEPhYQwACR/Tqxj6ZD
	a2OXgt7W8kZ8+2TrrBCn1rjkWx8lBsunGmWxhIScfgcC76ViHbLVk9eXcCowOUzN5NA=
X-Gm-Gg: AYBFou2PxVk4xuTs4WJdd7BGpIrnJhiYJu3ElCOMjRgO/HHlMu5cAqF1goFXHHW+o1p
	ruM5zDYxr/Wc9bvSE06e18Rq5DABNk0EXwMXHrrucUGLSRcXhOfVPc3mgjCbF0U00L4NaoNK9tp
	U14TWEcogyjQib1kx2zPDRah/88bBAj/sRWIsz8pAQVJ2dEmTAymwg6Kh5Yo3HKnDQm6ut3jOCn
	TfrPTGgGr9mhOBcx/sNu1RIgMJ1koOWJPdmvzjolqXbNGqoJ9AOln4JNa/08BS0ABQn0L69KrU/
	HM5pVrjW5R8YG0f5aRoe+32c2b3mKDrRGyrYmR+gokT6Juo1ZOSHHSpb1OMi5m6RofHdVsfAhD7
	9mupCmYJJ+04Xt8gkxGDZ53yUKxgmUtUoix4vS1lb0ADf1+7Uy0FLkinraRvzsgGnokyZS+Pwt7
	N6UzNbWpLDVxq/7wetMh3rAA89LofazoO/8Xb9VTJ0fs0rtpp3d1cmQmr7rEvWEVpbseDn7h074
	lKyNu6yJgA3ognI+feGUOqSCfCREmDUDhp3oRSES/paYxsBPk/PQM+aENzWj2latcj47Wowm6ON
	w45yZE7T4jjpNRZh9o8As1n0yl4AUrbXfBhMcUcWmE62aTfmbzBUVZ6ps8cQVmEYKuMK5mjmtbo
	gKnAHiprPcEtA/gxxgfP6
X-Received: by 2002:a5d:4e05:0:b0:48e:21f7:79ff with SMTP id ffacd0b85a97d-48e6e50575emr5450463f8f.33.1793382811276;
        Fri, 30 Oct 2026 10:53:31 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm4656186f8f.30.2026.10.30.10.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:53:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 18:53:29 +0100
Message-Id: <DMID5D64EBS2.3IDHDRJOWK3W1@linaro.org>
Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Christopher Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Russell
 King" <linux@armlinux.org.uk>, "Rouven Czerwinski"
 <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: omap: dm816x: refactor and align MMC
 node
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
 <20261028-patch-ektor5-dm8168-dts-v2-4-4544429251e2@linaro.org>
 <20261030113032.51b92b19@kemnade.info>
In-Reply-To: <20261030113032.51b92b19@kemnade.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_105334_073857_1F722C4F 
X-CRM114-Status: GOOD (  15.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andreas,

On Fri Oct 30, 2026 at 11:30 AM CET, Andreas Kemnade wrote:
> On Wed, 28 Oct 2026 17:06:05 +0100
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
>
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>=20
>> Update the MMC node in the TI Sitara DM816x device tree to align with
>> the structure used in other similar SoCs. The changes include
>> refactoring the node to better describe the target module and its
>> sub-nodes.
>>=20
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>  arch/arm/boot/dts/ti/omap/dm816x.dtsi | 33 +++++++++++++++++++++++++++-=
-----
>>  1 file changed, 27 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/t=
i/omap/dm816x.dtsi
>> index fc124f9ecfa1..e3d49651b44e 100644
>> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> @@ -423,13 +423,34 @@ &edma 20 0 &edma 21 0
>>  				    "tx2", "rx2", "tx3", "rx3";
>>  		};
>> =20
>> -		mmc1: mmc@48060000 {
>> -			compatible =3D "ti,omap4-hsmmc";
>> -			reg =3D <0x48060000 0x11000>;
>> +		mmc1_target: target-module@48060000 {
>> +			compatible =3D "ti,sysc-omap2", "ti,sysc";
>>  			ti,hwmods =3D "mmc1";
>
> do we still need this?

No, we don't. I'll remove that in v3.=20

As per the comment for patch 7 (USB node update), I'll send two separate
patches, one for DTS and one for the hwmod removal, making sure the
hwmod removal is applied last.

Thanks for your review,
Ettore

