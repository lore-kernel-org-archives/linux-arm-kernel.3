Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 23:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lVhkis+/;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Fss6OWVI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=; b=lVhkis+/hmMpatGAFlY/E+i0Tb
	qU+iJLgSRNU035gruMCfMOrhLdS/VGW+E16xCQNFOVIzz88S4XbdJw1I0LlzoRZBzDR0W6cdz8hmI
	TOg9fZolpiDkq+6Gae6HLkAOQw/uiggfSMHDpCEknq/K6Ga8VHs/gZsT2bsZBlx1HIpd5JPydjkqv
	oUTRiRE4z6vHXRvcett7Vl9aBuH6YjfgAHn/TDAsdtKpa6qWp42lD0ZqhEopyf1veRNORgtb17hfq
	jxF0rDQLw9KK44lyjnwXwcafqPywh7oWjjpHc3qlpVq13NxGHmIsZ3yJlVqtEhehS8Z4GQkUHHzJP
	cdLI4vhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJg1G-0000000D3q3-0eMW;
	Wed, 21 Oct 2026 23:46:54 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJg1D-0000000D3pc-1SsU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 23:46:52 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-93e4c00d71aso139993185a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792626409; x=1793231209; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
        b=Fss6OWVI9zcexnGRFHZZgEIcokFDUngbtzsV6a+qJngoAhuDcKg2UQU9lsWaduJ/oA
         5GbBKu9dxZ02yDH2X5WhtciH60u3WXvrTV7Vek/5TRm5+EGqpb4YDKUUJE+1lVBxkJAX
         Xx4q5Zpcv7OyRBmPf+0WMwMRLDi+dlxEcKuh1c9P/RYlUoCs+BxQhIMWIHcTwC+py9+3
         8t4W/zx9RiNsEbxsj2H4ARb7aJpjtzuZjcy99/AIWAv/k6vKsnq6L2byyOv+bEgrjL/C
         lQZkTRaF89VnvCrJBisKBBJJJQMAsaA55os/p4lLu6Bx67bExn8p+KgO7Q8KNd8eWwyd
         JAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792626409; x=1793231209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5hOymfjgaz7xpjT1ssIdHSQ+wD4cuNPKUAfRnejzdg=;
        b=mHzRVgqt9D2HXWOnRYDveLo0G/RRHSyiT0qGD732HgBwQyWhGlZfn+9M/gZ48QsfRv
         G/R+aMugf9NjX8aTyTyD6z6UJugMZQWhUZMrEyFphhW2t5HcqOyJV7cn1MhP99vAhdxk
         ULrgUeMoKb+j7zeiTeqREpiAZkJGgqbdJK49eavXoSQ4tR3bGOnrvl83ogkI+8Nk8K/b
         J2sdhvwRbyq0QAIgTINf8aNGG6alhOhnY7vmmcRYTQU/N3CQeY79x76LiJ0rNXPrIJOs
         frEGjNABfNISbFueJocOClogybzH/gnXmpy6TIF4OGvrOLUqNqdseGPLqtkeq+7pBd4S
         8X4Q==
X-Forwarded-Encrypted: i=1; AKwUvByWXQ6qMcMqIKJeiCrPFgLYQr397mezFdmKVfIXoQOilZUKjfUEz9irloo5q2dc/JwtIkIX6tMZOy1q5n3xIQUK@lists.infradead.org
X-Gm-Message-State: AFq9FYKu3oeQ7t2dvU3tF6S5Sw6XJIw95dKF4C1sXCPU0mvCot0+T02B
	G/RP3ReUGIgNPIQ5Sq8nEA6a9rherqP5V7pOy6HaeA5WUEzxNi/8napUIKzTeaNJmTg=
X-Gm-Gg: AYBFou2FXh95hO1Td6EjCIywV29lrEUqfhmwzHPK+5Nbw11wAX3hP3++Uah/vsIIbG3
	ctCCVPYRYRjbPIleN+u4QUSS433bhWivt8/ZuVV+R5HecUVkv5DPo61zebTfCWZj0JiRTxtGlcd
	9uOCXYah3xSb0GbkC4KQDKp/KiVstOyRSF8N5DCP2szNbf13w/W9EhEjvYzsCahgrd/qzqMr2yd
	yMPXs1NEySGhhwBHoNTE+6gTfVPUS1sAZUFzzL7IPrN+DzNjYp6HQjWoq0XdBno/bo7PpuddCL2
	Yu0vix8eNGXlctZ9Khjmf83LGdljUWmLsXTjRwS89HYvsFHyJSM/QHoFjSfHJPC4eznirBV/dpO
	oMioiSsr+1LwfLjcQEQWzLvPuqBHvkF3I/1I/MT79ADVCSsa0Y4TenfI9B2g3fskWCkXj/kV6EK
	sSf99MDwChHHRw/TRHPeVSdtE7LfkSuzz1Vqg/A8RBzDzt1SqKNLq7cO9fRL1G8TaiZSeEKV4wv
	fTydIYyeBMle5RAVv6zmrcTNVthXxfuIvuVCuYbxhwZJx4IVdcswTIIMe8bMJ5zam04ixS8KTyi
	yWEDNBkDyjYDGdAbbmcYIT+NVPekZ4oCP1UGKNRSJVU4ZElpzcxhGI3YWls=
X-Received: by 2002:a05:620a:17a1:b0:93f:22f1:97be with SMTP id af79cd13be357-93f5800e406mr694136885a.72.1792626409239;
        Wed, 21 Oct 2026 16:46:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e2bee2sm373858385a.42.2026.10.21.16.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:46:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJg19-0000000EWG8-3cjA;
	Wed, 21 Oct 2026 20:46:47 -0300
Date: Wed, 21 Oct 2026 20:46:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 06/11] iommufd: Map memory provider files
Message-ID: <20261021234647.GA3381610@ziepe.ca>
References: <20261014093733.90312-1-griffoul@gmail.com>
 <20261014093733.90312-7-griffoul@gmail.com>
 <atkO08eCJzLX6R58@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atkO08eCJzLX6R58@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_164651_512882_42396D8C 
X-CRM114-Status: GOOD (  14.07  )
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

On Wed, Oct 21, 2026 at 08:17:05PM +0000, Samiullah Khawaja wrote:

> With this approach, silently skipping holes during IOAS_MAP_FILE means
> iommufd has no tracking of which IOVA ranges in the area are actually
> mapped, which complicates unmap and could also hide a bug if a hole in
> the range was not expected?

I think if we are going to do this it should only work with iommupt
and iommupt should provide an unmap that is compatible with the holes.

There are other places that would like such an operation, IIRC.

This will have to block an access reaching into a guest memfd mapping
as well, so that should be OK.

Jason

