Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF7CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJh9yBvFY4EBaJbxooBBtangPspdnbiF6teNPDddWy8=; b=t2A0uB++4DVHb4PuCEVGZpGoBZ
	p/WBjFwM8V25PU8wIBHQE4RcrkfQfkrLm1WDR6yqvP2pwc86o3TKUtrQAJrVAhG82xO7PNUp2uV84
	k+9lzydjYhi1/faqfVpKelYbBt0S3iwERHeqq9tJcg7v/GCaNIldmRDxo2sxaR2m8px2NGygo1Ay+
	UQ4WAIMOz0VLURVHX9ptKz/k7aMION/fTuYEVvQYszaGi9T3PVnv4doVh2AKJkmhEkmOdBbtyNnLK
	VgGM6AjySuRR53gm28s9PvvVN/FoWTAOrLgOIuDnAmZnD+Q5pfdra4VUsqkJNha+wwGw1s1TtNZIB
	tXtAKhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbsF-00000002WSm-2tyu;
	Mon, 10 Mar 2025 12:04:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbay-00000002TQZ-3OTa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 11:46:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A643B1516;
	Mon, 10 Mar 2025 04:47:07 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEDD03F5A1;
	Mon, 10 Mar 2025 04:46:55 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:46:51 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, kernel@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/5] coresight-tnoc: add nodes to configure flush
Message-ID: <20250310114651.GD9682@e132581.arm.com>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-3-8afc6584afc5@quicinc.com>
 <20250227162349.GB2157064@e132581.arm.com>
 <7c702a81-fb6c-4399-8d7d-d8c4ad9a8c65@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c702a81-fb6c-4399-8d7d-d8c4ad9a8c65@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_044656_936083_2BBCEC83 
X-CRM114-Status: GOOD (  25.23  )
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

On Thu, Mar 06, 2025 at 04:39:27PM +0800, Yuanfang Zhang wrote:

[...]

> >> +static ssize_t flush_req_store(struct device *dev,
> >> +                              struct device_attribute *attr,
> >> +                              const char *buf,
> >> +                              size_t size)
> >> +{

...

> >> +       reg = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> >> +       reg = reg | TRACE_NOC_CTRL_FLUSHREQ;
> >> +       writel_relaxed(reg, drvdata->base + TRACE_NOC_CTRL);
> > 
> > How can userspace determine when to trigger a flush?
> It can be triggered under any circumstances.
> > 
> > Generally, a driver kicks off a flush operation for a hardware before
> > reading data from buffer or when disable a link path.  I don't know the
> > hardware mechanism of TNOC, but seems to me, it does not make sense to
> > let the userspace to trigger a hardware flush, given the userspace has
> > no knowledge for device's state.
>
> TNOC supports the aforementioned flush operation, and it also adds this
> flush functionality, allowing users to set the flush themselves.

I am still not convinced for providing knobs to allow userspace to
directly control hardware.

A low level driver should have sufficient information to know when and
how it triggers a flush.  E.g., CoreSight ETF (coresight-tmc-etf.c) can
act as a link, in this case, it calls the tmc_flush_and_stop() function
to flush its buffer when it is stopped.  A flushing is triggered when a
session is terminated (either is a perf session or a Sysfs session).

Why not TNOC driver do the flushing same as other drivers?  It can flush
the data before a hardware link is to be disabled.  I don't think flush
operations are required at any time.

Seems to me, exposing APIs to userspace for flushing operations also
will introduce potential security risk.  A malicious software might
attack system with triggering tons of flushing in short time.

> > Furthermore, based on my understanding for patch 02 and 03, the working
> > flow is also concerned me.  IIUC, you want to use the driver to create
> > a linkage and then use userspace program to poll state and trigger
> > flushing.  Could you explain why use this way for managing the device?
> > 
> TNOC support flush just like other links. This interface simply provides
> customers with an additional option to trigger the flush.

This is not true for Arm CoreSight components.  My understanding is Arm
CoreSight drivers never provides an API to userspace to manually trigger
flush operations.

Thanks,
Leo

