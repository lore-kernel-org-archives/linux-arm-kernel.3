Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEA1CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zZ8yCx6f40u5UbR/KC2bp/Rqga9aW94LHNUdhdITV0=; b=l+VsemSL5A7pZ9uaphtdy9OX6G
	1mdR4Fr4j10IuxFqWCS1vBTICN4OhrbzUuYoEifHzqEAoZ0k7/lpTM2zk6/rgagZOP7tHMfrPcsdw
	AwycHzpb/byoRu9lczxPzX47ndpLfuvlpzWIoiz+L8PpIW4HN5gDk+3k6+4OqvEEDiysPY3qi4Lxy
	yUwPpzHarfuANlKfuw+VdJpvCW2WPMcr5pAA3A0MwEBX2Eu4TfD1BWpvd4tRWoCnw9DM97bDK3hc6
	kkdc/5qspbsegtnjPpEJTx9E+0iJC3RXCZAaAgEa5FBreap3fjR0ko5tIw4Gj49WbZXUAPrp5UDF5
	LomUK8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonnY-0000000Ehym-31EF;
	Wed, 20 Aug 2025 18:44:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokTs-0000000ECnw-27v5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:12:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C892F1D31;
	Wed, 20 Aug 2025 08:11:55 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AC2E3F738;
	Wed, 20 Aug 2025 08:12:00 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:11:57 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 0/5] initialize SCTRL2_ELx
Message-ID: <aKXlvcqM90197MiJ@e133380.arm.com>
References: <20250813120118.3953541-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813120118.3953541-1-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_081204_590531_7C9FB29A 
X-CRM114-Status: GOOD (  16.31  )
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

Hi,

On Wed, Aug 13, 2025 at 01:01:13PM +0100, Yeoreum Yun wrote:
> This series introduces initial support for the SCTLR2_ELx registers in Linux.
> The feature is optional starting from ARMv8.8/ARMv9.3,
> and becomes mandatory from ARMv8.9/ARMv9.4.
> 
> Currently, Linux has no strict need to modify SCTLR2_ELx—
> at least assuming that firmware initializes
> these registers to reasonable defaults.
> 
> However, several upcoming architectural features will require configuring
> control bits in these registers.
> Notable examples include FEAT_PAuth_LR and FEAT_CPA2.

This looks OK overall to me, apart from some confusion between
SCTLR_ELx and SCTLR2_ELx in patch 2 (see my comments there).

This code will need to be tested somehow.  Do you have any thoughts on
this?  Hacking the bootwrapper, KVM and/or kvmtool may provide a way of
checking what happens when the kernel is entered with "wrong" initial
values in relevant bits (HRCX_EL2.SCTLR2En, SCTLR2_EL{1,2}).


Regarding the patch history:

> Patch History
> ==============
> from v2 to v3:
>   - rewrite commit messages.
>   - fix missing SCTLR2_EL2 synchonization at boot.
>   - https://lore.kernel.org/all/20250811163340.1561893-1-yeoreum.yun@arm.com/
> 
> from v1 to v2:
>   - rebase to v6.17-rc1
>   - https://lore.kernel.org/all/20250804121724.3681531-1-yeoreum.yun@arm.com/

Going forwards, can you try to make sure that significant changes to
the series are all mentioned here?

I didn't have time to look at v2, and in the meantime half of the
series disappeared and a chunk of code was moved from one patch to
another.  I saves reviewers some time and effort if they do not have to
dig through previous review conversations in order to understand what
changed between versions of a series.

(No need to mention every trivial change, though.)

Cheers
---Dave

