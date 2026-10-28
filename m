Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63D1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QuTD9QLH;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ULtlPxXu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HF1altOhSOliHgMv/AZ/rbBGnqwe/0k0dVHlSjsTcys=; b=QuTD9QLH/hzMcgnTIpgQM8Ln4p
	mQG6BQWucZAb4BnuI/VOeaAJlo2A/CHH5EW8u3wCarGAXCNc0Q9wmN+/2E07xw9dggqREPoMZY7fE
	s4vVPNsfW4zVm9wLOGfZrKMAVTLHcTQZkd9rWBl0u2/Ut/KeeLPa+7hCvaSmwS9HmWtM5utZa1jXg
	Y7A7sQ26B3C50p/7hsuZKYxUmCzryhrM4IJ+knqZ2knTr9e0wZ5gHAF4xk4Ju03xYdRXKLmkn8d25
	DkOTV86tkdtEcD6sbg3MtjbWj9Vi6hnbrjS4kiY2GnH+x9Pl9PomkhyBkO4U0v5TXmp3xEH/NcmSa
	4WhfGsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4zI-00000007G32-1Qkb;
	Wed, 28 Oct 2026 14:50:48 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4zF-00000007G1K-1Akd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 14:50:47 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c169ae1cb26so339823166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793199042; x=1793803842; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HF1altOhSOliHgMv/AZ/rbBGnqwe/0k0dVHlSjsTcys=;
        b=ULtlPxXuIdqXP5jZLZpDd0vHTFGeeod2vRHQdkBXCEqf3UI50Hs/Aapcvs9R40UFi/
         ZO55CQxor1r4kmdPfItt6wMIBIcKNaO4xoGNzEd2+BxPPzLgHCWBUmAfGzzthWCihzrB
         rt0SY3iPL8qrAowzDLsCaK1MCVuITg3M5cv78pjYglx3YF3cUlW74mTK2UKVS1BeGK8m
         1+eUbS5PMEr6ZUc7yu8n8il1ZLnpIqZKg95Hg69POR+ThdYEoHiImaOYQ7mg96ftwJqH
         kdNkya/EDeVo79w5Y5bARDW5yQXTMila7DH3WF5Jqq2H8zLrDEgZzNcdet3BZDJyMTdj
         TtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199042; x=1793803842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HF1altOhSOliHgMv/AZ/rbBGnqwe/0k0dVHlSjsTcys=;
        b=RBLiRWvYG3uHpCjjb8BydDvhnNhsoLKNaoTLLeZisUFK1m7KPdB8cZ55wjSLtKKaj3
         n5OPRNvbisbbM0SbbTI9EQytRnmUJyCyf8qFi3coAEBpdBKlz/ipsU1en7wZhcZlusiz
         oU+yarfo/HXjp4/3D4gSRrYw8YGoiUeRPEljNmSUbRyBWn4Qp+1xZ5bVBgttP1MCOGq6
         zBjJ7FmH7WXlFkjpMrIoxpt0MVj4eJiLUppajVod3N9+rqDzE7UpmVSC0p9AihmfNgsW
         3u849khhtGE+ZNKiDoUOP4fvgnYw2UNPza51NbyFB2cKwdqwo5QxFibS+hFd0bdOuwyk
         1gew==
X-Forwarded-Encrypted: i=1; AKwUvByltpN1gDPoj8BSNcHTwZOjdwNpthNsZ23SNi/2ay2ltOMBX0d2yQDIOkw21XmliImAkVKLB6Hxjxk/sB5BhPfJ@lists.infradead.org
X-Gm-Message-State: AFq9FYLOyYIC5d6D9exoON9BULqNTEs8HMpZ19mNTLPWYuces0AaxhnQ
	3fG1i1eeQD3dz8K5xbaFUO3cYsHLsi9ADfQVfYCn2a/92P6YcopLyKwwvajcv8AGpg==
X-Gm-Gg: AYBFou1ahLA4d7mhy8bVdKdBt0KATAf0hDX23dd0WuQVUtJ3LVCZb9KY4TzSW6ez/AX
	V7mFSaGWFOvhEPqUXU3YXjLw7NFMiDW37x+mHrKg8COO+dtRtp4DfUIGpYbXi4WbDbArrEscLpG
	CYK/CvDmZ0FEeOdYfZgCeplvAOJWJ4iHl5TuKEKG7L0QzbLdBFYz57LV+lYKuV1z3UPqvU4dwWZ
	7I9vHYuzIZhdGBTTw81NYthlRIJVYJSw0apvdlxqeBPTjCFf8SgD5WuoyWP1GUgfRIoidbDge6C
	hCoSdd/OcxbhSLZO+UxBIFzHUj1fw9qypB7f6ZZBGdH0Js/8XRBpmqBA/UVrbtJeqz7t1WnxhMR
	3CoFTPpGaboU54YLVzNRGh5JG7kmeS++fDWzl2QxK7TBm11cHqLN2dkjp6ALE1N5eXSBsHeuxNh
	b12sk5dj9O1jIUfFnCKEpiBhvmLmfty0DPzAIXeiDulG74DQ1Ioru7ROrYF9UQ1CcWGjDEnBEiP
	JTDBIjh+wvTk+Ys2ghpOzm4pUcJDDveIjBNjyMYxtYXostkOg8txSl66jVNJ8AvqBs4sXuDmFdo
	9VvNQ7twqyUGtggN8E1mDV95ruG+CZylzsed5PvhxJWh5OUQZu4erw3Eg01syseBkk2wNWQAIGF
	7BorBM0BfCJE=
