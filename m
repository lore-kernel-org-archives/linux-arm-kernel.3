Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1627C54EDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nSCGdmaulCKJ2pzYxAkTV6AdwVp2ZxR6mxEIPsaXQE=; b=Dc/jIdwoqH6zEWdpbeknYM0kxN
	BVkwfE/qvwW1jNR7yOG+3JrQEX415h5MaJWV+5m5rhzUi6gvNQSdMcDOfCt6xSczOqRosEx+Mlkxe
	trVyB3/NOAIK7kOQhJqXh0TBo56j5AAydIZjWjZ7I2TX0ucb3J8pzz02KOEP3nXU/eqqvrCk3Zh82
	bWM1kMSD22H5UMsubWF415BgIOF1NB4NnwtN6pVs2SzBtGNRtIQhTThLwpbh99wTv/sTQcvinZsHl
	VLsLnzYarzyWIhPs3L+lhTGiqbUZ+FR4T0hbkSjzZ9/qeDSD+mnQfvXJr9RA0CeVSd5PI+TxEwbcs
	CG2+OLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOFM-00000003Ngr-1SKX;
	Fri, 23 May 2025 08:59:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOD7-00000003NMD-2DGd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 08:57:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00CFB1758;
	Fri, 23 May 2025 01:56:46 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10B213F5A1;
	Fri, 23 May 2025 01:56:59 -0700 (PDT)
Date: Fri, 23 May 2025 09:56:55 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
Message-ID: <20250523085655.GD2566836@e132581.arm.com>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_015701_607873_A0E557F6 
X-CRM114-Status: GOOD (  13.86  )
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

On Fri, May 23, 2025 at 04:08:58PM +0800, Yuanfang Zhang wrote:

[...]

> >> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
> >> +{
> >> +    int atid;
> >> +
> >> +    atid = coresight_trace_id_get_system_id();
> >> +    if (atid < 0)
> >> +        return atid;
> >> +
> >> +    drvdata->atid = atid;
> > 
> > Do you need to expose this via sysfs ? Otherwise, how can you map
> > a trace to a TNOC at decoding ?
> 
> yes, need to expose the atid via sysfs, but it better to expose it on source driver which connect with
> this TNOC. so dont expose it on this driver.

If so, why the ID is not maintained in coresight_path::trace_id?

A source device allocates ID and maintains in coresight path, then
this ID is passed (when enabling the link) to TNOC driver to consume it.

Thanks,
Leo

