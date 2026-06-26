Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6091CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 15:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z17sULGnJSMf0U1rnv9nVUw6sWXxj/zvGggOMzk9Bfk=; b=P40RP3vArp9GHrNgaC2OZ4vWRx
	IuR15srPUEYq4v+yEeMnQVyfd9PRXDLmBIMFsJ1o3kUy9IF4ZK9ozEv64o8seH3QsQWVurOjmj8/c
	4AvZyIAGC10eB92ejD28gwC4CdnITSUqMisqdyJdEbwbpvvFXr0niRYKG/gO39Cq93ImJkER99W74
	Jsc7ERbFuAqpu9c/fMgURvvFrG9Id31RvfkqVDD9tMdtBRvDMYQy/VBPeiM/zfNSloORulLGBBCtR
	+lPRkkoHi0G2IcQDmstaYuhfom+mDyYUU+lPop108RmuFNyQiZUC+kMiFKnF5KpV132zsaWK4e1jE
	q2wxCZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8oW-0000000BZbB-1ES1;
	Fri, 26 Jun 2026 15:49:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8oU-0000000BZar-0zag
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 15:49:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2D681F37;
	Fri, 26 Jun 2026 08:49:47 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 006D03F632;
	Fri, 26 Jun 2026 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782488992; bh=F28JWrIedZ17+DHgzHvusZYYQKCC6LrQb+656X3FJ2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nec+1E15+1aCjiJ5Xk8YbKQ6EFSTYbImiCjfirtzZ8JYBXTo+MP/lt/ETlqmUG5ZT
	 sdzWJlK4cSG1kHt1aZ/5utQ+UC0ETSNkqPKyCP00E0RGab/4ORX5S39PZHDzgIo03/
	 FSkAfeJVxFE+bWlkmncC+HOLCLflESK/llmk8250=
Date: Fri, 26 Jun 2026 16:49:49 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Message-ID: <20260626154949.GA1812158@e132581.arm.com>
References: <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_084954_343149_47AB9EA9 
X-CRM114-Status: GOOD (  14.97  )
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

On Fri, Jun 26, 2026 at 08:09:58PM +0800, Jie Gan wrote:

[...]

> I have another proposal: what if we allocate the ATID in trace_noc_id() when
> the device does not already have a valid ATID?
> 
> Possible scenarios:
> 
> If the itnoc device is connected to a TPDM device (which has no ATID),
> trace_noc_id() will be invoked via coresight_path_assign_trace_id(), and a
> valid ATID can be allocated for the path.
> 
> If the itnoc device is connected to sources other than TPDM, trace_noc_id()
> will never be invoked, and therefore no ATID will be allocated for the
> device, saving resources.

TBH, I'm not sure I can make a judgement here, as I don't have enough
knowledge of the topology. And I'm not sure whether the listed
connections cover all possible cases.

I also found commit 5799dee92dc2:

 | This patch adds platform driver support for the CoreSight Interconnect
 | TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
 | from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
 | it does not have aggregation and ATID functionality.

With your proposal, wouldn't ATID be allocated for the interconnect
TNOC while being skipped for the Aggregator TNOC? That seems to
contradict the commit log.

Thanks,
Leo

