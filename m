Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA587CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 01:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lC1Ce96IAdT9aiWHsO9hQBbPSIkM4W4mENdHu+vAq/I=; b=KOV57t24ow1U8l5xw1FpjtOs9T
	0QX9Kc/R5uFeJu8CYTmNllGPeaefGu5wGDg1ZA1W7fD+sSDrNZ8GblwU57+bYxMCwTRV2+EHxWEsm
	/Z+/QE+5+b0MBsc+Vmrtk/uqvKnjYcy15h9e6bwDN2dudBEuhny8A+00Dv1Z8eyysfWzYwua7wbua
	BGgWAT3WExRT6MQcEyUBtueOWsqUENNOrCHt8k5N+izvmOgjwxMZYx5g9uFxk9ZVaZ5MifCR/Y9SE
	G6Di2BCJUjcQTM3SpkyF2/zU0THqq9TfvOTb43A6y/HUC+c0JeVjml8JYPmRC9WiWW8EkXwbPpQ77
	nIZrCaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9r9-0000000BTGY-01Yq;
	Wed, 10 Sep 2025 01:42:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9r4-0000000BTDD-42mi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 01:42:40 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cM3Gs2y4DzRk6r;
	Wed, 10 Sep 2025 09:37:57 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 63692180491;
	Wed, 10 Sep 2025 09:42:34 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 dggpemf500013.china.huawei.com (7.185.36.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 10 Sep 2025 09:42:33 +0800
Message-ID: <6a1ec9d7-f41b-4ea2-a42c-26eec9591195@huawei.com>
Date: Wed, 10 Sep 2025 09:42:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] KVM: arm64: make EL2 feature fields writable in
 ID_AA64MMFR1_EL1
To: Oliver Upton <oliver.upton@linux.dev>
CC: <yuzenghui@huawei.com>, <maz@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <liuyonglong@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20250909034415.3822478-1-yangjinqian1@huawei.com>
 <aL_QjZbkvHsYIRt6@linux.dev>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <aL_QjZbkvHsYIRt6@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_184239_170864_FE871152 
X-CRM114-Status: UNSURE (   7.95  )
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



On 2025/9/9 15:00, Oliver Upton wrote:
> On Tue, Sep 09, 2025 at 11:44:12AM +0800, Jinqian Yang wrote:
>> Allow userspace to downgrade EL2 features (VH, TWED, HCX) to ensure VM live
>> migration compatibility between hosts with varying feature support.
>>
>> v1: https://lore.kernel.org/linux-arm-kernel/20250325121126.1380681-1-yangjinqian1@huawei.com/
>>
>> Change Log:
>> v1->v2:
>>    -Added support for downgrading TWED and VH fields.
>>    -Added corresponding test cases to the set_id_regs selftest.
>>
>> Jinqian Yang (3):
>>    KVM: arm64: Make ID_AA64MMFR1_EL1.HCX writable from userspace
>>    KVM: arm64: Make ID_AA64MMFR1_EL1.TWED writable from userspace
>>    KVM: arm64: Make ID_AA64MMFR1_EL1.VH writable from userspace
>>
>>   arch/arm64/kvm/sys_regs.c                       | 3 ---
>>   tools/testing/selftests/kvm/arm64/set_id_regs.c | 3 +++
> 
> General comment: please make do kernel and selftest changes in separate
> patches.
> 

Will be changed in v3.

Thanks,
Jinqian


