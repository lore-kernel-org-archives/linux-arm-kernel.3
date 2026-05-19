Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313A7CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 02:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lIDxJSaCajGTRzsdr7llad9+YDVYVX1WlfP1ZJZZC8=; b=U4qxlCGNV9hwKeTOAxl3ucFDwl
	yjJ+8lTe+iKtQKpVHL2BHXyvop1ZWGmkNRNhRYtMmwLjvOEn/eBPX9nLKZjQTsm/jhfYtrNbhR4bP
	ZJ1VmASpMdh9uZD/gvpbpQQ8nzZqpHYH9NvbikoqwOVjmWL26VMT6x3czgIhopVSr+UsAAQAh3gFJ
	+CF1+oLNuzt7N5cqMeFkoAESV5ltPnFENLkNo+4NZRmsC2QAy8bJCXrflpM5G1UvLzYJTbcZbw5zp
	u/xstmYW1/C2QiymzEpyBK6NKL0IHm5CWwRDg+dlucFG0ZlbmDF6ATA0BcE5qjgLV1R17U4UcDmBZ
	cbrKzAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP9xC-0000000HQsF-1gWg;
	Tue, 19 May 2026 02:13:06 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP9x7-0000000HQrT-42lj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 02:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779156782; x=1810692782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RptmMw58B7z2kp+LpO4yKtCECQzw5sRd637q2vcLyXs=;
  b=OXAoOXicQD1KyA3Rl1QjRu+p/p/78lKdNBw61Azj8S6MZrNAV1E+nZDI
   QAZ1tLtzccJI8QPEXOcSYk2an8vRenM/ZO+IWrTq4eM+y0009c5VBWrGl
   KVd1grDtYCtGbmRqfh0+NgxL1BqwbAB4XgF8utjIPSIAZmFOyY9Og12kd
   vbjTU7D/NQcft8sQT1dto9wXQV+0kkble1Wtm0qwi/5uMaWt13HWQ1CON
   uSxfSCqmsComNTfYD+Pg98JzWh1nivrgbZtvUCsNtDEmwZ8+0Ov+fvkap
   bw4VCKQ56h4omihIr1qX1Qjbkr1h+sgPx6LZlgCjq+ncTyLcneXxj2tPF
   Q==;
X-CSE-ConnectionGUID: MY2/WwjHQGmX/16uBoWbFA==
X-CSE-MsgGUID: piNLvE80RhCf0rxjbL6e7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="218720760"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="218720760"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 11:12:59 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AEEE21C000B1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 02:12:59 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 660C41C0017C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 02:12:59 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.207.142])
	by az2nlsmom4.fujitsu.com (Postfix) with SMTP id 7B3AB20000AA;
	Tue, 19 May 2026 02:12:55 +0000 (UTC)
Date: Tue, 19 May 2026 11:12:52 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Sami Mujawar <sami.mujawar@arm.com>, 
	Gavin Shan <gshan@redhat.com>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
Message-ID: <agvGi9nrQeslnvjM@FCCLS0092175.localdomain>
References: <20260518033157.1865498-1-enju.kohei@fujitsu.com>
 <agsHBb9f3HkmJaIx@arm.com>
 <agsSyRT7z-F5iBIp@FCCLS0092175.localdomain>
 <agtKlvxAvCHXvX-z@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <agtKlvxAvCHXvX-z@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_191302_493996_8EF4AC1D 
X-CRM114-Status: GOOD (  29.83  )
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

On 05/18 18:21, Catalin Marinas wrote:
> Hi Kohei,
> 
> On Mon, May 18, 2026 at 10:38:53PM +0900, Kohei Enju wrote:
> > On 05/18 13:33, Catalin Marinas wrote:
> > > On Mon, May 18, 2026 at 12:31:31PM +0900, Kohei Enju wrote:
> > > > diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> > > > index 0c9ea24a200c..2d450caee3e4 100644
> > > > --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> > > > +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> > > > @@ -108,7 +108,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
> > > >  	 * allocate outblob based on the returned value from the 'init'
> > > >  	 * call and that cannot be done in an atomic context.
> > > >  	 */
> > > > -	cpu = smp_processor_id();
> > > > +	cpu = raw_smp_processor_id();
> > > 
> > > That's just hiding the warning which might be genuine, irrespective of
> > > what the comment says. Sashiko has some good points:
> > > 
> > > https://sashiko.dev/#/patchset/20260518033157.1865498-1-enju.kohei@fujitsu.com
> > > 
> > > Basically what guarantees that the cpu won't go offline? Can we use
> > > migrate_disable() and ignore the smp_call_function_single() altogether?
> > > It looks like a hack anyway.
> [...]
> > You've raised a very valid point about raw_smp_processor_id()
> > potentially hiding a genuine issue. I agree this would be a concern in
> > most contexts.
> > 
> > However, this implementation was intentionally designed not to block CPU
> > hotplug:
> > https://lore.kernel.org/linux-arm-kernel/7a83461d-40fd-4e61-8833-5dae2abaf82b@arm.com/
> > 
> > As mentioned in the thread above, the potential failure from the target
> > CPU going offline (resulting in -ENXIO) is an expected and tolerated
> > condition in this path.
> > Using migrate_disable() would go against the non-blocking design goal.
> > 
> > Given the context, the debug warning looks false positive for our
> > specific use case to me, and I believe raw_smp_processor_id() correctly
> > reflects the design intent by simply acquiring a CPU number without
> > debug checks.
> 
> Thanks, I wasn't aware of the old discussion. If user-space can
> tolerate, than it's fine.
> 
> Would you mind updating the comment above the changed line? It talks
> about not allocating memory in atomic context, so migrate_disable()
> would solve this. Just mention that it can't block CPU hotplug events
> either and user-space can handle spurious errors.

Sure, I'm happy to do. Thank you for the suggestion.
I'll work on v2.

Thanks,
Kohei

> 
> With that:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 

