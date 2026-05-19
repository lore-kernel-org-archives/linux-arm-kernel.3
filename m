Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C671CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqrcVfnO7KvHz04L9yl4e6Ci0L4LjlQK4/aWUr5steg=; b=Y0AdFP0tbJxveDjJaOgY+0nD4D
	UAjF5BmqY0pJM/dEGVL3UwpcLpvI1BVUYzswxLcf4FEG/WTO3vH9XbgwnZGJLV6HcqTDL8bVdgVGS
	NOL/t0nMNctfc42KddQUDKI7OAOGki6/qyEp9cEsclcyyNNzdsfoydNX/tgdwm9X26xEPE4RvgLJG
	xJdPmnn+k7gvGswTIaklauluIJzYxywTwwnT3EE6zdH92PkpCtbnv1oDa/dMs5UhN2tc/NSehUvzz
	hBic8e1loUyl/4F3sVhWqDC2TtX85f2yHQ8AdJI+SkHfxVE7oMT1s41e18jxllRxRxnmiFldc0MRn
	ue7XPq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIHt-00000001G3b-1w4U;
	Tue, 19 May 2026 11:07:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIHq-00000001G2a-44vf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:07:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48d1c670255so05e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779188817; x=1779793617; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gqrcVfnO7KvHz04L9yl4e6Ci0L4LjlQK4/aWUr5steg=;
        b=baisTznr3mSg1YRhPNg0ZVGWC5utWOprZocxWxVaVRYAI/ZXGE2hO8+UgC/ETJpXee
         apSiuM4WmygwF4jZRnkcfK4pFR2YjYpjXspW6HvARjcQdI2ToP3U324OMTy1b2c/Utlm
         NUR/GZyYtYCLbW1tP0xXxUfBl6oCMJo9Pp5uVoEwuOFQySrjTuiaFDEDvKbUNazIpfEK
         UjR4VAJiZH6REUWAkt69N/a280ZJ5Kw5aQaJzL6yiy59zoL4+VvOMpHLuPub64HrmNg/
         8kktmirh2C99iF8br4Q+yDA2UXzKWCOwRrSuvmD8Zz3KsjIL5YXT6GLB7pZXE/vd6Icj
         L6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188817; x=1779793617;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqrcVfnO7KvHz04L9yl4e6Ci0L4LjlQK4/aWUr5steg=;
        b=ShOcXk0V34UXzRPmuMW7KBqsXOi8wbKqmSZKWQV4/WNslpVm6BSz+6O7//WG3EL3Vz
         n+hhiZp848TyWHAB0Zsw3DLyJK62o5pgUAIx37l2PWjLr/21gxjj2c8REXJcZLwFJcAX
         PVaYA91ITiIOBk12kW32dOtTrMhrrjy8wQ0bRDiGzRiavOgWsVgqWVYLs3Jgr2Iyqvjs
         ENXEHDVRti61kozZQZfJIENQV5GkFkIW+8qhv+yoiaqJpQGO4NhcjpeHtNjSVl9zbVUQ
         Wv0kJoYA/o3SAzURAMhLQDB0WsM0ze2nSJ7abf8pM9piZzulkiuW2w/88TtWVSidAvL9
         fzlw==
X-Forwarded-Encrypted: i=1; AFNElJ9ibKUZanunaYRjlnksPlPOxNyYax/R+z5gsZR3xJUEZ/VBxOPe585CsQOqcQS9y0VPHlXhAFwHN3RbM+6pdLu4@lists.infradead.org
X-Gm-Message-State: AOJu0YzGU7VcBdlltQyw8lZQhK8efuWJUIaaCrl7fx5puIw9n2CQc0JC
	0msRnzNoQ20Ah1BHLfVEHHi4JYxLxinknwon1WumJdn852xT1UzHHTLb0cJ6BrRfcQ==
X-Gm-Gg: Acq92OHolnpUeRqD+xlaAiq0xZCV+LHWI5YXcWgVo5ktb506Ua4zwQo1o7u2u+uCmfL
	Dd1qaFg/+tnUkvnkqiGfV1N059mRHGPH0vcE1pXtaGqujQhLMmB5/bp4We/TsiFEHM5QkWD6fJb
	pFkAj/GZiRrbe544zNr3tK2g0jqpN9+/xNceSv5X04A2eet0pPKrzfHpcQXq/LBezYkT8F/yT4t
	26YD0WKOPxiXEfnGwI6idkPGVnJuJywUo958lz3nR2XAtpRKyyE5whE09rpoGN3NcK+KJBIFLZn
	rYPXW+0FuuvqWGW88Ocyx3rK2TrGkZBoJ0Htz3i5cTSEUTKOooPIWV+XVPhKM4xGOKfQiLL9eFa
	cZArSeKrQAoJD6iIE8m9IgRBZef8uajAhTgEYzp8VTNkOqjz0MaXTO4uQ/e8BJoJm8rTnEoJmMO
	EgNEzECjKw4BmmE4jmtcu4X3gPUOhwStJ0ZrZ/7BmkdRSQLiB6FG3clppJ1qEeG4nm9ueAlk5yA
	e2OfOEZMTi07Q==
