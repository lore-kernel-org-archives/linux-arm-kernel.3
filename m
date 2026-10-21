Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199B3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 23:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F6U+VsXS;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=eVxeaemW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fqUHRqztpFhXjrNb+RX+YalUvUHW60343cq6Q4Whxw=; b=F6U+VsXSrGo42O21YXuwQG2MKi
	9ejxXekukavCsoCYcQv+OJ7n5prDSpa3VZKlFyxjKcaZUulLiRmh8rkwrvyDqnIKYSRfniQpP5Rhg
	39i/DrHABkoOx4678MPqFdEhMyd8WSnhI9Iqtm36h6k45joMq50ru/uHe4KNQbM2GBNGBgB6p1R+i
	DVJNhHxEmtki2N2Q0i2GMznxNX7dimiYKTUPqhwqblg3cNDLGWzRMFBWjgs1J8h3b+PMynwCxl1X2
	V6zdWGR15/mD2eO47LXigH/S7Fa5ZqDLf/hp2qOfi8Ae1J4FATu6JpngcwaJto/GuPETe3pPOEsi/
	DYbUJ2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJg9u-0000000D494-3iJL;
	Wed, 21 Oct 2026 23:55:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJg9s-0000000D48K-1PRR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 23:55:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e977109392so8028445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792626947; x=1793231747; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1fqUHRqztpFhXjrNb+RX+YalUvUHW60343cq6Q4Whxw=;
        b=eVxeaemWz+uoHTYOPTH2DzI6uRtTtg1w2Hoq+tA2lPkgT6EowWlZrCHiIrXD3kENYw
         oyUdT/O2OfT1iz2DyLkLPy789vOgfMRct7Sk6bVvuQmXnCYh6Ka9BB0HMzq/jzG+r/qK
         GWB+x55dMNYv8i3zUoioEo1lsEzkYSAxqkpady42rxQDqPhexEGAdhkN7JVdZ4gXDTtC
         dzvo+sElMIIRzd7TtihfVtrF3AF4OK0tdil4XphUsJBUyxh0rDjlC/k1bqaikBSPDOAj
         g1OOjK8Uc6S0bOzKtVUbdvZqhMWs4H+drD3/oWV7pcRVAuF9Rf+T1ChMTTkI187IjLrS
         PobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792626947; x=1793231747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fqUHRqztpFhXjrNb+RX+YalUvUHW60343cq6Q4Whxw=;
        b=2iLSeo5TrgCGJIh6Fj1YFcJybqUdeRzjiSlRc1Tg/D8uDFZ/cx9X6qna0/Ahrcl6lW
         PjI5Jekx04xYKKwJC4xf22buUymHLkH/1Q9M6RKytZjB9hgcUu7qBdW6pO+vpQllIWWY
         nM7yf44TdmDWu32GYl99WXKcXtmvaFzu2enAwTyyck9lrW8J57BHjuii4tf6U3I+B+aa
         3TLb6sRfIC4OEXohSVUebBSi3bOKIXcBXlWzWY+JrfL69Jsctd8CvPGXazPSmsB0Hsp9
         NXt5BL/GT+5vrljzzDEJ+HO/S9mXSZ392mdMoGEmIFC21Bh4IHsh9rli/RYpPt+ZSicc
         ZmpA==
X-Forwarded-Encrypted: i=1; AKwUvBxJKhKo0V6AKIqT6flB7TIBJvmoEkZRLiZ/5uSRS11nFDij/i6BJq1D2/BkgigmqYVqtDxPK/Lq+SmZB6zgGAfX@lists.infradead.org
X-Gm-Message-State: AFq9FYJpsFOHdAaAxTfwplA887awbNocFLv0/1WStdi0/dYLxlb7hdFu
	BQE9sAwXtQpozZRK+qrDVNENvm9bYqijPMkD64xXpWVu3cNhWD9vRY0N6lJVNXEZgQ==
X-Gm-Gg: AYBFou1y0j1BnoG8DJ+Ii3UBcIZ5d+Gg6ySWfZSCHO9sgxSXEKDP3loWhdLrRyO1o+W
	QR0mr9KHAIJHT5ZEVJuTqliFlifKN/zpC6EEufXjk6HLiWWafsPurwYsc5F3iNZwotFp7VMb2KA
	s4jGzN9pQYQLAauH4o7iEZloLF1vDQ4eQvOda9HSs5diwA/rM3HfT3plLlinclgDntVFEEfX5l5
	wbQxd0FNYHAlgxotJjaWsd9wFwkNjuJukAmS3S4AqLgigQ/le+uEQtgxzcmzt7c+oaicS/Ayw2h
	+zdqyQJ0H9OOow208O1bm4Wftym71zGyYZeCGdfpxUCizCWKGtyZu0YGu1DcAHiwhHvUwndqkY4
	34agQolE1AHJYEwrW1WLDTuBBz/Azpaybt+AnfwVNL2FOQWTAUG/WDbOW9uAhG/yOlWSrGJlMo7
	jfHnCdZWaxVS4z1qoCd5tOqbkbUBCRZiASKBBRvGE2GWxoBRpdHAer62F3BcxT625t1yV/neACH
	35T8zpKF5uHFl0EumVP18x7varA9exug8T8tt7zz4bOQaEPjWsex8krIJqqRUnodTT9Nb6do79u
	PR9Vj674eKi5lV7o