X-Received: by 2002:a17:906:99c9:b0:c29:4b57:503e with SMTP id a640c23a62f3a-c49c620c08emr153260566b.1.1793199040959;
        Wed, 28 Oct 2026 07:50:40 -0700 (PDT)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd35004asm607338466b.4.2026.10.28.07.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:50:40 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:50:36 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <auILvMVSXk9pZh6M@google.com>
References: <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
 <asOD31rTX6dNfD1o@google.com>
 <aszdnInyJxLhSQRp@sumit-xelite>
 <as3798SFCfKFirag@google.com>
 <as4ATqhp0bPI03PA@sumit-xelite>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as4ATqhp0bPI03PA@sumit-xelite>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_075045_376627_042DA4DA 
X-CRM114-Status: GOOD (  71.05  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 13, 2026 at 03:26:30PM +0530, Sumit Garg wrote:
> On Tue, 13 Oct 2026 at 10:37:59 +0100, Vincent Donnefort wrote:
> > On Mon, Oct 12, 2026 at 06:46:12PM +0530, Sumit Garg wrote:
> > > On Mon, 05 Oct 2026 at 12:02:55 +0100, Vincent Donnefort wrote:
> > > > Sorry, not sure why Sumit's email was dropped...
> > > 
> > > The problem was with my mutt config, it should be fixed now.
> > > 
> > > >
> > > > On Mon, Oct 05, 2026 at 11:48:00AM +0100, Vincent Donnefort wrote:
> > > > > On Thu, Oct 01, 2026 at 06:04:06PM +0530, Sumit Garg wrote:
> > > > > > On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
> > > > > > > On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
> > > > > > > > Looks like you dropped me from your reply.
> > > > > > >
> > > > > > > Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
> > > > > > > CC list to To: and drops you. I suspect the same thing happened to Thierry
> > > > > > > when he replied here:
> > > > > > >
> > > > > > > https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
> > > > > > >
> > > > > > > I can't figure out why that's happening :/
> > > > > > > I manually tried to fix the To: and Cc: lines in this message.
> > > > > >
> > > > > > Thanks.
> > > > > >
> > > > > > >
> > > > > > > > On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
> > > > > > > > > I spoke to Brendan at LPC (?) last year but this doesn't really work
> > > > > > > > > for arm64 because it relies on being able to unmap arbitrary parts of
> > > > > > > > > the linear map, which isn't generally possible unless you force pte-level
> > > > > > > > > mappings for everything, which is prohibitive for perf/power.
> > > > > > > >
> > > > > > > > As per the cover letter it's about allocating pages that are not present
> > > > > > > > in the direct map. This essentially fits the protected DMABufs use-case
> > > > > > > > where we don't want any kernel mapping to exist at any time. Bufers
> > > > > > > > allocated from protected DMABufs are only meant to be accessed by the
> > > > > > > > TEE implementation or HW accelerators like in the secure media pipeline.
> > > > > > >
> > > > > > > That sounds like it should probably build on top of this series, then.
> > > > > >
> > > > > > The main problem I see with this series is it tries to move from the generic
> > > > > > CMA allocator to a reserved FF-A CMA pool which again comes from the
> > > > > > DT. We already support reserved pool allocations via "no-map" which are
> > > > > > discovered dynamically from OP-TEE.
> > > > >
> > > > > I can't think of a way around a DT declaration. We need to know what region is
> > > > > PTE-level before the direct map is installed and of_reserved_mem is very handy
> > > > > for that purpose. And as this PTE-level mapping is costly we certainly only want
> > > > > to enable it for platforms that absolutely need it.
> > > > >
> > > 
> > > I am rather thinking of a way to turn the default CMA allocator to be
> > > PTE-level mapped. Since the overall idea for this dynamic protected
> > > buffers was to reuse memory efficiently, otherwise the reserved buffer
> > > approach is already there to use as "no-map" via DT.
> > 
> > When the default CMA allocator is setup, it is already too late
> > (dma_contiguous_reserve() is called after map_mem()). I am not sure this can be
> > reordered easily due to the dependency on dma_limits_init().
> 
> Yeah I saw that constraint too, let's leave it for future extension
> then although having this reordering dependency fixed will be ideal.
> 
> > 
> > So the only case it would work would be when a reserved memory has set
> > "linux,cma-default".
> > 
> 
> Let's rather just turn DT based default CMA pool to support PTE-level
> mapping and keep it configurable via Kconfig or cmdline or DT.

If we need a DT declaration anyway, a Kconfig and a cmdline option aren't really
necessary.

Also, Rob wasn't very keen on having a DT option for the reserved memory and
suggested to have a compatible string instead [1]. So perhaps we could have a
a separate driver that handles the unmapping.

	linux,cma {
		compatible = "shared-dma-pool", "unmap-on-alloc";
		reusable;
		linux,cma-default;
		...
 	}

That "unmap-on-alloc" driver sets the memblock flags and register some cma hooks
(to be defined) for cma_alloc/cma_free where it unmaps/re-maps into the linear
map.

The nice property is optee won't need to be modified anymore. The downside is
the entire pool is now mapped at PTE-level.

[1] http://lore.kernel.org/all/20260902172436.GB1440252-robh@kernel.org/

-- 
Vincent

> 
> -Sumit
> 
> > > 
> > > If we can have "cma_unmap" cmdline option alongside "cma" then it can
> > > turn the existing default CMA allocator to support unmapping buffers.
> > > Not requiring a DT change at all, although we can have the DT property
> > > for the default pool too if platforms want to opt for.
> > > 
> > > > > >
> > > > > > If we can rather support a generic CMA like allocator for arm64 which
> > > > > > can support unmapped allocations then I am all for it. These platform
> > > > > > specific reserved pools isn't a scalable solution.
> > > > >
> > > > > What do you mean by generic CMA allocator here? An extension to
> > > > > shared-dma-pool? Or having the CMA automatically doing the unmap/map on
> > > > > cma_alloc() cma_release()?
> > > > >
> > > > > Right now I have created an API for the unmapping/remapping part. It adds a
> > > > > burden on the caller, but the alternative solution is introducing post-alloc
> > > > > pre-dealloc callbacks in the CMA, which looked a bit overkilled to me when
> > > > > the users of that "ffa-pool" are only optee and the nvidia video dma-buf heap.
> > > > >
> > > 
> > > I am not too worried about where the actual implementation lives but
> > > looks like CMA driver to be the better place. I think use-cases like
> > > guest_memfd proposed as a user for __GFP_UNMAPPED on arm64 will also be
> > > looking for this feature.
> > > 
> > > -Sumit
> > > 
> > > > >
> > > > > >
> > > > > > > You could allocate the DMABufs from a CMA region that has no linear alias.
> > > > > >
> > > > > > Allocation from generic CMA pool is already the case here:
> > > > > >
> > > > > > tee_shm_alloc_dma_mem() ->
> > > > > >   dma_alloc_pages()
> > > > > >
> > > > > > Do you mean it's just fine to unmap buffers allocated from generic CMA
> > > > > > region since it doesn't have any linear alias?
> > > > > >
> > > > > > >
> > > > > > > > > Vincent's series tackles that by using a pool so that only that part of
> > > > > > > > > memory requires the pte-level mappings in the linear map. That's the
> > > > > > > > > whole point of it, so I don't think it makes sense to drop it in favour
> > > > > > > > > of Brendan's approach (which doesn't work).
> > > > > > > > >
> > > > > > > >
> > > > > > > > For protected DMABufs, we even don't require any pte-level mappings in
> > > > > > > > linear map. The whole idea of mapping and unmapping is just a bottleneck
> > > > > > > > for performance sensitive secure media pipeline use-cases. That's why if
> > > > > > > > we can support __GFP_UNMAPPED with the memory allocator on arm64 would
> > > > > > > > be the best fit for this use-case.
> > > > > > >
> > > > > > > The point is that you will require pte-level mappings for the linear map
> > > > > > > if you want to unmap from it at runtime on arm64. If you don't, then you
> > > > > > > can end up needing to split a block mapping (e.g. pmd-level) when you
> > > > > > > decide to unmap only part of it and there isn't a safe way to do that on
> > > > > > > arm64 without transiently unmapping the entire block, which can lead to
> > > > > > > fatal translation faults during that window.
> > > > > >
> > > > > > I agree with you here, what I am rather trying to find if on arm64 there
> > > > > > is any possibilty to have a generic allocator for unmapped pages. That's
> > > > > > the use-case here as well as what Brendan't patch-set was trying to address.
> > > > > >
> > > > > > >
> > > > > > > > Now the question is why arm64 can't support __GFP_UNMAPPED similar to
> > > > > > > > how Brendan is doing it for x86?
> > > > > > >
> > > > > > > Because arm64 != x86? Presumably x86 doesn't have the strict
> > > > > > > break-before-make requirements we have on arm64.
> > > > > > >
> > > > > >
> > > > > > Sure, sounds like you are eluding to that the generic MM flag
> > > > > > __GFP_UNMAPPED being proposed can't be supported on arm64, right?
> > > > > >
> > > > > > -Sumit
> > > >
> > > > --
> > > > Vincent
> > 

