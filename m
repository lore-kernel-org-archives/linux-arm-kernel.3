Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98694E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nowhEyl5dI6aIIqwammoplLG7dGCizfgN3AwcDBvNB8=; b=4/vy2rqJQoZUzw9qiDwns4pkPw
	p+kg8JXm4c2lmly7sR8pf6CdPiXkEYcKDOQaqvT1XOl4cgKHlTo2tfxL9k5iBVe9mVlc3mfaf75f7
	Rg093ZWzoDdCNWhbjogAOc4MGTZUIkGYvkw3kw22wBE3euRTKE8BiomOqWLxccENAYBSF/HzoU0KB
	M//3ONA9iYMUYa8l+V/SKwOUKoJSOcijcgdw0qx0uyvf6edYwdhvSwZIw44wVEmX1818X4fR8r73g
	ateluaeeOxI8v+kwPAj8a6DSocbLRkXBQAwc5L5Xy8rggl+ggcDZvgCtE30od0+XpXESt2hUrcopQ
	mlfJnX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeda-00000008BQt-2XgY;
	Mon, 09 Dec 2024 14:21:26 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKecS-00000008BAR-0mI2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:20:17 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6d8878ec049so39339416d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 06:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1733754014; x=1734358814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nowhEyl5dI6aIIqwammoplLG7dGCizfgN3AwcDBvNB8=;
        b=KaCahd5xCr7IGP5oy9VwLOU17dOdSHwgNpy4M82pMQ8JM2JQ7KAW0frcJTT3Z2ZWAK
         CfG8VitSNdt1l6TU/FlipLywXzwl6RX2UH4874ooLvBAAnUp5QChEhPcv8l4kUNYM5Wk
         OV4rFFO52ZgmKJ/ElrgF6Ce7hCTI2hqBqPuJnT6n3kjT2VIW603OLaBcjZ0E5QFMKmrn
         hX3O8ADtKl/dDE6nTMHiJfC7CcRnaJCWhckuFziLoOZdUihrGUnIEVZgOr8P4m3NvJ3c
         WDOmctrb7nWd5GAH02KdXjMSZ/HTsptM1DMNGArcBeyuIMlg3qvmrDvWBMLdug9tu36c
         dVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754014; x=1734358814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nowhEyl5dI6aIIqwammoplLG7dGCizfgN3AwcDBvNB8=;
        b=fea/vvxDtzErvR6Y9wYbE5Ty7JwEVs1Pav1PMShMSrE3LZ4zjUmShYgSo+A6GTq8hi
         lxC/6nI1K4lMq2xvDTRdLmLUDSgsP84xyNQ6OdJIrT8cmq5sN6grXLGbB4BTOesYjzgA
         hUaY92rSU5llzu0SzNeVjqMUEk7ggh9MVJ+EKOTTRl3SI/EonyPAlWxGJjth6JSLBlG2
         oILrWLLNmp8HtHlRHTWvAqVwn5oc71jbef9DMhTzbo91CuNnEgUoqE3TcNbXCHI+nS6A
         YqHHTgm2ghJVIUjfbzju4gAy5Xx2tr49WANsXRmXtbguAS/HMTZZmBpqtolqDW2dOufR
         Sk9A==
X-Forwarded-Encrypted: i=1; AJvYcCU4rS7bO3K988Ro7eF3Q7I//qL+6/UNFlsSOTclZH5wJbGqVB1sWB+W1iAd3eMLkgWM/gopBoJsw0VmyBarkxC2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3vh6rLQlPsc+4kk2MahkUkkX5MSc3YqVbL6jtrAJpokPEjcPC
	5PoA62L43Tfo13BzAJRgOMpFqWWH2MjP1KGmL2Bgg6Iplz0K+7pdF2mGzahZk3Q=
X-Gm-Gg: ASbGnctswq4+OsG9YXeFizUE1gCo+RS0lYnZ7L3xeFj29aHWl0gNvS5tCKtufkQi6zK
	ByVoand2LoHK4LZZN7OBkS+MSjb1bbSJ07IHfTbznKiCfFbHFGPzLWJQEj4H9mZDeYlrXY4JZ4W
	G56rvWdXK/jLhtXItuHv7FUrZJuG/2H5ZUorXHD9lnbAA9bpwMd6BPCRvVnX/IMGSLPTU84dDs5
	ropLRvilmDsYUydcAUZKzzHRlPldIhHAvU9M5+xofgkUPKqAwhA3LV5XNfHRh+FSGXN8lB+CfgC
	r5+I6vDyoGxTU7bzXrXUSt4=
X-Google-Smtp-Source: AGHT+IHoY1ZOiHkAJnpdjYQRkeVDy7sffj3Siw+V0OMHlwsl39yE0CXPuxOPKOgDNwcCNM/wgKH60A==
X-Received: by 2002:a05:6214:1c07:b0:6d8:a76d:b66c with SMTP id 6a1803df08f44-6d8e7170365mr191037006d6.30.1733754014582;
        Mon, 09 Dec 2024 06:20:14 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da6b2291sm48868886d6.58.2024.12.09.06.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:20:14 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tKecP-00000009sI1-2JGA;
	Mon, 09 Dec 2024 10:20:13 -0400
Date: Mon, 9 Dec 2024 10:20:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2] iommu/tegra241-cmdqv: do not use smp_processor_id in
 preemptible context
Message-ID: <20241209142013.GC1888283@ziepe.ca>
References: <Z1L1mja3nXzsJ0Pk@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1L1mja3nXzsJ0Pk@uudg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_062016_224965_CA0D4C32 
X-CRM114-Status: GOOD (  15.74  )
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

On Fri, Dec 06, 2024 at 10:01:14AM -0300, Luis Claudio R. Goncalves wrote:
> During boot some of the calls to tegra241_cmdqv_get_cmdq() will happen
> in preemptible context. As this function calls smp_processor_id(), if
> CONFIG_DEBUG_PREEMPT is enabled, these calls will trigger a series of
> "BUG: using smp_processor_id() in preemptible" backtraces.
> 
> As tegra241_cmdqv_get_cmdq() only calls smp_processor_id() to use the
> CPU number as a factor to balance out traffic on cmdq usage, it is safe
> to use raw_smp_processor_id() here.
> 
> v2: Sebastian helped identify that the problem was not exclusive to kernels
>     with PREEMPT_RT enabled. The delta between v1 and v2 is the description.
> 
> Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Makes sense

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

