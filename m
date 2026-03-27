Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B70B10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5cpVuE7JFBSKHAktOaUZYYU5y78mpHsURTy3x5yask=; b=bfePgaaK7jQWlmB661XFbktC8w
	I9LB+Xi2J9K5N5t5o1RZPHnSXgqtLDkcbW+d7uAeyXNM2WuSYSVvbLb7CCnKbYUxObargDgUCflXI
	FpvRCI+qpG3+z7I8kUzabCFnC545DxWXC3Fljt9qQ1QqTzQhk29zZgKcvt3zVmqjXeZvrpcNKMnp9
	4VUb3/71m4wmkxZ2jUO+RUcbBSaHzGNsSwTHG8vcbF4wJMK9O8hklpYgPiFmBosZfB68qA2dFjZnI
	CowAoZZpxdOJhS0WuJzeyVJJeWZxdQTRxGs51+Nn0IbePbh9hiw8iPy/bpuo0QiYjeYdKa+Xk+eCW
	rlkaHsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cj5-000000085YZ-0wif;
	Fri, 27 Mar 2026 19:20:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cj3-000000085Y7-0P5G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:20:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A876939E7;
	Fri, 27 Mar 2026 12:20:01 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 815223F99C;
	Fri, 27 Mar 2026 12:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774639207; bh=5575KU5XG6MVtCmU8zgQI+IGm8GYYxyM/jF8PfV0Hzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JE0ey5kcgJ3VmeFK+o5i1Onwc6sUhe4xjQZk/AdEw8nlEancgRc+rOlCqYuftaq+o
	 HPmg5yBjWRiEbvASuOMztA79CJ6uxkBzKPh2k/AY/AFHZ9NndFJjeZqXCCqMBhsi3t
	 4lYTTSAyeW6+44VLLN2cavn13WnEZCL5hGblBjfk=
Date: Fri, 27 Mar 2026 19:20:02 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Describe TTBR1_BADDR_4852_OFFSET
Message-ID: <177463910134.2669909.16929042546490313397.b4-ty@arm.com>
References: <20260225064028.1525192-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225064028.1525192-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_122009_193276_23E75D37 
X-CRM114-Status: UNSURE (   8.70  )
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

On Wed, 25 Feb 2026 06:40:28 +0000, Anshuman Khandual wrote:
> TTBR1_BADDR_4852_OFFSET is a constant offset which gets added into kernel
> page table physical address for TTBR1_EL1 when kernel is build for 52 bit
> VA but found to be running on 48 bit VA capable system. Although there is
> no explanation on how the macro is computed.
> 
> Describe TTBR1_BADDR_4852_OFFSET computation in detail via deriving from
> all required parameters involved thus improving clarity and readability.
> 
> [...]

Applied to arm64 (for-next/ttbr-macros-cleanup), thanks!

[1/1] arm64/mm: Describe TTBR1_BADDR_4852_OFFSET
      (no commit info, script got confused for some reason)

-- 
Catalin

