Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73820E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MT3zjQCTe8dYrha5bzI2b4O5GqZchwvbuXrBf8LpDmY=; b=Mi2tyTeiOdhV4aAI4XT0SDBHxF
	p8R5s4Clngzf81T8QiM9NgL/tuJXzeU0eLFnFtcautc3xzEClDzmqGgd2vvXaTph9fevps+4Fi6qR
	rO0uLMJwWQtXj9sPRV6a4YoFpqMuIngsboLTzy3HL3snwGCeV5mvoXyFiUGOjk65BQu+PajxcGMEQ
	wVh757cL5xA7t3IWu+9QHJEFTQnX/j/ls70lnhbOlgxaO4hucqgKNe+HPYQduidfmNI29FcyMoQ7/
	0GRg6bEso9lM2qOk1YySq4RhtGyDQtt5B6kvFp8bwjumYjDM7jXd2V+clXkWGjyeLK/tA6BJyFEnE
	UtnmbIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlC5-000000011s2-1hB4;
	Mon, 06 Jan 2025 11:22:49 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlAB-000000011M3-2KpC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 11:20:53 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 506BKadq2410906
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 05:20:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736162436;
	bh=MT3zjQCTe8dYrha5bzI2b4O5GqZchwvbuXrBf8LpDmY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WT32yNgHZKl6uh2qr3Airp++lSs0i7jmoGTUD24eeZJzI0hE/bz86hjEcDQT346uG
	 In5y/IZECLpg9L4moXpQ5SKrDAMiKJlKASCflx5/k2VFHE0+zxJ8ojLrkHhVsxzvJs
	 +/KSWg4MsbI+Cku/2LcwOKPlVq4rY+an39A24Tq8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 506BKaIA073249
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 05:20:36 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 05:20:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 05:20:36 -0600
Received: from [172.24.227.241] (santhoshkumark.dhcp.ti.com [172.24.227.241])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 506BKXqg128614;
	Mon, 6 Jan 2025 05:20:34 -0600
Message-ID: <67ca6b29-6e55-48fa-8ad8-1850fd48f97a@ti.com>
Date: Mon, 6 Jan 2025 16:50:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable SPI NAND flashes
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>,
        "Mantena, Prasanth" <p-mantena@ti.com>, <s-k6@ti.com>
References: <20250102120043.1404843-1-s-k6@ti.com>
 <4cb46289-9f27-468f-a07a-13cbc28abc83@kernel.org>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <4cb46289-9f27-468f-a07a-13cbc28abc83@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_032051_760703_0E8F09FA 
X-CRM114-Status: GOOD (  12.48  )
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

Hi, Krzysztof,

On 02/01/25 21:35, Krzysztof Kozlowski wrote:
> On 02/01/2025 13:00, Santhosh Kumar K wrote:
>> Add support for SPI NAND flashes on ARM64 boards/EVMs such as:
>>
>> 1. W35N01JW on AM62x LP SK, AM62Ax SK, J721S2 EVM, J784S4 EVM,
>>     J722S EVM, J742S2 EVM
>> 2. W25N01JW on AM62Lx EVM
>>
> Please use recognizable names. git grep -i on some of above gave me zero
> results, so no models, no compatibles, no makefile entries use above
> names. Also really not sure where to look for - which vendor. This is
> defconfig for all users of arm64, not your private one.\

'git grep -i' on most of the above names results it's entry either from 
arch/arm64/boot/dts/ti/k3-*.dts or from drivers/mtd/nand/spi/winbond.c 
except for W35N01JW and AM62Lx EVM as the series which adds support for 
W35N01JW [1] and AM62Lx EVM [2] are yet to be merged.

Some 'git grep -i' results for your reference:
$ git grep -i "AM62x LP SK" 
 

arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts:14:    model = "Texas 
Instruments AM62x LP SK";

$ git grep -i "J784S4 EVM"
arch/arm64/boot/dts/ti/k3-j784s4-evm.dts:17:    model = "Texas 
Instruments J784S4 EVM";

$ git grep -i W25N01JW
drivers/mtd/nand/spi/winbond.c:254:     SPINAND_INFO("W25N01JW", /* 
high-speed 1.8V */

Nit: 'AM62Ax SK' should be 'AM62A7 SK'. I'll edit it in v2.

[1] 
https://lore.kernel.org/linux-mtd/20250102115110.1402440-1-s-k6@ti.com/T/#mfbbfc8852e70a077d2adbba0a4fddeed7b4237f1
[2] 
https://lore.kernel.org/linux-arm-kernel/20241117-am62lx-v1-0-4e71e42d781d@ti.com/

Thanks and Regards,
Santhosh.

> 
> Best regards,
> Krzysztof

