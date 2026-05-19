Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B097DCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7Nz6XFDKFDcI1TVcowrB8v0PKJyf/qnRnOMl+2I2pU=; b=AW2nQvsn7aaWn0rWfA+/OxYryF
	H3tZv6GGzhLhQDNaI7Xlg+pu64cS1bqwoqhH2n3x2/m89hP2R8N5DP9RPzzjubaa5v/3IloWoasoa
	axafAzpO9ciMTX1wpf9TRfm42vIIec2iadUPimpftzqCY3DnmW2OD1aQ0S+5v/Z4YQXsSRTvTBpGk
	W51izVJU+MwdPx60UYnLa105ko+uk2QovW+/TJzVdj1ugc2OMcImvzeAAQ6pAfEO72ASgeZLChRDO
	b9HDZpLsd4Tj1k3gWJqBTz5d2Xh8+78+QbzqveLwCe2JUjBcprccpGMgRbky2MZFPOjc7IJikGRrZ
	dmdNIRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLhY-00000001tCy-2qcB;
	Tue, 19 May 2026 14:45:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLhW-00000001tC7-0TDQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:45:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779201940; x=1779806740; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h7Nz6XFDKFDcI1TVcowrB8v0PKJyf/qnRnOMl+2I2pU=;
        b=Luq0/sC34DvXUpWRvFtdDi2/bUFspKFw5gkYSmsK4C8dr6lsBJxkHpNajLdx+Krrzz
         2zcWT+BRSlUX88BJnwgE906nBCeiudHZpQ/CTkkqqcUzGuWsWv3KvVG8gM6GSF5MHC+6
         VXmXpsu/b51V00jn0UVgeobcRTVBpsFXJFHJ+VbDkYSZvF6buVOv1HbkPixY2mREmI98
         un/NI9ecgUYl8LmDU6UKx2lswFnLoZ+ykanhXwjpu2oJreyVkUlcGl/5kiXo3xor/+mR
         aOjnSllZGmT+MCIClRMPAhYWQE6uf780uTP3XZbQcV1l+KfQzZqsVjrqr9RgP6UEMKb5
         qSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201940; x=1779806740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7Nz6XFDKFDcI1TVcowrB8v0PKJyf/qnRnOMl+2I2pU=;
        b=tTFlakH9o5R365qYJmO7tvSd2CFkyboiqHAn/sXUHzX0jp9XkIrKuel8WisAcpP9jO
         NSONUt2xZq+tVKB/KzNtzUFGJE/Ieb1x/HbFEtv+5dA5C8dagOYOVI1fG/yb56Mes9ut
         gXgkMoWUiEKi0L8ROFGwRPqt4k3u2WH1QgBE9w4H2ywJUW7vCNHjCF5vcn5ooHNlOXPu
         nNCJdTmORL3fsLd25JCPBXbQX+gFHRFgBkCdhxfhgLa1oSjF3bx3Bo0te8RJbqVjSm4V
         JIL6jErZ1hxonVuOCF/6BzEHCvBinxEZW0gpU31CkfI1ZaS46QcTvuLsbbkKRxYjqMcq
         O3Ag==
X-Forwarded-Encrypted: i=1; AFNElJ9NFu/O1OOO0d7MG7OMqEHPaWsgAp10yrksUo9E+VRbhxd2rUEPop2jMsLA+z/JQRNgEBEY2XDhxn6aqnc+IH1S@lists.infradead.org
X-Gm-Message-State: AOJu0YwP1cwFKno7LTv8OKqm7WmC22qG/K5OMaxe8VojCFm1Gq2LRx82
	B32KhI7ZNYUMGB2DO9CgEWGjSMq8Mn3fNzg18JQ+kP7BC0ergBKN+MX0EBnVnG5+xA==
