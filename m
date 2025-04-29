Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02276C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUtH6qYBNKD+N5mY6n6DhaFZniwZFgbgJcKa/OYa00o=; b=OtQWyIKpx7UX8s9ipeB41IdyqO
	rr3mMgW6m+kCOY6qdTjGAaYvRB73zx1HdB3IUqrzw9lRNB9WBs28EdjzNtmLZ2ljMXSoGgj0eaHcY
	r7qWffPeGkQfBDyuW/XNzzC/Ey8U8fsT1Syuk5JMrECXc2WB8qDF8DyAIhdKQqNz4Eequ2SxodjEV
	0R4rAlsiVBGX1KGQ2qKd7DqR6YUp5H1O9V+DsWGeBpb5rCFTuD5Kdn8qthQgPowvpHxslSbnl8Wla
	upJJcso7g//Mu17klXlMBMEb7kt/eqbA4EG+damK5iUa08kyW3hvZtbLFCjVjbzHXYvRcMpG6mZ1f
	56v6AH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nrW-0000000AG3A-3vzp;
	Tue, 29 Apr 2025 16:31:14 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mES-0000000A0HL-3Zse
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:46:50 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TEkjNL3699137
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 09:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745938005;
	bh=AUtH6qYBNKD+N5mY6n6DhaFZniwZFgbgJcKa/OYa00o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yEeVUC7BKsxRLNh/tIJg1TLtguiDJc9T/hlHcOxEP5xEaiTVszFaXTM6kkJ0Ra8M9
	 LCLHU/FjPOSgCf6VvYZGNdITTNtKC2zcMRbLJa6LFSBhLVHdn4Kytt5GYpbKmNz5L+
	 r37iSeiSV85FmeB1Z6NIADrg1Wrwo+CqzZcFmOVA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TEkiZO013806
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 09:46:45 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 09:46:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 09:46:44 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TEkiuj117182;
	Tue, 29 Apr 2025 09:46:44 -0500
Message-ID: <9128dc1c-8f15-499b-84f6-f824bbfe61fe@ti.com>
Date: Tue, 29 Apr 2025 09:46:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <20250429142333.4140010-1-jm@ti.com>
 <20250429142825.bvrbpoc5iz32wh35@garment>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250429142825.bvrbpoc5iz32wh35@garment>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_074648_954730_17F5B8A6 
X-CRM114-Status: GOOD (  12.99  )
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

Hi Nishanth,

On 4/29/25 9:28 AM, Nishanth Menon wrote:
> On 09:23-20250429, Judith Mendez wrote:
>> Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
>> for eMMC. This change is necessary since DM is not implementing the
>> correct procedure to switch PLL clock source for eMMC and we have a
>> non-glich-free mux. To remove any potential issues, lets switch back to
>> the defaults.
>>
>> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral nodes")
>> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0 instance")
>> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more IPs")
> 
> I thought I had given this comment previously as well, please DONOT put
> multiple fixes in a single patch -> All three are solving the similar
> problems, but on three different baseline - please think through how
> this patch needs to be automatically backported to previous stable
> kernels.
> 

I understand now, will split this patch in three, thanks.

~ Judith


