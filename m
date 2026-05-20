Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2098ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ILLE5X/zh5Zp5m7SYWsEaC8ZBBvgKc8eCKNCOEyqYg=; b=MbVcV4WsPYPj8fVxco5ZCGBpg8
	WhkX7uOrqse6m2mk/MMM1i9Ia3dXkjfLMvf8TOSOARs8W7ay3MCRUbY8uUG+KQ1P/pXmI2KGUAvB2
	zUrVmkK0eUL8rQV5oor8pLnaVdXF33euTWKsNU/xlybct8hum8gQ4hrUfRhHdFmhveAs9yIvwmynT
	Q1TJtMVUjXnXHTrFj2oi9Yi4azn7aXgr2LV5Tete7ia/SYj/k7xIZ8R87nkbG8B69Jl6OVxYM6C0S
	E/5UkvePKq84H258m2k/flL78Pp2B4iRAWI6bGI7Pnn5nqtDjiP0/++fFuT4rqfGJiv7nUe4q3ai2
	T4EPDAEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPceo-000000041yw-2U0F;
	Wed, 20 May 2026 08:52:02 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcek-000000041wJ-4AMb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:52:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5ILLE5X/zh5Zp5m7SYWsEaC8ZBBvgKc8eCKNCOEyqYg=;
	b=ahldOXzRVBCatzSoLh4qIWjZNKkjLW+qbMChK+u+JTSiPCXdTZPYb9zQteodxgzTQLeiOjLFL
	1TOQJNZphPCA3XiHB3+YzYEx6XTyKjoXuFgzD869C++zx7TZXKvZ+XrYS/dQlY+k8Os8NGRpKvC
	x+HpkHsLmUgowgc8bj+OXyA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gL4pP2yrDzcbR6;
	Wed, 20 May 2026 16:44:13 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 6149B4056E;
	Wed, 20 May 2026 16:51:47 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 20 May 2026 16:51:46 +0800
Message-ID: <cd330f4f-2604-48ce-bfcf-c9a79f48e66b@huawei.com>
Date: Wed, 20 May 2026 16:51:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Support the FEAT_HDBSS introduced in Armv9.5
To: Will Deacon <will@kernel.org>, <maz@kernel.org>, <oupton@kernel.org>,
	<catalin.marinas@arm.com>, <corbet@lwn.net>, <pbonzini@redhat.com>, Tian
 Zheng <zhengtian10@huawei.com>
CC: <kernel-team@android.com>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <liuyonglong@huawei.com>, <yezhenyu2@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>, <leo.bras@arm.com>, Jonathan Cameron
	<jic23@kernel.org>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
 <177918656142.736362.17906576792384645789.b4-ty@kernel.org>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <177918656142.736362.17906576792384645789.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_015159_229867_952803DD 
X-CRM114-Status: UNSURE (   8.88  )
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



On 5/19/2026 11:23 PM, Will Deacon wrote:
> On Wed, 25 Feb 2026 12:04:16 +0800, Tian Zheng wrote:
>> This series of patches add support to the Hardware Dirty state tracking
>> Structure(HDBSS) feature, which is introduced by the ARM architecture
>> in the DDI0601(ID121123) version.
>>
>> The HDBSS feature is an extension to the architecture that enhances
>> tracking translation table descriptors' dirty state, identified as
>> FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
>> page tracking, aiming to significantly reduce the overhead of scanning
>> for dirty pages.
>>
>> [...]
> 
> Applied sysreg definitions to arm64 (for-next/sysregs), thanks!
> 
> [1/5] arm64/sysreg: Add HDBSS related register information
>        https://git.kernel.org/arm64/c/72f7be0c2e30
> 
> Cheers,

Thanks!
Tian


