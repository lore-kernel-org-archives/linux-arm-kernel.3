Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F69EBFD30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+jPXobqJkWViI7fPVcLHzAx+nNikvv2KnjSxfNKdqA=; b=44iIxANJzT3YUNVauuAPUwOFBO
	8H+fk+xdv0n2eu7ocfSuRI4ynBBwiLgw1P53qM+9Cp4vKT/QBlbjoKhuArxvrQS/i0FPKb2aliiOn
	vM+5xZUD2RyhcmWde1rKBIU3J/hEvXvoE3cRzoO+jVg1L/HEVJj3xqQ3MeRZ2XHxUqjV77EXysLzg
	MaxTgvfXSRHr2wX/C3Hp4ETkyQvQ/VuUffPxKHVc+ADXtV1a4OFdZJpS6jFBiNO4PSvbq5lqzXRKT
	ANpF0NBlyZomizgBQs79bnLhbkXazAbula/VslY0dsgyrTkgMJWmGZDYg9NS6FOKoxEq1RcJaESct
	G2nVTxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCE90-0000000FPEm-0mNJ;
	Mon, 13 Apr 2026 10:03:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCE8z-0000000FPEZ-1SKa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 10:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q+jPXobqJkWViI7fPVcLHzAx+nNikvv2KnjSxfNKdqA=; b=MYWS+NltUHeWpRooyKNHa6ql07
	XvuFHLbt9zJZ7WMqpFSS5hF4xsgFwN34v+jlkgafQfcSP/BoflL9vUH4+Jc+pSLZeQjKrTOus1I9q
	dgiIpechy38+rsdn1UsCm6TtoqZ9KJ2XZQ1+MD6RYQU6Op9SSb+azpiopgj03GYQBMpxrnLBGAqQJ
	kFMeHRaUO9zpRAU4dBhuFx8WOIZG4wYBh7t/pJ9APWL4mdiBYeyH6GkQ8QhGqlYghN4PrJefqKf11
	BYbHlE81klUAaTjRvNmfFarL1mqHwAwjASW87f2aODM65iu/QkWAJKQmgMDCSc4zGDeqiSDiwj87W
	U3zqQ1lA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCE8v-0000000GXcy-3uu9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 10:03:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74E1935A7;
	Mon, 13 Apr 2026 03:03:37 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6FF93F641;
	Mon, 13 Apr 2026 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776074623; bh=+WaVpOKRK+c+itVGcTa/pCcJblWYON1rar2wLjXPz1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXjv3UuMd85iVJ0wKfIAOskwb4linlNWUTK9e6jYgaPazUtzzNW7YpexoWr/YL74b
	 zFSySfUpK4ZxqUA/DNJTUHCQKhyrZWx8f9ZP3XSPFlOOd3VkP8I52Dec0fp7SbCZyt
	 s24seek5kKSsBBXK6pLbVlEmVC6g5HUdbIt18aYk=
Date: Mon, 13 Apr 2026 11:03:39 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com
Subject: Re: [PATCH v3 1/5] coresight: etm4x: introduce struct etm4_caps
Message-ID: <ady/e9JYmr3ypNBQ@e129823.arm.com>
References: <20260412175506.412301-1-yeoreum.yun@arm.com>
 <20260412175506.412301-2-yeoreum.yun@arm.com>
 <6ed0ee60-caa2-4a76-9e01-5d2b8c9af701@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ed0ee60-caa2-4a76-9e01-5d2b8c9af701@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_110346_327880_08D113F3 
X-CRM114-Status: GOOD (  22.23  )
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

Hi Jie,
>
> Hi Yeoreum,
>
> On 4/13/2026 1:55 AM, Yeoreum Yun wrote:
> > introduce struct etm4_caps to describe ETMv4 capabilities
> > and move capabilities information into it.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   .../coresight/coresight-etm4x-core.c          | 234 +++++++++---------
> >   .../coresight/coresight-etm4x-sysfs.c         | 190 ++++++++------
> >   drivers/hwtracing/coresight/coresight-etm4x.h | 175 ++++++-------
> >   3 files changed, 327 insertions(+), 272 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index d565a73f0042..6443f3717b37 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>
> <...>
>
> > +/**
> > + * struct etmv4_caps - specifics ETM capabilities
> > + * @nr_pe:	The number of processing entity available for tracing.
> > + * @nr_pe_cmp:	The number of processing entity comparator inputs that are
> > + *		available for tracing.
> > + * @nr_addr_cmp:Number of pairs of address comparators available
> > + *		as found in ETMIDR4 0-3.
> > + * @nr_cntr:    Number of counters as found in ETMIDR5 bit 28-30.
> > + * @nr_ext_inp: Number of external input.
> > + * @numcidc:	Number of contextID comparators.
>
> @numextinsel:
>
> > + * @numvmidc:	Number of VMID comparators.
> > + * @nrseqstate: The number of sequencer states that are implemented.
> > + * @nr_event:	Indicates how many events the trace unit support.
> > + * @nr_resource:The number of resource selection pairs available for tracing.
> > + * @nr_ss_cmp:	Number of single-shot comparator controls that are available.
> > + * @trcid_size: Indicates the trace ID width.
> > + * @ts_size:	Global timestamp size field.
> > + * @ctxid_size:	Size of the context ID field to consider.
> > + * @vmid_size:	Size of the VM ID comparator to consider.
> > + * @ccsize:	Indicates the size of the cycle counter in bits.
> > + * @ccitmin:	minimum value that can be programmed in
> > + * @s_ex_level:	In secure state, indicates whether instruction tracing is
> > + *		supported for the corresponding Exception level.
> > + * @ns_ex_level:In non-secure state, indicates whether instruction tracing is
> > + *		supported for the corresponding Exception level.
> > + * @q_support:	Q element support characteristics.
> > + * @os_lock_model: OSLock model.
> > + * @instrp0:	Tracing of load and store instructions
> > + *		as P0 elements is supported.
> > + * @q_filt:	Q element filtering support, if Q elements are supported.
> > + * @trcbb:	Indicates if the trace unit supports branch broadcast tracing.
> > + * @trccond:	If the trace unit supports conditional
> > + *		instruction tracing.
> > + * @retstack:	Indicates if the implementation supports a return stack.
> > + * @trccci:	Indicates if the trace unit supports cycle counting
> > + *		for instruction.
> > + * @trc_error:	Whether a trace unit can trace a system
> > + *		error exception.
> > + * @syncpr:	Indicates if an implementation has a fixed
> > + *		synchronization period.
> > + * @stallctl:	If functionality that prevents trace unit buffer overflows
> > + *		is available.
> > + * @sysstall:	Does the system support stall control of the PE?
> > + * @nooverflow:	Indicate if overflow prevention is supported.
> > + * @atbtrig:	If the implementation can support ATB triggers
> > + * @lpoverride:	If the implementation can support low-power state over.
> > + * @skip_power_up: Indicates if an implementation can skip powering up
> > + *		   the trace unit.
> > + */
> > +struct etmv4_caps {
> > +	u8	nr_pe;
> > +	u8	nr_pe_cmp;
> > +	u8	nr_addr_cmp;
> > +	u8	nr_cntr;
> > +	u8	nr_ext_inp;
> > +	u8	numcidc;
> > +	u8	numextinsel;
>
> missed kernel_doc.
>
> Thanks,
> Jie

Thanks. I'll add comment for numextinsel.

--
Sincerely,
Yeoreum Yun

