Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3556BCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47DEz/6ha8fZiHE5oM7w1+bkW2dkQmrKXzDB+j6xPJw=; b=hUEqlTsG4g7K5dZAYOUtBR1fPL
	S8xExMKiH4Sgn1ZFyjsvgThGHn8A4nXAHmxQEA2uEH+IJ/f8rr3SQ0wa7c6Vyw2c74m4J1EfFmXY1
	jRztm9ezmVWD3fhomxnWZC6YZ71kMqI/shCCEoQnxb19YIOr60yy6/RANiSLrEG/9I8sns78INr/U
	WwmyMd9ebTASVIr03iLDY1vmIngZmlk4g3nH7+1QBthFydS/pmVtBXk8p9rZqZ1dD+cpZTXG6QY5G
	ZYx0ngnHOtK8ASxoIP60Cx7wSesjAnm26epCaZ8xeMl9Jw52pUy2A4fJDhkvfLhuT2tgV+exl1LoB
	tacp0slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2nz-00000009KCS-3usr;
	Thu, 04 Sep 2025 05:46:43 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2lG-00000009JSQ-1LXE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 05:43:55 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5845hkqw2940972;
	Thu, 4 Sep 2025 00:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756964626;
	bh=47DEz/6ha8fZiHE5oM7w1+bkW2dkQmrKXzDB+j6xPJw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=EmkR/F3c23o5OuA4YkYjGrSEbr5bzGuG0pyFGnXHqwi1/IaMyE4ZyEhZ8wP8rKrsE
	 6GeUeAuE2a1po7BQIJ08OsnD4xRUIKTlikh7l9YGpRqbZb+7T2RpConxu+M/+e2+ze
	 vsJKsUJ5iDfj0wonZTmxNvLw3b3zqKie41nCSLEM=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5845hkwR641637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 00:43:46 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 00:43:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 00:43:46 -0500
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.233.62])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5845hfOS2766310;
	Thu, 4 Sep 2025 00:43:42 -0500
Message-ID: <49db8bea-80a0-4f09-9b39-20fd7493b5da@ti.com>
Date: Thu, 4 Sep 2025 11:13:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: ti: k3-j721e-main: Update DSS EDP
 integration configuration register
To: Harikrishna Shenoy <h-shenoy@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <r-ravikumar@ti.com>, <tomi.valkeinen@ti.com>,
        <a-bhatia1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <aradhya.bhatia@linux.dev>, <u-kumar1@ti.com>, <s-jain1@ti.com>
References: <20250904050940.2913567-1-h-shenoy@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250904050940.2913567-1-h-shenoy@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_224354_463831_982EBBD4 
X-CRM114-Status: GOOD (  13.09  )
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

On 04/09/25 10:39, Harikrishna Shenoy wrote:
> Fix size of DSS_EDP0_INT_CFG_VP to 256B as stated in
> TRM Table 2-1 MAIN Domain Memory Map.
> Link: https://www.ti.com/lit/zip/spruil1/SPRUIL_DRA829_TDA4VM
> 
> Fixes: 92c996f4ceab ("arm64: dts: ti: k3-j721e-*: add DP & DP PHY")
> 

Remove this blank line. With this,

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>

Regards
Devarsh

> ---
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index ab3666ff4297..3fa7537d5414 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -1863,7 +1863,7 @@ mhdp: dp-bridge@a000000 {
>   		 * the PHY driver.
>   		 */
>   		reg = <0x00 0x0a000000 0x00 0x030a00>, /* DSS_EDP0_V2A_CORE_VP_REGS_APB */
> -		      <0x00 0x04f40000 0x00 0x20>;    /* DSS_EDP0_INTG_CFG_VP */
> +		      <0x00 0x04f40000 0x00 0x100>;    /* DSS_EDP0_INTG_CFG_VP */
>   		reg-names = "mhdptx", "j721e-intg";
>   
>   		clocks = <&k3_clks 151 36>;


