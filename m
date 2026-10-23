Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F710606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lljDlKeM;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iDwrUNBe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WZKXP8VTOXU0OFEfLxvR9auLXjQRH/E3aKS3dlf0WJ8=; b=lljDlKeMhVxO2OlYWWQ0KN5Ci0
	PuhcM6Sr1prDzgjXUtf7q4J8tmH+djUYBI5fBMhUhCqVX/4M5JtimA02tnRgDA+EZlM4fcVg5o5IT
	q+VjMkDH2z3QaPCsFpCBInHg1NZ4v1hh/RWydIDNq3hgQ+VE0DSVKbnflwKMGVMCwNM0lgow0zeYT
	FgIEHoiZlVTfhvkAvPFDf2iuaAlj8lViXLFTjCc5ZdJsktwfZUV4i+Ei04HjHhWntdrUuG1JE4VCZ
	XH7Qv1d+vBi45Q5LZ2wTIrao1Z5D1ZL7qq7jUSql8Xs3/RRIFrMO0+Dqof0JY+PgyNpmsEV90qFUC
	G7z3YGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFdp-0000000GRBy-3RBs;
	Fri, 23 Oct 2026 13:49:05 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFdm-0000000GRBJ-3NR9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:49:03 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-93e63ee7b4cso109190285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792763341; x=1793368141; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZKXP8VTOXU0OFEfLxvR9auLXjQRH/E3aKS3dlf0WJ8=;
        b=iDwrUNBe7g1iILgn9iCeImkgds79FhrJH8yzzidaV2A8ONyHOqkfN/qFeM2JT69sNy
         E00++EjYPlBw3xsD5NUSzOROu0zOjckHZoek3qo1rPWc5QRCny+ucp5mMsQWEEMXpz9q
         xT56AhDd/NTteagyNKFqQuIk9lNyID9ZXhzxBvlQxyB363NfO27PpsyRqxLhWIld2W8A
         HuTuCIVBjPNHY8fxFtsI74oqk/XnPWHwj3QxB4URLZZ7jcrDg4HytUVPWhd+kK13itUH
         BnlNApWf3FVHLla+gYBJN0uFkt+otnTiXOKw5hsJJg4ypkOSMgaxr9+J/9mOWdXQBAEv
         p0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763341; x=1793368141;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKXP8VTOXU0OFEfLxvR9auLXjQRH/E3aKS3dlf0WJ8=;
        b=WmovfUhRYV57I1OGu/emzFW/pQglIqLBIR7nrw0o7oitLApFG4uABN+N6XeAEF1xId
         1uBoLlv3V5QxS0NlgPqhxcOzOV6EQeB1i9vYzP25KdpBErdEVYsuUrcambx9S4qhPLhr
         rqyJq91ydL+3X0AYjhxitq/ZqpbMf2R7kXrBJlQhsTPuGvJPeSi/nKHLaqF5oNB6Gs9B
         3Lv3gPZ0l77AKqzP/dWf7Pnz/oSgxjlZfKf+01Ey5b3qLmCWRxu8vzB2KMISG2QnqHqM
         MJiN28FM/59Od9TV0worQ464vEhJySoUE91VFVucIQMQqcxzeqwSKwvu2diWznyEm1Nu
         /ckw==
X-Forwarded-Encrypted: i=1; AKwUvBwlQR/8V75UZVNUcjwDqbsQtywaJgpX31MjAuZ11d3OuGA1AlcZGUTjGCt2fGwzB0xruIRorBcJQUSuNXFHxLG4@lists.infradead.org
X-Gm-Message-State: AFq9FYL1gsypZ/ueLpfA+hCwLG8pFKBXolAII3wsKLL/IkwqOTAo/BYO
	xQltP2b7cAOCgPIxb7dl8no68umof1XMmSgfs872B1D1Cn3ZGxTL+iHLn2efERp2fzw=
X-Gm-Gg: AYBFou1Yaj8ueOlXAkNYH8HxNUD2z8sKsScDobMYfJK94DPv0TeFTdO1/BadGM5bOdu
	yLmklRoeUMLh7mY4IFhpnHgglJQEj9dF0iJW463XggW5Kh2bG9Sk8zCMJ9XevexqVRmD0Gsm6vR
	WOYbdTi/j8/StnijGwDM5bm6f+/YifqX1X30SmGJX27A+CNTk0dpaRz8VfVWjhHKYHpCFvH1rwd
	fPKfbxZItIfh841etLhBB+zKa2d+OEjpIN0cF2qSS1Y6EeSs/APaaBMejy1/Q0QXReg/ND47ZW2
	tr9lcQ8QBQ3CbqzcyulOSBGWc5efQDyP1HyyiM+pf+rLhO6bq+j8NzHy4yBh4y9Lna+6sR3QV87
	r0KvZXCi5CeIa8rzuEDS5y8FhR5z3sAlN/jCYotxzw5sr1WKO/FYvX0/0xmybdG2K//pxKeoBS5
	K1SLuCqAzUAoCZagJouMyRNqp5a08d7HzLOo3zVMhvcxYKVTftg1wrtq/DLfsXg/IoISiMMkZW6
	lYBX7hQFsXsaWaKTr2YZfwioeOz8mfVzSx3rEumIcHhjm46m3E147fhbh6/Q/fqJNizvZJN0O4a
	4h5Ex+T5J3+9YjzKX+BITxY=
X-Received: by 2002:a05:620a:439e:b0:93f:1cd7:734b with SMTP id af79cd13be357-93f6f796974mr406212285a.34.1792763341610;
        Fri, 23 Oct 2026 06:49:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b1c97esm21136585a.30.2026.10.23.06.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:49:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKFdk-0000000GhLJ-2S35;
	Fri, 23 Oct 2026 10:49:00 -0300
Date: Fri, 23 Oct 2026 10:49:00 -0300
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
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
Message-ID: <20261023134900.GB3977851@ziepe.ca>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
 <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_064902_860084_21AF22DA 
X-CRM114-Status: GOOD (  11.80  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 02:43:28PM +0100, Robin Murphy wrote:
> > @@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
> >   		struct arm_smmu_cd target_cd;
> >   		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
> > -		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
> > -					&target_cd);
> > +		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
> > +					  &target_cd);
> 
> No, we cannot blindly do this for arbitrary ->attach_dev calls - the
> majority of S1->S1 transitions are going to be moving back and forth between
> the default domain and user domains, where there is zero expectation, let
> alone guarantee, that the translations would be equivalent and thus not
> liable to lead to TLB conflict aborts or amalgamation hell.

Heh, yeah this probably only works properly with BBML2 or something so
the temporary ASID doesn't explode.

Jason

