Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2605DCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rg6bmFDt84HgfdmHQ5rMQfe5qNs0Lmh5zrMOKqozbmM=; b=HpnfYMldUWdUmklXy78k41xLht
	/XgXEeWcDbopP7C7HZtx7XczN8U1dU3d85Kl50HuvO8bpffc0xTWqlGQTokZ/kqZDbjcvAwMolQ+L
	/H8vJiWC7lyxuzaojMofltiHYAZerH5Eolrd52jksaws7LsV3QkKQmQaGDUZLyAEgS1p5pJihHgyP
	/D9fBvgfHS0BOLnvIfGatFQ31j/UsBYqMnC2U3McOvjOcc42rN2zzQXmoi+a2pgJHI4BTzhaBMTCf
	gxGLckKzmsonlpPDcSbxsIViRVOXVzYHHjnnolW5XXBqxkJmTamE03Xf82wIUb47Gh391hqNptxrO
	5/pBPZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUYd-00000005NjI-2QgL;
	Thu, 14 May 2026 11:48:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUYc-00000005Nj7-17Ay
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 11:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rg6bmFDt84HgfdmHQ5rMQfe5qNs0Lmh5zrMOKqozbmM=; b=Rmwm3CSSH91nQ+xrRa7X2nec+Z
	Yjdwy1EcTi3/11hROoqdONnBzURooc0xqpUaz+d9Efz9THTd4XPeTdxD/j6GBLsHEo5OH9Gk+/1eg
	Q/BLdgWPmlhfj5f6rD+xrSgoApRnmeR9d8kiXXa6cDvzxpQxRgWzuQjWTAdReXYK/hZWGRFokuyZK
	jahRGPYv0UhCouY91T1KeyrnKqLPHINAnUqQBXwI+0hhmKMf+aMWZ2p9CcE98oz4mYRPTZ7UDDoE6
	40+/4WcjW41ViBP9g3e+ZUxUTfXYV7ia+zNFZHm+MSVXI96aqDXsWz29APn6ENSHuMTcHEQo8ippr
	E6IRpN5A==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUYY-00000002nbA-3YeN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 11:48:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so88205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 04:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778759324; x=1779364124; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rg6bmFDt84HgfdmHQ5rMQfe5qNs0Lmh5zrMOKqozbmM=;
        b=p9hfu2nF9pt1pku5QLlESlc49hBm9zNcdrBPrAajOKshQoEJdf1ZCwhTEazPP9KRv7
         dQfECtOlLDFgnqvos2YpGo5gkq4W+XSiwWNfdaT8dPiMstiaCA/AHLjY50tpEzo0c/o9
         ZEFAfKFMRmriwzre4hWNoe38M8lLY1+RwmynfRB1adEYZjrqx3NEF8SjT7yPBRJZIgRe
         038pxV2btNEkUV9qWbM6owQ9bScm0GLNrehDGodmg1ggLOM+qsDlael8YTQHUlnnnICt
         PCjC3YbZ1WaQ322MxxSlZO9PJ9uaf/N2hkkrKuJQoweQF6Q5fanSJWgRCabiPukMi8oq
         Z15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778759324; x=1779364124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rg6bmFDt84HgfdmHQ5rMQfe5qNs0Lmh5zrMOKqozbmM=;
        b=Cl/TGoxvWYzKNxly+ZM56ERJtZ3m1gxOI/cFY9zG/toSHvWCZ7/IgqFZ0MuuwI+PXG
         WS2KhCI2lcLp4d6+nAHOGeEkBp+pBm0gMkkVX5UPcTbW5paFYedrl/c/02ZxE+9CJg+U
         CydHtIb4zaFaiRMZb2slAXCl/27WsHc3CQYKTjfTqLV4GdGjVklggMu4+PKg2WAFBgu9
         2jGPOXRKJ9Zs5aMwXloX4mxVHOEAHgnPGj0dHztFX7CsX4kb/U+yqQtX0Lt0R21/jHOx
         xxRTkz5WdkVD+SioHO9QTWPw+Puc67qY8zsyBtjhbxTOQZgoFGPMYFvhLwWE3Jfk6MEs
         Vbbw==
X-Forwarded-Encrypted: i=1; AFNElJ/j60Gu1ZZh2mDx6JfBAuEYJ3rsG388U2jqsA61yU0YA/Iz25uch3rtV+GON1tc0LW8OCes2XHdvZwqVQ4mFtK1@lists.infradead.org
X-Gm-Message-State: AOJu0YwzFyPWNRJuLwGFhs4qqXEx7YSQHeC/cKLXsTIMsgzlLb/yy8+a
	32bw0Cppbn9tHEpYHh5ZYv0cNq0ps1Ja9ifOnukKaxt8Tx24z79tvwNJ67bCy41Jfw==
X-Gm-Gg: Acq92OGf+wLQGbFmrjAFeEeSDzJnovejY/leDqIcEW2OzAH/5jMQ8FblPI4BSsIgmoU
	OhJBboRJkjfqYRchpIyzwqVfiM7aB/tcQqxQQIR+59eV4E6IhhGJeu0yVTSl06mPOs3AMfcaZGu
	lDO+VsiVhgqVToWdF9F/z0FqPPTkiBocOqHmBHwd3GDV/8mvFdY16YzSiKcatIicEbi7PGgftf9
	qa39tjZKT8PQM87g6vPYc+B1MAFl18pZl7RQ5HFEGnzePUEd4aBqh/oV92p7BEC7Rjw1H0OoUAg
	JVRAyZBUsDqLlpI3fA/+8b2YR6RZeJyjXVvtG50rTWd6S2LQxIoZDZK0HXZchd3tbCLhFUNFciZ
	MfffwS248kl9TYU2pdGp3ZYG9QD+xrWs4O6KdGJ6jKI9BLPIDYQEHWWmQ/JjKg6jN9JRjxDr32R
	kfvVF3tI0WbAuAWjsFLmCPW6onpPbpYkJoOUOuyLhgLusmczXMSY4dWvJD49mvgn5nPVo=
