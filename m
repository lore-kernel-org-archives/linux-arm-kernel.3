Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E683EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 08:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAAvYxuuuYgZ6Udi3MqCZJcu5QStsstjQ/LkjzAIDBw=; b=TTSCuc39KSD+pQRJxzSdsM76Ph
	Jd5WiRXlkjPV3KM79n2v/5SkSdZeb3KelV5p8uBMmIwKZM6IwcR3ycQgAWHsGrVbqh7lL/goNnlVT
	6oRj0yR4wCX5Kv1cF8UhKT40rdfsXri7RgZkm1pRDvx7Tv2g9lXVUkOjBlZ6sR/ZjkT+gwAr3uVpY
	Nsxocks4FQeFpWSSfTf+YHS4ZlSxYdncSdyNuTr07ConefeJlG+t5VKNfFQz201Ks3081iGSB0FpY
	YxS7lNUcRHVYqBeoLSjk0nxgvSV2jStGRLj0gJ3e/cfgVtrIoCu8/5SvRwJTg6KQe66j76WHUHWps
	dG6d0Jww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnvn-00000009NWd-3suc;
	Wed, 18 Jun 2025 08:14:03 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnn7-00000009MTZ-3T7A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 08:05:07 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55I8509d258388;
	Wed, 18 Jun 2025 03:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750233900;
	bh=iAAvYxuuuYgZ6Udi3MqCZJcu5QStsstjQ/LkjzAIDBw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gjrxtSt7FvQkXkHpVC5Uo2xcKnofCv6Ehf8qWIJw5uEl06UjNterpP3Dm/Yu2K32D
	 sQRwzyqu30rrMEdd8EJIyydxx+jNTtLYeLssmXvSUsbNRm/pYCtyaJi1mYuWRtguTz
	 4AqqXhaC5mTbS9xBzQgTBHAMSnAurR3N6bv8RCqA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55I850so2735878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 03:05:00 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 03:04:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 03:04:59 -0500
Received: from [172.24.20.171] (lt2k2yfk3.dhcp.ti.com [172.24.20.171])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55I84sLG3131069;
	Wed, 18 Jun 2025 03:04:55 -0500
Message-ID: <fabe8565-cd27-4117-ba64-23022f1942ae@ti.com>
Date: Wed, 18 Jun 2025 13:34:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] dmaengine: ti: k3-udma: move static inline
 helper functions to header file
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-chavda@ti.com>,
        <p-mantena@ti.com>
References: <20250612071521.3116831-1-s-adivi@ti.com>
 <20250612071521.3116831-4-s-adivi@ti.com>
 <acc1217d-50ce-4851-829d-38294b0a4d81@ti.com>
Content-Language: en-US
From: "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>
In-Reply-To: <acc1217d-50ce-4851-829d-38294b0a4d81@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_010505_963162_2BC87B1F 
X-CRM114-Status: GOOD (  11.95  )
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

Hi Siddharth,

On 6/12/2025 4:35 PM, Siddharth Vadapalli wrote:
> On Thu, Jun 12, 2025 at 12:45:07PM +0530, Sai Sree Kartheek Adivi wrote:
>> Move static inline helper functions in k3-udma.c to k3-udma.h header
>> file for better separation and re-use.
>>
>> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>> ---
>>   drivers/dma/ti/k3-udma.c | 108 --------------------------------------
>>   drivers/dma/ti/k3-udma.h | 109 +++++++++++++++++++++++++++++++++++++++
> 
> Since this patch and the previous two patches seem to have the same
> objective of moving contents from "k3-udma.c" to "k3-udma.h" for the
> purpose of re-use, could they be squashed?

I split them up to make the changes easier to review, bisect or revert 
if needed. They're logically distinct changes even if the overall goal 
is similar.

If there's a strong preference to squash them, I can do that but I'd 
prefer keeping them separate.

> 
> Regards,
> Siddharth.


