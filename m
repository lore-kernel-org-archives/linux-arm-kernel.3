Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591C1C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcFXvWp+8y1C0Jh84T5AKaDALbMP9vd9zmnZkTJ7y5E=; b=0OGJBesnE9ikkPOZvKKRNrpZIK
	pUdj8phswerD4T6Ml9Tubs8mC2oT1gcc2SjDzR4OOZqzINnjvmVUGz3TeIRw2vUXyrT7nI84Y8jMB
	Z6Y7ZDspraVgifBsqDR9RYAx5HjDcdC4jWgTfYK/Ye/90XL5c0mHBgcsP9RpmUeCSnt46eUUSZIg4
	LtewVGR3poNMnuAJJsixCt2DgchXpJWvOS8wYH+AIw4TB2qhMNWebi4Eor4MLNTEO8rpV/1XAVwOw
	oYjd01EwjbC+JnGYeRj098xkrti4G2et8xvdwshs05lKMTMTWgh0PEU1w5HQlPxJ3k5SK31reizTc
	hXKhMg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3tyl-0000000H39t-2fJg;
	Sun, 13 Apr 2025 09:50:19 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3twu-0000000H31K-0OhP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 09:48:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53D9mAQ51793023
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 13 Apr 2025 04:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744537690;
	bh=XcFXvWp+8y1C0Jh84T5AKaDALbMP9vd9zmnZkTJ7y5E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AsiBlB4ZoYWF2U9lu/WtajZBi4vcmvTuTg3KXFIBfQbYIjhLsVM/4meBLfZ9ANsDq
	 afsDbMX92q1joGAbQ1HnhEc+8yXPA5/AQDqCgp7WzHrXScj1AERxNBVgOqPZ9p1WQ9
	 qI6TZUaq/nytY8qtJ0BvTNpmspLyWVd15Z4rYByE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53D9mA6r076798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 13 Apr 2025 04:48:10 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 13
 Apr 2025 04:48:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 13 Apr 2025 04:48:09 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53D9m5pE090639;
	Sun, 13 Apr 2025 04:48:06 -0500
Message-ID: <8c2aeee1-585f-495b-87a5-93b003709afd@ti.com>
Date: Sun, 13 Apr 2025 15:18:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250412052712.927626-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_024824_270139_F4E4F80B 
X-CRM114-Status: GOOD (  14.56  )
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

Thanks Siddharth

On 4/12/2025 10:57 AM, Siddharth Vadapalli wrote:
> Hello,
>
> This series is based on the following series:
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> Based on the discussion in the above series which disabled 'serdes_wiz0'
> and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
> file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
> 'serdes1' in the SoC file anymore, since that is not a working
> configuration - serdes_wizX enabled and serdesX disabled doesn't work.
>
> Hence, this series aims to cleanup the serdesX nodes after the changes
> made by the above series.
>
> Regards,
> Siddharth.
>
> Siddharth Vadapalli (2):
>    arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
>    arm64: dts: ti: k3-j722s-evm: drop redundant status within
>      serdes0/serdes1

For series

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
>   2 files changed, 6 deletions(-)
>

