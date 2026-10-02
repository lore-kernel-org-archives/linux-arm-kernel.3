Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C317CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AErM8omXMbFoZXjDR1vI6e85Id/9tD2CVAQ5ngtsDBQ=; b=hjKiB6wmIRQArVM/tHWHcRVVi4
	lRJfESh7kJmg2th5BBrjThhoRda0NKZvPCudOtJKm4ome1pzrm+z/ruIZg3BZz/+VXjoyNzqi6inw
	KPtLdZOfOJzYEtOTSATMBI+ObMC+O3/6aXLUekN0yHeR2ygtbK4gLHErMZYuqMFHQ5UbTleuirHwv
	oNwbf3XwuYzn+p5pg1VokMlvUhaeRnuAD6OcSdT++Mv60N4UQQ93tDA+Nyyq3oG2ARVXR4/hsc2xi
	PKovKqd3+7t0aYeFFQnS3xOHaK0viloH3KVMhoyZZEm/wVCB0mIJlNgVKi6XjOVLqJMrjlviYgdTC
	luBqMJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiWz-0000000CLPF-1E8o;
	Fri, 02 Oct 2026 19:02:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiWw-0000000CLNp-1Bat
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:02:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41C642F;
	Fri,  2 Oct 2026 12:02:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C06093F86F;
	Fri,  2 Oct 2026 12:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790967769; bh=UYBbzaQgjB3Rj6OfM9lQuXgoeAs8jCyRhdc/dQIZf+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6kErPhW1j687ig4FMaPeuK1N4IbKj0WfhLHuj/sn2T0BKpa3Ocs85gICz/NHaslD
	 c5RmlezzpEUJ6KrktxVnT7UlqbU9Gnq+3O98rO41fs42KpXX41GTgE9Ultm/uF5sZD
	 eBW5tpBVJEkp7F7geISRc69nwBXBDBZcumuSGJ5M=
Date: Fri, 2 Oct 2026 20:02:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [GIT PULL/PATCH 00/27] MPAM driver changes for v7.4
Message-ID: <ar__1TPJaGlmJHqy@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_120250_365809_E5401AFF 
X-CRM114-Status: GOOD (  10.00  )
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

On Fri, Oct 02, 2026 at 06:39:13PM +0100, James Morse wrote:
> The following changes since commit eb0fde98fee407118bfcb10e38400494e0699201:
> 
>   arm64: mpam: Document when to set arm64.nompam (2026-10-01 17:00:43 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git tags/mpam/for-next/v7.4_v2
> 
> for you to fetch changes up to cb351e3f304b260fc2f11cca5ed819fc9ac7c46d:
> 
>   arm_mpam: detect and enable MPAM-Fb PCC support (2026-10-02 18:27:11 +0100)

Merged into the arm64 for-next/mpam branch (b4 gives a python stack dump
when I tried to use 'ty').

https://git.kernel.org/arm64/c/5415b256badbe1681183e85f42462fa01cf09c83

Thanks!

-- 
Catalin

