Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05946606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2uIXOjRs;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=N6Q4039l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x3fqohRU8/o+/rWwlUOj67KW8Xe73r+lpb6xdIN08VU=; b=2uIXOjRsQ7ylmk6poWt+hTck6N
	loQ6CPSuGqU6Ap7eABAQvka4hCdo+yFSimaKqgKZ7UoaVtIGYjrGgAARJW+YL6HZjvqjExL9XKa04
	bCFRNxGMoeBQn/ZWr3nf/77HyN5l91b9HXAHHMcElscUttRBfLN1I7wzghDq7lwt6zYrWuc8+GSNW
	hu4fqyjan5xjHr9tyLDW/anGyIfouqht2GXgGFv7BaMXN/T2lUZDqtw+cT19IOmw/aPJR+geYu35D
	HNyDYm8x+0yC2NGkfewE6pfMnuUbwi2yqi5jEvg0sUuCB/Iv0A9jx7JlNH/3kC3I7iFbIoBHThVlb
	TDHGIorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFbW-0000000GQs9-1EkV;
	Fri, 23 Oct 2026 13:46:42 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFbO-0000000GQqy-3jCc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:46:40 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-93e7ad9f78dso101725985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792763193; x=1793367993; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3fqohRU8/o+/rWwlUOj67KW8Xe73r+lpb6xdIN08VU=;
        b=N6Q4039lH6CdA65oYewSerz9CCU6UW4A6TMlA5tptzveHDVO0V8Yntml6QSHXi7lGO
         b8lujwE3SbJezuTRRvld8XeKnfxUERpzQRgVIoW6TWPp/XGEyHv/sJ7Kla7M7FDkgQDy
         BDAHusSugjslo4KoarHPiHpkFQsrsEcbRmtalp3diajiuYRoG1r2EeMjByGOrY13LYOm
         t4YdJKBOHIAuFtlGbmlcH+HUOJUbq6VPPNN7d4XYJ9nNhZCjzwOsg5MTRaK2jlTXUmG6
         BEbQchy0aG0iynzpTAvVBALnvRjV7BbeOWosNRnAuIzjlb5wk+idGNlsTjOMiQuR7YFl
         OYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763193; x=1793367993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3fqohRU8/o+/rWwlUOj67KW8Xe73r+lpb6xdIN08VU=;
        b=cc+b83a5Yg/PeL7hHIfQeewz4qCrXTgqWtunamdVC9uzbOMTwyO7/s9y1+IFkO/D50
         2Nc9tj5ZP49xmZEJ58Qwf39F1TPJzXicUSlJQfd4DIW2Mb88OYT5glgmEaOJcbDekanM
         8Vuu1Io0o5Bu69MWmCSGPaWt96PNcgQQ0InuorbpwEWWvS0XhwCzekdDo58s3S6qUZwU
         Pvv3XKj5dUnOCVnkJc7Vzlkam8EYcVjTh9Wn/y0Jn69xsJpj3nbynSYlwRUQOZa42DN3
         p1c6JrstnLLIfSfTCWSD5nzVpmRVPdaZ8bI+mPcvVSYssczSZWIi/BrY7etzNgEDMmcM
         Z9EA==
X-Forwarded-Encrypted: i=1; AKwUvByypaG+u38OhbFeYqGTIZ3GTRcs1myy/mdMyEiJRFjTOeebZJ4/EwF7yMS1C7yEAM0WV6izDLIfUCqP63zcyYxg@lists.infradead.org
X-Gm-Message-State: AFq9FYJmzIwUXKTQXr75o3SS3yjflACkMwjMEjbyRQ/Sw1vPQ0eHCmBA
	jnVLCduB2S34jReZd5fJzvt22IPdsdK/QBcFns6/qhcFwAdrSoHW5cTcbcI6z0CQuAFP0ki17rx
	sSgD7
