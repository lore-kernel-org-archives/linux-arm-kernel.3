Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11F6C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2a0unVA6n3+j9fdh2NnbwBkFQJ7cIAUlFlVhNHAPQg=; b=Bv+9r5PSoh2wEDC9Zz8yFOQpD0
	q0jxgyWEe0hff/iNsWRj21rezHjxvMJXvE2mDlxc6MpNqxUPs55E+B+sieNyCHWr1nLkv3/nB/ATX
	rMyVcG23/cJoFebFVRoYY5xyd7Ak9jzLOfLOKlU0rjfM/tgnnNMzOVizWG6i6AM+3NTkxiILvmFp8
	e0pYeCj4t550BKH4hY/iEFyR1Y5sssztlSmhy4Be0saxFLYgeUg+gd+OUNLp8fa2LvFzStxh+aWqU
	TlJyMXzt30aGi1CGDsuw6KCsATis2dr0xEillp8yYuSea0fnkuIFP69zlVBymu01YMzbJhn4yNtKc
	MbcYMAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urv4K-0000000556e-1aNq;
	Fri, 29 Aug 2025 09:06:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruPO-00000004xq4-1qs9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:24:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C4721BCB;
	Fri, 29 Aug 2025 01:24:21 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 749083F694;
	Fri, 29 Aug 2025 01:24:29 -0700 (PDT)
Date: Fri, 29 Aug 2025 09:24:27 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
Message-ID: <20250829082427.GF745921@e132581.arm.com>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
 <20250828-itnoc-v3-2-f1b55dea7a27@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-itnoc-v3-2-f1b55dea7a27@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_012430_515607_E80D74B5 
X-CRM114-Status: GOOD (  11.30  )
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

On Thu, Aug 28, 2025 at 02:27:23AM -0700, Yuanfang Zhang wrote:

[...]

> @@ -51,12 +53,17 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>  {
>  	u32 val;
>  
> +	/* No valid ATID, simply enable the unit */
> +	if (drvdata->atid == -EOPNOTSUPP) {
> +		writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
> +		return;
> +	}
> +
>  	/* Set ATID */
>  	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
>  
>  	/* Set the data word count between 'SYNC' packets */
>  	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> -

Unintended change ?

>  	/* Set the Control register:
>  	 * - Set the FLAG packets to 'FLAG' packets
>  	 * - Set the FREQ packets to 'FREQ_TS' packets
> @@ -68,8 +75,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>  	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
>  	val |= TRACE_NOC_CTRL_FREQTYPE;
>  	val |= TRACE_NOC_CTRL_PORTEN;
> -

Ditto.

>  	writel(val, drvdata->base + TRACE_NOC_CTRL);
> +

Ditto.

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

