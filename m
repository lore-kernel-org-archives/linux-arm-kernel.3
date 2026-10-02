Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE3ACA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETDYezF4EpY1m9GnmHpZyhi9wtCLVYIki1caJa8ooMM=; b=cW2Y6ZrNFMGy+aemMmBsWIXRAQ
	DrWelL63SWLkr+M3fffkjj7SlqJLfrGMaT00VXSMJHmAsULn2E/tq7hRP6SQTr4sjgcTZEvxc/xbG
	RW7z6NY6wy/K7f54qED5bctR6LFP1e7Z6d0qb6byWvPdnUQnx/1us1BQ45wjiSFseNhuXiH3DnTe3
	h0KDfz/9/w8/H1sOTzgqtlN240qD/8dfGUX4FRQnMdan1R9b6gMprn0WqEDQKJiS2ljHEwB1jbq8B
	fDn+vD1RhJoBBr+L7zl3jL/rt7A93XkN8xpKjnjbKpLechzKXPC7FUwUv8BWJXDNDHEwuRWJL+CYU
	/JgQXjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfGQ-0000000Bw6g-44sx;
	Fri, 02 Oct 2026 15:33:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfGO-0000000Bw6E-0UQ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:33:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F3B0143D;
	Fri,  2 Oct 2026 08:33:27 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFA0D3F85F;
	Fri,  2 Oct 2026 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790955211; bh=Of1LVdGYAcnWOg5CtjpXKTVkgH1AL/P/GtNpU5IDVu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IofnOcwQDxU0Xd8A77BfWJmyj84GyW8z1sL/apmxHWDvrMzCv1SgRomFH6VU0JzGd
	 XR3EYkaI2c2n1e69pwrr7gT4MTyO7NSl2u8Wzg5wi7StDh4T8Hn3Ms2AqdCIv7vV+C
	 5p4TYWJCuvX4KQ/LLI7AMfi1I5au65Pja5pdupVY=
Date: Fri, 2 Oct 2026 16:33:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>, Michal Simek <michal.simek@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
Message-ID: <20261002153328.GE1208404@e132581.arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
 <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083332_205573_F2B32A14 
X-CRM114-Status: GOOD (  14.43  )
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

On Fri, Oct 02, 2026 at 06:21:36PM +0300, Dmitry Baryshkov wrote:
> On Fri, Oct 02, 2026 at 04:07:24PM +0100, Leo Yan wrote:
> > The APQ8064 static replicator has no registers to program, so it
> > does not need an APB clock. Remove its RPM_QDSS_CLK reference.
> > Other programmable CoreSight devices keep their clock references.
> 
> QDSS clock is not actually the APB one, it's required for the coresight
> (or to access some of the regs) if I remember correctly.

If so, it might be atclk for clocking the module rather than the
register interface. Could you confirm this?

The replicator is just a middle component on the data path. I read
that it shares the same clock with other CoreSight components, so it
should still be safe to remove the clock from the replicator node,
as other components on the path will ensure that the clock is enabled.

Thanks,
Leo

