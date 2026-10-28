Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBFD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jsfg51sS;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PCW1gEuA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tOxsbn2WzdX0v59D7Zs82WgtkG4cFGkj3ewz31Uolyw=; b=Jsfg51sSv/2C7I1ZRlgXsnd8jW
	uBixBezlp2+Wu7+kZmpjRsMs81vOtUHT7iN9rLf/NP4lKE8VnuduTeK5SOKuqth19PUHnDEQHGS0l
	z66jZvwq3dXhOMg1J0QfGz7gnxCoLyzY4TMzmj7yPQcw7s9gEY8r5m3W0x/xNWJwM3h7xwmCX4wjP
	83tU0mHlUaH7QKeKMSVO+KPqG+CcPZ8WGRGXVIHLTra47+PUzc2h5eMN6T1x1/BnAqNLDED87C73G
	Ev9+lZVXniPrIrnI2DwOX9nKH30bqE/oPhBAnP8ixonJSdjzsSJogz5fv2EbCJMaU9VT6dqDQiPAK
	ulCYemnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7k6-00000007hMg-0Iha;
	Wed, 28 Oct 2026 17:47:18 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7k4-00000007hM6-0Fce
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:47:17 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5eac4855401so603037e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 10:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793209634; x=1793814434; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOxsbn2WzdX0v59D7Zs82WgtkG4cFGkj3ewz31Uolyw=;
        b=PCW1gEuAQ4uO4icRUa4dgL6Zy6cw63p10FxaujzHc/cCNY9iU1Tonlccyg8joDeKkE
         k5AGCiYXDUako2OPbOOuRIMXdMZqw71KdG+ZbLeJdo6hzR1U2rkwcRZUFNUAk/KwawE2
         kISAbqX/ZBJbYKxu21MASNd7RfhCOp1v7R8NtDKnxMbCRtXdBKLzKKPLSo8b27IxZm9b
         3jkEMzNvsSAKfLdvSZKjyQno/RO0Vnof2bgkNjsFvvR6kpCpEmnNx8pRdL7c8uGl45i1
         1XhPsNKED6HFrfES9vOnwPG4tW+j0S/utSvYfMNai+v4BeTrd7bfzfWQmhI4qnLXzb8Q
         3v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209634; x=1793814434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tOxsbn2WzdX0v59D7Zs82WgtkG4cFGkj3ewz31Uolyw=;
        b=tS2Ok0JD/Bc6FmbR0o8xJUqNmZM3jSJTFx/d1HZEgoX0djS899R5zbP++0Dbw20a10
         2pif6PPMbo9qnxhMsks/miY3m3gXnYWHGX2/jzFxK1kcCt+mQT+XmkCEOJ76BYjiNQA3
         35e/sm+bOXEn1f28ryA09ubi6m8otkMe76oLyR+QGHEMpbWrJvzF/QdVY4eNw55qSnOL
         OUupSYelbWA7JW3L6aJSejoisWwDx7y6ms0yWkoHZOq12CAvJ9uAlQNPFKlf85WhMy72
         sic50MOYTbeYLQMdxD80Jnr0Y8aE8zj9j1Gd2kFlq+ZStovCyKihVnBPTeQqqyPOYtEt
         Jb5g==
X-Forwarded-Encrypted: i=1; AKwUvBy0bb7qYoYPv3oSyUB0AN6D1m70vuu80avnRyX+f21XfxEvhIXIbpZx0gJt/DFaYMBccZV9LWSSaffzeSoKbEs4@lists.infradead.org
X-Gm-Message-State: AFq9FYIghlS1/jKIaC1h/lrRP2j4k4XmxnXChUyjW1GVR7u1+QbDUGQD
	1I4mjP0lqTSNnn/2utV/+g3A98eq8AHP2nDWhZ1st52/E8+We7SrlumC5F2Azob512g=
X-Gm-Gg: AYBFou3PJ4VL2u+x4NktcOT7Vx1RLtrNbKgZ+YY3jMuiR4zLraxQs37ECPm+GSONcs8
	jKeuxotpy7n6A3q+ygWNt6HsF6qgGGgqiMDFnee9Hg7uuegtIT7IDFXRjWgbBfdqzIqWVNaq4vW
	TkE0EY9x41hC7AjjSMMAnzvSROxyqtkc1H6C7c0qCLE5hQJyoMmSnuCbCYk2VrIcY88vW89qH+o
	rT4jmPYx5KnoXBaTEw/tYSHVcuFfx/gyQXk9TfThtMbMBMsU0NXSdiBhQOI7cPIpzRMY+KhqxL7
	odhnOKx9ARao7ySJ3pZ/WBmTZx2kO+E/E7Ors+wwU1yyvM45HXVsCZ9Hy9ycGkAf/RzdNrTY9i2
	5e6+tFB3/dsBYVE7jhJg89Y4II1g5lcuJUckT0HdEunGPxkQzvud+V4lGz55OfoJEJCr9HdVUF+
	s0UDCG/hpLuupBAB4Ez7EukxNIJV2LKrJOkfvQiokLdxlhFjmgKad89MdtOvZGswHqJF42F2zfC
	AtFsQiswLUkAVO5OAYPZ7tK831nEctDU6EXlYXpB8dhzaGzsyjn6AVwkBwJXNAZfYLMTWJHs3+v
	Y9bzZ1iO0OHV9uI1xLd00B+p6AyLQr0iaFjxcK7HeX/CwA4f6d5u+E3sxboZVGZrOvucw+SvL/m
	NOE0gMuleQ35kuuHHXrRi8bSNyG5NMTFbkt9JNmD+elad8h+39nJ0fA==
