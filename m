Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8EBCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKW1+DgNKTcSFWZr2yMsUcLdmMBtGqV9lYdiIEUEmS8=; b=hKWqY8adxaByr6OkPtfjyNh6+P
	Yeb4oEEpjMtvvclNKMxKSrCmz9xC6eDDKAUCU16z9BXab8RmdAQ3AiVaglTff4ax7TG0jZepmV/qj
	OCSwh+MJd1vokupEQHxP8TtSILGtih4g0ISZkZmuUpwj7NU8dLS9J3j+UvkMo9kP/A1nnfAvHa3Y5
	sudvlIAjeukBZxGRhn8Id19nBbRaFni3EPayxX0Y9gWtVADS7yWiZUhFDGjj4xM44baDmtoGFfakg
	/a13nuQ/qD9eMCDpnPHpbTU2SBd9BeIAKrbIsG0mlVcmWdv1c8Mq/eBUvmtnPEFXqW74TN7q/fWyj
	/RYugBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYqd-00000008T1p-2GOh;
	Mon, 25 Aug 2025 15:11:03 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqY2H-00000008EEp-3oHS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 14:19:03 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PEIoTx825779;
	Mon, 25 Aug 2025 09:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756131530;
	bh=cKW1+DgNKTcSFWZr2yMsUcLdmMBtGqV9lYdiIEUEmS8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ghY6Ai+egyXOxyJgqOh1EKEqMeEsvgGv4pdLj++9k4XPJpLC5tf/SIM1FXk8yvB0u
	 +oNd1haUzQb5TQVWtrrx9zf9Un3ClBMOoAXs1fliZ5cfYNsffhC7LMZb5v3Y3PPyS2
	 o+k8LBIwZlFtoI1mZcoEKWW0Ni+MiXfV14j12LPY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PEIoLM935796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 09:18:50 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 09:18:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 09:18:49 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PEInL93738293;
	Mon, 25 Aug 2025 09:18:49 -0500
Message-ID: <edbdcd7c-8c96-4cbd-9740-1e1044fba3b0@ti.com>
Date: Mon, 25 Aug 2025 09:18:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/33] arm64: dts: ti: k3-j7200: Enable remote
 processors at board level
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250823160901.2177841-1-b-padhi@ti.com>
 <20250823160901.2177841-2-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250823160901.2177841-2-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_071902_043704_8DF5F231 
X-CRM114-Status: GOOD (  17.79  )
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

On 8/23/25 11:08 AM, Beleswar Padhi wrote:
> Remote Processors defined in top-level J7200 SoC dtsi files are
> incomplete without the memory carveouts and mailbox assignments which
> are only known at board integration level.
> 
> Therefore, disable the remote processors at SoC level and enable them at
> board level where above information is available.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

Small comment on the $subject, these all seem to be specific to the R5F
cores, the other remote processors are already enabled at the board level.
Suggest: "Enable R5F remote processors at board level"

Otherwise this looks good to me, same for patches 2-12 in this series
so feel free to add my ACK to those 12 patches when you spin v3,

Acked-by: Andrew Davis <afd@ti.com>

> v2: Changelog:
> 1. None
> 
> Link to v1:
> https://lore.kernel.org/all/20250814223839.3256046-2-b-padhi@ti.com/
> 
>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi       | 3 +++
>   arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi | 3 +++
>   arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi     | 9 +++++++++
>   3 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> index 5ce5f0a3d6f5..628ff89dd72f 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> @@ -1516,6 +1516,7 @@ main_r5fss0: r5fss@5c00000 {
>   		ranges = <0x5c00000 0x00 0x5c00000 0x20000>,
>   			 <0x5d00000 0x00 0x5d00000 0x20000>;
>   		power-domains = <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
>   
>   		main_r5fss0_core0: r5f@5c00000 {
>   			compatible = "ti,j7200-r5f";
> @@ -1530,6 +1531,7 @@ main_r5fss0_core0: r5f@5c00000 {
>   			ti,atcm-enable = <1>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <1>;
> +			status = "disabled";
>   		};
>   
>   		main_r5fss0_core1: r5f@5d00000 {
> @@ -1545,6 +1547,7 @@ main_r5fss0_core1: r5f@5d00000 {
>   			ti,atcm-enable = <1>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <1>;
> +			status = "disabled";
>   		};
>   	};
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> index 56ab144fea07..692c4745040e 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> @@ -612,6 +612,7 @@ mcu_r5fss0: r5fss@41000000 {
>   		ranges = <0x41000000 0x00 0x41000000 0x20000>,
>   			 <0x41400000 0x00 0x41400000 0x20000>;
>   		power-domains = <&k3_pds 249 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
>   
>   		mcu_r5fss0_core0: r5f@41000000 {
>   			compatible = "ti,j7200-r5f";
> @@ -626,6 +627,7 @@ mcu_r5fss0_core0: r5f@41000000 {
>   			ti,atcm-enable = <1>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <1>;
> +			status = "disabled";
>   		};
>   
>   		mcu_r5fss0_core1: r5f@41400000 {
> @@ -641,6 +643,7 @@ mcu_r5fss0_core1: r5f@41400000 {
>   			ti,atcm-enable = <1>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <1>;
> +			status = "disabled";
>   		};
>   	};
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> index 291ab9bb414d..90befcdc8d08 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> @@ -254,20 +254,27 @@ mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
>   	};
>   };
>   
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
>   &mcu_r5fss0_core0 {
>   	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
>   	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>   			<&mcu_r5fss0_core0_memory_region>;
> +	status = "okay";
>   };
>   
>   &mcu_r5fss0_core1 {
>   	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
>   	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
>   			<&mcu_r5fss0_core1_memory_region>;
> +	status = "okay";
>   };
>   
>   &main_r5fss0 {
>   	ti,cluster-mode = <0>;
> +	status = "okay";
>   };
>   
>   /* Timers are used by Remoteproc firmware */
> @@ -287,12 +294,14 @@ &main_r5fss0_core0 {
>   	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
>   	memory-region = <&main_r5fss0_core0_dma_memory_region>,
>   			<&main_r5fss0_core0_memory_region>;
> +	status = "okay";
>   };
>   
>   &main_r5fss0_core1 {
>   	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
>   	memory-region = <&main_r5fss0_core1_dma_memory_region>,
>   			<&main_r5fss0_core1_memory_region>;
> +	status = "okay";
>   };
>   
>   &main_i2c0 {


