Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B9CC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCKaYh/Mru80v/h7RVrN8BG3lyhqMINhUP3Pv7Z5Hhk=; b=Gx/DTCmso4FZzo4HCPCQIpr4gs
	8PyANjRGw50JD1QJAbNL6J7coCxSckB5+EOSGKjB9nIcEwVQFauxYwxmohfJWgqquN6tEaAbd7t4t
	BbD3kIm4JHKTD8qN4jpVkkOGCS6JpSU8jmNnJmegUBSBPwN/VxC6q7pYxYVrxVC2PJSuih7azezrS
	xHEvDgB3Rqd/SUhKnZO98JeGxnIwPJDbXYe2TtL5eLk7/ptAzkxzwKyAlj7uHsj4I1+YUe3ZlWpuV
	CIGosia3zyVYWubT4/7FNqaquPyElZAMEgIukCXPf0C325EPaYMd4Y0NPgqcTo0psPMf6PgW1h8aB
	Wd8XJTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzNB-00000000fKp-1sl9;
	Fri, 30 May 2025 13:02:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzL0-00000000edf-2F4h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 12:59:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76FF216F2;
	Fri, 30 May 2025 05:59:37 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A0F73F5A1;
	Fri, 30 May 2025 05:59:53 -0700 (PDT)
Date: Fri, 30 May 2025 13:59:44 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
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
Message-ID: <20250530125944.GB666854@e132581.arm.com>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
 <20250523085655.GD2566836@e132581.arm.com>
 <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
 <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
 <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_055954_615694_1A81094F 
X-CRM114-Status: GOOD (  23.83  )
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

On Fri, May 30, 2025 at 12:32:23PM +0100, Suzuki Kuruppassery Poulose wrote:

[...]

> > > 2) How does the source driver know the TraceID for exposing via sysfs ?
> > > Does it expose its own traceid ?
> > No, sources connecting to TNOC don't have their own traceid, it expose the ATID which allocated in TNOC.
> > TNOC will maintain the ID in coresight_path:: trace_id, when enable source, the source can get it from path.
> > 
> > Here is the patch to expose id in source:
> > https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250530-showtraceid-v1-1-2761352cf7b4@quicinc.com/
> 
> Please don't do that. We don't have to fake a traceid for all sources.
> It is only of use to the decoder, with manual input from the user. So,
> someone using the TNOC based system must be aware of how to collect the
> traceid and as such expose it from the TNOC and not all the other
> sources connected to it.
> 
> Simply expose it on the TNOC device node

[...]

> > > Good question, since we have the "path" maintaining the TraceID, we
> > > should use that here for the TNOC. But the other question is, can there be multiple sources connected to a single TNOC ? (I am guessing, yes!. And thus it may not work with what you are proposing.
> > > 
> > yes, there can be multiple sources connected to one TNOC, and these sources share one Trace ID which allocate in TNOC.
> > To decode the scenario relay on TraceID + Inport number, TraceID identifies the TNOC, the decoder maintains a table that maps each TNOC inport to its corresponding source.

If the Trace ID is only used to identify a TNOC, I am just wandering
if can use self-contained method.

For example, you can generate a ID number based on the register base
address, something like:

   /* TNOC physical address */
   drvdata->paddr = res->start;

   if (IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
       drvdata->atid = (drvdata->paddr >> 32) ^ (drvdata->paddr & 0xffffffffUL);
   else
       drvdata->atid = drvdata->paddr;

Then, you can get a unique ID for each TNOC in the system, and the
ID is determined by the pyshical address and can be calculated
directly by decoder.

Leo

