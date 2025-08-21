Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4BACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 06:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jW0I3Wbl8wn0bXM4aIILiaO/4XtSs7hgp8Mh4FtNMw=; b=iTUe8pv0FTGierTbTxnBRfg/PF
	taBTzSuRRDUeHzC94/fMxmkN5W3rXYNzYDRXOMbJAjX77535gnlAwmCqNPXizGfxMnA/3QG6YWr13
	JeAZxqu7WeQ02/BAnZtFQznJH1mkEMysdyt7JEmek1nXpfFaDLwD1VJkHKTabKa9ReScb+M1O8EgM
	mk2f4a9PjybB0CvUWYm7MRNO+w4YVTqLIL6os7JAl1BmJqTIC1dPfaFBJHpYVM71VvSEtBnQDgKQ1
	M+tqVUDHOUDTwikhZrtib7i1HtZ1JTU6h7q7T+oI/R6Hi7s59kmWE4iL4mTNFk+WgH7i5Ey9Nf8fl
	cVpKNGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozEe-0000000G1Vm-42pg;
	Thu, 21 Aug 2025 06:57:20 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoytS-0000000FyCX-1rgU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:35:27 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57L6ZKhs424954;
	Thu, 21 Aug 2025 01:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755758120;
	bh=6jW0I3Wbl8wn0bXM4aIILiaO/4XtSs7hgp8Mh4FtNMw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AKiexg6G2j9oHg5OJBrd6S/WlePzkF8jrBG8qLeipV91odbZSahg2wDCNHleJgGI2
	 kF/zPDpH96iSPFZXWwUZt5wYKB98EepNXCRAhlXLrfEsVE8pUq7e2hgnos7PXW+8sf
	 YqzPEDblXOR7u7T3i14IX8YelPZ6r+2Ck7gOYeqg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57L6ZK8k2338138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 01:35:20 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 01:35:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 01:35:19 -0500
Received: from [172.24.22.46] (lt5cg1457vgj.dhcp.ti.com [172.24.22.46])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57L6ZEA71729977;
	Thu, 21 Aug 2025 01:35:15 -0500
Message-ID: <24d4c528-57c9-45ee-aac4-dec3cc4cbae6@ti.com>
Date: Thu, 21 Aug 2025 12:05:14 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-am62a-main: Fix pinctrl properties
To: Paresh Bhagat <p-bhagat@ti.com>, <nm@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-vadapalli@ti.com>
References: <20250820083331.3412378-1-p-bhagat@ti.com>
 <20250820083331.3412378-2-p-bhagat@ti.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250820083331.3412378-2-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_233526_578997_F7C9AAE6 
X-CRM114-Status: GOOD (  14.31  )
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



On 8/20/2025 2:03 PM, Paresh Bhagat wrote:
> From: Vibhore Vardhan <vibhore@ti.com>
> 
> Correct reg length to match end address - start address for main
> PADCFG registers.
> 

Needs a Fixes tag and Cc stable tag. Read [1]

Please add a link to the documentation to support your claim.

> Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index 9cad79d7bbc1..260279702c01 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -267,7 +267,7 @@ secure_proxy_sa3: mailbox@43600000 {
>  
>  	main_pmx0: pinctrl@f4000 {
>  		compatible = "pinctrl-single";
> -		reg = <0x00 0xf4000 0x00 0x2ac>;
> +		reg = <0x00 0xf4000 0x00 0x25c>;
>  		#pinctrl-cells = <1>;
>  		pinctrl-single,register-width = <32>;
>  		pinctrl-single,function-mask = <0xffffffff>;


[1] https://docs.kernel.org/process/submitting-patches.html

