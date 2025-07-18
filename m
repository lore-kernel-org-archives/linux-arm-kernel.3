Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E91C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXFYZnjlHdB/uyS4Hy1B+2ouYxuWau8TLwy+zfMt0K8=; b=xaCUOdZTxbe1eTT89yfe0WnXGa
	9C3FGpoLhoaz0RYLu6+bWT0rbs8+WLf+7IqSdOB2dvzjOljkoR0ylTW57izov4hfU83ZjHfAlZkha
	BWtR1RGMjTVoswV+0FoDfxIr8fXGF2ns+9wxEIoSHfwJkxE32Zgj6glK4b3VRHhL3vxu+C+4JDZyk
	/qBLOcKtTiKhwqR5eLHpUaNWNyKKFEc+/ro4qa/fU7D727DKenjsNfwEPzWj8xh8EBmj3TnYeD/uC
	iRz+Ak+kdwvJRlS840i7e1NmfbYvF/yb8cYMAielbQtXQ9BLIe9Z4ZUwIzIREnsZR1cDFjEy0Msta
	j+u7i2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucp2C-0000000DFBK-0YLb;
	Fri, 18 Jul 2025 17:38:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucotL-0000000DECu-18pu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:29:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C7EE16A3;
	Fri, 18 Jul 2025 10:28:53 -0700 (PDT)
Received: from [10.57.52.232] (unknown [10.57.52.232])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9E303F6A8;
	Fri, 18 Jul 2025 10:28:57 -0700 (PDT)
Message-ID: <4b010cc5-9244-450d-9a03-4ff6bf5c9a20@arm.com>
Date: Fri, 18 Jul 2025 18:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] SCTLR_EL1.TIDCP toggling for performance
To: "Liao, Chang" <liaochang1@huawei.com>
Cc: linux-kernel@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, sashal@kernel.org,
 yangjiangshui@h-partners.com, zouyipeng@huawei.com, justin.he@arm.com,
 zengheng4@huawei.com, yangyicong@hisilicon.com,
 ruanjinjie <ruanjinjie@huawei.com>
References: <24afb8de-622a-4865-bd8e-8e89ccfff8f4@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>
In-Reply-To: <24afb8de-622a-4865-bd8e-8e89ccfff8f4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_102903_355558_97F7C9A8 
X-CRM114-Status: GOOD (  12.92  )
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

Hi Chang,

On 18/07/2025 03:32, Liao, Chang wrote:
> Hi, Kristina
> 
> I've reviewed your patch [1] for FEAT_TIDCP1 support, which by default traps EL0
> accesses to implementation-defined system registers and instructions at EL1/EL2.
> 
> Do you have any plans to add support for toggling the SCTLR_EL1.TIDCP1 bit? I'm
> encountering performance degradation on CPU where certain implementation-defined
> registers and instructions are designed for EL0 performance use. The trapping
> overhead is substantial enough to compromise any benefits, and it's even worse
> in virtualization. Therefore, I'm hoping there's a way to clear the SCTLR_EL1.TIDCP1
> bit on such platforms, perhaps via a kernel config option or command-line parameter.
> Alternatively, do you have a better solution for gracefully toggling this bit on
> and off?
> 
> Thanks
> 
> [1] https://lore.kernel.org/linux-arm-kernel/Yrw3NWkH6D0CgRsF@sirena.org.uk/T/#m5cfdb27b48d9d7e30db73e991fc6c232ba8a7349

I don't have any plans to add support for toggling it. You could try sending a
patch for a Kconfig option or kernel command-line parameter. I'm not really
sure what the maintainers' view on supporting IMP-DEF features is.

Thanks,
Kristina


