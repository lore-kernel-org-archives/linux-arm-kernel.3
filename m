Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0EAC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 17:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHEpdwNR2NTxyR8BRUJwmZG3vFLW2wzJJsjNzqpMVAo=; b=z6Q1Th9ruqozyxPx0w6J9iCuov
	bmgW7QrOKdcDr4hVahJYrg8NjJke3xYT17OY95SAcrN7KBHV18r3p0j1p29AR1b8k0ugAiec+V4dS
	yrpca/eSzHLaWaTFI1wxPUhCW/dMUKpXKe9XezrT2PfrvM0QpdaDbBWHNrt5KoSC81E93ir+H6yOp
	NWHIpcb4zQ/pNW2abvT70OR157my3JjiD7zlv1o9ADEQuKtUdw8SqlIYVJFs8M2UT5oyjfI63351Y
	o18d2nU113Ge5IqxjUfds5YnmWAtamR10mKjWgfJBaQM/8Po7OPxGLhFXlFQAQmxBt+qUs3KZBCH3
	xvrTmLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWBb-00000004YGU-0scQ;
	Fri, 23 May 2025 17:27:59 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW9X-00000004Y6R-0xCv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 17:25:52 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54NHPk7H976752;
	Fri, 23 May 2025 12:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748021147;
	bh=rHEpdwNR2NTxyR8BRUJwmZG3vFLW2wzJJsjNzqpMVAo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DVjw46V4rDCNK5icxwbDXO5oKCrqXDRqp+ExM3w1ivx6Zwouipd4i1p5oIWuMwPi0
	 L/AJ5E6HU/S1MCUmcyWifPMhF2ufxptUJy87gNPH10y+713jGwok43Q3P4ADlOqhq6
	 XYBuzGtx91Rw6QEk233FoQwiWWiwENbtHAhweUf8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54NHPkvP235744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 12:25:46 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 12:25:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 12:25:46 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54NHPf77078864;
	Fri, 23 May 2025 12:25:42 -0500
Message-ID: <80d7fc2f-1e96-45b6-a897-f5f4c9bb8288@ti.com>
Date: Fri, 23 May 2025 22:55:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: Modify J784S4 SoC SERDES lane controller
 register length
To: Gokul Praveen <g-praveen@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC: <n-francis@ti.com>, <u-kumar1@ti.com>
References: <20250523134946.144461-1-g-praveen@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250523134946.144461-1-g-praveen@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_102551_313436_D0054A67 
X-CRM114-Status: GOOD (  14.36  )
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

Hello Gokul

On 5/23/2025 7:19 PM, Gokul Praveen wrote:
> Modify the J784S4 SoC SERDES lane controller register length from 0x30 to 0x50
> to enable SERDES4 registers.
>
> 'Fixes:9cc161a4509c2("arm64: dts: ti: Refactor J784s4 SoC files to a common
> file")'
> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 1944616ab357..1fc0a11c5ab4 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -77,7 +77,7 @@ pcie1_ctrl: pcie1-ctrl@4074 {
>   
>   		serdes_ln_ctrl: mux-controller@4080 {
>   			compatible = "reg-mux";
> -			reg = <0x00004080 0x30>;
> +			reg = <0x00004080 0x50>;

I assume above is already fixed with below patch

https://lore.kernel.org/all/20250423151612.48848-1-s-vadapalli@ti.com/

or I am missing something



>   			#mux-control-cells = <1>;
>   			mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 select */
>   					<0x8 0x3>, <0xc 0x3>, /* SERDES0 lane2/3 select */

