Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14661CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y03k4DFLRprDfdbyLDspwlWtQehDogFzjJI6AMgeKrM=; b=eQ3874VYv65cbv1cFDlxq9KR46
	DyIbiq0QDNR93+qMEhjZ+pB+wc4WQpdXlzpXEqjH7Ha/HulVuutpJnLuqSMC7uFl4WWcnzdoe9lMj
	cx40HIphWHxjiUsfsdgBAJMezf0xeIEFKJpf2NPbiRkdmYqH6WSZoVTRqzv0xa6ZEAH1jYm8meAPG
	YZNrwup+FMXDRZqJkGyM96QQmvSM/gGZcp8tAq8oTcWf3J2CNEavUyCH+NudWidYE3IFV8dy/42hz
	2UVDAWHA/c7PR/nrzMmAr2kgC8XnrU/rme2h3gO5xndVdOVRiOfIa8oK7ZtVlisKje6j2QIbHL8SB
	b4CegERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gcS-0000000AVgJ-3RAQ;
	Mon, 22 Sep 2025 13:30:16 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gcQ-0000000AVfm-2h4z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:30:16 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4cf068ffe4dso4895551cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758547812; x=1759152612; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y03k4DFLRprDfdbyLDspwlWtQehDogFzjJI6AMgeKrM=;
        b=T70No/vdj3jy5VA/U/neiJtHJ45gSDICtiJmtfp3wt1tIE00LBfSe2bNs523Rc/aED
         IB77j7bwkDWaNkBfZREms/rt9rR0eVYTamva0C82ykN4SmByxgpKpFr1oJEbpCwwJm+b
         K1hnmHiBoqH39VRd91RYG4h79S1LsTvKAv5VwABY4eP/8H03Myt7ukLjk1BdANQod4Nc
         jI4gFPFQm3s1G70ttQEofXvjl5EK8L/GKVTJTyNVasNB19mnogP5OSpFk2CmLTO+9QBV
         KcZ23EMCAYwKs6meFUd4/kl5zbvWU1nThfONVq330xUPL5LM9Xv4lzQQHR9W6BXFzLig
         C+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758547812; x=1759152612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y03k4DFLRprDfdbyLDspwlWtQehDogFzjJI6AMgeKrM=;
        b=jIEPIBGBSDnp6P2QH3uCBdv9W+O37gP1VSBlizNCr1hSLNcX+TjRkGbWqeiHgngUDd
         Hz6fJbR2tTAC28h67ppezeGim5zKMLZ6kkHkM3yp5RSnslh2evXra+XTII+wM515pRd/
         nfzK4vAujxmBRMOdcd4xdyU2XLcbLMsJhMyoUNN0aY1dZWCC9i1LUl24G+FjIwcTryr6
         eJOc6m0IYK+CAqbOpTzuj+IQ1HP0ruUME8d0AgWVIib7uiKHMVhU5PmjxGDD3k03Xn+P
         LboxoR6cYgJ031yTjlBNWdp3noD30wb//8GmB0ssf8iSwf4xb6EyZx0gy/jLqENHoSti
         oSQA==
X-Forwarded-Encrypted: i=1; AJvYcCW+8NIoP2/ZhKDE6Eva3l006b94DwDBjOw7L5hLl6pYCFMku3FjwgvvVGviAGpYAuzeQN/33er/smbeA2etBEBT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9SX80aCaJodvYTwN8KiQCtPXXELRbMq4DAAJe2UgseKrES3o8
	UYbcvo7xZ1qvseSOs05b7A3zaIQMgYnr5GaGk+rt7FW3Nqo3EtqlzsM62I/R2sAycCI=
X-Gm-Gg: ASbGncunBkZiOfgT5R/yO2e3fRgCGEU89J9RJEinVHKPSFz6akusXzl/ZcMYbD/TXHe
	6iqRhoZ4l7bzHZN0FcJndsc0WWCgOFMTEx0WeiCrfeHN8bdk1B3cQLhAFevwELRRacDUZ+arhnq
	f9fOCMr8V/iZ0flvde3jT3dxFroP+AlRHZ2AkNp9w8nzaxUQ3ua4DNSYY1X+QdifxfPxMFf1jVD
	cUtv6724oiyVK/3IxGo8MN9zlBz5G671swNwmNp6SH+UVpFq5ZRY12O5IM4CknWZlchnfovbLf8
	ZfSG6Kc45AYaSZan1qK2EA28ZvstFARgck8vNCkQYzQvWxBJ/uZQUqemN01rMTJaUPprTzl1
X-Google-Smtp-Source: AGHT+IH4XwIxdKdRzW2o+GACM5iQvve0syctd1r00LPQSbC18rDTaAU9S+ss/ne+khceFU/HXjRUbA==
X-Received: by 2002:a05:622a:488:b0:4cc:6d84:8199 with SMTP id d75a77b69052e-4cc6d8484e1mr38598321cf.13.1758547811879;
        Mon, 22 Sep 2025 06:30:11 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83d1352f390sm566847185a.15.2025.09.22.06.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:30:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v0gcL-0000000ALyP-3XIB;
	Mon, 22 Sep 2025 10:30:09 -0300
Date: Mon, 22 Sep 2025 10:30:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v4 1/4] iommu/io-pgtable-arm: Simplify error prints for
 selftests
Message-ID: <20250922133009.GY1326709@ziepe.ca>
References: <20250922090003.686704-1-smostafa@google.com>
 <20250922090003.686704-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922090003.686704-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_063014_690409_8C8D212C 
X-CRM114-Status: GOOD (  15.75  )
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

On Mon, Sep 22, 2025 at 08:59:25AM +0000, Mostafa Saleh wrote:
> At the moment, if the self test fails it prints a lot of information
> about the page table (size, levels...) this requires access to many
> internals, which has to be exposed in the next patch moving the
> tests out.
> 
> Instead, we can simplify the print, using ias, oas, pgsize_bitmap
> and fmt is enough to identify the failed case, and the rest can
> be deduced from the code.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

