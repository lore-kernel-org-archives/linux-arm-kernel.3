Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CC5C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UM6Vn3fL7J3xAJBIYyUzeIBiXiYvGrMBNB36K+Hll8k=; b=KeZSnnr5zgA+EuLWBTM5nXbem0
	tNwrTz5dzW8ABDN5XF2mnO/ptwhMuHEfhHl8SPSNOkpk1v8BS4PwAzVWeLBbbjvnlh7eLA47SvneZ
	M91xHF5JAvR35mCT5XMq1+t5XxKYgFypy8e2rukbzTgpfHsDB2bmfWeYVtIcOklGJ3+fvHgZND3FO
	Te7UMk/ugjiXxw7fF3gTrKnoyqBb7TIHApt2reFGkdxwx1BQRO9OxQB7VAeKvsSO8f5nuCSwegEh6
	Ci5hTVG+yNiDbn1LJoB43cLOHLTsQbe99dY781EqF3vhYAex4aS0XVp3MqmgfFgigFYK5++Oq/rUA
	Bzi19DoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUM-0000000ECLr-2kfG;
	Fri, 04 Jul 2025 11:21:54 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXc3w-0000000Dmud-0Pou
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 08:46:29 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5648kL834136291;
	Fri, 4 Jul 2025 03:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751618781;
	bh=UM6Vn3fL7J3xAJBIYyUzeIBiXiYvGrMBNB36K+Hll8k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wPNG8kyHauGIWBSfpBfVvQGPrBldXCRwZvu/mVbzUwtQH9qzYvZjtsmdzJBC8opZs
	 45VZi0uAPhGF4wpHxjzPMtGzGhc4yQrHIjMLiiQgOONsD0G+/UWnIkGUPX6SMfelfx
	 121mwkJL1rZ7ML2HiHdhPST6NG5hDMK7TEb7RroY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5648kLvG2656895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 03:46:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 03:46:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 03:46:21 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5648kGSJ2686036;
	Fri, 4 Jul 2025 03:46:16 -0500
Message-ID: <6f151fc8-ff95-4e1a-b92f-4e908f62e979@ti.com>
Date: Fri, 4 Jul 2025 14:16:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: Add support for AM62D2-EVM
To: Vignesh Raghavendra <vigneshr@ti.com>, <nm@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-5-p-bhagat@ti.com>
 <485dc90b-dc9b-4b1a-ad18-9a9ef117637c@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <485dc90b-dc9b-4b1a-ad18-9a9ef117637c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_014628_253026_F6F5B524 
X-CRM114-Status: GOOD (  11.46  )
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


On 04/07/25 09:40, Vignesh Raghavendra wrote:
> Hi
>
> [...]
>
> On 27/06/25 17:27, Paresh Bhagat wrote:
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>> new file mode 100644
>> index 000000000000..70aeb40872a9
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * Device Tree Source for AM62D2 SoC family in Quad core configuration
>> + *
>> + * TRM: https://www.ti.com/lit/pdf/sprujd4
>> + *
>> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "k3-am62a7.dtsi"
>> +
>> +/ {
>> +	model = "Texas Instruments K3 AM62D SoC";
>> +	compatible = "ti,am62d2";
>> +};
>> +
>> +&vpu {
>> +	status = "disabled";
>> +};
>> +
>> +&e5010 {
>> +	status = "disabled";
>> +};
>
> Norm seems to be to use /delete-node/ here instead. Please respin
> accordingly.


Yep makes sense to delete the node itself. Will update this.
>

