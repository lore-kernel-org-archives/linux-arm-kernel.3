Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D903EC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 18:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0X7lvNsn2JIE9CIy/kM3jZEUmhu6NaFtSLnNtOm3oM=; b=jTbn/fsbxCXFmbFErP4RSesrGB
	uLhWwOCHg/Zk+QF7PBREldIdFsJ16SuKoQPFoNuj5V8SM4VIFgQy6KtmmfjbNHNnjoSzCerEjfZtj
	2SRH5McmMa/4lqvV4jgjKZ0wUsY4Eo2QwXETbGi9Ti7pi6kgbdOA4Z6f9QSJXI+Av6gIhyxxXHoPG
	d4cLxBYU4ZrrqNizV+YN19fKSbL/wdwx6oDBmc5A7sLOiGyyL6EjHn+JiTZsWmlpFAuGtQK36IqSk
	dmejOVfYOj1FLrMdkuTju53dNScM0XpdZ6IpsaKsE96kPc80y49jkEoE9QkAx4e3LKWv7IgDUGShk
	piEU0Prw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Cbm-00000001eRE-2NOb;
	Sat, 19 Apr 2025 18:08:06 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6CZr-00000001eIp-0ydI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 18:06:10 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JI5u7Q1243120
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 13:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745085956;
	bh=R0X7lvNsn2JIE9CIy/kM3jZEUmhu6NaFtSLnNtOm3oM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LgcWH8d3mXJrZFq/nhHp+Isr82SpNywOVRmM9v+ooJPD704MUeYKEC6mjN1m46RGV
	 AG7L0if7OzVQ67ZvCcJXCFHW1rFgVVGMFQZrCXTXtJ5UD5+ezd3yRdIKs133nNe8Oh
	 QPethh/Gjf7FtnS+c89j+oSAxlb2Tgxw+0KVUEeQ=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JI5udw001727
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 13:05:56 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 13:05:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 13:05:56 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JI5pmh069477;
	Sat, 19 Apr 2025 13:05:52 -0500
Message-ID: <8b707fbc-9d82-48d0-a227-366d4e83e8a7@ti.com>
Date: Sat, 19 Apr 2025 23:35:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: ti: k3-j7200-main: switch to 64-bit
 address space for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
 <20250417120407.2646929-3-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250417120407.2646929-3-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_110607_421384_23B7BD2F 
X-CRM114-Status: GOOD (  15.59  )
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


On 4/17/2025 5:34 PM, Siddharth Vadapalli wrote:
> The PCIe0 instance of PCIe in J7200 SoC supports:
> 1. 128 MB address region in the 32-bit address space
> 2. 4 GB address region in the 64-bit address space
>
> The default configuration is that of a 128 MB address region in the
> 32-bit address space. While this might be sufficient for most use-cases,
> it is insufficient for supporting use-cases which require larger address
> spaces. Therefore, switch to using the 64-bit address space with a 4 GB
> address region.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> index 5ab510a0605f..e898dffdebbe 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> @@ -759,7 +759,7 @@ pcie1_rc: pcie@2910000 {
>   		reg = <0x00 0x02910000 0x00 0x1000>,
>   		      <0x00 0x02917000 0x00 0x400>,
>   		      <0x00 0x0d800000 0x00 0x00800000>,
> -		      <0x00 0x18000000 0x00 0x00001000>;
> +		      <0x41 0x00000000 0x00 0x00001000>;
>   		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
>   		interrupt-names = "link_state";
>   		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
> @@ -778,8 +778,9 @@ pcie1_rc: pcie@2910000 {
>   		device-id = <0xb00f>;
>   		msi-map = <0x0 &gic_its 0x0 0x10000>;
>   		dma-coherent;
> -		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
> -			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
> +		ranges = <0x01000000 0x00 0x00001000 0x41 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
> +			 <0x02000000 0x00 0x00101000 0x41 0x00101000 0x00 0x08000000>, /* 32-bit Non-Prefetchable MEM (128 MB) */
> +			 <0x43000000 0x41 0x08101000 0x41 0x08101000 0x00 0xf7eff000>; /* 64-bit Prefetchable MEM (4 GB - (129 MB + 4 KB)) */

Sorry for novice question,

with this change,  How do you see  old EP working which supports 32 bit 
addressing,

or some translation is possible ?

0x43000000 0x41 0x08101000 0x41 0x08101000 0x00 0xf7eff000>

to

0x63000000 0x00 0x08101000 0x41 0x08101000 0x00 0xf7eff000>


>   		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
>   		status = "disabled";
>   	};

