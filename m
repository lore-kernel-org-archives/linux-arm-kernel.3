Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C23AC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3UJ+jJG/fm0G4nquu0DTAR8wl/181muiJC8crp8lPM=; b=ry2Syso1fmn2DUWgWwkkPdF2Rs
	V5LMTJIbEAbo741VIloNrR/kp6SP2ACuoUzdSolS5e8iyUSLwex+mfQ/E9/xV8+QryhoSAImMZjKI
	6cWbdaO/4kUHzeOKlC/gloeAtCX17X3kD9+ppYI1ccJ6EV1dlAa7wh4S1doF0rWUG11Qziwi1OUh6
	z5dwjegxpcH0tWtz24q5gpN8c+EeE+c4zC9ty4IykO6bLN45htkElQqZpYvbvVS6ZSPkvDQP/Za0v
	2MSwC4a6lIdkOirC2O9T17GaHktSJFLEFPOiTKP5oWx2qHZkvX9KinngTVpGC19DuMBhj6p3l2PIU
	YdiglDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cyA-000000022Dw-2EZY;
	Mon, 21 Sep 2026 12:18:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cy8-000000022Db-2T7k
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w3UJ+jJG/fm0G4nquu0DTAR8wl/181muiJC8crp8lPM=; b=nBjeh78xcjVdapa+ETqaLhxgv5
	DPC3KbkXdJ8mADfdNm4Ld5aDJs5HhxeVEDRmiK0saDL2crcsrn5NOEoybpemf0pnFrnBz6wtcUrYZ
	lF2UlvTk77CsbmC2DuzwXM0+Hok5yHkNW9fdeFHJoC1N9nNGISJS3Wpq/djxuX3AeQQ3CsuxRczqd
	pSBPch6CuCA34BoogoqGUw8AVlIfuHOS0S5Wsm7gGp4VpSwFWzVGJCb86DjDGY0sWdjnORgTE6w8S
	8CLFEtJlRFjjC0skOwOndRbj4xYqmsm+CpeOjYqKV6T5CtJw5lM/vRTMDt1KaIZJ3wToMDwIwEi2p
	OCLwqmxA==;
