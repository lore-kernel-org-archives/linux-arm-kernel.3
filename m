Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81C2C3ABCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+N5DvPuQMU/7dBpX0ejA1VZYd0oXGoPVLUrhqi6CG8=; b=mhDpkEyIHTwqGVKUpSG9whd6yl
	oRmpU4T9x4pugh3LKtL3YsbHCp//OYTKhsOl0y4m3zOMKK4xgYWtO0P0CrrbwtsdtLizHsPI8oq3W
	zs5zV5AMPwyWTKmoS0l0BO2NbCfbeuo1M1T0xVjoPWZDmAN7KpRZGLEVlk41oVKUyNFQ6zgosvOLO
	RQ1Bm4B4uRHIcNqjCwRd+fHZ/mDLSE48MNTD74IR8oFGekJmnTw0SSRxE6fdfP/zOY2iGhSDnuxr6
	G2n5V45u6tna0eJRyifY1IQiVafkIN7M9aKJZSwTP85ZvXbLvM6roj077mzKrHsajAHWPMyh4AVJp
	Pf9w+FvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vf-00000001MsG-2R6u;
	Thu, 08 May 2025 17:21:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3oN-00000001F97-22wt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 16:09:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCC3D1E2F;
	Thu,  8 May 2025 09:09:14 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5A973F5A1;
	Thu,  8 May 2025 09:09:24 -0700 (PDT)
Date: Thu, 8 May 2025 17:09:20 +0100
From: Leo Yan <leo.yan@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 1/3] arm64: dts: fvp: Add CPU idle states for Rev C model
Message-ID: <20250508160920.GF177796@e132581.arm.com>
References: <20250508103225.354925-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508103225.354925-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_090927_565499_C2423761 
X-CRM114-Status: GOOD (  13.04  )
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

Hi Sudeep,

On Thu, May 08, 2025 at 11:32:23AM +0100, Sudeep Holla wrote:
> Add CPU idle state definitions to the FVP Rev C device tree to enable
> support for CPU lower power modes. This allows the system to properly
> enter low power states during idle. It is disabled by default as it is
> know to impact performance on the models.
> 
> Note that the power_state parameter(arm,psci-suspend-param) doesn't use
> the Extended StateID format for compatibility reasons on FVP.
> 
> Tested on the FVP Rev C model with PSCI support enabled firmware.

I verified this series and confirmed the CPUIdle states work well (I
manually removed the status = "disabled" in idle state nodes).

Tested-by: Leo Yan <leo.yan@arm.com>

Just a nitpick, we should firstly add the timer node and then add the
idle state nodes, as CPUIdle is dependent on broadcast timer.

As the idle states are disabled by default, current patch ordering
would be fine as well.

Thanks,
Leo

