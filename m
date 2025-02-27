Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97529C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buScLni0fJpq/olYSYs/TP5v5AMqPIGM9l8uVS6GTbk=; b=i7FAJRGt5Fhp/i8FOiD5B0zh39
	/uH5BOdnLz6xONLdFhpDZcqYNAIuSPaDG+wD9e+p7DHVy7PuagkGN9J1lDoELsqXX3FuWv1Logzuc
	TbcLX8/X0Q/ngcH82wiOFmNuhOz3DDIsp1QjYtnp/Xd88hwHfLlHcQqndvH0ZM0VmqafKhxanQ9xH
	a0j4Q7OowWtF35ikqWXR2qXkFia6U6JiQX+mND/VvNQxPAUS0ietV445xyYTGYNe1/5NIjSDPuAAh
	cp+tGV/9mPK6wxNHQFWuEEOfC07HsVaTpOYXkosPJedAmhWzO3Xtk6Jyqph31YSiObQh+w/6m0yVO
	JsU1xUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkD-00000008Zjq-0y4Y;
	Thu, 27 Feb 2025 19:40:29 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhH9-00000008A0T-2k33
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:02:20 +0000
Date: Thu, 27 Feb 2025 12:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740675736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=buScLni0fJpq/olYSYs/TP5v5AMqPIGM9l8uVS6GTbk=;
	b=jYgTgyQatW2/J5YgV8UCLIUrdXMporvBsRM4196W2rfF289Fk2/Fo4JOKsXSBEwxsHD4Sf
	Mi0suq3ARv+pa1DunsrhOHKtSWRaKeBTK+UgaRt3cgCDDk/HhsWQTkI1OVWM+CDgh5mKYN
	HOlYj17+N+3DA6LbkE8AmChqAivD9n73e4EY23o4GoSzEU9mLNbvqv2fk1PVTh3q10oaTd
	mWilusDemTDcY1gqTUHcmmcPS2ePcoYQAdzXYG3QrJkJ0RYqZOj5/rp/Hfr3kLMm/4o8bq
	6ctgtfJJHAQ1CHalr99fAEPA+kFirTjIlrx4PsnMJ+/2Cy8DEVuDlLkWEV0fig==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/2] iommu: apple-dart: Increase MAX_DARTS_PER_DEVICE to 3
Message-ID: <Z8Cak9VdyUIedOsV@blossom>
References: <20250227-isp-dart-v1-0-161e91ef4f46@gmail.com>
 <20250227-isp-dart-v1-1-161e91ef4f46@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250227-isp-dart-v1-1-161e91ef4f46@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090219_833252_380D768D 
X-CRM114-Status: GOOD (  13.17  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Thu , Feb 27, 2025 at 05:56:03PM +0100, Sasha Finkelstein via B4 Relay a écrit :
> From: Hector Martin <marcan@marcan.st>
> 
> ISP needs this.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/iommu/apple-dart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 95ba3caeb40177901086076416874b9905a1f40a..edb2fb22333506d7c64ad1b6321df00ebfd07747 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -36,7 +36,7 @@
>  
>  #define DART_MAX_STREAMS 256
>  #define DART_MAX_TTBR 4
> -#define MAX_DARTS_PER_DEVICE 2
> +#define MAX_DARTS_PER_DEVICE 3
>  
>  /* Common registers */
>  
> 
> -- 
> 2.48.1
> 
> 

