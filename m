Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0B9CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W12XDrvw7f+AKX3qBwyOQ7szCXeUEBebRu6XXPPodDI=; b=X9mzOepA6qrC1pyRBR+Vlva/qC
	vajGpTBPO1uY3aTYRt5IPWwYZPNLZGjhMS+oNWifPUoOXL4r8lECgrQjp3UcOGasKkRtRcifi3Ijj
	ZvJTHUS2tmnHnSd4Q/F+q6F5wIz6ovipmCt9TEB2n5H5J0jXVtD0Xnn9XSqMZcq3ykT1jis8FjJQz
	ej4SOFGS3hNJUXyPt5mh895yTWiHl2jI6KHnP1Ugha8G78B3K1vOyCP44Sq1lnSSbJBJl3cylQwu9
	SqCslCmygG/ziyyIOrnt35QQwJzWUc4u8Xg2hWTFg/PZp3B71fXc8xayVZk0GLYmQ6OgSTFE/Sdyg
	yRzE6P9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKqF-000000009Nk-1TST;
	Thu, 15 Oct 2026 12:45:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKqD-000000009Nc-3NcX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:45:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2433D439A2;
	Thu, 15 Oct 2026 12:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1743F1F000C4;
	Thu, 15 Oct 2026 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068349;
	bh=W12XDrvw7f+AKX3qBwyOQ7szCXeUEBebRu6XXPPodDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=le6uPVllewTN5EAXowJ8xOcxIlFmLfrEKnM516I8nrvzPao8bCK2e37+CtcQOsl4/
	 k8bW9nNY5M7YnHMBZVzcPr2bZi4YwV3FhwZKQ3s2CYPrIPvv3ZiRzL/M6I8vuzyQHL
	 FIz/KBhwqKcgiAPbu6ZlJwmOUvz+3eZOdEeHCZFZzs/Lyr7PQGsstQAaqq1cisNXqT
	 6iitL6D7/H12m1qFZLcTxKyhHt1hNm2QJPT+MQBze2+1X/sDC6EqADMmKpr7vLbZUb
	 kCcrp1HnFk/IooaG9cfXJ+Wtg+b4we+SfjCDbVAYYt/zJ+XiXx5j82UUR7h5G040yh
	 E9Fp29B444Icg==
Date: Thu, 15 Oct 2026 13:45:44 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mark.rutland@arm.com, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] perf/arm_cspmu: Add Arm system PMU
Message-ID: <atDK-H_Qrufjc2WW@willie-the-truck>
References: <222d98feab5ca2836fdef69fee9113f6f860167d.1791209460.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <222d98feab5ca2836fdef69fee9113f6f860167d.1791209460.git.robin.murphy@arm.com>
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

Hi Robin,

On Mon, Oct 05, 2026 at 03:11:00PM +0100, Robin Murphy wrote:
> Arm's latest Compute Subsystems and SoCs are using a common PMU block
> in various places which can mostly just be driven as a generic 64-bit
> CoreSight PMU, but does have an IMP-DEF register for additional
> filtering. The details of event and filter encodings depend on the
> particular PMU instance, so are left to the higher level Arm Telemetry
> Solution tooling.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v3: Fix 32-bit COMPILE_TEST to match arm_cspmu.c
> 
>  drivers/perf/arm_cspmu/Kconfig      |  7 +++
>  drivers/perf/arm_cspmu/Makefile     |  1 +
>  drivers/perf/arm_cspmu/arm_cspmu.c  |  7 +++
>  drivers/perf/arm_cspmu/arm_cspmu.h  |  1 +
>  drivers/perf/arm_cspmu/arm_syspmu.c | 67 +++++++++++++++++++++++++++++
>  5 files changed, 83 insertions(+)
>  create mode 100644 drivers/perf/arm_cspmu/arm_syspmu.c

Sorry, but with LPC last week and us now being at -rc7, this finalised
just a little too late for 7.4. I'll pick it up next cycle (but please
resend at -rc1 so I don't forget!).

Cheers,

Will

