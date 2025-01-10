Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF0CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYrQC0kXwBVMa1J45wEqt9TQ8aBV6ll3GFZxCHeR19w=; b=OnoM3bj/Gd6YP10X5/bQH2Q8Ri
	m+7pSzE5v1sz5P+XXFdDrOL0gdWAQuVE2D3jPiP3H6z5nL1MkWZaPim34xocanoc4hxLTFK2C1hrR
	2GBfxcpkf5usT1GBCksajzISKof7sjQUbIRszxSdr6kOoYwKUjgm+PjHz3aF8aBbweKFQd906XWB5
	wp9q0R9JDoK+/WiK1OLRznvuDbXF54mFip8JwFze/IbSOGWliZtjsLHFJ3tBG8jWX8GAoxD5lQTW7
	PijBaaaOQ7FgGvNvgwxhDXD+FnGUHibOS2l17LNVQABjD78x8e1ShHpAn1Kf2Dnl15IGfUIMElT/s
	HIoSN81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCc7-0000000F1E4-3qbO;
	Fri, 10 Jan 2025 10:51:39 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCat-0000000F0xI-44HT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:50:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AAoKqc3106649
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 04:50:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736506220;
	bh=rYrQC0kXwBVMa1J45wEqt9TQ8aBV6ll3GFZxCHeR19w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UoGoi+o99ilNkoPbD9QVCUxa1zhtOlhpzbxhqm7K20thbDMKoORdR4GRNoJ3vNhPR
	 FlazG57RWWvXBATEoMcw8NrSXZNOwMCtamq8eUOfpfrn9MO0ZqV7/ADSLSmdsqeEGm
	 ucPwdq//pC3liDAnX7jEuYxo7+ClXt3Az4uZIGRY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AAoK4R120658
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 04:50:20 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 04:50:19 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 04:50:20 -0600
Received: from [10.24.72.180] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.180])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AAoGxT104651;
	Fri, 10 Jan 2025 04:50:17 -0600
Message-ID: <b67cc247-0c96-493c-b048-315db295158a@ti.com>
Date: Fri, 10 Jan 2025 16:20:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4-evm:quad-port-eth-exp1: Remove
 duplicate hogs
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <c-vankar@ti.com>
References: <20250110101855.156136-1-j-choudhary@ti.com>
 <ybyexqc4ssjt5lkr76bfiaf7usmq7xto42byyboov5pjkdc4fn@wsj26klcliio>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <ybyexqc4ssjt5lkr76bfiaf7usmq7xto42byyboov5pjkdc4fn@wsj26klcliio>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_025024_101105_737E5939 
X-CRM114-Status: GOOD (  14.10  )
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

Hello Siddharth,

Thank you for the review.

On 10/01/25 16:15, Siddharth Vadapalli wrote:
> On Fri, Jan 10, 2025 at 03:48:55PM +0530, Jayesh Choudhary wrote:
> 
> Hello Jayesh,
> 
> In the $subject of this patch, please use the overlay name as-is instead
> of adding the colon which splits the overlay name:
> s/k3-j784s4-evm:quad-port-eth-exp1/k3-j784s4-evm-quad-port-eth-exp1

I will fix this typo.

> 
>> The j784s4-evm board dts now has the gpio hogs for MUX2 after integration
>> of audio support.
>> Remove duplicate gpio-hogs from the overlay dtso to prevent mux probe
>> failures leading to can-phy3 deferred probe:
>> 'gpio-mux mux-controller: probe with driver gpio-mux failed with error -16'
> 
> This appears to be a fix since overlay functionality was broken since
> the commit which introduced audio support. Please add a "Fixes" tag
> to indicate this.
> 

Will add it in v2.

Warm Regards,
Jayesh

>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> 
> With the above comments addressed,
> 
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> Regards,
> Siddharth.

