Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25203CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 07:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjbTeP/uPO39TwEXrbj1nzgVC7BN96NufmW+FXmSEcI=; b=GhM1uP+GbpZ5pp01U5fTNQcf/Y
	uYue9j7cX8Ey4jp7uVFM5yUXicHbanQ813uBrsqQp/GsW4XzhC3vkO/jWnVWMojkJ971NFLObym7k
	kFZQtikQy2bkcN6ziAxtXdhDEO0Vr4lEGMLIcHUc4lpw7I2cxSQHlBfMAALJn/4ylui6XGUnEB9LG
	02nmRFZBzS8a4fn1dBcNAqxESdCZ1Si18DOH4Tlfr1/hrUuAY2L5coQhNP3oinNZqJee9iV18SFL1
	hlQJheJuI5uq3kUi2GE3wynKzWZe+yjy498LwXaZI95Dj75C7xkoiuSEnu9WM8BqEwDdRp6c79M1g
	xgB0w2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22g7-0000000GgfW-3CCP;
	Fri, 26 Sep 2025 07:15:39 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22g5-0000000GgcQ-0vqK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 07:15:39 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cY1vX203cz2Cgn6;
	Fri, 26 Sep 2025 15:10:48 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id AAF521402C4;
	Fri, 26 Sep 2025 15:15:27 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 26 Sep 2025 15:15:27 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 26 Sep 2025 15:15:26 +0800
Message-ID: <3d518b64-d66b-ca1e-0893-5b1f0faa17ee@hisilicon.com>
Date: Fri, 26 Sep 2025 15:15:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/4] Add workaround for HIP10/HIP10C erratum 162200802
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
CC: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<oliver.upton@linux.dev>, <tangnianyao@huawei.com>, <wangwudi@hisilicon.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>
References: <20250825023954.3516381-1-wangzhou1@hisilicon.com>
 <fc7763d5-bed6-ace6-ace8-a50c031cab36@hisilicon.com>
 <87wm5uxwvc.wl-maz@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <87wm5uxwvc.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_001537_422374_5A097731 
X-CRM114-Status: UNSURE (   8.66  )
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

On 2025/9/19 23:52, Marc Zyngier wrote:
> On Mon, 01 Sep 2025 11:55:49 +0100,
> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>
>> On 2025/8/25 10:39, Zhou Wang wrote:
>>> As the discussion from V1 series, V2 series firstly adds GICD.num_LPIs
>>> writable support, then add HiSilicon erratum 162200802.
>>>
>>> Erratum number should be 162200802, make a mistake in V1, so fix it as
>>> well.
>>>
>>> Zhou Wang (4):
>>>   KVM: arm64: Allow userspace to write GICD_TYPER.num_LPIs
>>>   KVM: arm64: selftests: Add test for GICD.num_LPIs
>>>   Documentation: KVM: arm64: Add GICD_TYPER.num_LPIs writable
>>>     description
>>>   ARM64: errata: Add workaround for HIP10/HIP10C erratum 162200802
>>
>> Hi Marc and Oliver,
>>
>> As the discussion in V1 series, this series firstly adds GICD.num_LPIs
>> writable support, then add erratum patch.
> 
> Given the state of this HW (as per [1]), I'd rather we start by
> working out the strategy at the GIC level, rather than exposing stuff
> to userspace before we agree on a way to make it work in the kernel.

This bug is in GICv4.0([1] is in GICv4.1), and seems having a clear way
to fix. How about merging this fix firstly, then continue to try to solve [1]?

Best,
Zhou

> 
> Thanks,
> 
> 	M.
> 
> [1] https://lore.kernel.org/r/20250909110615.129179-1-wangzhou1@hisilicon.com
> 

