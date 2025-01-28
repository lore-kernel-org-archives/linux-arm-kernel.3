Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A02CC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a993OaTmApiSLYlbcO9FRYc1TtEbUHIgXSDEucVTzdo=; b=SGxnbDAivHKMW/KLAH56T8B4A8
	kbwa5Foiqxq76IQ7Yq1SEF6qQEUK1TDPEsXGOnOPOuByhXy1834UvxXfz/0Rbmo+PZ6917v5pMfxI
	U0JOa1wuKrBchBxM/GjHTSk8ZdALVkdPIWJb3wZmpcLCWrsjV0UjkjE635TMgBcgYaE7AbcCMfNFS
	ZeA1gu9cVHg6Hj2xL8tnjAQgPW3ZOEGV8J/2dOFTLjvE2u9koQIO8mv3Opf1pUGM2BSapG9Yh0SLy
	D1KwiMK+PVukvRpik4W/Za0eTxbQc4CMhozk1Ur89XInxdENX9ZKfwzTUPNcOkFwI+/cU2QeLANas
	7WtOT/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcodW-00000005MAA-3Jle;
	Tue, 28 Jan 2025 16:40:26 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoLr-00000005J62-1JvJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 16:22:12 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50SGM5Em2031163
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 28 Jan 2025 10:22:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738081325;
	bh=a993OaTmApiSLYlbcO9FRYc1TtEbUHIgXSDEucVTzdo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uqtrmIdiNt8YICveSIYOuI4iwA71sM7ttGG2uTrkhJTbYn5kxfvrxKj76cPznY8EM
	 j/Sxck0VqJE5fFNDHIxI5P6E+jQ6sL4hTcBVaH4SN8/TsclA+ry9aukayjHAT7Qabs
	 DDaqvHvt3gCH8GJGpxOEK7pQGdCEVXxnaaDQrDF4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SGM5oY004743;
	Tue, 28 Jan 2025 10:22:05 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 10:22:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 10:22:04 -0600
Received: from [10.250.32.214] ([10.250.32.214])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SGM4Zv083379;
	Tue, 28 Jan 2025 10:22:04 -0600
Message-ID: <950a1e23-a943-41b0-979a-4e7a4a264fdd@ti.com>
Date: Tue, 28 Jan 2025 10:22:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-am62-wakeup: Add wakeup r5f node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Devarsh Thakkar
	<devarsht@ti.com>,
        Hari Nagalla <hnagalla@ti.com>
References: <20250127221631.3974583-1-jm@ti.com>
 <20250127221631.3974583-2-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250127221631.3974583-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_082211_454558_89870560 
X-CRM114-Status: GOOD (  15.98  )
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

On 1/27/25 4:16 PM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> AM62 SoC devices have a single core R5F processor in wakeup domain.
> The R5F processor in wakeup domain is used as a device manager
> for the SoC.
> 
> Co-authored-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> [Judith: Fix commit message header]
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> index 9b8a1f85aa15c..79708c1c214f8 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> @@ -106,6 +106,30 @@ wkup_rti0: watchdog@2b000000 {
>   		status = "reserved";
>   	};
>   
> +	wkup_r5fss0: r5fss@78000000 {
> +		compatible = "ti,am62-r5fss";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x78000000 0x00 0x78000000 0x8000>,
> +				 <0x78100000 0x00 0x78100000 0x8000>;
> +		power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
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
> +			firmware-name = "ti-sysfw/ti-fs-stub-firmware-am62x-gp-signed.bin";

What is this firmware name? This doesn't exist in linux-firmware,
should use the normal name like "am62-wkup-r5f0_0-fw", then we
can use symlinks in our userspace to map to whatever firmware we
want to run.

Andrew

> +			ti,atcm-enable = <1>;
> +			ti,btcm-enable = <1>;
> +			ti,loczrama = <1>;
> +		};
> +	};
> +
>   	wkup_vtm0: temperature-sensor@b00000 {
>   		compatible = "ti,j7200-vtm";
>   		reg = <0x00 0xb00000 0x00 0x400>,

