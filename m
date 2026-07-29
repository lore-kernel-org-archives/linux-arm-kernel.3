Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F8DC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWdAI1NvPYdtxpdNDYy2eq7d4+X1bKpjAzLxCp6XRws=; b=G3BV8t/oPMa76O9H4MHoz0Sk/v
	Kb6PgLkqmLif4Kax9ABH5UQB9Br0bcR4SeLwW2klWRE+ZRmqSzzYb+7nOOeEFNAn+tqSvbmSnfdCj
	GVXa57idTqhXjI3V5HcJ/pyaRyOf17/2rdmzCCtcj52OxFGsudyPGrFv3RcU6km5Ya81Oj8rCC/JO
	u6WQQPMLzH58VphCnMq6i8ye2dz00XL/D0WkxbhVMWLVW0OX67NpUL5PaTA/M8pxxDMREcQpTxd/d
	+HlAYRLjpfxs6EhThNki6p+nVMeGUOg9UI0PpGHFqdzKiqCTdsjZLp5tWaGJIZ4GuE/wNH2o3ku+u
	aDCH6Hbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozwR-00000007H6g-2bLQ;
	Wed, 29 Jul 2026 08:47:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozwP-00000007H6T-2f6g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 08:47:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D8F842D87;
	Wed, 29 Jul 2026 08:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFA71F000E9;
	Wed, 29 Jul 2026 08:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785314825;
	bh=JWdAI1NvPYdtxpdNDYy2eq7d4+X1bKpjAzLxCp6XRws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O98AQmik0gvB8yXO8+8UNiVZEKw7CpRGsyMeY84TO7cYjJEVEpCfHNa9DBiIVK9nv
	 YrUvT9wYqZB/NxxMoswZ4jX/XVb7YFBa6idysfl8BBNvfGnuc6VWcbrJgul4jVO5G+
	 sfdW+82KQxW+U9x19C2XrNtE56BvYhKDnNoNWxRuR/Sxw+KHEs9kejbZ+FlHDvbuGX
	 CYP6r8qiOAdWQr4A1psdQx5jbieO9JDgnG5eKGmIyLJwVKRyPvolAyoDjXz2DxnmDc
	 YOUFEQUfueF2mVvzqExnFdHRpXK2p5ZXlLXyfe8ZskjXrjGuswCsLUUEaS0SfN0ZAS
	 yQ9Bb/YgMjo+Q==
Date: Wed, 29 Jul 2026 10:47:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: perf: Add Arm Bus Monitor Unit
Message-ID: <20260729-glossy-strong-seahorse-81c9da@quoll>
References: <cover.1784214112.git.robin.murphy@arm.com>
 <1cc6acae06fb4910e27cc89e2270a52e80e310ef.1784214112.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1cc6acae06fb4910e27cc89e2270a52e80e310ef.1784214112.git.robin.murphy@arm.com>
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

On Thu, Jul 16, 2026 at 04:12:40PM +0100, Robin Murphy wrote:
> Arm's Bus Monitor Unit is a low-level performance analysis tool for
> matching and counting transactions at interconnect interfaces. Typical
> platforms will have multiple BMUs each measuring multiple interfaces in
> various parts of the system, hence for the sake of usability we make it
> mandatory for the platform to label each instance such that the end user
> can correlate with platform documentation to know what's what.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> ---
> v2: Invent example

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


