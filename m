Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708EE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KN2ZGqbN;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=cnzisrvb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gbXuStreYRF1M4k9Su5zd2++RJBOLVmoBCN1Uwl3TZ0=; b=KN2ZGqbNPkajamUpnXB+ZOiv8s
	K71BTCIjNRUR5w1YP945cie7vI14hWhaIphPHd8OqXFa5aRILGRiXiEtSjyHsp5PfbrNPVxz+eZgU
	FOT9oFqwvNHJmjVMZE8Vay4jfypefmkvKnypYmUPCNAfMrcZm8aWQUI7jxkUGENewL5Quv4BUx/Z0
	vjsBhNLQpujWt6EZH9p6mvmWKz/OnpTsxTFBY4soQpVwKUsrQZwLZhIrZes45eqJ+IkIcJ6o01TyC
	cv8c9ekyTGuQKBJXkDoWv/Y88iHrJjnfufX/7V5gMfR7r0RcjwTWSeEzX573dfoXrhfn+M6mtD7fb
	hXk4eS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkDa-00000005OOT-2tjY;
	Tue, 27 Oct 2026 16:40:10 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkDX-00000005OMn-1NI9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:40:09 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-988c7371716so55157241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793119206; x=1793724006; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gbXuStreYRF1M4k9Su5zd2++RJBOLVmoBCN1Uwl3TZ0=;
        b=cnzisrvbKbW0pFuDaz+kHMmxXiIezPBvVCc91p55CF1D2bHf1Db3F09sdK7bWgGt34
         5ov5IgJ5BMQZmj0DqZm6oDX+jWwCxnY0VQbp3qHWAn0/pRNIv9/28eULp4D1s4NutGZt
         OsVzZzrpGosEwuZLRteiWiauEvebDx9oHrVSDtzSsjctdYHwt/8WvThKOR+b0BT9Vz8d
         m2fpqgylo1WVDHW3cIg13ONLoqd3d5rXc896ZGhiC5bFg5Op+AQ2oILumVD3ztFrGO1a
         0mG4xZPzG3KzmSdEwVxPHmlmOZdGK/2ZIhdruWhXgbkZr4f32pDMCuOFI2n+ExibQKyL
         BcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119206; x=1793724006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbXuStreYRF1M4k9Su5zd2++RJBOLVmoBCN1Uwl3TZ0=;
        b=Cecz+EAnGHsZLO1YEAj2TvivNpPqDCtkHpYDM+E+4b+dfoMmDnlEGpUUguc/F17DDr
         mgmRevHESUob+/hnNRt9FGrA1qEqEis4At/RrZ1qHAHZgyfSqmq7wKOHLCFSrsD1nZRN
         Zry/W4fXELthrmoy6Qq5NiQWp6R+NmNjXtnso+YTH3j+1i0s1vAPCMwILKYTrCOxeu4l
         /nG9MizP4nBuJf+sPfH/P3wyC6MTI0Ng63tmQ4lUkelEkTTJKCtfCA9Po4QpJXpiCZee
         J9eHwmKiIwcCqjIaOrPzfajE0n8ylcAgaVRd0ma5bNn77zcQMG/6EFhKjoUAJjtt2F+D
         4+Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxvFK0uUmYq3QUouYxEm7oXP0xNikzFJprt0lHr8riCyFD8LX4mXJsgLCEpQHCYiPfngY8VLIQzJ+im8yreqJxa@lists.infradead.org
X-Gm-Message-State: AFq9FYJDLLBzodSe26aCcf/Wk6TxBRd3/K9wT7ibZbQ2Lt+h3LC4XOPX
	0xGQuyihhoyRYaKFA6c3IYJHrnxQIp8aziaiUyuHEvdoAl9M+6wXy5X4FIIQ9c/Nbaw=
X-Gm-Gg: AYBFou29AfZrsyPN6b4VHzp3g6mUBkxppYNc5k/PNUa86h9vcgoD+r4L3k6BKE+5iOT
	PozfIk8E04rtiNOIy5Yz0pdw2zPJMiAYCVxL+tjhWOaZwAKiht1+cGzcfLkU8kvwU5WnSF4+PUQ
	lga2lXFmFRygmYxtS1zRkgcN3+MKL6A3FBLhvqw3thZzYBavcQy+bm79SNYl63s+W4CCTf0fo5e
	9XEhHSEXcViIQaiCwq8u/nKWPjXOIm70XlOUROfywmlQV8MPjlAQo39rpT+IFf/gW4K76RCwZCs
	UOr6pbhY0LLFBSknhFC6U3mzlh1na9kvz2dowetHQ2YodsKks9JDXUj2GwVPcILLiPs+SlA2xTG
	nBDclnzjE6NYqp+y3J7KVNefGVPo8a3mS2LbUZAZ+SVdTs3+8Qfw07TSqyaacl6i69NJs/eFV+l
	wUGgQa2FWZ5zytYvMC4fXBW7D/WvRJhZo0k9x+2L+UX4JqX+L9eqYR7vtGeyf0EcHX/Rq2xpC58
	F6az13rfbNZOGihXCdEKqfh/ZtK1x5DrmRN3fI4yoYk148bPDZIWGo/wk1640GTln6tByVdZS4M
	TfJ4dtsEtebGhKqj6R3aGXudm4Y/CZJWYulz0VolF2rF0Nrp303kvAAj0ExJGBFMmQPqs2F+9aI
	jOEj9ioSldXgJDZxfHjZCO/qYdH0QWqwKMKNdADFPlOgMBzxWSWA=
