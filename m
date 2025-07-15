Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC81C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPj+ZjyXI08K1aa9ZtqJ2JQ4vXsCzR+hY2K3B7jFZY0=; b=0oYE5ZQCKkYNoTVPZAUOvtiHzh
	Evo/T6emkyTiIwzgRrl6lHEnTmYqzW4q7cNTLZmJ0fpKhUfH/s+D8Qmt1AWEl0hJ+HJt2vSWRPR8R
	5YaVKbq8/EckP8x8ve56iXHZBj4dWJKwAVp9fvOJBY4NjXwHEzQ7dTXFTsw1tBkfdSdwRkbfSrOXX
	xi4v8b2cg5TgUChoAlVW3Xc8+wTAzvs43upzkOQMz3tLZ4lK88bY4NXhOB8vSW6fW7a65hqQmGD9b
	VD6Qf5CEIo8kKaLiv3EQbcXcWnwadwV++j//Fp401PkigvTzpjROOGw0n7sV5dzy3S9ND6ErQXXeA
	gRhe/t1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcS4-00000004mE5-3vLK;
	Tue, 15 Jul 2025 09:59:56 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcCc-00000004jSs-44Yl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 09:44:00 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56F9higY2864311;
	Tue, 15 Jul 2025 04:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752572624;
	bh=pPj+ZjyXI08K1aa9ZtqJ2JQ4vXsCzR+hY2K3B7jFZY0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HcipY2/4YMrPz6oInXTxuQgxYPe/6zR029wPd0s9QnDqJHqHqukrflc9WIZ7vq6Tw
	 KZOyF4027omc7xLuYYBvnoQJolvl/8mtI3T8hnODp0wOPjugVKivRKSoouIs1PxCgE
	 KNggh50s3EvXp6tXtnsHP7NSoxI0rV+aeo4yaADM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56F9hiLK1175149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 04:43:44 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 04:43:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 04:43:44 -0500
Received: from [172.24.227.166] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56F9heAe2655315;
	Tue, 15 Jul 2025 04:43:41 -0500
Message-ID: <eb5c71b5-62bb-4ec2-b3a1-a34ed3d70849@ti.com>
Date: Tue, 15 Jul 2025 15:13:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Add DSI display support for TI's Jacinto platforms
To: Vignesh Raghavendra <vigneshr@ti.com>, <nm@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <0d81594f-ad1a-4c65-a00a-9c97c8b01a65@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <0d81594f-ad1a-4c65-a00a-9c97c8b01a65@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_024359_060562_5E46B19C 
X-CRM114-Status: UNSURE (   9.02  )
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

Hello Vignesh,

On 26/06/25 11:45, Vignesh Raghavendra wrote:
> 
> 
> On 24/06/25 13:56, Jayesh Choudhary wrote:
>> Hello All,
>>
>> This series adds the dts support to enable DSI on 3 platforms for TI SoCs:
>> - J784S4-EVM
>> - J721S2-EVM
>> - AM68-SK
>>
>> Relevant driver fixes, CDNS-DSI fixes[0] and SN65DSI86 detect fix[1]
>> are Reviewed and Tested.
>>
> 
> Are these merged?

SN65DSI86 fix which was an essential patch is merged.
CDNS-DSI fixes will soon get merged (and that does not break these
integration patches for DSI).


Warm Regards,
Jayesh

> 
> [...]
> 