X-Received: by 2002:a05:600c:418b:b0:488:960f:60b8 with SMTP id 5b1f17b1804b1-48ffa5e1272mr2275185e9.6.1779188816592;
        Tue, 19 May 2026 04:06:56 -0700 (PDT)
Received: from google.com (136.41.155.104.bc.googleusercontent.com. [104.155.41.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53767ecsm288995945e9.10.2026.05.19.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:06:55 -0700 (PDT)
Date: Tue, 19 May 2026 11:06:52 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <agxETC1rXBUSkWYg@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <20260513172450.GR7702@ziepe.ca>
 <agW2lzJI-20DyJVe@google.com>
 <20260514123529.GZ7702@ziepe.ca>
 <agXfm3mS_M3fvRrN@google.com>
 <20260515225113.GN7702@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515225113.GN7702@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_040659_041857_168934FB 
X-CRM114-Status: GOOD (  45.51  )
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

On Fri, May 15, 2026 at 07:51:13PM -0300, Jason Gunthorpe wrote:
> On Thu, May 14, 2026 at 02:43:39PM +0000, Mostafa Saleh wrote:
> > > That's a somewhat different problem, we have the dev->trusted stuff
> > > that is supposed to deal with this kind of security. We need it for
> > > IOMMU based systems too, eg hot plug thunderbolt should have it.
> > 
> > I see that it is used only for dma-iommu and for PCI devices.
> > However, I think that should be a problem with other CCA solutions
> > with emulated devices as they are untrusted. As I'd expect they
> > would have virtio devices.
> 
> Yes, any security solution with an out of TCB device should be using either
> memory encryption so the kernel already bounces or this trusted stuff
> and a force strict dma-iommu so the dma layer is careful.
> 
> This is more policy from userspace what devices they want in or out of
> their TCB. Like you make accept the device into T=1 but then still
> want to keep it out of your TCB with the vIOMMU, I can see good
> arguments for something like that.
> 
> > > > While we can debate the aesthetics of the setup , this is
> > > > the exisitng behaviour for Linux, which existed for years
> > > > and pKVM relies on and is used extensively.
> > > > And, this patch alters that long-standing logic and introduces
> > > > a functional regression.
> > > 
> > > Yeah, Aneesh needs to do something here, I'm pointing out it is
> > > entirely seperate thing from the CC path we are working on which is
> > > decoupling CC from reylying on force swiotlb.
> > 
> > I am looking into converting pKVM to use the CC stuff, I replied with
> > a patch to Aneesh in this thread. However, I need to do more testing
> > and make sure there are not any unwanted consequences.
> 
> Yeah, it is a nice patch and I think it will help reduce the
> complexity if it aligns to CCA type stuff.
> 
> > > In a pkvm world it should be the same, the S2 table for the SMMU will
> > > control what the device can access, and if the SMMU points to a
> > > "private" or "shared" page is not something the device needs to know
> > > or care about.
> > 
> > I see that's because dma-iommu chooses the attrs for iommu_map().
> 
> Long term the DMA API path through the dma-iommu will pass the
> ATTR_CC_SHARED through to iommu_map so when the arch requires a
> different IOPTE it can construct it.
> 
> > In pKVM, dma_addr_t and IOPTE are the same for private and shared,
> > so nothing differs in that case.
> 
> Yes, so you don't have to worry.
> 
> > We don’t expect pass-through devices to interact with shared
> > memory (T=0) at the moment.
> > However, I can see use cases for that, where the host and the guest
> > collaborate with device passthrough and require zero copy.
> 
> Once you add the CC patch it becomes immediately possible though
> because the user can allocate a CC shared DMA HEAP and feed that all
> over the place.
> 
> > One other interesting case for device-passthrough is non-coherent
> > devices which then require private pools for bouncing.
> 
> Why does shared/private matter for bouncing? Why do you need to bounce
> at all? Do cmo's not work in pkvm guests?

At the moment, in iommu_dma_map_phys(), if a non coherent device
tries to map an unaligned address or size it will be bounced.
In pKVM, dma-iommu is used for assigned devices which operate on
private memory, so bouncing that through the SWIOTLB would leak
information from the guest as the SWIOTLB is decrypted.
In that case, the device needs a pool which remains private.

Thanks,
Mostafa

> 
> Jason

