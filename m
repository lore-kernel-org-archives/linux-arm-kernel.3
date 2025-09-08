Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA70CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JTskB/UCChEzoe+7IbsfNIUYnxNVPm3fPK+F6ahfQc=; b=sUvFB86jHlei76z5xAoePbfSLJ
	YOqr4yZGqSWx8XRyF6ARIDApdxvqKDKYzWVSILh3w1hlgC+xh0bNiqrHOq8mJSubguhVlV1PfnjJR
	CWubAvO6QBmfzAzJMQz4OSbEG8LcKshGYZFnUwh3NRsZNqi+N6DK0ydosYGcAkqdkHOml20YVTCLw
	oMbYHCQyHw8VOFdf/o5IDLFiUH9MgsA39x+czg0EsUitqGbYmT7mmkGMEHyH97KDG4nkXvjCns3om
	jn1+NcWAFcjE1Hm04gxyQF8mA1S7Rns4B0irgDFgDyKrsnJxQPZV6YrQSwrG+RX40X7PDMA0ikNNR
	vv3st67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsDS-00000004rUG-3aXu;
	Tue, 09 Sep 2025 06:52:34 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlFD-00000002woX-2mbU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:25:57 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588NPpHu3892219;
	Mon, 8 Sep 2025 18:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757373951;
	bh=1JTskB/UCChEzoe+7IbsfNIUYnxNVPm3fPK+F6ahfQc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UoddI0GYQB+zGqKKbu3v8TmBLU93NKVHzqxnPThLX+Q6NHiRI+6jz985GqMjUB+M8
	 US7nT49t11ITmspasIhoQy4dfhjRApD7E4ql+ptXI9SkljRDlyeCZn9xcYts5JOGMN
	 VvjNbU0megVyekf3ZkPNrLebttChTI6KGKA4QVy8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588NPpbC2731831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 18:25:51 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 18:25:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 18:25:51 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588NPphW1651879;
	Mon, 8 Sep 2025 18:25:51 -0500
Message-ID: <f6c8abba-75f6-4a68-846a-780d37bb94fe@ti.com>
Date: Mon, 8 Sep 2025 18:25:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am62p/j722s: Remove HS400
 support from common
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250908173831.269039-1-jm@ti.com>
 <20250908173831.269039-2-jm@ti.com>
 <363878df-528b-4959-945f-3b531f156679@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <363878df-528b-4959-945f-3b531f156679@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_162555_856003_586E8DE5 
X-CRM114-Status: GOOD (  13.50  )
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

Hi,

On 9/8/25 3:44 PM, Andrew Davis wrote:
> On 9/8/25 12:38 PM, Judith Mendez wrote:
>> Since eMMC HS400 has been descoped for J722s due to errata i2478 [0]
>> and is supported for AM62Px device, remove eMMC HS400 support from
>> common-main.dtsi and include only in am62p-main.dtsi.
>>
>> [0] https://www.ti.com/lit/pdf/sprz575
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 ---
>>   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi              | 6 ++++++
>>   2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/ 
>> arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> index 4427b12058a6..0c05bcf1d776 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> @@ -576,15 +576,12 @@ sdhci0: mmc@fa10000 {
>>           bus-width = <8>;
>>           mmc-ddr-1_8v;
>>           mmc-hs200-1_8v;
>> -        mmc-hs400-1_8v;
>>           ti,clkbuf-sel = <0x7>;
>> -        ti,strobe-sel = <0x77>;
>>           ti,trm-icp = <0x8>;
>>           ti,otap-del-sel-legacy = <0x1>;
>>           ti,otap-del-sel-mmc-hs = <0x1>;
>>           ti,otap-del-sel-ddr52 = <0x6>;
>>           ti,otap-del-sel-hs200 = <0x8>;
>> -        ti,otap-del-sel-hs400 = <0x5>;
>>           ti,itap-del-sel-legacy = <0x10>;
>>           ti,itap-del-sel-mmc-hs = <0xa>;
>>           ti,itap-del-sel-ddr52 = <0x3>;
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/ 
>> boot/dts/ti/k3-am62p-main.dtsi
>> index 6aea9d3f134e..90afe21e972b 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
>> @@ -31,6 +31,12 @@ usb1: usb@31100000 {
>>               snps,usb2-lpm-disable;
>>           };
>>       };
>> +
>> +    sdhci0: mmc@fa10000 {
> 
> The node already has a label where it is defined, so you could just use:
> 
> &sdhci0 {
>     ...
> 
> here at the base level, and not have it inside cbass_main.
> 

Oops, missed that detail, thanks Andrew. Will fix for v3.

~ Judith