X-Received: by 2002:a05:6102:5048:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7ce5ce4227dmr3243460137.34.1793119205875;
        Tue, 27 Oct 2026 09:40:05 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9912da2d9d1sm442866241.7.2026.10.27.09.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:40:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:40:04 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: tarunsahu@google.com, Andrew Morton <akpm@linux-foundation.org>,
	joro@8bytes.org, Mike Rapoport <rppt@kernel.org>,
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
Message-ID: <auDT5MjXYq3lcQjE@google.com>
References: <20261021152527.375070-1-tarunsahu@google.com>
 <20261021152527.375070-4-tarunsahu@google.com>
 <atlQ_Er0Ig7CCSxv@google.com>
 <CALzav=f00C4yOAseNunW8GgQTDUGWT927Qy=TLm-3-J0TEDH8Q@mail.gmail.com>
 <9huzzew0el59.fsf@tarunix.c.googlers.com>
 <at_CncIPYCxOVkLo@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at_CncIPYCxOVkLo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_094007_382560_240486E8 
X-CRM114-Status: GOOD (  30.64  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10-26 21:14, David Matlack wrote:
> On 2026-10-26 11:50 AM, tarunsahu@google.com wrote:
> > Right, Required bit should be source kernel payload property to tell
> > target kernel that the payload must be handled to correctly deserialize
> > the data. It should be source kernel (userspace) responsiblity to make
> > sure it understand the target kernel before doing liveupdate.
> > 
> > Saying this, During deserialization, target kernel's required bit is not
> > necessary. So I propose the following truth table.
> > 
> > Source hdr  Target supported[i]  Action
> > ----------  -------------------  ----------------------------------
> > 00          0 or 1               Accept: feature absent in payload
> > 01          0                    Accept: ignore the feature data
> > 01          1                    Accept: use the feature data
> > 11          0                    Reject: -EOPNOTSUPP
> > 11          1                    Accept: use the feature data
> > 10          0 or 1               Reject: -EINVAL (invalid encoding)
> 
> Yes, this matches what I had in mind for the semantics.
> 
> To be explicit: the source kernel should set the bits for each Live
> Update based on what is actually preserved, rather than generating the
> header from a static per-kernel array. E.g. memfd would only mark a
> feature present for memfds that actually use it. That's what allows
> rollback to an older kernel as long as nothing being preserved depends
> on the new feature.
> 
> But looking at this again, I think the required bit is redundant. Whether
> a feature can be safely ignored is a property of the feature itself, not
> of any particular file. Every file that has a feature present will have
> the same required bit for it. The only thing that actually varies per
> file is whether the feature is present.
> 
> The required bit still has to be conveyed to the target somehow, since
> the kernel that needs it is the one that doesn't know about the feature.
> But it can be conveyed by the feature's number rather than an extra bit:
> split the flag space into required features and optional features, and
> assign each feature to one of them when it is defined. This is similar
> to the required_flags and optional_flags approach in struct pci_ser [1].
> 
> Keeping the same header shape as discussed with Pasha:
> 
> struct kho_ser_hdr {
>     __u32 size;           /* Size of header + payload in bytes */
>     __u16 nr_required;    /* Number of required feature bits */
>     __u16 nr_optional;    /* Number of optional feature bits */
>     __u64 flags[];        /* Required bits, followed by optional bits */
> };
> 
> Required feature N is bit N of flags[], and optional feature N is bit
> nr_required + N (using nr_required from the incoming header). The length
> of flags[] is DIV_ROUND_UP(nr_required + nr_optional, 64). Both spaces
> are numbered contiguously, so there are no gaps, and up to 64 features
> still fit in a 16-byte header.
> 
> Each bit just means the feature is present, so the truth table becomes:
> 
> Source bit       Target supports  Action
> ---------------  ---------------  ------------------------------
> Not set          -                Accept: feature absent
> Optional set     No               Accept: ignore the feature data
> Optional set     Yes              Accept: use the feature data
> Required set     No               Reject: -EOPNOTSUPP
> Required set     Yes              Accept: use the feature data
> 

I like this proposal. I bet most features are going to be either 
optional or required, and even if we ever have a magical 
sometimes-optional feature, it can have its own required flag. So, no 
need to pay double the cost on every flag.

Just need to make sure that optional features always start from 0, in 
their own enum, so the offset can be computed correctly in the incoming 
kernel.

Pasha

