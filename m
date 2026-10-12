Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB24BCA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzQ8WFC4sNYwAEJyzPz1QylQ8G5FsVhU9K3fU5SkSN0=; b=B12SlwINJXDsfcvo3AozqavFeh
	VZnBSYvT/qJIuePcxVHSst5tzE5nwcR482qVCDldjXb6haPirtAHgfYfrZVtL+Qx+ZTAi88k6te0z
	JtHWmhdffwJ5qh+spGrXOpbfYDcoZ5vWv3HeWYxXV+KbKxoOL4ATdpWnkJDiJOk6hf3uFhvNUJSe6
	DW8ucNG7v+Qrkry267fjeo8WyO3DgoMulm7zVE40a0iSHWi9YVwXuJYpPmBWpCwKub0NeY/QsB3Gl
	KVgfOy9N3mTkzcQYkEGi8BkxhxJu8/X2rmLrp1uScKwqDRCqiQGvxJ6gssu4p6V7TGfHGei0DKBwh
	UggOCCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGItX-0000000AxmT-3jij;
	Mon, 12 Oct 2026 16:28:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGItV-0000000Axlr-3iwu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:28:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4466D169E;
	Mon, 12 Oct 2026 09:28:51 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 274433F673;
	Mon, 12 Oct 2026 09:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791822534; bh=gIJwf2heM9XCD/JqzbYgIt2MgD8ykDZ06NKl6r3wTEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7LPfNA7s8RoIZ3hI5+HCdI5KNciqvmLoKZPd7Smr9cADlUE6FWh94GlhN94SM8zE
	 08ufpKcftvWxkinUalIyA9KPb7gnmBMsNjtfJOoExmY0eaETYrlmN8ZnXoANAeztqa
	 nm3rC2OtKj+jd5UH4FWdu5latuwMyZHbrtyo5qAw=
Date: Mon, 12 Oct 2026 17:28:51 +0100
From: Leo Yan <leo.yan@arm.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: coresight: Limit static replicator
 to atclk
Message-ID: <20261012162851.GB26205@e132581.arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>
 <1128f456-ed6e-47ee-8dda-157af99cc404@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1128f456-ed6e-47ee-8dda-157af99cc404@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_092858_150654_FE36A660 
X-CRM114-Status: GOOD (  17.71  )
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

On Mon, Oct 12, 2026 at 02:35:37PM +0200, Michal Simek wrote:
> 
> 
> On 10/2/26 17:07, Leo Yan wrote:
> > Static replicators have no programmable registers and need no APB
> > programming clock.
> > 
> > The Zynq clock controller registers dbg_trc and dbg_apb and calls
> > clk_prepare_enable() for each gate the bootloader left on.
> 
> That's one bootloader behavior. If there is another bootloader that clocks
> can be simply disabled. I don't think there is any reason to depends on
> bootloader behavior. If there are clocks which has to be ON I can't see any
> reason not to drive them.

My reference to zynq_clk_setup() was to explain that this patch leaves
the existing management of dbg_trc and dbg_apb unchanged.

The CoreSight drivers do not request clocks named "dbg_trc" or "dbg_apb".
And removing those unused clock properties introduces no additional
dependence on the bootloader. Could you clarify how retaining these
entries addresses the bootloader concern?

> TRM page 741
> 
> Trace Port Clock The trace port clock is used to clock the TPIU and trace
> buffer when the MIO interface is chosen and must be twice the frequency of
> the desired TPIU clock. The TPIU clock frequency must be chosen to be fast
> enough to allow the trace port to keep up with the amount of data being
> traced, but slow enough to meet the dynamic characteristics of the data
> output buffers of the TPIU.

The quoted paragraph establishes a trace-clock requirement for the TPIU
and trace buffer, how does it identify the clock inputs of the funnel
and replicator?

Thanks,
Leo

