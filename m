Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3FDC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqnGmArU6RNzZmnwadf2J/FpHlbermW/Jnu6jOuWXcw=; b=rS2VHFU0X47bpRM/h/ckEApEgT
	L8TjBdNHaZ82/uzF6E0LV/0amc+7Nt9r/Gfj9q4FLVX/9HBMShtq+EnDPT5x/42rfr7ZBvGaZDL9r
	NRAtv86zQ3/4BBp0fFNMuD5ENp4VVMviiI2M645Ng2ftXtxBLnB8rkTiNinOlHej0bTLUOT7iEMrz
	v6ud5mmfQIreaHc2yZfD5Zq3IYDG0R++aUuk3z1SWAU6M+1fFWt6D5UJqoOCdDMr1LP672Tnb1wvj
	96zJuuq4LnAlzgrj0IifHs6sgIWXLP+Sj2iHtPYciGKbtUbkGVMGrSihclXkroDXk61tWUZNA5xzT
	3mGlVxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbV7-00000002SiD-1Sli;
	Mon, 10 Mar 2025 11:40:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trauM-00000002MfS-1yAF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 11:02:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6670D153B;
	Mon, 10 Mar 2025 04:03:05 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CA943F5A1;
	Mon, 10 Mar 2025 04:02:53 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:02:51 +0000
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
Subject: Re: [PATCH v2 2/5] coresight: add coresight Trace NOC driver
Message-ID: <20250310110251.GC9682@e132581.arm.com>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>
 <20250227113910.GA2157064@e132581.arm.com>
 <c0848f24-26c4-4282-9813-1842c2a50c1e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0848f24-26c4-4282-9813-1842c2a50c1e@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_040254_558882_DB3CCDDE 
X-CRM114-Status: GOOD (  15.54  )
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

On Thu, Mar 06, 2025 at 04:22:20PM +0800, Yuanfang Zhang wrote:

[...]

> >> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
> >> +{
> >> +       int atid;
> >> +
> >> +       atid = coresight_trace_id_get_system_id();
> >> +       if (atid < 0)
> >> +               return atid;
> >> +
> >> +       drvdata->atid = atid;
> >> +
> >> +       drvdata->freq_type = FREQ_TS;
> > 
> > I don't see anywhere uses FREQ.  Please remove the unused definitions
> > and related code.
>
> it is used in trace_noc_enable_hw().

I understood some macros and definitions are used by seqential patches.

A good practice is code should be added only when they are used.  This
can allow every patch in neat way and easier for review.

Thanks,
Leo

> > 
> >> +       drvdata->flag_type = FLAG;
> > 
> > FLAG_TS is not used in the driver as well.  Remove it.
> it is used in trace_noc_enable_hw().

