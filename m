Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F25CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsYpOJYvElDxLhD97/O7HisiKVPjxDxtquJ5SHA91hw=; b=z9GByTqHCO3hJhrMH6u/KlwKvW
	uLdbVzBiTqzgTLAUqC/8YdilXI5I+VxE5wjElevz045asC9YJ/V77TuMATx5Zb5JVwxPGGMqInIx+
	78g2P4Usm3Dfyr1u2QgOZ4Far7ngUjgKpEMEAaQSydWR2Jx/LUL3wnJgcpxoODewTQ6YipEC6cG8E
	5sO7jcerJ+jUXs+JQhIGwm0v3PsmtTxdjJ8jj89ltK/+Jf/UE4t4dnYXry4uzGZLf8ra6x6HVQStu
	3ySe//Z0+yutvCz33p2iRdxTttwqbOnWQ90ZYD/EMgVPAquAlO9z+BOqLHCpIZPshgFEcRh8UDnQn
	pSUmSFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLtX-00000001AvI-3ZIA;
	Thu, 18 Sep 2025 21:10:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLtS-00000001ArN-27OU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:10:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8AFF43697;
	Thu, 18 Sep 2025 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75444C4CEF0;
	Thu, 18 Sep 2025 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758229817;
	bh=SfrmeclEc845DEufwFnDd2g0X3XVeZyb0wqqBxUhQCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RAY9mHg53kI4TXwi98HCa+0ru3ZjlihjoNL/+IetPKADkPLtexpUy7ffe3Wr7HGlD
	 lCIQYQL6bflSluVr4jmQlCba6Ka77AEe84TAgwX1FK380uHdl8JShHEpOQyxVwWqgD
	 P14FVJKMX+DLd6qAHZQ+kMvvXTLmIFktbv/+ZXUe7PnoxEiOX3QTdayQmqggHlGdfI
	 9wClpVuN4db00NAUdXEO/AWy4toEbnT+B3l/lwzaqKMeB2AxnF/65q764WNMibwHmW
	 NqbAfTdPWY4pnV8fyhvtVlUKQPipihT8xmyLlUrKzNpg2J34dpLV5+lLsgvFrFIp9Q
	 wTYUim216cLKw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	james.morse@arm.com
Subject: Re: [PATCH] arm64: cputype: Remove duplicate Cortex-X1C definitions
Date: Thu, 18 Sep 2025 22:10:05 +0100
Message-Id: <175821431090.3516371.5319873858810570585.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250918141131.2358048-1-mark.rutland@arm.com>
References: <20250918141131.2358048-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141018_570058_B8B3D8FF 
X-CRM114-Status: UNSURE (   8.36  )
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

On Thu, 18 Sep 2025 15:11:31 +0100, Mark Rutland wrote:
> We currently have duplicate definitions for ARM_CPU_PART_CORTEX_X1C and
> MIDR_CORTEX_X1C as a result of commits:
> 
>   58d245e03c324d08 ("arm64: cputype: Add Cortex-X1C definitions")
>   efe676a1a7554219 ("arm64: proton-pack: Add new CPUs 'k' values for branch mitigation")
> 
> Due to inconsistent sorting when adding entries, there was no textual
> conflict between the two patches.
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64: cputype: Remove duplicate Cortex-X1C definitions
      https://git.kernel.org/arm64/c/52b49bd6de29

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

