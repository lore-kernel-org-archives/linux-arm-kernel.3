Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D849C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRhwr6bsuUpHJokkn7OOYPwCV0G4EhNX1INeaCHd44E=; b=GVxayE7FGfdRhhF3PGByfhI0pc
	HoU5ke9zRskogBy5MnCzk23kd3gZDeBB6sbRzYDffiyaOBNMhdKMevsIV6opZKQ/6gmaDu2S6wDVF
	4cj/p21eSgQxviPlbepkiiTNCBzDp6bqI5TQq9BR07iohHjiLOhYBrYwhV/Ump970QDn4RloDWE7U
	NMQx5451ZipqU1nI6dReJNAylH0Z6Y9S0TLs6Xu6b3RpIKTwUOIFbmpIQ0VlvuaBzOnhKAE4KnGSF
	L0nj9nSTyT3OO+pCNNahss1gkz3wGh7LyCQv0OhaUIV2ZOngq9sgCFeKPZdnoZtXaC/VGFzs9MP0n
	87B3Zp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6q8n-00000004G0i-3B4e;
	Mon, 21 Apr 2025 12:20:49 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6q6v-00000004FjK-0Mwf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 12:18:54 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCImUA1545741
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 07:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745237928;
	bh=HRhwr6bsuUpHJokkn7OOYPwCV0G4EhNX1INeaCHd44E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BZKn1IcjY/qIX90o+ZurQTtKZqjPrgXf4wjt8S5Xx7qjZ5A8ejXuDw0A8qkoSAom3
	 ENz+2z4Ak8AqrSSNbVO0nzfGcbStX1yWOGGClkkHz5FfQWb8GzwXK2jYIfn1xcv7v6
	 bFrCTZKtFAuyIv28c1EtsMqvom3owEPl2ckMubHA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCImtg061686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 07:18:48 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 07:18:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 07:18:47 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LCIiHl032378;
	Mon, 21 Apr 2025 07:18:45 -0500
Message-ID: <94e79e4b-ff72-49ba-bcd7-ba69e2296d3b@ti.com>
Date: Mon, 21 Apr 2025 17:48:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add DSI display support for TI's Jacinto platforms
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <02f1912f-0a05-4446-923a-7935ed305cb3@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <02f1912f-0a05-4446-923a-7935ed305cb3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_051853_255911_5F5E7824 
X-CRM114-Status: GOOD (  13.77  )
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

Hello Udit,

On 19/04/25 14:23, Kumar, Udit wrote:
> 
> On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
>> Hello All,
>>
>> This series adds the dts support to enable DSI on 3 platforms for TI 
>> SoCs:
>> - J784S4-EVM
>> - J721S2-EVM
>> - AM68-SK
>>
>> [..]
>>
>> NOTE: For higher resolutions, we need bigger CMA region.
>> But for validation, the default value is enough.
> 
> I am not sure , how DSS uses CMA region
> 

The framebuffers for dss are allocated from cma-pool.
By default the cma-region is of 32MiB that is shared by various peripherals.

1920x1080 requires ~16MiB of CMA but sometimes due to fragmentation,
we cannot get even this much for framebuffer and memory is not allocated 
resulting in display failures.

And large resolutions like 4k@60fps require ~64MiB straight away.
So it is better to reserve appropriate CMA region.

Thanks
Jayesh

> 
>> I am posting another series to add CMA region to Jacinto platforms
>> similar to Sitara family soon:
>> <https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/>
>>
>> Jayesh Choudhary (5):
>>    arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
>>    arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable DisplayPort-1
>>    arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
>>    arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
>>    arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0
>>
>> Rahul T R (2):
>>    arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
>>    arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP
>>
>>   .../boot/dts/ti/k3-am68-sk-base-board.dts     |  96 ++++++++++++++
>>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 116 +++++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  37 ++++++
>>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  |  52 ++++++++
>>   .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 117 +++++++++++++++++-
>>   .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  37 ++++++
>>   6 files changed, 454 insertions(+), 1 deletion(-)
>>

