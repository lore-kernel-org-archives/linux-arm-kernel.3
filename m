Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F60DCD8C8F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QhtC6BM1t83QgwU0/BhQV+fmUFhszUWMJjveagzpQs=; b=e/tp7VUcfLdi8Bub/4Kbfmoxwl
	bVfK2wX7B96M2B7fH0N0WGC1A5Fa4NuH6WvZGoYM9K/iOiuKGUvf5OqWAKrDhhC4l4qU1hXOlBe3d
	kFkrqHQ8Jb7QbVQ9NolHhw3I1s0OkU/Tp0q/dL+WItwoCd84FZ0GNhbBZgv821Qf0KAKeeSppKL3a
	6YxrTjWoaaUIzzs+KNqNTq5aAiNiQP10GJw8BoCj7SwMRNqv5TeJIA4l4Et/ZzVwEdSb0iVoZ+lPh
	xnC7OGsaXi1kDHQrzypgDa3na7yBhsDKuptTb86kkCUgox1PDBOuY9ccV5rT4SLXpIeJU+hg3e/pF
	7RRDI2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZDY-0000000Ain7-3rtc;
	Thu, 13 Nov 2025 15:26:36 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZDV-0000000Aimj-3nAs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 15:26:35 +0000
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4A56B5B346;
	Thu, 13 Nov 2025 16:26:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1763047589;
	bh=s472zsbluvHBJ6plUrkXJmLD7ld7k9PFgMkG2zSfpIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbvsvxmdaAUiKIrIJ9Dmgy9iXPmtvW/B8NGzUPWFuvCOmz5V4p7Z1Y0D2VQCRUa+a
	 09CBLDe3xbyzg9C7VTkn/fes2gS9KthfSZE+fjqhqeuUXbm7s2VqYuFIX31uNOqodR
	 u76zNi3L36eR5OMkZ25GsRLikY3Cc7Wuw2l0akxrNvIfnPazZ4i/XLrjIPYFu6W6Bl
	 gXbnFNHsXY1VlYvXyOnxY81AQW04CdNT8gMDZ4vGb+THnTIF4CcgTea5z+nloazEcm
	 ETsUH8q8ICrqQ3v/VpEQ8m2rbTDT26kU2kjPyo6bPH5yV95OrCNF+LIFBjwEDdL/jq
	 GU5QO7nA+csfw==
Date: Thu, 13 Nov 2025 16:26:26 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org, jgg@ziepe.ca, 
	praan@google.com
Subject: Re: [PATCH v6 0/4] Move io-pgtable-arm selftest to KUnit
Message-ID: <xop3ddd56mar3nvszw3owayadp6rupsoo7ajjy5y2b2qr2ud5k@cvtdizo3laof>
References: <20251103123355.1769093-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103123355.1769093-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_072634_174626_23F4DBA4 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
> Mostafa Saleh (4):
>   iommu/io-pgtable-arm: Remove arm_lpae_dump_ops()
>   iommu/io-pgtable-arm: Move selftests to a separate file
>   iommu/io-pgtable-arm-selftests: Modularize the test
>   iommu/io-pgtable-arm-selftests: Use KUnit
> 
>  drivers/iommu/Kconfig                    |  11 +-
>  drivers/iommu/Makefile                   |   1 +
>  drivers/iommu/io-pgtable-arm-selftests.c | 214 +++++++++++++++++++++++
>  drivers/iommu/io-pgtable-arm.c           | 203 ---------------------
>  4 files changed, 221 insertions(+), 208 deletions(-)
>  create mode 100644 drivers/iommu/io-pgtable-arm-selftests.c

Applied, thanks.

