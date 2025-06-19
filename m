Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A4FC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlRjm8eym2T9Hx/fyDaiY5Go0jYo5ZoRNES0P1c6pcM=; b=zkL0wdJo8Rj4rbaL2PXWioDhCq
	V7R/G1dDrJpOVhV2Q3oV6jFnz1Gbud8U3bpg2lseddyklJBEIqbFdBoQiKlfuUCarwW0N8FhXooer
	KFQoVu9k4OuAgVvSvq0Yyzq+2i6DRwiCUagNI4S8WcWhrosSHjRvh+6BFFN23Y/15a8dIdWABzbmk
	Po7FvTHLrJc09sXgKazgII09254FusUVklBJqpv08vi4lZD9/UJgcRROg3CZo246dB+/TwSFBPt6c
	3sX9LoeoXIziTFSAPiTlffd0CZMqVFx6pJlj42j4lqi6vn9fRExXedxx3G3A0bLLJAqILRJNb37GZ
	/Bl0LptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDYJ-0000000CuBP-3jo8;
	Thu, 19 Jun 2025 11:35:31 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCgE-0000000Clkf-42Et
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 10:39:40 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55JAdSQd588824;
	Thu, 19 Jun 2025 05:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750329568;
	bh=tlRjm8eym2T9Hx/fyDaiY5Go0jYo5ZoRNES0P1c6pcM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=faya4tNlxHcgR0iN7NSGved1dittEmBomwKRYY1tsZ1dX7O2cqrTRP2yaLYKF4rv/
	 8Vi0asnBam87XcKjMUq/lMIfgzQRY2vSH5gxDEAsK5Nk7btALkowj7KSXRgVuknjjs
	 leX7ONT0oDAqw0KEZJ2CQvdFXnqSnD/rqrdezWm0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55JAdRbU3819668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 05:39:28 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 05:39:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 05:39:27 -0500
Received: from [172.24.227.4] (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55JAdN4r1220846;
	Thu, 19 Jun 2025 05:39:24 -0500
Message-ID: <b446e04f-0c4a-4cce-8330-0b7bc1e330dc@ti.com>
Date: Thu, 19 Jun 2025 16:09:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add idle-states for remaining
 SERDES instances
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>, <srk@ti.com>,
        Hrushikesh Salunke <h-salunke@ti.com>
References: <20250609115921.2380611-1-h-salunke@ti.com>
 <ec2c7fab-6f4d-4163-90a9-16dddec80adb@ti.com>
 <afb54fe8-a271-4074-8249-669219954c4c@ti.com>
Content-Language: en-US
From: Hrushikesh Salunke <h-salunke@ti.com>
In-Reply-To: <afb54fe8-a271-4074-8249-669219954c4c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_033939_337420_08194563 
X-CRM114-Status: GOOD (  12.86  )
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



On 19/06/25 11:35, Siddharth Vadapalli wrote:
> On Wed, Jun 11, 2025 at 06:23:24PM +0530, Siddharth Vadapalli wrote:
>> On Mon, Jun 09, 2025 at 05:29:21PM +0530, Hrushikesh Salunke wrote:
>>> In AM69 SoC there are 4 instances of the 4 lane SERDES. So in
>>> "serdes_ln_ctrl" node there are total 16 entries in "mux-reg-mask"
>>> property. But "idle-states" is defined only for the lanes of first two
>>> SERDES instances. For completeness, set the "idle-states" of lanes of
>>> remaining SERDES instances to a default value of "unused".
>>>
>>> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
>>
>> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> I failed to notice that this change will introduce a regression on
> AM69-SK for CPSW AND Display which rely on the SERDES Lane Mapping for
> SERDES2 and SERDES4 being at their reset value of "zero". This patch
> should be fixed by updating it to the following:
> 
> 	<J784S4_SERDES2_LANE0_IP2_UNUSED>, <J784S4_SERDES2_LANE1_IP2_UNUSED>,
> 	<J784S4_SERDES2_LANE2_QSGMII_LANE1>, <J784S4_SERDES2_LANE3_QSGMII_LANE2>,
> 	<J784S4_SERDES4_LANE0_EDP_LANE0>, <J784S4_SERDES4_LANE1_EDP_LANE1>,
> 	<J784S4_SERDES4_LANE2_EDP_LANE2>, <J784S4_SERDES4_LANE3_EDP_LANE3>;
> 
> 

Thanks for noticing this Siddharth. I will correct this and post the v2
for this patch.

Regards,
Hrushikesh

