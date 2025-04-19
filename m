Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA56C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwEMlnTnv0lV+xni/6CjZLizXvcalTTI8wO/LpF/GOc=; b=jMU5d52FzYrJ2OtW1AggUAcFSM
	7f1tezlORG7oNE0CtmZxnAgKopyC5W6jQ8DTTzwSMZBbGLB3ea+FJ+2AZJE9RHorrVFkLlVvQ1FtA
	Ml/nc/R9uxpZmBo4fIOj879ov59LpwFrNAEZH1/AWVUZciaphHk1+KOqWEqPplhVNvotNtIGnjyNW
	peyq65TOdOrGp26/5POKw9qZxHAsJS/LC0C+pxQKvHLuxHyZgZKXjEV5kEtrfggnQwlCwtE8M9Ffw
	zvSJQvZhgwBADLu6uR4VUk3wb/4kmFR6fbbP0I9qZHJWx1fbvHX1PZY2NYbobNrnDWhLnCi6n+Df0
	r9u4bkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u67xO-00000001Ka2-36qJ;
	Sat, 19 Apr 2025 13:10:06 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u67vW-00000001KN3-10Y1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 13:08:11 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JD85Co502312
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 08:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745068085;
	bh=XwEMlnTnv0lV+xni/6CjZLizXvcalTTI8wO/LpF/GOc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hwUTTBePzeMsJkq6SC3wu8CD91AhSqRw7J5ODT4Xa/Seg1prFx2rIUad3k0A8BBa8
	 U0/RmVRPSlY/g+X5RKJGPjLWvDUrx7DNQtFn8+c7Lvz1d3fPhtNoE8ZRpc/9boZz5W
	 xJdEb6rrglevSIPp2Ouug9zEBO12jBb8J/nU+02c=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JD85JE008025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 08:08:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 08:08:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 08:08:04 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JD80JA029258;
	Sat, 19 Apr 2025 08:08:00 -0500
Message-ID: <7da470c6-5426-48bf-838a-bc7a5b5dc5db@ti.com>
Date: Sat, 19 Apr 2025 18:38:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4-main: Enable ACSPCIE outputs
 for PCIe interfaces
To: Parth Pancholi <parth105105@gmail.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Parth Pancholi <parth.pancholi@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250404101234.2671147-1-parth105105@gmail.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250404101234.2671147-1-parth105105@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_060810_376042_A5D57A86 
X-CRM114-Status: GOOD (  15.49  )
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

Thanks for patch, Parth

On 4/4/2025 3:42 PM, Parth Pancholi wrote:
> From: Parth Pancholi <parth.pancholi@toradex.com>
>
> TI J784S4-based devices, such as the AM69 SoC, provide PCIE_REFCLK outputs
> from the SoC, which can be used to clock external PCIe endpoint devices.
> Each PCIE_REFCLK output is enabled via the corresponding ACSPCIE clock
> buffer, with each buffer supporting two PADs to provide reference clocks
> for two associated PCIe instances. The mappings are as follows:
>          - PCIe0 -> ACSPCIE1 PAD0
>          - PCIe1 -> ACSPCIE0 PAD0
>          - PCIe2 -> ACSPCIE1 PAD1
>          - PCIe3 -> ACSPCIE0 PAD1
>
> This patch enables each ACSPCIE module and its corresponding PADs to ensure
> that all PCIE_REFCLK outputs are functional.
>
> This change have been tested on an AM69-based custom hardware platform,
> where all four PCIe instances (PCIe0, PCIe1, PCIe2, and PCIe3) with the
> internal PCIE_REFCLK are utilized with various endpoint devices such as
> a WiFi card, NVMe SSD, and PCIe-to-USB bridge.

You can enabling REFCLK to be out as default.

There are few boards, on which this clock is either terminated at test 
point or not connected at all

Example AM69 board

PCIE_REFCLK2_P_OUT is not connected and PCIE_REFCLK0_P_OUT is terminated 
at test points.


IMO, this clock to be enabled where this can be connected to PCIe EP.

Let Siddharth also share his comment, where to enable these clocks board 
file or SOC file.

Regards

Udit

> Link: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1484211/am69-pcie-refclk-out-and-acspcie-mappings
> Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
> ---
> This change depends on https://lore.kernel.org/all/20241209085157.1203168-1-s-vadapalli@ti.com/
> v2: set ti,syscon-acspcie-proxy-ctrl mask to 0x3 for all PCIe instances to prevent unintended overrides.
> v1: https://lore.kernel.org/all/20250320122259.525613-1-parth105105@gmail.com/
> ---
>   .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi    | 12 +++++++++---
>   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi           | 10 ++++++----
>   2 files changed, 15 insertions(+), 7 deletions(-)
> [..]