X-Received: by 2002:a05:600c:a30a:b0:475:d905:9f12 with SMTP id 5b1f17b1804b1-48fd6bcf0b7mr839965e9.4.1778759323668;
        Thu, 14 May 2026 04:48:43 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb26ac98sm47844535e9.2.2026.05.14.04.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 04:48:42 -0700 (PDT)
Date: Thu, 14 May 2026 11:48:39 +0000
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
Message-ID: <agW2lzJI-20DyJVe@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <20260513172450.GR7702@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513172450.GR7702@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_124847_455189_CB450E8E 
X-CRM114-Status: GOOD (  46.21  )
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

On Wed, May 13, 2026 at 02:24:50PM -0300, Jason Gunthorpe wrote:
> On Wed, May 13, 2026 at 02:27:14PM +0000, Mostafa Saleh wrote:
> 
> > > +		/*
> > > +		 * if platform supports memory encryption,
> > > +		 * restricted mem pool is decrypted by default
> > > +		 */
> > > +		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
> > > +			mem->unencrypted = true;
> > > +			set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
> > > +					     rmem->size >> PAGE_SHIFT);
> > > +		} else {
> > > +			mem->unencrypted = false;
> > > +		}
> >
> > This breaks pKVM as it doesn’t set CC_ATTR_MEM_ENCRYPT, so all virtio
> > traffic now fails.
> 
> How will pKVM signal what kind of memory the DMA needs then?
> 
> Does it use set_memory_decrypted()? How can it use
> set_memory_decrypted() without offering CC_ATTR_MEM_ENCRYPT ?

pKVM (hypervisor) doesn’t signal anything.
The VMM when running protected guests will use restricted dma-pools
for emulated vritio devices in the guest, which gets decrypted by
the guest kernel and hence shared with the host kernel, and then
traffic is bounced via the pool.

It’s also worth noting that bouncing here isn't just about visibility.
Because memory sharing operates at page granularity, bouncing sub-page
allocations through the restricted pool prevents adjacent, sensitive
guest data from being exposed to the untrusted host.

> 
> > Also, by design, some drivers are clueless about bouncing, so
> 
> Oh? What does this mean? We take quite a dim view of drivers mis-using
> the DMA API..

Maybe clueless is not the right word, I mean when virtio drivers use
the DMA API they don’t know whether it’s going to bounce or not as
that is decided by dma-direct (and in other cases by dma-iommu,
but not for pKVM).

> 
> > I believe that the pool should have a way to control it’s property
> > (encrypted or decrypted) and that takes priority over whatever
> > attributes comes from allocation.
> 
> We should get here because dma_capable() fails, and then swiotlb needs
> to return something that makes dma_capable() succeed. Yes, it should
> return details about the thing it decided, but it shouldn't have been
> pre-created with some idea how to make dma_capable() work.

That sounds neat, but at the end we have force_dma_unencrypted() in
dma_capable() which is just hardcoded to true/false by the platform.
How is that different from having the state static by the pool?

> 
> If dma_capable() can fail, then swiotlb should know exactly what to do
> to fix it.

dma_capable() returns a bool, I don’t think it can know what exactly
went wrong (based on address, size, attrs, dev...)

> 
> If pkvm wants to use the hacky scheme where you force a swiotlb pool
> configuration during arch init with force swiotlb that's a somewhat
> different flow and, sure the forced pool should force do whatever it
> is forced to.
> 
> But lets try to keep them seperated in the discussion..

While we can debate the aesthetics of the setup , this is
the exisitng behaviour for Linux, which existed for years
and pKVM relies on and is used extensively.
And, this patch alters that long-standing logic and introduces
a functional regression.

We can address this by either adjusting this patch or by changing
pKVM guests to be more aligned with other CCA guests which is
something I have been wondering about if it would help reduce
bouncing.

> 
> > And that brings us to the same point whether it’s better to return
> > the memory along with it’s state or we pass the requested state.
> > I think for other cases it’s fine for the device/DMA-API to dictate
> > the attrs, but not in restricted-dma case, the firmware just knows better.
> 
> The memory type must be returned back at some level so downstream
> things can do the right transformation of the phys_addr_t.

Agreed, I believe that will be needed at least for
SWIOTLB/restricted-dma -> dma-API interactions.

> 
> One of the aspirational CC things that should work is a T=1 device
> tries to DMA from a decrypted page, finds the address is above the dma
> limit of the device, so it bounces it with SWIOTLB to an encrypted low
> address page and then the DMA API internal flow switiches from working
> with decrypted to encrypted phys_addr_t.
> 
> If we can make that work then maybe the flows are designed correctly.

Mmm, I am not sure I understand this one, shouldn’t the device also be
notified about the switch in memory state, if it expects to read/write
decrypted memory, how would that work if the kernel changes it to an
encrypted one?

Thanks,
Mostafa
> 
> Jason