X-Gm-Gg: AYBFou2Uk2o2gbZU3QSDPpjV3yz2O3ZCiF2k7t2xNIdnZhULEVjE3I53X4OdNsCGDjD
	45lh0baIASa7gKU/+Ii+rFhJWQhBZ+v5tME0NnIx/9hQKZFRYGp8kV8NKXQ4aMEu2WcM6R/UXir
	h/4GAH9n0ItRaJqxlq2H41YzFsxNxU/9Zl3MtjFwizfGuPgy9pGjZj1icOkiX5o3McIS4tq5kY2
	9xEZfktE77I198fQdLw+25w4jj8wdqIC7D1ZKTP4nirk0ANslLkqTIgCuc5hio/15zLtvcLb6Gz
	ypB7CX4vI1D1dh9a4WOd4j6FupDBd9xDPYwMw3vjcj/oboOWRRC2FF2JfVFZ8oRz+Ct9tdh+yVo
	KojlJIXsIXOGlzx6q6QsdhOilCei0KkkL3W313gy6v19dnNMUvfRD3oqMcUL7FNbuMIEovobTOe
	tPM14Qz1ROqpojQyIILX4P0eRX8r9sPnQIcQwnrRM7aqiIIdGjXPeGNU0A2R6K4XniZESiVPkZN
	jZJbKDJUNPFsN3PNd6+JxyKbrHvEamKes/F2VhZdXMMfyD4tlPHcMGYUN5LT4y84aDtjMxNVRdI
	zefBLGC5W2KWj20jvi/VgxS2aR718edZsGj64HCCd0Xw8v2G5MLC0ZQgPW0=
X-Received: by 2002:a05:620a:2853:b0:93f:dea:3b7e with SMTP id af79cd13be357-93f6f78721amr391556485a.24.1792763193248;
        Fri, 23 Oct 2026 06:46:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9404722bccbsm21296085a.8.2026.10.23.06.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:46:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKFbK-0000000GhDh-3AUl;
	Fri, 23 Oct 2026 10:46:30 -0300
Date: Fri, 23 Oct 2026 10:46:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Matlack <dmatlack@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless
 replace of CD entries
Message-ID: <20261023134630.GA3977851@ziepe.ca>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <40a2e1a2-138b-42bf-94ea-a42fda128c22@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40a2e1a2-138b-42bf-94ea-a42fda128c22@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_064634_955074_E2639A62 
X-CRM114-Status: GOOD (  21.12  )
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

On Fri, Oct 23, 2026 at 01:10:56PM +0100, Robin Murphy wrote:
> On 25/09/2026 2:13 am, Samiullah Khawaja wrote:
> > This patch series adds support for replacing IOMMU domains with S1 page
> > tables hitlessly, that is without disrupting the ongoing DMAs. This is
> > one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.
> > 
> > S1 domains are programmed by CD entries in the CD table. During a new
> > domain attach these are updated using arm_smmu_write_cd_entry(). Since
> > ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
> > considers it a non-hitless update and sets V=0. This means such an
> > update is disruptive and would generate translation faults if there are
> > ongoing DMAs.
> > 
> > Replace the CD entries by using an unused temporary ASID in the
> > following sequence to allow hitless replacement of CD entry,
> > 
> > - Update the CD entry with temporary ASID.
> > - Update the CD entry with the target TTB0.
> > - Invalidate the temporary ASID.
> > - Update the CD entry with target ASID.
> > - Invalidate and release the temporary ASID.
> 
> Why bother transitioning through a 3rd ASID? The old and new pagetables must
> contain the same translations anyway, so why not just: switch ASID, switch
> TTB, invalidate old ASID?

The target ASID may be in use by another CD someplace else. Doing it
without the temporary could contaminate it with wrong translations
from the original TTB0.

From a driver perspective we don't know why the domain replace
operation was triggered. iommufd can trigger it for domains that are
not identical. Corrupting the target ASID when we don't know for sure
what is happening is not safe.

Obviously Samiullah's use case is hitless between the same translation
so it doesn't need the extra ASID, but the driver can't know this.

Samiullah please include this explanation in a comment..

Jason

