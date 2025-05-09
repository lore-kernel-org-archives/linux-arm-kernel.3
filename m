Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BB6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LekwP+ArvEoE0eGxVmnPiOhWhxLOfr95imAbcOo7FRc=; b=fYRIKGjHwrDcy5hwMizNbL2dCU
	HJDauWALK4AbX/o/eDKJqhfPnWODQj5GYb+D5850s/gLPT4rSyJnuQhVsuiv2trquzXymnY0htwLp
	86yWAf6MbAaqDHiq415OvaPysBXmBAZq3cb0eUhtiv8DIPVvYuWz9oSIQ6/te/zjSjx9Cj3eMbzp9
	V49auZgNqFOl2cvT3HDDwFahYpWO5WT4drTRzRon2d4w6v8kb/yChx9WMqKfD2nqvE4GZyfqXbKmt
	6Ffiy/i3CArT+ldNC0QOS03n+h7ZQNSj1ptQmx0SLfK580Nj0cZ+YH9Ipgd8v5akmx1PO1S7EL1Zt
	1mIPCO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJKZ-00000002xhb-1anN;
	Fri, 09 May 2025 08:43:43 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIVC-00000002oty-2lKJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:50:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5497oV0u1897039
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 02:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746777031;
	bh=LekwP+ArvEoE0eGxVmnPiOhWhxLOfr95imAbcOo7FRc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=B9KASlCAQoYI/91Ry4UgRF1LJPa9AWty4SjnEyuX144ka6s6qNBDHRtbC8jQclg/s
	 nJSC16rF/2P6WEm3xa/rkGUYFecq1ZqFWTgCjDDdpiQHyC6lPZrKVXWR1b0gfAROtc
	 3K8HzcdHl2Ml3wNnVwe2iBE5B7Tw6i5laAssM9i0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5497oVkL113068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 02:50:31 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 02:50:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 02:50:30 -0500
Received: from [172.24.19.187] (lt5cd2489kgj.dhcp.ti.com [172.24.19.187])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5497oQjf086528;
	Fri, 9 May 2025 02:50:26 -0500
Message-ID: <1aa31d6e-8f23-464f-9153-ded233429b41@ti.com>
Date: Fri, 9 May 2025 13:20:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-j722s-evm: Add overlay for quad
 IMX219
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
 <20250508155134.2026300-4-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250508155134.2026300-4-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_005038_785142_4C3A84CF 
X-CRM114-Status: GOOD (  13.80  )
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


On 5/8/2025 9:21 PM, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
>
> RPi v2 Camera (IMX219) is an 8MP camera that can be used with J722S EVM
> through the 22-pin CSI-RX connector. Add a reference overlay for quad
> IMX219 RPI camera v2 modules on J722S EVM
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>   arch/arm64/boot/dts/ti/Makefile               |   5 +
>   ...k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso | 329 ++++++++++++++++++
>   2 files changed, 334 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
>
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 3c3aa09a94b6..b317eaff64cc 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -132,6 +132,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>   # Boards with J722s SoC
>   dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo

I think, you need to care of comments from Nishanth.

With  that

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   
>   # Boards with J784s4 SoC
>   dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
> @@ -227,6 +228,8 @@ k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
>   	k3-j721s2-evm-pcie1-ep.dtbo
>   k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
>   	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
> +k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
> +	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
>   k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
>   	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>   k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
> @@ -264,6 +267,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>   	k3-j721e-sk-csi2-dual-imx219.dtb \
>   	k3-j721s2-evm-pcie1-ep.dtb \
>   	k3-j742s2-evm-usb0-type-a.dtb \
> +	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
>   	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>   	k3-j784s4-evm-quad-port-eth-exp1.dtb \
>   	k3-j784s4-evm-usb0-type-a.dtb \
> @@ -288,5 +292,6 @@ DTC_FLAGS_k3-j721e-common-proc-board += -@
>   DTC_FLAGS_k3-j721e-evm-pcie0-ep += -@
>   DTC_FLAGS_k3-j721e-sk += -@
>   DTC_FLAGS_k3-j721s2-common-proc-board += -@
> +DTC_FLAGS_k3-j722s-evm += -@
>   DTC_FLAGS_k3-j784s4-evm += -@
>   DTC_FLAGS_k3-j742s2-evm += -@
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
> new file mode 100644
> [..]

