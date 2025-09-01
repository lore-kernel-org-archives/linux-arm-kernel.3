Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11A7CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 12:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mfpu9+946Ww6Zj4dLh0pYD4ihvSOIC5tpCxWoPhVpoE=; b=3HWZL69Supxr6UhdJVVe3GU4aJ
	SlLEX+EPrnF3ZJ8D4LDON7Cevu/98l4wtSgQGdYgWo5twu+vQ+7teU2deWWOIVOJPlPgUCW/B0aQn
	xBfl48mlP6pVTqaw3Y/1DwFw/V6z2r9dG4r6DmXoSWDSb93U5UmeRbTcU5bAHQt732PIBxeSLSNZz
	FojOH4qSwT0te9RtlVVPNNHHTlvjXyBQsE1xMhJQD7d+CKVYDigcA0YAjMVnYWxbW3vq+ddgukXHn
	iUxQ6HtPwbglc3gFc6qGwsXVh3NyyrgSTYnGt7UglB/uKN4QfFGuDQXdHdxuLbyXL5QFFEOle+cL8
	cKijCdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut45M-0000000CbSM-16V9;
	Mon, 01 Sep 2025 12:56:36 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2Co-0000000ByHO-17OB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:56:13 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cFm0T5B8hz13NJQ;
	Mon,  1 Sep 2025 18:52:09 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E225180486;
	Mon,  1 Sep 2025 18:55:58 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Sep 2025 18:55:58 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Sep 2025 18:55:57 +0800
Message-ID: <fc7763d5-bed6-ace6-ace8-a50c031cab36@hisilicon.com>
Date: Mon, 1 Sep 2025 18:55:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/4] Add workaround for HIP10/HIP10C erratum 162200802
Content-Language: en-US
To: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
CC: <maz@kernel.org>, <oliver.upton@linux.dev>, <tangnianyao@huawei.com>,
	<wangwudi@hisilicon.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>
References: <20250825023954.3516381-1-wangzhou1@hisilicon.com>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <20250825023954.3516381-1-wangzhou1@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_035610_463454_6C7726D4 
X-CRM114-Status: GOOD (  10.18  )
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

On 2025/8/25 10:39, Zhou Wang wrote:
> As the discussion from V1 series, V2 series firstly adds GICD.num_LPIs
> writable support, then add HiSilicon erratum 162200802.
> 
> Erratum number should be 162200802, make a mistake in V1, so fix it as
> well.
> 
> Zhou Wang (4):
>   KVM: arm64: Allow userspace to write GICD_TYPER.num_LPIs
>   KVM: arm64: selftests: Add test for GICD.num_LPIs
>   Documentation: KVM: arm64: Add GICD_TYPER.num_LPIs writable
>     description
>   ARM64: errata: Add workaround for HIP10/HIP10C erratum 162200802

Hi Marc and Oliver,

As the discussion in V1 series, this series firstly adds GICD.num_LPIs
writable support, then add erratum patch.

If this series is OK, I will prepare QEMU related patch.

BTW v1 is https://lore.kernel.org/all/20250626124142.2035110-1-wangzhou1@hisilicon.com/

Best,
Zhou

> 
>  Documentation/arch/arm64/silicon-errata.rst   |  2 ++
>  .../virt/kvm/devices/arm-vgic-v3.rst          |  6 ++++
>  arch/arm64/Kconfig                            | 12 +++++++
>  arch/arm64/include/asm/cputype.h              |  4 +++
>  arch/arm64/kernel/cpu_errata.c                | 15 +++++++++
>  arch/arm64/kvm/vgic/vgic-init.c               |  9 +++++
>  arch/arm64/kvm/vgic/vgic-its.c                |  9 +++--
>  arch/arm64/kvm/vgic/vgic-kvm-device.c         |  1 +
>  arch/arm64/kvm/vgic/vgic-mmio-v3.c            | 22 +++++++++++++
>  arch/arm64/tools/cpucaps                      |  1 +
>  include/kvm/arm_vgic.h                        |  1 +
>  include/linux/irqchip/arm-gic-v3.h            |  1 +
>  tools/testing/selftests/kvm/arm64/vgic_init.c | 33 +++++++++++++++++++
>  .../selftests/kvm/include/arm64/gic_v3.h      |  2 ++
>  14 files changed, 116 insertions(+), 2 deletions(-)
> 

