Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A5CC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 03:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUHVWRSz6bAK679c/45owLGBEZBTPE2TOhEFGW6p+qU=; b=OWlPZlyiDXNWV187ta4jOe/BzB
	Sk3+33MN0V098WoSYyC5f13VTwE5kbMQwjKx/dfmwozzwglQIvKgv5rqhXYbuIdO45GDW74a+jrYz
	kTpEWwr1n6iEjtxb2RA/AjhzqreHiZCxhl/4CDKhfzffLSA9mBrgPxQM7vcZSF4xMX8oyElbLhLav
	qj5j5zXyEN23u3qdwO2APG+bfmbkRf9LEBtLdZcDxsv/Z28B0ktluvFbzyFCPU2lgs4OOEPH6juLG
	u14PKlGVNoQFKDevtuf+Cro/HvXKS6WScVoWuoi9K8CLSFRc2kB6Jo8d3bKrQcus+8FIBN0/MSZCt
	io2r5FZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF2zW-0000000Dxfh-0cvG;
	Wed, 14 May 2025 03:41:10 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF2xT-0000000DxXL-2ZB8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 03:39:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZxzYT67c1zxTSP;
	Wed, 14 May 2025 11:37:17 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id B9A2D1402E0;
	Wed, 14 May 2025 11:38:43 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 14 May 2025 11:38:43 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 14 May 2025 11:38:42 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <wangyushan12@huawei.com>,
	<caijingtao@huawei.com>, <xueshan2@huawei.com>, <prime.zeng@hisilicon.com>
Subject: Re: [PATCH v2 0/3] Add support for SPE Data Source packet on
 HiSilicon HIP12
To: <acme@kernel.org>, <namhyung@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<mark.rutland@arm.com>, <jolsa@kernel.org>, <john.g.garry@oracle.com>,
	<james.clark@linaro.org>, <leo.yan@linux.dev>, <irogers@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
References: <20250425033845.57671-1-yangyicong@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <d06b1e86-b6b8-3909-65bb-45b7cd70d263@huawei.com>
Date: Wed, 14 May 2025 11:38:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250425033845.57671-1-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_203903_792121_7E4B2678 
X-CRM114-Status: GOOD (  11.78  )
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

a gentle ping on this..

Thanks.

On 2025/4/25 11:38, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Add support for Data Source packet on HIP12. Support counting L2 HITM for c2c
> statistic since it was missing.
> 
> Change since v2:
> - split the kernel/userspace changes into different patch
> - revise some mem_snoop decoding according to the discussion
> - count missing L2 HITM for c2c statistic
> Link: https://lore.kernel.org/linux-perf-users/20250408122809.37884-1-yangyicong@huawei.com/
> 
> Yicong Yang (3):
>   arm64: cputype: Add cputype definition for HIP12
>   perf arm-spe: Add support for SPE Data Source packet on HiSilicon
>     HIP12
>   perf mem: Count L2 HITM for c2c statistic
> 
>  arch/arm64/include/asm/cputype.h              |  2 +
>  tools/arch/arm64/include/asm/cputype.h        |  2 +
>  .../util/arm-spe-decoder/arm-spe-decoder.h    | 17 ++++
>  tools/perf/util/arm-spe.c                     | 96 +++++++++++++++++++
>  tools/perf/util/mem-events.c                  |  5 +-
>  5 files changed, 121 insertions(+), 1 deletion(-)
> 