Received: from mail-qk2-x0f.google.com ([2607:f8b0:4864:34::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8cxs-0000000CGUb-44XN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:17:52 +0000
Received: by mail-qk2-x0f.google.com with SMTP id af79cd13be357-939109f067cso306004485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789993060; x=1790597860; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w3UJ+jJG/fm0G4nquu0DTAR8wl/181muiJC8crp8lPM=;
        b=KPsrd7Za2Pa3/UC8QbC1Aw+uVxbiNcj70Ismm1HhAv5L3mD9uIc8WCLbq0WBf4QPzy
         9Wr5zn2pKc/m+hZgdUsygrQ/e3Uj7STyQ9gyouz4Mq30R4Il/tbNspaL+TygT3gPtloY
         SnaaNgHIGw1i++t5/YaCr6RRVWYx44P9vYpthLiK6AXjjOdf44Qfv5Q8qHQLOXxe3kvd
         LsFskhzpQmOhin5XaPGZqifoRzw1mvqIETToi6uXiYi9TYPjkgv2OWMzs6e938MvRCqN
         ReP1H1tkka82xSAFjiJ/CB356xbZoZH08Q7x6qXBPpx/poP5CkR4D9dMuA90Dt0g+HVp
         +bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993060; x=1790597860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w3UJ+jJG/fm0G4nquu0DTAR8wl/181muiJC8crp8lPM=;
        b=U9Rvnd3XDcwrCkRInhhHZcIL1K54opD8oFme47sHwl5N75f87P45y5HEgjHhw/Dwiy
         XOT3WF0Tj0UO6xyHeyA04OlmfYTcJXyD19z6r3RIAIGqitOFpgDMRRlc0gXQlF8OJsCB
         6oXFl1/MwQU+oIBZlyuYEm7mU+Zv/+EYLOU/2S0IWRfppgYBtaRwvknWy3MY2mES1iGo
         CsPJXXsUXFz8iRA3tfqwAZYYH1HZIbjDzqoLbvlBZZTs6ptiOxMrpdh8STRjtIYDZ+Jg
         MUI3ViuTL3P8oMLMF+rJmbdg8xXL7LqDEgB/jf/oGJ1mILp8tsIgAa4IHY32b7W4s6TJ
         WSNA==
X-Forwarded-Encrypted: i=1; AKwUvBz4SOiluZL37Vc9cq7aZMZgonvF/CbTLOqCKoEpMytEpb0N3lsWXvDdEkGP6XcNUYb3uu7sLLMC0YwbBNL1RNWS@lists.infradead.org
X-Gm-Message-State: AFuF++keFgqUukVPk3+GIsw5ilRK62kIy/8y/64Xz+pySltMCJOQnZkD
	wzah+joTKEq11MW/hl9Dj3ouXc7FafioBy2vFaN+KGjy4iaiHGOrDeatUH9FwNdMxL0=
X-Gm-Gg: AYBFou2fp3SXR9ltayN31qgKyUFUfsWO9Nw4o5Ow2/f4AT0h4yW0LTeBQoAUutM7MZO
	JLyHSbH0aNZr0/u8SDSa6sW5zAZlmPaNbMJBHIQlwB9Fg7SclBvHI2IReE1kV5lz0webGPz2osT
	UFUn7x8oToNx4yyyMUmY06QQt9JsB55GBYwMrsoioZLanbejrczWvtHLQX/3xOZ7LUvRHrMHurC
	BAoUgUPAZuVQPfRca0YQJ40Dkj5m0rK/xkKbKSmox+qLU7IQGGNAqwLGm8BsqZAcG/pHsUXjej2
	A4F17VqE85H6uBGUhbgwYn54WPJjulf2+/7jhxQocXWSp9jHzFH5hfyfrP0+vgAgr6U1N19l0nR
	uwUKIkpOYW17rHZRE5Jm/fulAQcCm18UIL04Te31uFLBy2+5TW0BEyMcAqA9ffdLHHTLBu40HLI
	MADmC9a6eEMjmQbZH8WmCgLejp6GcBHsdaxT8kRV5FbgXgrf+mwklkERUtM1UT15xTZa/q79Tlg
	LQbX7IleIfZuoLGG4YMa4PlZDSKuRklOkqzt6Qe2WcQbDz9op7zBKbZe2zvU+pnyMI=
X-Received: by 2002:a05:620a:440d:b0:93b:e6d3:3149 with SMTP id af79cd13be357-93c15ec31camr28407885a.53.1789993060138;
        Mon, 21 Sep 2026 05:17:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedac21c7sm633945285a.22.2026.09.21.05.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:17:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8cxn-00000006Foq-0Pwg;
	Mon, 21 Sep 2026 09:17:39 -0300
Date: Mon, 21 Sep 2026 09:17:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260921121739.GM11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
 <20260918165315.GF11599@ziepe.ca>
 <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
 <20260921115141.GJ11599@ziepe.ca>
 <45dd7a2f-8474-4388-b383-2dee3ee62206@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45dd7a2f-8474-4388-b383-2dee3ee62206@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_131750_940370_0CF56E8B 
X-CRM114-Status: GOOD (  27.41  )
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

On Mon, Sep 21, 2026 at 02:05:50PM +0200, Christian König wrote:
> On 9/21/26 13:51, Jason Gunthorpe wrote:
> > On Mon, Sep 21, 2026 at 11:07:17AM +0200, Christian König wrote:
> >> On 9/18/26 18:53, Jason Gunthorpe wrote:
> >>> On Fri, Sep 18, 2026 at 05:39:55PM +0200, Christian König wrote:
> >>>
> >>>>> Arch code can figure out how to do it. If some ARM configs only give
> >>>>> order 4 folios or whatever then dmabuf heap doesn't care.
> >>>>
> >>>> The fundamental problem is that DMA allocations are highly
> >>>> architecture and device specific while Linux memory allocation APIs
> >>>> are generic.
> >>>
> >>> This isn't a dma allocation, this is a memory allocation.
> >>
> >> No, I mean this is a DMA-buf heaps allocation. It is a DMA
> >> allocation, we just don't know for which device.
> > 
> > So? How is it any different from the existing alloc pages?
> 
> That you need to specify that this is for DMA without encryption.

It is not for "DMA without encryption". It creates shared pages in a
CC guest which *every* guest device can DMA from.

> >> That userspace provides this cc_shared flag is a NO-GO to begin
> >> with.
> > 
> > What do you mean? We discussed this with the heap maintainers and we
> > all agreed this was a kind of heap just like any of the other kinds of
> > heaps that userspace can request.
> > 
> > It is *exactly* the "special allocation requirements" you are talking
> > about above.
> 
> I only see a fraction of the patch set (because no DMA-buf
> maintainer was CCed) and to me it looked like the cc_shared flag was
> added as an additional parameter to the allocation and not a
> separate heap created.

?

It was merged months ago, and you were CC'd:

https://lore.kernel.org/all/20260325192352.437608-1-jiri@resnulli.us/

It follows the design the dma heaps maintiners guided to create a new
named heap:

+	exp_info.name = "system_cc_shared";
+	exp_info.priv = &system_heap_cc_shared_priv;

Along side the normal heap:

 	exp_info.name = "system";

It is identical to "system" except the pages are "CC shared" meaning
the hypervisor and every DMA device can access them.

This series is just adjusting the rules around how
set_memory_decrypted() works. It isn't changing any uAPI or adding
anything new to dmabuf heaps.

Yes, it ends up as a flag in the internal code flow, that is just how
it got coded..

Jason