X-Gm-Gg: Acq92OESfq3Jrkmc0JMolgHWyzuN1u1wm7uaLUI0NpAJlPCQoP9fYQ9vSoPYaD8JvxG
	1T8zI4WHwBrsJPmP2bB169YgfDHw7+mhdIFY1LMkTCwiKz7UugqxNvQBYLaDfcsLJN73OcSyPxl
	frQO7588U7l6szueqN/hl1rB76ItnajGQHnhM797jl3WniG1Awo/7wZ26Gdjc9uEKzfkHjyYC51
	J3SfzXjvi75m65tNbwhuTS9jFuExvbeHJxiAGv1tA/iwLPey/4Eu+DCwkkZgRV4A88rZKjDHPaS
	aOtKx2wDwTzc2Ugs+fjh8v0CTyBSWNJgYCZLJz6GDzfBkji1QO6gC8CxGC4Iffid/NfNsc1K9uD
	DPayI/PeJkwnHg4xYFrWgpwl1PSWs+8oB7ag9hMiV3TfBPlKasU+xuviKQqQPHoX6SjI7PRECqg
	tmfFXLr5wNZPLYTIGocGwcCliQ8kmDhmv5Qhxs/z4kX3E10kVfDOPN1e8Wdh/dpbSvYq8/z904O
	pc=
X-Received: by 2002:a05:600d:6401:20b0:489:1f6a:4ac0 with SMTP id 5b1f17b1804b1-48ffa0627e7mr3099895e9.0.1779201939945;
        Tue, 19 May 2026 07:45:39 -0700 (PDT)
Received: from google.com (136.41.155.104.bc.googleusercontent.com. [104.155.41.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm48721081f8f.18.2026.05.19.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:45:39 -0700 (PDT)
Date: Tue, 19 May 2026 14:45:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <agx3j6Oc8QivZ3RG@google.com>
References: <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com>
 <20260519143529.GD7702@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519143529.GD7702@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_074542_166464_72876B9A 
X-CRM114-Status: GOOD (  30.54  )
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

On Tue, May 19, 2026 at 11:35:29AM -0300, Jason Gunthorpe wrote:
> On Tue, May 19, 2026 at 01:41:42PM +0000, Mostafa Saleh wrote:
> > On Tue, May 19, 2026 at 10:29:11AM -0300, Jason Gunthorpe wrote:
> > > On Tue, May 19, 2026 at 11:04:37AM +0000, Mostafa Saleh wrote:
> > > > On Thu, May 14, 2026 at 08:13:25PM +0530, Aneesh Kumar K.V wrote:
> > > > > >> 
> > > > > >> What I meant was that we need a generic way to identify a pKVM guest, so
> > > > > >> that we can use it in the conditional above.
> > > > > >
> > > > > > I have this patch, with that I can boot with your series unmodified,
> > > > > > but I will need to do more testing.
> > > > > >
> > > > > 
> > > > > Thanks, I can add this to the series once you complete the required testing.
> > > > > 
> > > > 
> > > > I am still running more tests, but looking more into it. Setting
> > > > force_dma_unencrypted() to true for pKVM guests is wrong, as the
> > > > guest shouldn’t try to decrypt arbitrary memory as it can include
> > > > sensitive information (for example in case of virtio sub-page
> > > > allocation) and should strictly rely on the restricted-dma-pool
> > > > for that.
> > > 
> > > ??
> > > 
> > > Where does force_dma_unencrypted() cause arbitary memory passed into
> > > the DMA API to be decrypted? That should never happen???
> > 
> > Sorry, maybe arbitrary is not the right expression again :)
> > I mean that, with emulated devices that use the DMA-API under pKVM,
> > they will map memory coming from other layers (VFS, net) through
> > vitrio-block, virtio-net... These can be smaller than a page, and
> > using force_dma_unencrypted() will share the whole page.
> 
> force_dma_unencrypted() should only trigger swiotlb and that never
> memcpy's more than necessary?
> 
> Where does it do otherwise? That sounds like a bug?

Agh, I got confused and thought that it can be triggered from dma_map()
too. I need to figure out why that made pKVM guests boot with broken
restricted-dma-pool then.

However, it should not alway use SWIOTLB? It can trigger decryption for
any memory returned from __dma_direct_alloc_pages() which can come
from alloc_pages_node().

Thanks,
Mostafa


> 
> Jason

