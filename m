Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34121C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50ccKvJbE8E2q8/VtQYZSANjSkm7KV3enAX7k9Bs5ug=; b=oFUQcZbqN6PnlCPNizKsfBx1oa
	7R6T+wfklq/hRESgHO3nDRVgeWMIpJyOrSMxh826yc78jwTRXJ7MZ2SJEaA/cUWG2TLbOyNN3jUW6
	UHeqqdELXLc2DI6vvuwBr9eOaQ8c6Vcw5fGnD+q1bQmTI43X7P2cqUXhCbBIuGV8QsB4GbBuUuQ8e
	MElwYLaDsapzhxB0GLwdKW06l+1p0aJGsQQVYjUL+Ss9Ohn/dl/6bdSRf8s/TZyYZ7SBJDUEUmcB/
	eFdOcBSaIc5k1QE2O9b4DrOmniK/Q6QbEDJ5IqI65RYv0E2JSM6lR7SFXJMKi7oh8e13cRszF3Wv5
	N3lCL5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqzd-0000000GxHX-212e;
	Mon, 03 Aug 2026 11:38:05 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqzZ-0000000GxGq-3GuM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 11:38:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=50ccKvJbE8E2q8/VtQYZSANjSkm7KV3enAX7k9Bs5ug=;
	b=ZZUFS3Xc/+LfR2nGSgliKhOmQoycCSE5doMoaU7wW8huWa25tay/rH1PkyKnxIrxEriRptTxk
	ekByilyNOlDXPDVcQ6+LSAsMuXjq8ZUKrGHtJnXGZ4pJwhD53LPLIbyjEClRtoCjxHrJFZQNKbN
	26kOtVb2p5gcPcNQnWvUejw=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hDDtw4xJzz1cyPG;
	Mon,  3 Aug 2026 19:28:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7055040572;
	Mon,  3 Aug 2026 19:37:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 3 Aug 2026 19:37:36 +0800
Message-ID: <2cd68320-ef89-4833-8960-05b826c26160@huawei.com>
Date: Mon, 3 Aug 2026 19:37:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 40/45] arm64: nmi: Add Kconfig for NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-41-vladimir.murzin@arm.com>
 <c46ccf44-7414-42bf-9760-79200ac247ba@huawei.com>
 <b65980e5-8db2-4346-898d-fd6fce87e6cc@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <b65980e5-8db2-4346-898d-fd6fce87e6cc@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_043802_313084_AD7B33BA 
X-CRM114-Status: UNSURE (   6.12  )
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



在 2026/8/3 17:36, Vladimir Murzin 写道:
> On 7/28/26 07:24, Jinjie Ruan wrote:
>>> +config ARM64_NMI
>>> +	bool "Enable support for Non-maskable Interrupts (NMI)"
>>> +	default y
>> I think we should select ARM_GIC_V3 here, as FEAT_GICv3_NMI need GICv3
>>
>>> +	help
>>> +	  Non-maskable interrupts are an architecture and GIC feature
>> GICv3 feature
> 
> Not really, GICv5 also supports NMI.

Oh, I forgot about this newest interrupt controller.

> 
> Thanks
> Vladimir
> 