X-Received: by 2002:a17:902:f70d:b0:2e8:3190:73a with SMTP id d9443c01a7336-2ea44075412mr31011645ad.58.1792626946744;
        Wed, 21 Oct 2026 16:55:46 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b30829csm16784705ad.11.2026.10.21.16.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:55:44 -0700 (PDT)
Date: Wed, 21 Oct 2026 23:55:40 +0000
From: David Matlack <dmatlack@google.com>
To: Tarun Sahu <tarunsahu@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de,
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com,
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org,
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com,
	will@kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>,
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
Message-ID: <atlQ_Er0Ig7CCSxv@google.com>
References: <20261021152527.375070-1-tarunsahu@google.com>
 <20261021152527.375070-4-tarunsahu@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021152527.375070-4-tarunsahu@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_165548_373126_6005EC8B 
X-CRM114-Status: GOOD (  27.87  )
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
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-21 03:25 PM, Tarun Sahu wrote:
> LUO and its file handlers validate handed-over state with monolithic
> compatibility strings ("luo-v5", "memfd-v2"). Any change to a serialized
> structure, even an optional additive one, must bump the string, which
> breaks live update between adjacent kernels. Replace the string in
> struct luo_ser with a feature header, so that the target kernel can
> accept or reject the source kernel state per feature.
> 
> struct luo_feature_hdr is a fixed 128-byte header: the serialized
> structure size from the source kernel followed by 15 chained u64 feature
> flags entries. The fixed size keeps payload field offsets identical in
> every kernel, regardless of how many flags entries a source kernel uses.
> 
> Each feature has a 2-bit pair (req, active) state (enum luo_feat_state:
> LUO_FEAT_DISABLED, LUO_FEAT_OPTIONAL, LUO_FEAT_REQUIRED). A flags entry
> holds 31 features, and bits [63:62] = 0b11 chain to the next entry (465
> features in total). Each subsystem defines its feature states as a
> static const u8 array indexed by its feature enum, which
> luo_feature_hdr_init() packs into 64-bit flags entries with
> LUO_FEAT_EXT_MASK chain bits. The target kernel validates the header from
> the source kernel against its own feature array via
> luo_feature_hdr_validate() according to the per-feature (req, active)
> truth table:
> 
>   Source Target Action
>   (1,0)  (x,x)  Reject -EINVAL: invalid source kernel (req without active)
>   (x,x)  (1,0)  Reject -EINVAL + WARN_ON_ONCE: invalid target kernel
>   (0,0)  (0,0)  Accept: feature absent
>   (0,0)  (0,1)  Accept: feature absent
>   (0,0)  (1,1)  Reject -EOPNOTSUPP: target kernel requires the feature
>   (0,1)  (0,0)  Accept: ignore payload data
>   (1,1)  (0,0)  Reject -EOPNOTSUPP: source kernel requires the feature
>   (x,1)  (x,1)  Accept: use payload data

I think we have different definitions of "required".

In the PCI series [1], required and optional flags describe the _data_
the previous kernel handed over, not the kernel itself. A required bit
means "this preserved state depends on feature X; a kernel that does
not understand X must not take it over". An optional bit means "the
data for X is here, but you can safely ignore it". The source kernel
only sets a bit when the preserved state actually uses the feature.

It's up to the FLB/FH retrieve how to handle the scenario where a
required bit is set that the target kernel does not understand. For the
PCI FLB we panic since failing to adopt the PCI state could lead to
memory corruption as preserved devices can be doing DMA.

The target kernel never requires anything from the source. If a
feature is absent, the target kernel must handle that, e.g. by
falling back to default behavior. If it can't, that is a compatibility
break and should be handled by the compatible string.

In this patch each kernel has a single static feature array that is used
both to generate the header and to validate the incoming header.  So if
kernel N marks a new feature X as required (so that older kernels reject
data they cannot understand), then kernel N will also reject every
kernel that does not have X, because of the (0,0) -> (1,1) row in the
truth table. That breaks forward updates from N-1 to N, and rollbacks
from N to N-1 even when **nothing being preserved uses X**. Therefore,
every new required feature becomes a compatible string bump.

I would drop the target-side required state entirely and let the source
kernel decide which flags to set for each Live Update based on what is
_actually_ preserved. Accessing a field added after the original struct
then always requires checking its flag.

At the end of the day it is up to userspace to never start using a
required feature while they can still rollback to a kernel that does not
support it. Cloud Providers know how to do this since Live Migration has
the same problem. This also means we must be very careful when adding
new required features, as they need some way for userspace to explicitly
opt-into them. I do _not_ think we should try to have some generic LUO
opt-in for required features. That is up to the File Handlers and FLBs,
as they have their own uAPI.

[1] https://lore.kernel.org/linux-pci/20261013162529.1928093-1-dmatlack@google.com/

