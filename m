Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85B4CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdCmqb+Q/RWbEKnG9EY6/RiX3h/16cPj3Fyl+P2nPJA=; b=vKnyGw5GDjgplXmhIxi1F1SsGS
	f2ilMSN4hOzJZVu4sApnbl7ZrIx5bns3fqyQkEJdDyZzdRpUN/UBw9q3eowX5sfqZdjdMvCTZj8eF
	IUGqii2Q6kqkCZczXjSXKhL8UHJUmPWW0OwEGTt0HJiW6he1ipcsKLHm1iJMAFf1K61mWg7ZGzwai
	m/MJrjW46eyHwgWA/cISkfs67uIii5MVO0qRJT9IWuCqPGCW/Wz3N7IwmDqKHTZNCCzuyq3VKiyr4
	vpxu4X2ZD8bCej9vpiAVqd8odgI6lxKXSmga9B3MRkLYpdkJt03fIS3Vtb6IEd5lKNtuuFS/wrvOc
	Wwb+J5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxoa-00000006x2W-16Cz;
	Thu, 21 May 2026 07:27:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxoV-00000006x0p-357G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:27:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1610DC2C64D;
	Thu, 21 May 2026 07:28:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB95360495;
	Thu, 21 May 2026 07:27:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FAB3107EA6BE;
	Thu, 21 May 2026 09:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779348440; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LdCmqb+Q/RWbEKnG9EY6/RiX3h/16cPj3Fyl+P2nPJA=;
	b=xy55XxSGj8wfpzSly2SLiplATXUej0wVb1nJbVpSvYl+2JW0eU8oZPSWIdBYcsyx+GLjad
	T1FAb5HyZE/P1rDfgx9eCp3Uvgc1E3ZaGyspLIV/k/wubdH/GF63WyxRhk/iDu79q5VBw3
	oe1xqz8bZloI+DH4woo7KpLxIMgtTe9mpNTBXq5Cl1vuFYEXMDozYd7MBLltNJbE4wutXi
	VN6RJ4r2zkH+n4A7CWG+ujzrTbU+82BFz0N53MzcpVy2Y3J8USso4w0AJMKU/G09HMyhBk
	qIBxBfv68H2uSaE/nznx4f9uLX1EV7d8dycsUI+nCdzzPD8FR98nWAMc8vZLiQ==
Message-ID: <dbd4078b-180a-45fe-850c-86d86c66614a@bootlin.com>
Date: Thu, 21 May 2026 09:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Richard GENOUD <richard.genoud@bootlin.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: ti: k3-j7: Reserve memory for LPM meta
 data
To: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Udit Kumar <u-kumar1@ti.com>,
 Abhash Kumar <a-kumar2@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260427160326.370415-1-richard.genoud@bootlin.com>
 <20260427160326.370415-2-richard.genoud@bootlin.com>
 <20260505125945.mxucy4cfpno2x66z@slacking>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20260505125945.mxucy4cfpno2x66z@slacking>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_002727_927658_445E0A29 
X-CRM114-Status: GOOD (  24.17  )
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

Hi Nishanth,

Le 05/05/2026 à 14:59, Nishanth Menon a écrit :
> On 18:03-20260427, Richard Genoud (TI) wrote:
>> From: Prasanth Babu Mantena <p-mantena@ti.com>
>>
>> For TI SOCs J7200, J784S4, J722S, J721s2 which support low power modes,
>> a chunk of memory is reserved for LPM meta data, which is needed for
>> saving ATF context and the certificate information of ATF and OPTEE and
>> DM image. This LPM metadata area is firewalled to be accessed only by
>> TIFS.
>>
>> U-Boot/TIFS will use this area to save and restore:
>> - ATF context
>> - ATF certificate information
>> - OPTEE certificate information
>> - DM image
> 
> DM image is loaded from storage, correct?
Actually, after being loaded from storage at boot time by U-Boot R5 SPL, 
the DM image is copied in this memory, so that it doesn't have to be 
loaded from storage at resume. (This speeds up the resume time)

