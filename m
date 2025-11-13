Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCA5CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnq52uHmXJWRUJ7kxrVaYVdr/4BvSsc+Rxd5zOv8eVw=; b=haXLgNhqCOweju2oktbJySJv+T
	NmUdFIGN0M+sYrWsdKjw6NRRsTFte4bzlN4EgOiVWpwkJXvnGZ7md1gfCGEud1pZ3p/97VyaRdNki
	Z5YI9szoM72rwMUe3cUjS89Of8jlnoXwLiTtszCefS8fzZcn1koWvMQxiLFTjRqn5G6bPm4ZYZwgL
	Em3C1Mi8DZnVVXESA1fBTEMDUbc9RBRQQY4ZZPMzTVEFvhK4yMjLEbQvKKy9E2DDZnmD5aYMNDm1p
	Ltc94jn4btzSPBxZ+lrdXinpqFHuA93lRCQiMWR9D9Ve8yGkhwL61rlhho8TsGg7X5/Piqqjl7c5b
	CSQriYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTwq-0000000AEC2-3V1l;
	Thu, 13 Nov 2025 09:49:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTwo-0000000AEBf-39wK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:48:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF4E643B01;
	Thu, 13 Nov 2025 09:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109E5C4CEFB;
	Thu, 13 Nov 2025 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763027336;
	bh=/zPy/5nrXeM3rH0WQMBYQ1KrNaP5+75Xxt2Uk8rbmwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YN6Ir+5ZMjGfmTiRLhKZA0DyIZolgiSZj1hxtYt3XLjTFwDmfytxd0PtvztHxYp9u
	 eJK8JXUI63Bqc6tOiRkQA8pd50WNLBbsd/RMq/QFMbwLChQLKTv2wfzNXnCIv8go36
	 aTdxAEq2uzmqRVbc8jGYOpEMtnhP0heo7rKv/klYYaNO4LQV45twX41F2mGqQ6IFaw
	 MpAyV1EKN2RqEZgMLe1nxBgPI6qDPKuZ4miGa9wlEBLjjTZLBSZCoRaxeTxK66C1bx
	 r4r32dE7YUB0Y/MLGCWhnDWJyhdsOXL068g2BxRtQMdEyNxrIbhZLI5uzyX+pP0p5i
	 v0CVFXJmJ6nUg==
Date: Thu, 13 Nov 2025 09:48:51 +0000
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, praan@google.com
Subject: Re: [PATCH v6 0/4] Move io-pgtable-arm selftest to KUnit
Message-ID: <aRWpg0MXrnVH3E4Z@willie-the-truck>
References: <20251103123355.1769093-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251103123355.1769093-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_014858_839321_AF02CC8A 
X-CRM114-Status: GOOD (  18.89  )
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

On Mon, Nov 03, 2025 at 12:33:48PM +0000, Mostafa Saleh wrote:
> This is a small series to clean up the io-pgtable-arm library.
> 
> The first patch is a small clean up to reduce the depedencies of the
> test before moving it.
> 
> The second patch was originally part of the SMMUv3 KVM driver support[1],
> which needed to factor out the kernel code from the io-pgtable-arm
> library, and based on Jason’s suggestion this can be taken out as a
> cleanup, and a step further to convert it to kunit.
> 
> The second patch just moves the code to a new file with no other changes,
> so it can be easier to review with “--color-moved”
> 
> The third patch converts the sefltest to be modular, that is useful as
> kunit can be a module and it can run anytime after boot.
> 
> The fourth patch registers the test using kunit, and converges some of
> the APIs, some notes about that:

This all looks good to me, thanks for persevering with it!

Acked-by: Will Deacon <will@kernel.org>

Joerg -- please can you pick this up?

Cheers,

Will

