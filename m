Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D75C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFsFiLH1AC8uaOEAXzwfhn+J6kmqxAKDCggsNNyWAkM=; b=ekUHF0M0570v4BrCNGHZI2t3c4
	lj7JgUaFhzgwcH2uR/8Vi19zxN1wEfm4ztGbifU5gQh4SSNFegf4Vrbd3wECc3u6U73QWc57TB6AZ
	WndGz5/QWd3Wa96CTpB3HhkXPOfQcFF4uoF6eDN1wyeks7wgMGlbR3YzejvynLOegsepe7WKpXtmd
	IbpcgBWPkwtXmQGNUmbmT7Q0yZibNxWSnSCzBkBUcWHC5QIkDZgTSwHM2frxGrCuQke4epTCFDWUW
	kn94m5lCDAil7drJv1O+jvXmyJEC+emlXgZcXdrL9FE9Fl7gbb9GC2prSqb/CTZRg2LF160OYKseM
	nJEmwVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUogm-0000000C9fC-0rs2;
	Thu, 26 Jun 2025 15:39:00 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnSo-0000000BtP3-0W88
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 14:20:31 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QEILMu2480443;
	Thu, 26 Jun 2025 09:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750947501;
	bh=wFsFiLH1AC8uaOEAXzwfhn+J6kmqxAKDCggsNNyWAkM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Um9jdZECWIV0e9EakqymbBQVn/y22bAgmlwIMh7BrwDp1eSY+Jw0Spcn38rvaRLgK
	 e6pzZhrYMic51XSVuJrW1UJddRUkZmyKs2egFV+STbr+Uuh1h04GhqWKfgKLm/YDC5
	 L9g0TCz9PAFbcJo6i3tjyRPFmt8JQae2OytW9GOs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QEILfC2053280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 09:18:21 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 09:18:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 09:18:20 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QEIKGq1132823;
	Thu, 26 Jun 2025 09:18:20 -0500
Message-ID: <44649612-ea42-43af-b07a-f2f504a199fa@ti.com>
Date: Thu, 26 Jun 2025 09:18:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62-main: Remove eMMC High Speed
 DDR support
To: Vignesh Raghavendra <vigneshr@ti.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
References: <20250624221230.1952291-1-jm@ti.com>
 <20250624221230.1952291-3-jm@ti.com>
 <5428ecbd-8154-43b1-a77c-9eda550c47e7@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <5428ecbd-8154-43b1-a77c-9eda550c47e7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_072030_216501_C6C2A972 
X-CRM114-Status: GOOD (  11.86  )
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

Hi Vignesh,

On 6/25/25 10:58 PM, Vignesh Raghavendra wrote:
> 
> 
> On 25/06/25 03:42, Judith Mendez wrote:
>> For eMMC, High Speed DDR mode is not supported [0], so remove
>> mmc-ddr-1_8v flag which adds the capability.
>>
> 
> Needs a Fixes tag.

Ok, will add fixes tag and send in a separate series.

> 
>> [0] https://www.ti.com/lit/gpn/am625
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
>> index 9e0b6eee9ac7..120ba8f9dd0e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
>> @@ -553,7 +553,6 @@ sdhci0: mmc@fa10000 {
>>   		clocks = <&k3_clks 57 5>, <&k3_clks 57 6>;
>>   		clock-names = "clk_ahb", "clk_xin";
>>   		bus-width = <8>;
>> -		mmc-ddr-1_8v;
>>   		mmc-hs200-1_8v;
>>   		ti,clkbuf-sel = <0x7>;
>>   		ti,otap-del-sel-legacy = <0x0>;
> 


