Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B446CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0ZYC8XyqmhRCxLoo09GB7F0S70wSBZYcxQO5AixQb0=; b=4Il8XEDu+UL2zZovPT37ixlqKV
	BmtlLfBkEAT4/0hB41a21TEwiqFBnhJpCQiDEtx2Fgcq4aZooLgUav8mzaTV1Zu9F14V9VZVnFNCe
	OIsz/srgT2aSRq+XGvctbIE6WSyTwQe0bddp6IZb/Yrn3aF5vNrTHdccRa0e6tDfDRaacEcra46x2
	0v6tUY28NZZg2nBPODn/hWmphkzYsU7A+lkzakAt+khiE1Lr11X1cI3gjJFtqPuMqg36HcvKSrXB5
	WztyrsXRiht3AuOJmOEgvUuS1tCfoyWFGbFXZLJuh+dRy0Yk/ZTFo7Nba/WsBn1As+/+I9/zRfhxJ
	f9+Ms1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mYB-0000000A3h9-2xfN;
	Tue, 29 Apr 2025 15:07:11 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9m77-00000009zA2-1B4s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:39:14 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TEd9373868399
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 09:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745937549;
	bh=i0ZYC8XyqmhRCxLoo09GB7F0S70wSBZYcxQO5AixQb0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Q7OgFLkVaWw7tiit93pwA0uy4R0yZlDzYrio0TX9yGj/bIM5nO0F6UCAJW15L1/ro
	 kZhFPnDu+VxG1o1+u2oZfcnpdgI4nkxNBNxGOkTYCjSbxx4TbgBeyHR65y7sZA/9PX
	 /UeAIL3AEkfzlY8OTdZczePWMtlohROHoFn411MA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TEd93t008783
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 09:39:09 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 09:39:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 09:39:09 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TEd9li088402;
	Tue, 29 Apr 2025 09:39:09 -0500
Message-ID: <e956e04a-f2e8-4e13-a1f9-23521e99807d@ti.com>
Date: Tue, 29 Apr 2025 09:39:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
References: <20250429143730.4145747-1-jm@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250429143730.4145747-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_073913_434637_FCD0DEA2 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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

Hi all,

On 4/29/25 9:37 AM, Judith Mendez wrote:
> For am65x, add missing ITAPDLYSEL values for Default Speed and High
> Speed SDR modes to sdhci0 node according to the device datasheet [0].


Please ignore this patch, forgot to add stable tag.

~ Judith


