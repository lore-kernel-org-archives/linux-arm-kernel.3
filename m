Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341C1CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciFeC//gKNJFSuZ7EE4bGjGrRM+EG0OVJlnadr3EU9E=; b=RhcAZ47YQGCoYjegMW8ilSPgwQ
	tx/hcb4hVAc+SUuZv++tRMRehKuzPVW0Ol5Pz98SR/zL/54j8fiXlZ2N8CiYlFu6XxNqVTK5jJNOZ
	PS1K13Bnw2tqHeIsGH8BhINvysKp0E1/2gjbL63kR1xik9lZGj4Wee5Fnugth2iwTu1uz7WzNvn4J
	RY9rMQJsIp9PoU7bWexnJQgT92UR2fcNq6k2wc704vAi7ePhwwZ9YDTql40GdRABcvxZIC4j5wOtW
	cCDf0HyqzdT87eSL5xi2fkpQkXwcNhKTe+2BbQrAP6gs8bPWgpBMATWLjrt7uYXIP1BzqibAvEfZ3
	3aNWae5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCH2D-00000009GH5-3v1v;
	Thu, 01 Oct 2026 13:41:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCH2B-00000009GGR-0m5g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:41:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED0A0497;
	Thu,  1 Oct 2026 06:41:09 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBA2F3F86F;
	Thu,  1 Oct 2026 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790862073; bh=d7AaXtrsxUp4jy1qMsWbSpDXTjmvvtJXht/l2mnYE44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGYfB0WAVtfZWvTeCQBWksyS91YtQ74lEIFWQ8sNun2ofaLMUMp8hQ9WNyqVP4h5k
	 s81P3n4nALu5TwlI41Qnyk0ALTMXhfUoIiJy8VP1f9jQ8FM51EyeDcjXarn7ilnFmj
	 tkI5lITjC1x2l5boC/2HxI4CGJI/iLTwjpCWAAMA=
Date: Thu, 1 Oct 2026 14:41:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Message-ID: <20261001134110.GM14479@e132581.arm.com>
References: <20260921232834.3138571-1-robh@kernel.org>
 <20261001100455.GL14479@e132581.arm.com>
 <20261001120444.GA1048975-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001120444.GA1048975-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_064115_275021_E61FE745 
X-CRM114-Status: GOOD (  19.25  )
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

On Thu, Oct 01, 2026 at 07:04:44AM -0500, Rob Herring wrote:

[...]

> > The question is that a static funnel does not need to program any
> > registers, so in theory it should only need atclk as the module's core
> > clock, but not the APB programming clock (apb_pclk).
> >
> > Maybe I did not get this right when I initially enabled the static
> > funnel in hi3660-coresight.dtsi. We should probably remove pclk from the
> > static funnel node.
> 
> Yes. I suppose in theory it has some clock, but if pclk needed to be 
> enabled, it is shared with all the other coresight components and 
> enabled anyways. And there's no atclk defined, so 'clocks' can just 
> be removed. Can you send a patch to do that, and I'll drop this one.

Sure, I will prepare a patch for hi3660-coresight.dtsi.

> zynq7000 is even more of a mess I just noticed...

Agreed. It should bind to "arm,coresight-dynamic-funnel" instead.

However, I'm afraid the "dbg_trc" and "dbg_apb" clocks are never touched
by either the CoreSight driver or the AMBA driver after switching to the
dynamic funnel.  These clocks should therefore be removed from all
CoreSight nodes.

Thanks,
Leo

