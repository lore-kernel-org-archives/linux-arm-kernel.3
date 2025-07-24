Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC22C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCg+1QoRbgtlHKqHHRGHpdwt2kaPrsylpaRAX7tlZ98=; b=IYXxWia8ijl92jiLY+FfTKIB5i
	W1w/0aAKQg6NcAITeuX9YpFCi1XdUfRphXoPo3oYKoQ9Dhu6yy63SBr6HLaANn6omjEiyZJdoz/KN
	D/q7akjy3XXQX5OtEWuwxOgoDUbDgDjLPu/smFymWgvjjgA6d5+OGpif+cWf8uR4PR8m2RkXSDC5m
	i3x8s2vMSGvfIoSGzG8PXXvoRHFlLQV7EY6R4B6j4veFT1VCELRhFpzSKfKkW62DLj4iqKnkj2S/J
	HtRi6+DjMAlor8VFRnwfgKhmaGOINMb0brjMBOnMXvhqukMpZstbyuI77if3W/qpuqU6XRREXd7/I
	+jAmz64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0o6-00000008Dmf-1PUQ;
	Thu, 24 Jul 2025 18:36:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf03L-000000089a4-10U9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 17:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZCg+1QoRbgtlHKqHHRGHpdwt2kaPrsylpaRAX7tlZ98=; b=kSRcuRqp2hSV2mCRQ5JKkdZmnI
	rChDz5dy7d9lgGVJ8iIjVuUvhVEi6Fj+1IhO1mNpVSnTSKrVDMuJBo5TxayvowmGemNxdNuWfx0GV
	3Cgf65hQMP8zGV5ajpGa6GN/K9sJS1XqkQyEQQfPTOw8g09CWvnc+duS64f33U8AklDHI1SlKXz4H
	4UOybKFir40fJsuqS68elFYqRNl5t4UDm0RRr2LMvzFwWtS0qtl2Xqtw2W6u08WH2SncRLmJ/Gz3e
	rVwf2vEn32V13KSb2CqvK5TAbTuZ1zW89R/mg9y2a/XCNj/65vE/jNeMXkGlpOj3Gozm+wfbJgCo6
	vP4mgNRg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40504)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uf014-0003co-15;
	Thu, 24 Jul 2025 18:46:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uf00z-0000v7-0L;
	Thu, 24 Jul 2025 18:45:57 +0100
Date: Thu, 24 Jul 2025 18:45:56 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: ardb@kernel.org, linus.walleij@linaro.org, ebiggers@google.com,
	nathan@kernel.org, lumag@kernel.org, dave@vasilevsky.ca,
	ruanjinjie@huawei.com, kees@kernel.org, liuyuntao12@huawei.com,
	linux-arm-kernel@lists.infradead.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: allow single CPU configuration by adjusting NR_CPUS
 range and defaults
Message-ID: <aIJxVDBXyFgrz8AV@shell.armlinux.org.uk>
References: <20250724172603.18701-1-suchitkarunakaran@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724172603.18701-1-suchitkarunakaran@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_104823_280519_F30BC6AE 
X-CRM114-Status: GOOD (  10.86  )
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

On Thu, Jul 24, 2025 at 10:56:03PM +0530, Suchit Karunakaran wrote:
> Previously, the NR_CPUS config for ARM required a minimum of 2 CPUs.
> This patch changes the minimum NR_CPUS to 1 when SMP is not enabled,
> sets range to exactly 1 if !SMP, allowing only a single CPU setting and
> adds conditional defaults:
>     - default to 1 if SMP is disabled (uniprocessor)
>     - default to 4 if SMP is enabled (multiprocessor)
> 
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>

This hasn't been tested. NR_CPUS depends on SMP, so if SMP is not
enabled, then NR_CPUS doesn't exist in the configuration. Therefore,
providing a default for !SMP is meaningless. 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

