Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A08BCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQZO5nTRmEQFRCy1SP5NN6DtrD69wZAHlR442WwrJB4=; b=C6wcpuB1+ZJienj3Rhp8aQtmYo
	80Jvjog/2LTQ2LFkchmQML/l+AKOxtZF9egQU3iENtxtkLc/+9Mz/UivDLFxCcLxHVUf5WLMrD9lr
	eK6n5ZpO6xxqD4FlI1jyr4jxJsCkQzRIu0OVl2mmVfEG4YQin6IN2BpdH9kEnaWq3S2GdY4ds4tYU
	BdPHTCurG76qv3HhFaCXrYekjwB4t+ZIKame6dOyxZTLe4ylTkQ6gHBHJ1VmzkJWAaQ1W7ss2GEn7
	v2KeEpzOyLiKX+bc8ApOjLA9pf/H2eARasB5PR48DxWoJt9Rr7omJCU2WmIq9tuZzLXoUT4789C0y
	JwuP9rMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLXk-00000001qv7-09DS;
	Tue, 19 May 2026 14:35:36 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLXg-00000001qsi-0WvM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:35:35 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-90ea08cc5ceso640425485a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779201331; x=1779806131; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQZO5nTRmEQFRCy1SP5NN6DtrD69wZAHlR442WwrJB4=;
        b=ODfXiHExGWetZvGu+sN0QE0Py3REX0PRQuCmCnhKdX7do93ryUyDj8zF319raDjV66
         1ygZ0RIcMEg6RVSBnSURgO5rS/JTC+1cIlReiVWArjI7d2OGSCrioEuPzvhtKWXN4L5G
         YMesi78XMcUZ5y4C+72Px29ww2XCo4fDnj8iA0O4JCrDgPrl8ABnrjinRKFOyJ/BWCJk
         sNIAo1WoRlZpNbqNQL81NI6FNBFihqiRe4W44Ex8wYxnhLgpRcYbm40h4uXmxBwSLBpi
         bkj0dQc9kqSMkKKlgJG2XBqsaqpYi2L+alQ3VvTd2K3HtfWzf3PDFmQ34bEhX4m4Q52b
         dRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201331; x=1779806131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQZO5nTRmEQFRCy1SP5NN6DtrD69wZAHlR442WwrJB4=;
        b=JD8Zd9Zx7e3Xl6yDFz+RxxdgztfVF5z5mcEgK6jb2xnfsiaHj9GLEnbHsOwsNCxfhd
         r/71GvimOHjUHv6Vd7Tuq+YwFBJJP7z1Iz5BKwkbpotoxOPg9IUVrNiEtoJMqkGI/BPj
         KhALnCsnQOUhTnmS+O76ZTVWKA/+aoWdceQGpgZzTruQ0EcD/bQ7v8Wzj9W3ezw8daoR
         Xl08D+vn0IbyJlG2cH8QNg75ocQeSmXQpvNwqI/W4ncWCPg9hmNZ6wTcY5lU3FG/FNfm
         DcioFz+kYfenQAlqVeGMybJkbahrmFIcG+9BdyVSOCPnIGdL6SuAa7WbMfU00Kd+LbIM
         O1rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yT1g4L66qiZI+x8ecBiAOOkukH7QElBbaMEPVT0N/N4JzpdG/QYOsXLsEr9pNJAHvIUZ5cMp9YAA4ypNiO0GT@lists.infradead.org
X-Gm-Message-State: AOJu0YzFUJrnNGqFkuQsiFwiE2aCU+L+Vlsafn6THhqBT37iEML1GBr5
	LQDsglfwmTh4Y96r962LLkYfuV6/oGtgxG/fI7xYS4J3z8/fc/St5Gn59M0n8UytRpWUK5T6Yju
	hVFwm
X-Gm-Gg: Acq92OGo4bKnIfcG7M9gslFsmyN+FKobZdZ9ht/7zAHfEAtaOZSDWnXROsa3bGZ+vil
	ZoV4LYy6SmKY/iv4ffssZWbcn7CdOd3m2WC+OollOxnI6OILo6boCVWrF7n+gwnOSriwAfFMNhJ
	VgQtAhrDRF6LkGxLvBHzLkyn2eJC3FMFwhZgDDv9dD0ti4il6X6QZ6hGSbAkCjckCIVNz6eCfpt
	Pse6nhHKPPkWyH4B2XwlXL9NmUb0i4kmEgoZEnOunt3i+hbg0WpvE0lEVNtQgOw3RZbC6Q4BaVp
	YxhD8BSJrSylvXJLP4pPnVscZO5ZlLduL2eQGHTeNmDGuPPKZ3vaUaNPZ6/lsE/iCkv7Om4XWhT
	oy757hFBE/a31V3zF+yHavoLea1F6YUzlJiTKFa4UIweXnGYUqSRhBMAfNdBSc4frMU1pZz+2xl
	/lSDgMX3lPrMMZaJXMWSJe8U5kv/6qoa39rvRbZWVfXKTCjvDDrknzx0RQbJKc9Bc0Fx5Rnp2Dj
	cF+Cg==
X-Received: by 2002:a05:620a:d8a:b0:913:e5bb:3db6 with SMTP id af79cd13be357-913e5bb548amr1506341585a.31.1779201330581;
        Tue, 19 May 2026 07:35:30 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc83ff00sm1849026185a.26.2026.05.19.07.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:35:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPLXd-0000000F7pa-1dCL;
	Tue, 19 May 2026 11:35:29 -0300
Date: Tue, 19 May 2026 11:35:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
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
Message-ID: <20260519143529.GD7702@ziepe.ca>
References: <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agxolksC_1nfO34X@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_073532_209003_08E04C5D 
X-CRM114-Status: GOOD (  26.11  )
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

On Tue, May 19, 2026 at 01:41:42PM +0000, Mostafa Saleh wrote:
> On Tue, May 19, 2026 at 10:29:11AM -0300, Jason Gunthorpe wrote:
> > On Tue, May 19, 2026 at 11:04:37AM +0000, Mostafa Saleh wrote:
> > > On Thu, May 14, 2026 at 08:13:25PM +0530, Aneesh Kumar K.V wrote:
> > > > >> 
> > > > >> What I meant was that we need a generic way to identify a pKVM guest, so
> > > > >> that we can use it in the conditional above.
> > > > >
> > > > > I have this patch, with that I can boot with your series unmodified,
> > > > > but I will need to do more testing.
> > > > >
> > > > 
> > > > Thanks, I can add this to the series once you complete the required testing.
> > > > 
> > > 
> > > I am still running more tests, but looking more into it. Setting
> > > force_dma_unencrypted() to true for pKVM guests is wrong, as the
> > > guest shouldn’t try to decrypt arbitrary memory as it can include
> > > sensitive information (for example in case of virtio sub-page
> > > allocation) and should strictly rely on the restricted-dma-pool
> > > for that.
> > 
> > ??
> > 
> > Where does force_dma_unencrypted() cause arbitary memory passed into
> > the DMA API to be decrypted? That should never happen???
> 
> Sorry, maybe arbitrary is not the right expression again :)
> I mean that, with emulated devices that use the DMA-API under pKVM,
> they will map memory coming from other layers (VFS, net) through
> vitrio-block, virtio-net... These can be smaller than a page, and
> using force_dma_unencrypted() will share the whole page.

force_dma_unencrypted() should only trigger swiotlb and that never
memcpy's more than necessary?

Where does it do otherwise? That sounds like a bug?

Jason

