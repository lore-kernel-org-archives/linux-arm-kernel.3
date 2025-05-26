Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF554C54FC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 04:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uid9l3t86hTNki59z/q03Aog88KQ1lyZOwD3aGlJdRk=; b=rQcQmGrDCZBPycj7xbshCQLTJt
	VMCkf1z0YBdvyPMTU7FjEnZutjxtCka4iDnEWYFvc/T3flEyqq1+TByEmxFgnXoVVn671ZUEMbJeO
	TPLOo/w36N4tvvtzdWzINy1EwPEAQnctKHe9w2JoHipg5yAJmHVOa8yaGgJCo4D6CXQRgTx9UjL2P
	NbbrUBMrOo8RAOEhct/1SZXa9hDnHlDQCwS8/ZRFUiCTc3IMNeSDSGft0FjSLplvFfCQb7+aoWIDt
	Wi8H1ap11efittoRgli1GgADfMSfnje7ytu2hr0JrPVpifOWYxmvH3fSTZp64ocCvUxlma2+DQ2eU
	Y7exAyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJPEv-000000082wp-3Xdp;
	Mon, 26 May 2025 04:15:05 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJPCm-000000082st-11H8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 04:12:55 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54Q4CdHY1441725;
	Sun, 25 May 2025 23:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748232759;
	bh=Uid9l3t86hTNki59z/q03Aog88KQ1lyZOwD3aGlJdRk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PaXTo1Vbtq010JdueoPYeo+TqsP01X2Sgnc+k6ZVpshPeciXVmx3YU7j12ePDu34R
	 wLr2SXghNsT2rd51CsGTJfPcZrH0qiJEHVjnIvNtjdkRkIAqLjL5g/1wGEZYGTBrUK
	 tD5OcnhqjJDw+SlZNPT0zESFNIHZxt9niRy+8JMc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54Q4CdPx1571692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 25 May 2025 23:12:39 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 25
 May 2025 23:12:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 25 May 2025 23:12:39 -0500
Received: from [10.24.69.37] (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54Q4CanR2535335;
	Sun, 25 May 2025 23:12:36 -0500
Message-ID: <a9402f5b-d7fe-4e49-a18c-a93ccec0ea39@ti.com>
Date: Mon, 26 May 2025 09:42:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: Modify J784S4 SoC SERDES lane controller
 register length
To: Gokul Praveen <g-praveen@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC: <u-kumar1@ti.com>
References: <20250523134946.144461-1-g-praveen@ti.com>
Content-Language: en-US
From: Neha Malcom Francis <n-francis@ti.com>
In-Reply-To: <20250523134946.144461-1-g-praveen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_211252_413235_63155AB2 
X-CRM114-Status: GOOD (  14.37  )
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

Hi Gokul

On 23/05/25 19:19, Gokul Praveen wrote:
> Modify the J784S4 SoC SERDES lane controller register length from 0x30 to 0x50 
> to enable SERDES4 registers.
> 
> 'Fixes:9cc161a4509c2("arm64: dts: ti: Refactor J784s4 SoC files to a common
> file")'

There's no need to put it within ''

> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 1944616ab357..1fc0a11c5ab4 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -77,7 +77,7 @@ pcie1_ctrl: pcie1-ctrl@4074 {
>  
>  		serdes_ln_ctrl: mux-controller@4080 {
>  			compatible = "reg-mux";
> -			reg = <0x00004080 0x30>;
> +			reg = <0x00004080 0x50>;
>  			#mux-control-cells = <1>;
>  			mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 select */
>  					<0x8 0x3>, <0xc 0x3>, /* SERDES0 lane2/3 select */

-- 
Thanking You
Neha Malcom Francis

