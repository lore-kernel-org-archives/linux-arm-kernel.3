Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBC2CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGzjoGRngmrp9+h+OTQBYk71JiUSRMd+oUnpbtOnxvs=; b=4xx1lllps5+H+Xc2UxBBOLaMl8
	NjRPjbV78dsH7VVP+5uLvRmh2IiGxZtv2AjNz9z4FywuGGtZVUeEWWK0/kHgnHM2FCD0OItY/4pgP
	ExzxsXVyJuoMamZQEj1AeH9anbyV7YOasPnel34tdgYFqfvhMoWuVbxe0x4GZYj/oTx989W2KGVQb
	GytvkkoxyVfR6iO4oKH3hJzyZZHssgSxEjA0LL10OKQFXSFVXR/GogLOvIXRk8Z0DVLYshQlw6XPc
	+m7d5Oj15xLC9MlL+7VMUtQ2an3v5reFwKgBNkZ8dncOVcuM1YFQ/a3MMjzHhah5J4BcXO6ekE2in
	s9oBQJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPyZ-0000000F7TG-1CJM;
	Sun, 04 Oct 2026 17:26:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPyX-0000000F7T4-1gwp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 17:26:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9199E408C5;
	Sun,  4 Oct 2026 17:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD921F000FF;
	Sun,  4 Oct 2026 17:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791134772;
	bh=CGzjoGRngmrp9+h+OTQBYk71JiUSRMd+oUnpbtOnxvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oqK1BV984ka5jeJ6+IMsiwSccplxqz4q8U9rZaRRyw0wmYmNQ94VXGQna7T3SIzsR
	 n7jtMgv/5jLlbK+hE8qffQdJXuSzH9s5DxDS/kT4YQLLtbpc9xzXnKiy+OfzNzO0Mh
	 IjKrD1vsSmwrcDuBcS55NuW53/JLSM4aiNoy+FRz1scvhfG909BxxUlkT1s9klKsin
	 AjTCHgNerrxvl+Aa0ejb7dxfV7oR3GyGZbzL6QRTAkxHcqUnwA+pxQTa3qk1UwJBJU
	 MUSKxz2m+aIM52o2qjQGOKRcYgPCCSpYGfuqHxja5q8WP2YPvSrFo3gED+HUAhOLsN
	 EZ3SwCK/uKU1Q==
Date: Sun, 4 Oct 2026 18:26:08 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mark.rutland@arm.com, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf/arm_cspmu: Add Arm system PMU
Message-ID: <asKMMAvyAbT5mGJd@willie-the-truck>
References: <84a65061841c8870375ee6b0621dd3f61651763d.1788970980.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84a65061841c8870375ee6b0621dd3f61651763d.1788970980.git.robin.murphy@arm.com>
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

On Wed, Sep 09, 2026 at 05:23:00PM +0100, Robin Murphy wrote:
> Arm's latest Compute Subsystems and SoCs are using a common PMU block
> in various places which can mostly just be driven as a generic 64-bit
> CoreSight PMU, but does have an IMP-DEF register for additional
> filtering. The details of event and filter encodings depend on the
> particular PMU instance, so are left to the higher level Arm Telemetry
> Solution tooling.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/perf/arm_cspmu/Kconfig      |  7 +++
>  drivers/perf/arm_cspmu/Makefile     |  1 +
>  drivers/perf/arm_cspmu/arm_cspmu.c  |  7 +++
>  drivers/perf/arm_cspmu/arm_cspmu.h  |  1 +
>  drivers/perf/arm_cspmu/arm_syspmu.c | 67 +++++++++++++++++++++++++++++
>  5 files changed, 83 insertions(+)
>  create mode 100644 drivers/perf/arm_cspmu/arm_syspmu.c

Sashiko failed to apply this and so did I :/

What is it based on?

Will

