Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F7BC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBpbsi5FzX0qyeI5y08KpDoYRn3UiM6EZGXZ0C5P48Q=; b=BcaWEs9Gv7HpXM9SJChvzfGcIg
	B+WDqxMw1DP0G0Qvr6gAt5IwT6QYxtwc/czeZS+mGmrdGierZ5EMvJlTCNUoeGNuhCL7mkqeeynup
	8uWy4fqo09GGgLhixFzworAxKFAdkkxNAGr0qqPxeKKPcGq6VkamdIrCRiZfNI/05SitUC3GizHOo
	Hd3/FjlTEjGJlFhrbmzQXgd7geFlO7dV89JpHoynjQL24EmRw7ZtY1DZ5jzW8ZWGeIV2q60DRl6J/
	kChf2D9pW9MLVRmLNlvfFB9/g5KxBtKg0NNGvrJrAWu27NIwYo2IuGWrrhuvRKn+H2Bx6mheRsZxB
	nv61mo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCym-0000000EscM-19CU;
	Mon, 29 Jun 2026 14:28:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCyk-0000000Esbk-2B47
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:28:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA28416A3;
	Mon, 29 Jun 2026 07:28:46 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C80543F905;
	Mon, 29 Jun 2026 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782743331; bh=rVIpgPhieX/hjC3o46WFkzWX0pZQG5WKKAO87ImTv3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQzriMHvEelb+GRgBs6E+iOc+LzatJGj0P3ERA+k3ICsHUL0BLFmbopMkhXEEEjFM
	 GI6HS3b+ecuLQ2wXtZxrj3DKrOouxsynsOan44cbs9/dmaqesyIJTMT9ptNsqnY4ao
	 bNr/i7lLu4m6jI0q4LwManSJOY/hukQweyviJSdg=
Date: Mon, 29 Jun 2026 15:28:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Message-ID: <20260629142848.GB1812158@e132581.arm.com>
References: <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_072854_595666_6404CE70 
X-CRM114-Status: GOOD (  15.43  )
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

On Mon, Jun 29, 2026 at 10:08:17AM +0800, Jie Gan wrote:

[...]

> Can I fix the issue by adding "arm,primecell-periphid" property. That's
> would be the best temp solution as it avoids breaking the original design of
> both the TraceNoC AMBA driver and interconnect TraceNoC platform driver.

Before proceeding with the "arm,primecell-periphid" property, could you
clarify a bit:

  - For an interconnect TraceNoC, what would be the consequence of
    enabling ATID? Would it simply be a no-op, or are there any side
    effects? Or is the concern that the trace IDs could be exhausted?

  - How can you guarantee that a interconnect TraceNoC will never
    require ATID in the future?

> The TraceNoC device here must be treated as an AMBA device and I am
> continuing to investigate the issue with our hardware team.

> We aim to fix it from hardware perspetive for existing platforms if possible
> and ensure it is fixed in future platforms.

I'm concerned that all of use end up repeatedly fixing similar issues
whenever hardware configurations change or modules are reused in
different topologies.

For example, if future platforms may require ATID support for an
interconnect TraceNoC, then the issue will pop up again.

Thanks,
Leo

