Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566CBD1D486
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 18:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1qPdoO+X2jwPeMvVPGM0GzX5uNn2DdddZW3ayiLdg8=; b=098PmDynGpH3Ouyj/9EJ0evpB7
	eSaDDA9/VC4K2GE4xFQ3YwQ3JcJ/oHapj9a7jwhGOAA9pe9YVWhX21xZ0tUkh0jODapQIAupqyk56
	UxTmk5QMW0P+Mwjpb5EupzgOs3GCAQjhyDjZ1JYNUdoM1l2cmCdglwR1xkMMf+hGm/St6/QgwjSd6
	+vu4yFa/RhQsrIJxON6pnniLJxQR/W+EzTIq0jVMOzkqEV74T0tWnriKriCK/lH5x3lHD+ROSCVMO
	yevZUGHjKVCAo7rjZIAChxDi6RHzL2K4U6QI30pywtDUYK+vmYLvM6ENjBLxfvu46P7eetE8ggbOW
	Jmt2CBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdulD-00000000cLZ-2yU9;
	Thu, 08 Jan 2026 18:29:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdulB-00000000cKS-2QWm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 18:29:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D89124405D;
	Thu,  8 Jan 2026 18:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3BCC116C6;
	Thu,  8 Jan 2026 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767896964;
	bh=C1ZZbneNUmbULmhmIIcvZNddGcCUci7DDbpWChqEyKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qA1Aq20xJgjpSoMfhVPELlB3kaMSb4V949hdTJTF7ntA/YDRLPvppPlo71J3iNVEz
	 rWPCZzTejHHH+XB9IiMGiMIVOdrHLg92f88tFmfG7Ee4vaZkHKHJOAzq+fw14Nu3o3
	 3XyFg2T6izd3Edg2iO6j9aynx/8E5EKvZC7I5BKofd1bGmvairPCUhH9p0rE64TXbh
	 AZHNfuCTQICVlmaoj472l/aJicPGDjbXohpy9QXQzRldQth+W5Xr/j92I3bfizc0/9
	 jMOW/hMOBwidFSFHMxnmxaY04o9i2lgVgZ7aCLmsvinqdRjXMYgP1qT2fZwJzh2seo
	 M6yCbvZJ5I0bw==
Date: Thu, 8 Jan 2026 18:29:19 +0000
From: Will Deacon <will@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Cc: Weilin Tong <tongweilin@linux.alibaba.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
	baolin.wang@linux.alibaba.com
Subject: Re: [RFC PATCH] arm64: Kconfig: enable ARCH_WANTS_THP_SWAP for all
 pagesizes
Message-ID: <aV_3fxlzwOSz8B0t@willie-the-truck>
References: <20251226063759.4020782-2-tongweilin@linux.alibaba.com>
 <CAGsJ_4zd+SMa4Mj23tjF5OwsP3LQyvYTrwN4y81=k8FSFgbH3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zd+SMa4Mj23tjF5OwsP3LQyvYTrwN4y81=k8FSFgbH3Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_102925_643477_C6342069 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, Dec 26, 2025 at 07:52:44PM +1300, Barry Song wrote:
> On Fri, Dec 26, 2025 at 7:39 PM Weilin Tong
> <tongweilin@linux.alibaba.com> wrote:
> >
> > Currently, ARCH_WANTS_THP_SWAP was limited to 4K page size ARM64 kernels, but
> > large folios requiring swapping also exist in other page size configurations
> > (e.g. 64K). Without this config, large folios in these kernels cannot be swapped
> > out.
> >
> > Here we enable ARCH_WANTS_THP_SWAP for all ARM64 page sizes.
> 
> I no longer recall why this was not enabled for sizes other than
> 4 KB in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64"), but
> it appears to be fine, and the swap cluster size should also be
> more friendly to PMD alignment.

You seemed to be worried about I/O latency in your original post:

https://lore.kernel.org/all/20220524071403.128644-1-21cnbao@gmail.com/

Will