X-Received: by 2002:a05:6122:2896:b0:5ea:fae8:e69e with SMTP id 71dfb90a1353d-5ec4cc4f065mr1774474e0c.11.1793209634129;
        Wed, 28 Oct 2026 10:47:14 -0700 (PDT)
Received: from google.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec57e4e556sm445088e0c.5.2026.10.28.10.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:47:13 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:47:12 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, tarunsahu@google.com, Andrew Morton <akpm@linux-foundation.org>, 
	joro@8bytes.org, Mike Rapoport <rppt@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com, oupton@kernel.org, 
	kevin.tian@intel.com, alex@shazbot.org, dwmw2@infradead.org, pbonzini@redhat.com, 
	seanjc@google.com, will@kernel.org, Alexander Graf <graf@amazon.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
Message-ID: <auI02M-pZO_aQ4jn@google.com>
References: <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
 <atpNFEFIlqAoYIwH@google.com>
 <CA+CK2bB2C3Am5ssRuzYpfiU7_vB81vxMGc19HQLq7N=_7YrbTg@mail.gmail.com>
 <attmFVIFU_mS0Y7p@google.com>
 <CA+CK2bDXDWbww_d3sD6OZqpo37V1a3t76_ubbrXLQS=9DB3dWA@mail.gmail.com>
 <at-8vkVpN2SF3XgB@google.com>
 <2vxz8q3hoicx.fsf@kernel.org>
 <CALzav=eG5j2n5omO2Mxqw8xA4sZLduxdbBYFcnHpPn0PDpt9Hg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=eG5j2n5omO2Mxqw8xA4sZLduxdbBYFcnHpPn0PDpt9Hg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_104716_132510_D61C06F5 
X-CRM114-Status: GOOD (  30.86  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10-28 10:24, David Matlack wrote:
> On Wed, Oct 28, 2026 at 10:17 AM Pratyush Yadav <pratyush@kernel.org> wrote:
> >
> > On Mon, Oct 26 2026, David Matlack wrote:
> >
> > > On 2026-10-25 04:38 PM, Pasha Tatashin wrote:
> > >> On Fri, Oct 23, 2026 at 9:50 AM David Matlack <dmatlack@google.com> wrote:
> > >
> > [...]
> > >> The reason I care about keeping the header compact is that we are
> > >> defining a foundational kernel ABI and want to use this header across
> > >> almost every serialized data structure so we can evolve them later
> > >> without breaking compatibility. While some top-level structs are on
> > >> sparse folios today, other serialized structs are tightly packed, and
> > >> we are looking to add KHO slab support in the future where tightly
> > >> packed allocations will be common.
> > >
> > > My intuition is we will have a small number of headers per preserved
> > > file and per preserved FLB. One for the top-level struct and then
> > > optionally a few more for sub-structs like arch-specific data. That is
> > > why I am less worried 8 bytes per header, even if we fix the folio
> > > problem.
> > >
> > > Maybe where our visions differ is when there are collections of
> > > serialized structs, like KHO blocks. For collections I don't think the
> > > elements will each have their own headers. Otherwise the elements could
> > > be different sizes.
> >
> > kho_block today doesn't store entry_size in the serialized payload. It
> > relies on its caller to do so. With extensible structures, this can get
> > messy. Sure, the owner of the kho_block_set can track the size somewhere
> > in its payload, but perhaps we should store the size in
> > kho_block_header_ser to begin with?
> 
> +1000
> 
> KHO block should track the entry size automatically and not rely on
> the caller. Otherwise every caller is going to have to store the entry
> size in the struct that owns the KHO block, like I had to do in the
> PCI v10 series :(

I am fine with updating this as part of the versioning change so that we 
do not have to do it twice.

Tarun, could you pelase include entry size change into the next version as 
well?

Thanks,
Pasha

> 
> > Anyway, not a problem this series needs to solve, but something we
> > should eventually do.

