Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D327BC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dh6bE3XEbiTa0mmTq1+LWP9AAzh6deTQmR8XrrWXPSI=; b=nOEkJKOvNyYrI5ChAzMH3mlibh
	85meygvzDitMYDCi2+3Z+LARGdQ5mfvsNOK49XszL6zVrS1pPRtLBsJrrZ/JNpGgZIdhTA7lKCVxz
	Dy6UIswLCDvxCxNhvx9g80kolMtkkOnL1G6YTtAWpwAg7BfVpmEZz7nPKImxu2o4o0e9mkes1eQqE
	vbMHwknO3TZNLME4ESmH8IxkuxxVJC05bPwg++VCmCUg/WK/G/nkf4PodUFJlgEWrcQvc4p85iZOw
	xXmYgTrdZx4u4haQXRZxol9AyCJ3rva8/xSM1shRy/l3LWzF95KnsoPOnAVNLik8ffabr6cP1CHLQ
	KwkeZEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FFG-0000000E4IE-34YD;
	Fri, 11 Apr 2025 14:20:38 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Es8-0000000E0Iz-0wdS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:56:45 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDuebR1457292
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 08:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744379800;
	bh=dh6bE3XEbiTa0mmTq1+LWP9AAzh6deTQmR8XrrWXPSI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FP/LHciKb+kFVsE/9VAjEQwtM1lOXleR/rP4eUPFWF51epfLWamq+9ykFFT523ZtA
	 rrdUBHyQ6519dkEZLCnjar0aUUpys03i7kAr9ZzzSh4yQYBxdnVRAsHoamx4PKwiAz
	 Lf5a3XC3xbaF0FLbuOxOJesxtKfyi2rIKhz/28j4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDuedm093360
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 08:56:40 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 08:56:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 08:56:40 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BDuZCB124896;
	Fri, 11 Apr 2025 08:56:36 -0500
Message-ID: <b6cae091-caa8-41fa-97b1-fb243386b0b5@ti.com>
Date: Fri, 11 Apr 2025 19:26:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-j722s-evm: Enable "serdes_wiz0"
 and "serdes_wiz1"
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rogerq@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <u-kumar1@ti.com>
References: <20250408103606.3679505-1-s-vadapalli@ti.com>
 <20250408103606.3679505-2-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250408103606.3679505-2-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_065644_367105_1B98547C 
X-CRM114-Status: GOOD (  16.78  )
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


On 4/8/2025 4:06 PM, Siddharth Vadapalli wrote:
> In preparation for disabling "serdes_wiz0" and "serdes_wiz1" device-tree
> nodes in the SoC file, enable them in the board file. The motivation for
> this change is that of following the existing convention of disabling
> nodes in the SoC file and only enabling the required ones in the board
> file.
>
> Fixes: 485705df5d5f ("arm64: dts: ti: k3-j722s: Enable PCIe and USB support on J722S-EVM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> v1 of this patch is at:
> https://lore.kernel.org/r/20250408060636.3413856-2-s-vadapalli@ti.com/
> Changes since v1:
> - Added "Fixes" tag and updated commit message accordingly.
>
> Regards,
> Siddharth.
>
>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index 2127316f36a3..0bf2e1821662 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -843,6 +843,10 @@ &serdes_ln_ctrl {
>   		      <J722S_SERDES1_LANE0_PCIE0_LANE0>;
>   };
>   
> +&serdes_wiz0 {
> +	status = "okay";
> +};
> +
>   &serdes0 {
>   	status = "okay";
>   	serdes0_usb_link: phy@0 {
> @@ -854,6 +858,10 @@ serdes0_usb_link: phy@0 {
>   	};
>   };
>   
> +&serdes_wiz1 {
> +	status = "okay";
> +};
> +

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   &serdes1 {
>   	status = "okay";
>   	serdes1_pcie_link: phy@0 {

