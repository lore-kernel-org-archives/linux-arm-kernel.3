Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6752610F2869
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4U04YuVkU5yVPo7bGwMr1M680Ffrpb/xE3/QhU9zoo=; b=BmTuIgJECNFWREjJ5qmjGrqNgA
	ywY2a3XjxzsCtummIhpxf1/1keqg4dOwi2HyLsGXRX14x6+wlU5w6scMEI3seC0RS1IpI0LTSYu3W
	aWQul42PqotnjdCcm9bgCRhKd5sNZa/HCEKb3Z8lNm5DaqQQ9Al1NOEi1FBpcw+DzUUCH6p59L8hf
	hrnP9StG0ZKHqEFF07TSKK5ceEHnS5LzyngXchzFiNhXWDzvVnkGTMH7op4dk5NB/i7b9kCqoiJ7K
	GOY4eT1ZramXDmfL17BznSxE3xz8iG56QreEaUB7oeAUNmdFwmN7e48AAfoznk9TTpmil9ZxqKknx
	+xKg2o3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Clv-000000085tv-1dTE;
	Fri, 27 Mar 2026 19:23:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cls-000000085tC-05t9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:23:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 607EC3D4F;
	Fri, 27 Mar 2026 12:22:56 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB2193F99C;
	Fri, 27 Mar 2026 12:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774639382; bh=6SLGKG1KQiAZqiHF6EieHOeZHwzjQrj0pwiwo/Qkes4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M97CMfXJVb45g8Lm5V9RMdSPtRPWirkk45UC4Kno9lBYkkpnjENFeaqvOjSmtGDf1
	 L6sLrotHOAjYUC8+BFwYofxMUjPyRxn5ezp46C3ZqzTu85BQMgQvUZZhw5w/7xKKHQ
	 hNB2PUc8YfdYIdIpPLZ3yI4LfPx/kIYBQjKDRJFk=
Date: Fri, 27 Mar 2026 19:22:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Morse <james.morse@arm.com>
Cc: "will@kernel.org" <will@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Oliver Upton <oupton@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Dave P Martin <Dave.Martin@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: Re: [GIT PULL] arm_mpam: Add KVM/arm64 and resctrl glue code
Message-ID: <acbZEkkBDHEATZLD@arm.com>
References: <01f76011-f3c2-4dcb-b3bc-37c7d4de342e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01f76011-f3c2-4dcb-b3bc-37c7d4de342e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_122304_109599_627FC809 
X-CRM114-Status: UNSURE (   7.98  )
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

On Fri, Mar 27, 2026 at 04:19:26PM +0000, James Morse wrote:
> The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:
> 
>   Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/glue/v7.0-rc3
> 
> for you to fetch changes up to 4ce0a2ccc0358f3f746fa50815a599f861fd5d68:
> 
>   arm64: mpam: Add initial MPAM documentation (2026-03-27 15:32:52 +0000)

Pulled into arm64 for-next/mpam. Thanks.

-- 
Catalin

