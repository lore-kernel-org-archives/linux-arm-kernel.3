Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93866C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4UJPNnOWudFJocURSS5csRTh7we/bdm3q/LWnIuJSU=; b=ehU0U+m6iNtS97+cDg1DuWI67Y
	HVW66ytD+ABCgBGxY7Lu+TJq013kxLvt9OyDovgA5s/++Jssw0u82qHyJm0t0QlLmDpg7eQ/5ur9a
	LjUqyCQc6alPs42eL6HZdoTILCdIYKH2Bhgpw+N8dd6X46afYJZIyGz1UFrQUF6u6glR5oJzyh1nG
	FVL3/XzLN1qJWUfue6TSa/I+Ff4/c3KtLpg89vh+Y12xgAvFrFSb69GXbIUoeisIvNQ8DU1TnXjw1
	8DI0Dc5tHI9l61HfS0/l469tUkIMSBggBKNyMdCM8vh4iaycnGqGSSSlSzCTGCWTvgGrIJEfJQCaM
	8QqlEG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3F4U-0000000E2KS-1pm8;
	Fri, 11 Apr 2025 14:09:30 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EeE-0000000Dy08-1HO4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:42:23 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDg8aD2137750
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 08:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744378928;
	bh=v4UJPNnOWudFJocURSS5csRTh7we/bdm3q/LWnIuJSU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wIVUIrACHs8GQ8ru01wDzPMjGBKWgr/XbgniA/LgxGKt9bW6bBICgE9F3Emah8+Ts
	 0Ytj1Wvyhn7Gscpc3ShFHFxQ7uMVe7KLC0vy2DsP69U32x2hPh3WcXHCgfmAVwQcEE
	 CeoGtWJTRXJlzboIbewbyHISvvPL7AyiPufy5q0U=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDg8J8026772
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 08:42:08 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 08:42:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 08:42:08 -0500
Received: from [10.249.136.157] ([10.249.136.157])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BDg2Nx119834;
	Fri, 11 Apr 2025 08:42:03 -0500
Message-ID: <a05e2a39-b000-4c9c-9c74-49a9941b4801@ti.com>
Date: Fri, 11 Apr 2025 19:12:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: ti: k3-am62x: Rename I2C switch to I2C
 mux in OV5640 overlay
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <stable@vger.kernel.org>
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-8-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Francis, Neha" <n-francis@ti.com>
In-Reply-To: <20250409134128.2098195-8-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_064222_441066_B0D722DB 
X-CRM114-Status: GOOD (  13.92  )
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

On 4/9/2025 7:11 PM, Yemike Abhilash Chandra wrote:
> The OV5640 device tree overlay incorrectly defined an I2C switch instead
> of an I2C mux. According to the DT bindings, the correct terminology and
> node definition should use "i2c-mux" instead of "i2c-switch". Hence,
> update the same to avoid dtbs_check warnings.
> 
> Fixes: 635ed9715194 ("arm64: dts: ti: k3-am62x: Add overlays for OV5640")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso      | 2 +-
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
> index ccc7f5e43184..7fc7c95f5cd5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
> @@ -22,7 +22,7 @@ &main_i2c2 {
>  	#size-cells = <0>;
>  	status = "okay";
>  
> -	i2c-switch@71 {
> +	i2c-mux@71 {
>  		compatible = "nxp,pca9543";
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> index 4eaf9d757dd0..b6bfdfbbdd98 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> @@ -22,7 +22,7 @@ &main_i2c2 {
>  	#size-cells = <0>;
>  	status = "okay";
>  
> -	i2c-switch@71 {
> +	i2c-mux@71 {
>  		compatible = "nxp,pca9543";
>  		#address-cells = <1>;
>  		#size-cells = <0>;

Reviewed-by: Neha Malcom Francis <n-francis@ti.com>

-- 
Thanking You
Neha Malcom Francis


