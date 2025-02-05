Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA7CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 21:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iHMFagFUzTBrSi6prGvxicOIdtThcnaj/EYibmT6U8=; b=mChYcryjoyy51+dTYT0w5q2QgF
	MrMtPKvb63jA2/Ip98Rt98yHDRtf72TTr0+u12aO1iAFxt1utb3ibRZ2aDVl96Gki9eoOC0Q/LclK
	dzlvx0iYdKpHUc6N88ojzKcpK0+7tBmrFsVTuJhpBOrVXqe8xCJIcvZIprukCEnsF28R43d8+wKke
	vaMaCvpXiMieJSQAAjggICiy3NGjXy2Hb0JKoyunzDYhcvWXd1DOdPRYYoYzGj5RMEQigcHijSfKI
	PiA2f2x5NFWuwi+jz7zKOfA7lyqnrROiM2khCttlGp5ePCjUPGgE0iJBjcCUg5iTyicqpitw/p5lb
	16yWOryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnFp-00000004fJ2-0x9j;
	Wed, 05 Feb 2025 21:48:17 +0000
Received: from [198.47.23.234] (helo=lelvem-ot01.ext.ti.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnET-00000004fBS-0BJE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 21:46:54 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515LkmER3500201
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 15:46:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738792008;
	bh=5iHMFagFUzTBrSi6prGvxicOIdtThcnaj/EYibmT6U8=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=HM3mRbquemiJxIED2iweuAsNO8vY4bLESJH6ovOI7sRE9XKPMMYWw7530q6qL6JaR
	 ToqoapeSdJVmmMYbtE2MxGIHEytf+gaDAyC0a7dBj6OvbAKRzGJg7Z/CmSL+hnxlP3
	 9aS4Os7iqkBrBorYCKbpkzYPYuXtE9O5jtsni7mc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515LkmZV060068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 15:46:48 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 15:46:47 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 15:46:47 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515LklsK035372;
	Wed, 5 Feb 2025 15:46:47 -0600
Message-ID: <16cb75e2-8321-4acb-a04a-15027930bdca@ti.com>
Date: Wed, 5 Feb 2025 15:46:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F
 node
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>,
        Hari Nagalla
	<hnagalla@ti.com>
References: <20250204011641.1523561-1-jm@ti.com>
 <20250204011641.1523561-2-jm@ti.com>
Content-Language: en-US
In-Reply-To: <20250204011641.1523561-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134653_289447_8A646FC2 
X-CRM114-Status: GOOD (  14.92  )
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

Hi all,

Please do not merge this patch series version.

I will be including one more node and send out v4, thanks!

~ Judith

On 2/3/25 7:16 PM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> AM62 SoC devices have a single core R5F processor in wakeup domain.
> The R5F processor in wakeup domain is used as a device manager
> for the SoC.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v2:
> - Fix commit header, capitalize R5F
> - Fix whitespace issues
> ---
>   arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 25 ++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> index 9b8a1f85aa15c..061819a64300f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> @@ -106,6 +106,31 @@ wkup_rti0: watchdog@2b000000 {
>   		status = "reserved";
>   	};
>   
> +	wkup_r5fss0: r5fss@78000000 {
> +		compatible = "ti,am62-r5fss";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x78000000 0x00 0x78000000 0x8000>,
> +			 <0x78100000 0x00 0x78100000 0x8000>;
> +		power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
> +
> +		wkup_r5fss0_core0: r5f@78000000 {
> +			compatible = "ti,am62-r5f";
> +			reg = <0x78000000 0x00008000>,
> +			      <0x78100000 0x00008000>;
> +			reg-names = "atcm", "btcm";
> +			ti,sci = <&dmsc>;
> +			ti,sci-dev-id = <121>;
> +			ti,sci-proc-ids = <0x01 0xff>;
> +			resets = <&k3_reset 121 1>;
> +			firmware-name = "am62-wkup-r5f0_0-fw";
> +			ti,atcm-enable = <1>;
> +			ti,btcm-enable = <1>;
> +			ti,loczrama = <1>;
> +		};
> +	};
> +
>   	wkup_vtm0: temperature-sensor@b00000 {
>   		compatible = "ti,j7200-vtm";
>   		reg = <0x00 0xb00000 0x00 0x400>,


