Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CA7CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 06:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvgEEuC4IGLPe9aw1KFjm9tvi5gdUH6X9pTwf0g0988=; b=i3Me/5UpAflOrOJcZl6dD2dZ6F
	uoJnmBbuD9T/9W/63dBnGfzfOoYlOnRCsi2xGwzy41JI9d9OeSmAD6JB4M9AtiG0mcjrEeCigDQCu
	1vMnhm7SPiLSErm4rZGpjpWjD6vPGEGpwHKgBWJIvSyid3JxMVrFYlFlmC1IizaPAtg2oWt3Z4QzE
	/HG8kSdgZpWDhEJqvzeQQmvzLp7we9wQqdCxcN+dfuL/RQCDUELr+PxzQM4Jf7Qw6w62wZHgcjMUn
	2Dzi3+xR+Wil8d/Nrxu87q6N7rCW80jXBOrparQc5K+iSGIpJxtDUiATCXUaRtWIJRbnxMdqOe/5m
	ehi3HZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEKh-00000005h3E-3n4U;
	Fri, 08 May 2026 06:05:07 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEKe-00000005h1h-3mBR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 06:05:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OvgEEuC4IGLPe9aw1KFjm9tvi5gdUH6X9pTwf0g0988=;
	b=OVYimY99yeSQAGIbLDyiqwsNMFNuH2QM96aG7gBjM516AuUjve5Wt9qg6UZy7+6TxiiKfqoKj
	gU5JrO3zO9wM7d1mXCgINbnltdGY8hl2HY/CMMQ/1w/eVDPzt+GZZEd9R0c0jR4OoyB5xwC4kH+
	tLRpktEKYs3YQol3dtoQGxA=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gBdgH3P9nzmV8W;
	Fri,  8 May 2026 13:57:15 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 8FED44056C;
	Fri,  8 May 2026 14:04:50 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 8 May 2026 14:04:48 +0800
Message-ID: <9a57707f-6c80-e887-406e-3426b319635a@huawei.com>
Date: Fri, 8 May 2026 14:04:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] arm64: cpufeature: Add support for the MPAM v0.1
 architecture version
Content-Language: en-US
To: James Morse <james.morse@arm.com>, <ben.horgan@arm.com>,
	<xry111@xry111.site>, <catalin.marinas@arm.com>, <maz@kernel.org>,
	<ardb@kernel.org>, <yang@os.amperecomputing.com>, <ryan.roberts@arm.com>,
	<kevin.brodsky@arm.com>, <reinette.chatre@intel.com>,
	<miko.lenczewski@arm.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<thuth@redhat.com>, <james.clark@linaro.org>, <lpieralisi@kernel.org>,
	<broonie@kernel.org>, <oupton@kernel.org>, <anshuman.khandual@arm.com>,
	<yeoreum.yun@arm.com>, <leo.yan@arm.com>, <mrigendra.chaubey@gmail.com>,
	<fenghuay@nvidia.com>, <ahmed.genidi@arm.com>, <mark.rutland@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
References: <20260203095406.6437-1-zengheng4@huawei.com>
 <20260203095406.6437-2-zengheng4@huawei.com>
 <5869e7ef-fb07-414b-8bf3-359e74444c76@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <5869e7ef-fb07-414b-8bf3-359e74444c76@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_230505_436376_173660CD 
X-CRM114-Status: UNSURE (   8.19  )
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

Hi James,


On 2026/5/7 22:09, James Morse wrote:
> Hi Zeng,
> 
> (sorry for the delay - arm silently blocked your original mail. I've added you
>   to the whitelist, we'll see if that actually does anything!)
> 

Thank you for the notification and for restoring my email address, as
well as for your patience in reviewing them.

As I'm still concerned that some patch series may have been missed and 
not yet reviewed, please allow me to supplement the links here:

1. Introduce Narrow PARTID feature support:

https://lore.kernel.org/all/20260413085405.1166412-1-zengheng4@huawei.com/

2. Several MPAM-SMMU bugfix submissions for the MPAM extras branch:

https://lore.kernel.org/all/20260414032610.1523958-1-zengheng4@huawei.com/


Best regards,
Zeng Heng

