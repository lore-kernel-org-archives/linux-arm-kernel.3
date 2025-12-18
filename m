Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ED4D6ACE7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 11:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GgEGNIgDPOJ8Rpf9B88k6d+kWmu+f9Lca07EFk6KFM=; b=nA2WXLyFYkBsxlnH7i+9PGjySe
	xDN7iAUR1vK73TlgklfCNsAbyGNo1GPQwXQ2MQslD1brDAwRWf7VNpjTE+6NckuYvPh65y9WXoMhP
	p7H2Fioe23eDdRBgtZy5LRWnN4WMTM4St8HDqWYIvNzHuC22Kus3ufErntCH5dC3WZjwfj7KF++4r
	ai5ImpJqR4fUS9/vfNLs+jK/LN18EL3cVTs1nhABWhxu8pCw3xcOpCxJ6XLwUA+3xX1AiGulBYQwQ
	a2Gfomxyl+euKQwMYoDAvP8rMltDIm74Cm2fRN++AHxRO3jI0TjIag72edt/ieyz45aZrERLhNTl9
	qWJdUXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCFy-00000008Jz1-0G4Y;
	Thu, 18 Dec 2025 11:33:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCFv-00000008JyS-0ym2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 11:33:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D30C8FEC;
	Thu, 18 Dec 2025 03:33:04 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BAF13F73F;
	Thu, 18 Dec 2025 03:33:08 -0800 (PST)
Date: Thu, 18 Dec 2025 11:33:05 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster
 funnel/replicator/tmc support
Message-ID: <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_033315_316544_73D6E834 
X-CRM114-Status: GOOD (  14.19  )
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

On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
> This patch series adds support for CoreSight components local to CPU clusters,
> including funnel, replicator, and TMC, which reside within CPU cluster power
> domains. These components require special handling due to power domain
> constraints.
> 

Could you clarify why PSCI-based power domains associated with clusters in
domain-idle-states cannot address these requirements, given that PSCI CPU-idle
OSI mode was originally intended to support them? My understanding of this
patch series is that OSI mode is unable to do so, which, if accurate, appears
to be a flaw that should be corrected.

> Unlike system-level CoreSight devices, these components share the CPU cluster's
> power domain. When the cluster enters low-power mode (LPM), their registers
> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
> out of LPM, making standard register access unreliable.
> 

Are these devices the only ones on the system that are uniquely bound to
cluster-level power domains? If not, what additional devices share this
dependency so that we can understand how they are managed in comparison?

> To address this, the series introduces:
> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>   device tree property.

Really, no please.

-- 
Regards,
Sudeep

