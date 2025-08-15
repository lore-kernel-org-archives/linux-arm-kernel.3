Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B1CCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3R0ShOKrYC/TrDizkBvGx4oi8w9wLjh05UMIqlG41U=; b=H8nCTndR090Xj5ndC+sTEIJpAe
	TTFQjT4wLZe6oAW/kg5hYr+bmLoa0pICalR/ji4fX42AFh3D8NdEK5/LHdRpA+x9gY+3qxNZw5cle
	v1COjPyBuQobN0so0Xo6vzpvQmzRd/W5l4d1e9aNhWqCNkxsK54W9/k1pCY1bK7hcOmaP5wfHbgZv
	/pKb+B2mAyAf+E4O4cagCQxH7IIucLOrWqbcDqjxRlGFEJ7c2UANzX4x/VJcHarauMpt8rcQB4ckI
	LwVLhWqEZClFAYSNUvbUGxHmr+BFo+0DFXIJVqc7qFVgJM0oGG3n3bqbsX9J3RzYIj28Xhc05OMfs
	lw34g22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umy8M-000000036hR-1mok;
	Fri, 15 Aug 2025 17:22:30 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwfY-00000002sdW-2nmf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 15:48:41 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FFmaN02635242;
	Fri, 15 Aug 2025 10:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755272916;
	bh=g3R0ShOKrYC/TrDizkBvGx4oi8w9wLjh05UMIqlG41U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gpfYK/3tjHiVHDN+66MlpfI4wqkkq64ZmhqiYZHgk0E63n2OQFPM63xDEPgIAcZ/x
	 ElEFBrA9zQcsjJOTPTZPzRZ52Tg8v6vApFm0i3uQ9OHDzhh2HMHejwDV/rpsPa8N29
	 OaKWIkbKRyz2mZ0UGO8UrEpj8FiQ7xQpj0vymN0o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FFmaNM1999922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 10:48:36 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 10:48:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 10:48:36 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FFmZpr1197117;
	Fri, 15 Aug 2025 10:48:35 -0500
Message-ID: <9a3f4271-ada2-48aa-b99d-023619ec5e12@ti.com>
Date: Fri, 15 Aug 2025 10:48:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/33] arm64: dts: ti: k3-j7*-ti-ipc-firmware: Switch MCU
 R5F cluster to Split-mode
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-34-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250814223839.3256046-34-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_084840_795927_328CCD9A 
X-CRM114-Status: GOOD (  19.94  )
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

On 8/14/25 5:38 PM, Beleswar Padhi wrote:
> Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
> R5F cluster in the MCU domain which is configured for LockStep mode at
> the moment. The necessary support to use MCU R5F cluster in split mode
> was added in the bootloader. And the TI IPC firmware for the split
> processors is already available public.
> 
> Therefore, Switch this R5F cluster to Split mode by default in all the
> boards using TI IPC Firmware config (k3-j7*-ti-ipc-firmware). This
> gives out an extra general purpose R5F core free to run any applications
> as required. Lockstep mode remains default in the SoC level dtsi, so
> downstream board dts which do not use TI IPC Firmware config should not
> be impacted by this switch.
> 
> Users who prefer to use the fault-tolerant lockstep mode with TI IPC
> firmware config, can do that by setting `ti,cluster-mode` property to 1.

What a user prefers and other configuration like that does not belong
in devicetree, which should only describe the hardware.

Configuration should be done using the normal methods, like kernel
cmdline, module params, ioctls, etc.. Maybe we can even set the mode
based on some signal in the firmware itself, like in the resource table.

Andrew

> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi             | 1 +
>   arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi             | 1 +
>   arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi            | 1 +
>   .../boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi     | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
> index 8eff7bd2e771..ddf3cd899d0e 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
> @@ -94,6 +94,7 @@ &main_timer2 {
>   
>   &mcu_r5fss0 {
>   	status = "okay";
> +	ti,cluster-mode = <0>;
>   };
>   
>   &mcu_r5fss0_core0 {
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
> index 5b3fa95aed76..57890a3b38a2 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
> @@ -211,6 +211,7 @@ &main_timer15 {
>   };
>   
>   &mcu_r5fss0 {
> +	ti,cluster-mode = <0>;
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
> index 40c9f2b64e7e..7ee8a8615246 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
> @@ -179,6 +179,7 @@ &main_timer5 {
>   };
>   
>   &mcu_r5fss0 {
> +	ti,cluster-mode = <0>;
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
> index b5a4496a05bf..e12fa55a4df0 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
> @@ -254,6 +254,7 @@ &main_timer9 {
>   };
>   
>   &mcu_r5fss0 {
> +	ti,cluster-mode = <0>;
>   	status = "okay";
>   };
>   


