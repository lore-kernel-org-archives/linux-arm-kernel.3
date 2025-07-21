Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F709C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nh59/lkpsvmg1ZVKHRMN4ZHHZVoi4kbwnBYZr5gHbjk=; b=pDNetApy7b7p2Lo0Ca18RNf4+C
	5yhrgv0TVlkI2bzhEjUx2wcSniD4YnRzG1+jKIbjXO44vPQrnUXi9R2Ioy5eWLxJ2DimyVXFwIEXi
	sSzHrot9tDIni+67EQIFbkpQ6E99PU0Xq6Ibl/VqJde5LTbHntDjH1vW6cUqTp9LGL3ynmdoVxCxD
	5m5DxjueINPTJVV2eXMylMxw6GXHhC4b4S6jsw7sMIlf2Ck3uRiyGzdQ6anBC8GxyeRqLE8hL8+9v
	AWF7TyIhSHkSNIafQHp6+IPy3rQsDxGMU5rNTpRxV0ynIS6Jv36vO1vHv/9f7QuCW40kSXRNsSNw+
	+x1cLdkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtb5-00000000Btb-0gdz;
	Mon, 21 Jul 2025 16:42:39 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrGR-0000000HTbG-1KIq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:13:12 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LED2k1822189;
	Mon, 21 Jul 2025 09:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753107182;
	bh=Nh59/lkpsvmg1ZVKHRMN4ZHHZVoi4kbwnBYZr5gHbjk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Tan0eiZcqW0I4uKlbNIWRM0tM9SYQhScxKr03owyfIXsdfK6Eg2wbd4rpAVZT3mHK
	 LJFMV0SATt60zWidBxtGSs2JPgwg0KciWceCgh6iOwIzZ87vjLxNE+WDLN9Skg4Qmg
	 2P62ufFNwCpBx3CIv/H0Mbrx9LFEnvVcwgVgdwh0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LED2ux1417486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 09:13:02 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 09:13:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 09:13:02 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LECvBl3955460;
	Mon, 21 Jul 2025 09:12:58 -0500
Message-ID: <86bbb4c1-18a9-4917-8554-97d540b72b5a@ti.com>
Date: Mon, 21 Jul 2025 19:42:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: ti: k3-j721s2-main: Add interrupts
 property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Yemike Abhilash Chandra
	<y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20250714092708.3944641-1-y-abhilashchandra@ti.com>
 <20250714092708.3944641-2-y-abhilashchandra@ti.com>
 <72545187-4605-40bb-9c68-54670c2e5332@ti.com>
 <92627ace-1fc8-45a7-a25e-76f410427f0c@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <92627ace-1fc8-45a7-a25e-76f410427f0c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_071311_406308_F960F2A6 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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


On 7/21/2025 7:39 PM, Krzysztof Kozlowski wrote:
> On 21/07/2025 16:07, Kumar, Udit wrote:
>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>> index 62f45377a2c9..6f32a2b0c40c 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>> @@ -1248,6 +1248,9 @@ ti_csi2rx0: ticsi2rx@4500000 {
>>>    		cdns_csi2rx0: csi-bridge@4504000 {
>>>    			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
>>>    			reg = <0x00 0x04504000 0x00 0x1000>;
>>> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
>> Just cosmetic thing, if you are doing v2 then consider 152 first ,
>> followed by 153.
>
> No, you cannot just randomly change numbers or the order.
>
To be precise both , interrupt-names and interrupts,

if this make sense to change.


> Best regards,
> Krzysztof

