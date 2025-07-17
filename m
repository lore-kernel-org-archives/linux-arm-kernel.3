Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A18C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 20:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KrtjudTMe29tXW2LdCbvkSQKDHUcHyf+mPqGMkyKq4=; b=pABepH0FYBeZMAxiNtcA/KckrH
	oPOh/3E7eU/rNoaHm3//zaZ48fOwgru7QuyOK4NeNMPs/EHm25YyAdLSrEy53xCXpCYEz4nFz3ujM
	AZTQkkE0nn8s6s2Gknyd2K/jOx7gwZWZCaxjTtXq1hy0VS+lyvPHMxaE0siKsWhs/0KJklef0EiEf
	lbLcwxQE1BP0y2pkuIUKV03bSvJKxlcEqOvCh+qq1KdKuy4Ys+nD3mb/GQ0jI6nJn96BtUkMC4WwP
	CV6X2jW7Q09xm18ZpQTgZv2kgAL1SujvOuuJVEBPvKEnEnvB9DVCFr0o7BLXbL2OhCVBZ+glYD5fY
	c8NGRVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVYp-0000000B7bK-3piH;
	Thu, 17 Jul 2025 20:50:35 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVUK-0000000B7ET-1ESP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 20:45:57 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HKjpbd091000;
	Thu, 17 Jul 2025 15:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752785151;
	bh=1KrtjudTMe29tXW2LdCbvkSQKDHUcHyf+mPqGMkyKq4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iFrIRVjWfXBJ42olh52TEub21SKxJ4+jtRWYm406wzv9nmhu0XnGmN6zNuhgD21sT
	 uIht8fLS1LXyXVFvw59OI31fB2IiDVwHYeCPZAxiDnBzuyzW70EcV9gkdV/0POMj9/
	 9jBCseJmoxspoEqqASK87HwrRezzPE4ZY4ehYlIk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HKjpuJ486769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 15:45:51 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 15:45:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 15:45:50 -0500
Received: from [128.247.81.81] (uda0499903.dhcp.ti.com [128.247.81.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HKjooN2755246;
	Thu, 17 Jul 2025 15:45:50 -0500
Message-ID: <444774d0-5941-4428-b82e-d10b1fa099f2@ti.com>
Date: Thu, 17 Jul 2025 15:45:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add Interrupts property for CDNS CSI2RX
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20250714092708.3944641-1-y-abhilashchandra@ti.com>
Content-Language: en-US
From: Jared McArthur <j-mcarthur@ti.com>
In-Reply-To: <20250714092708.3944641-1-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_134556_424960_82C31F75 
X-CRM114-Status: GOOD (  10.81  )
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

On 7/14/25 04:27, Yemike Abhilash Chandra wrote:
> The driver patch that adds support for error detection on the
> Cadence CSI2RX by enabling its interrupt lines was recently
> picked up [0].
> 
> Accordingly, this patch adds the required interrupts property
> to the Cadence CSI2RX device tree nodes.
> 
> Test logs:
> (To validate the complete functionality, CRC errors were
> intentionally generated by modifying the sensor overlay)
> 
> AM68: https://gist.github.com/Yemike-Abhilash-Chandra/123fed82e798a76944ec23f8e46d1114
> AM69: https://gist.github.com/Yemike-Abhilash-Chandra/1820e39888cb50e250a83e2d059365f6
> J721E: https://gist.github.com/Yemike-Abhilash-Chandra/63f993a995fd6a12cb113454952c063f
> J722S: https://gist.github.com/Yemike-Abhilash-Chandra/2144fc8ab2f7bcdb3ef868e85424467d 
> J721S2: https://gist.github.com/Yemike-Abhilash-Chandra/f46587ec1ef72671ee31803dd93434b4
> J784S4: https://gist.github.com/Yemike-Abhilash-Chandra/0c594683772f11c70bccb508757e9799
> 
> Driver and Binding patch series: https://lore.kernel.org/all/20250416121938.346435-1-y-abhilashchandra@ti.com/
> 
> [0]: https://lore.kernel.org/all/aG9tuMFOnvwXkcE-@valkosipuli.retiisi.eu/
> 
> Yemike Abhilash Chandra (7):
>   arm64: dts: ti: k3-j721s2-main: Add interrupts property
>   arm64: dts: ti: k3-j721e-main: Add interrupts property
>   arm64: dts: ti: k3-j784s4-j742s2-main-common: Add interrupts property
>   arm64: dts: ti: k3-am62p-j722s-common-main: Add interrupts property
>   arm64: dts: ti: k3-j722s-main: Add interrupts property
>   arm64: dts: ti: k3-am62-main: Add interrupts property
>   arm64: dts: ti: k3-am62a-main: Add interrupts property
> 
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi                 | 3 +++
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                | 3 +++
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi   | 3 +++
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi                | 6 ++++++
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi               | 6 ++++++
>  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi                | 9 +++++++++
>  arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 9 +++++++++
>  7 files changed, 39 insertions(+)
> 

For the whole series.

Reviewed-by: Jared McArthur <j-mcarthur@ti.com>

-- 
Best,
Jared McArthur

