Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89EDF588DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crEmDvjs5b1DaxkQopC3Ptl3PLa4f/FTz18lnb+EAQ4=; b=u6ma2oG25icwXN13IW6vEoI8vT
	q9RjD4xP3rtH7FY3wHOlj9TRlvp8S3ZIsIzu4Ot6A/ZfoQ+uElhDZwadsYh33tw2qmBD3u8nvMKLT
	i3qqNNXunLfLI6crpuS1c2L9cIUctu63F/uaulYyVAq7VzCK4FsIYL4LAB32YMNmaKufECBcJtR0q
	D3bYTLoqSUdtQZ/JEq7lzzpH/5MnamIhWuf2n+tLBR08liqzOqUq6UbnQLq7lFDqJpHHgxLBA3m+j
	k5K7r4M6e/lT0AsjdIjU3yt8BmAwbfOoh6qpD1J88lUDhsTqr29/SZ+fExFOMJQ1G0SXZd/CikScx
	BZbT5CKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpPt-000000079Wn-2Pup;
	Mon, 20 Apr 2026 14:16:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpPq-000000079VX-2Yp2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:15:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 380C71516;
	Mon, 20 Apr 2026 07:15:50 -0700 (PDT)
Received: from arm.com (unknown [10.57.89.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 881F83F7B4;
	Mon, 20 Apr 2026 07:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776694555; bh=jpQEW9v4+0iIoT2HmeCsYzjMGkOaNNq+W02ovVUjlLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPhXzyfIgTIk7EAZZtS4904HSlVC5tr3Z8GoJBYIiPUoliDV0hjMgyMqo6yoZgx8+
	 9UR22jvHhg31wVf/jIXqs5R0FUrNBDgLX4m8nDY/tUG+j3en+vcbTAMIPYvRjgNUT/
	 mlLHdbuqhMNWUHifCuCYl3raj/cdhUzeR9EaKChw=
Date: Mon, 20 Apr 2026 15:15:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	Ben Horgan <ben.horgan@arm.com>, Gavin Shan <gshan@redhat.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: Re: [RESEND PATCH 0/3] arm_mpam: resctrl: Fixes for v7.1-rc1
Message-ID: <aeY1F_QL-vLeDgRa@arm.com>
References: <20260420140516.3892820-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420140516.3892820-1-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_071558_747206_50D8E0BF 
X-CRM114-Status: UNSURE (   9.56  )
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

On Mon, Apr 20, 2026 at 03:05:13PM +0100, James Morse wrote:
> This series is the collected fixes for MPAM series in arm64/for-next/core.
> 
> These fix a unmount->remount problem with the CDP emulation,
> an uninitialised variable and a checker warning.
> 
> If its easier, there is a branch here:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/glue/v7.0-rc3

I pulled the mpam/glue/v7.0-rc3+fixes into arm64 for-next/core.

Thanks!

-- 
Catalin