For the context:
At resume, U-Boot R5 SPL is executed and detects that the board is 
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

>>
>> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
>>
>> U-Boot has to parse and retrieve this area from the device tree, thus
>> @lpm-memory node are used instead of the generic @memory.
>>
>> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
>> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi  | 6 ++++++
>>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 6 ++++++
>>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts      | 6 ++++++
>>   arch/arm64/boot/dts/ti/k3-j742s2-evm.dts     | 9 +++++++++
>>   arch/arm64/boot/dts/ti/k3-j784s4-evm.dts     | 9 ++++++---
> 
> Split this up into platform wise. I dont understand why you'd not modify
> the ipc-firmware.dtsi and use the phandle similar to https://lore.kernel.org/all/20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com/
The wkup_r5fss0_core0_memory_region can't be used in our case because 
the DM memory isn't retained during suspend.
For Sitara, the LPM metadata are stored in the DM DDR, but here, as the 
DM memory is not kept during suspend, the LPM meta-data is stored in 
another memory region, so I don't think I can use this phandle.

> 
> Split the patches per ipc-firmware.dtsi as required.
> 
>>   5 files changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
>> index 5a8c2e707fde..756928a2d411 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
>> @@ -40,6 +40,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
>>   			reg = <0x00 0xa0100000 0x00 0xf00000>;
>>   			no-map;
>>   		};
>> +
>> +		lpm_memory_region: lpm-memory@a4800000 {
> 
> vignesh already flagged this in previous revision - just use phandle
> reference in u-boot and make this memory@
I would happily use the phandle, but as this memory is not related to 
the DM DDR, I don't think I can.


Thanks!

Regards,
Richard

> 
>> +			reg = <0x00 0xa4800000 0x00 0x00300000>;
>> +			no-map;
>> +			bootph-all;
>> +		};
>>   	};
>>   
>>   	mux0: mux-controller-0 {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
>> index 12a38dd1514b..ceab8f057640 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
>> @@ -42,6 +42,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
>>   			reg = <0x00 0xa0100000 0x00 0xf00000>;
>>   			no-map;
>>   		};
>> +
>> +		lpm_memory_region: lpm-memory@a9c00000 {
>> +			reg = <0x00 0xa9c00000 0x00 0x00300000>;
>> +			no-map;
>> +			bootph-all;
>> +		};
>>   	};
>>   
>>   	mux0: mux-controller-0 {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> index e66330c71593..eebc5cc7d4cd 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> @@ -63,6 +63,12 @@ wkup_r5fss0_core0_memory_region: memory@a0100000 {
>>   			reg = <0x00 0xa0100000 0x00 0xf00000>;
>>   			no-map;
>>   		};
>> +
>> +		lpm_memory_region: lpm-memory@a6c00000 {
>> +			reg = <0x00 0xa6c00000 0x00 0x00300000>;
>> +			no-map;
>> +			bootph-all;
>> +		};
>>   	};
>>   
>>   	vmain_pd: regulator-0 {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
>> index fcb7f05d7faf..d0752c8a6b37 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
>> @@ -23,4 +23,13 @@ memory@80000000 {
>>   		device_type = "memory";
>>   		bootph-all;
>>   	};
>> +
>> +};
>> +
>> +&reserved_memory {
>> +	lpm_memory_region: lpm-memory@ab000000 {
>> +		reg = <0x00 0xab000000 0x00 0x00300000>;
>> +		no-map;
>> +		bootph-all;
>> +	};
>>   };
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
>> index 6c7458c76f53..114594f37f0b 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
>> @@ -23,10 +23,13 @@ memory@80000000 {
>>   		device_type = "memory";
>>   		bootph-all;
>>   	};
>> +};
>>   
>> -	reserved_memory: reserved-memory {
>> -		#address-cells = <2>;
>> -		#size-cells = <2>;
>> +&reserved_memory {
>> +	lpm_memory_region: lpm-memory@ac000000 {
>> +		reg = <0x00 0xac000000 0x00 0x00300000>;
>> +		no-map;
>> +		bootph-all;
>>   	};
>>   };
>>   
> 

