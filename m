Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC8ED79764
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 09:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHes1F7V2ko7jN5LQbqhhigIDqrFsVpRr9YdCYe8MdI=; b=OOLG/5yAZNaUBMc/akeiu7POlt
	gn6ZhjA6XK47X2iFxmuRnCDgOCKax0bz/ws0viMjLduvUcNBWDxTlEhfPF5KU80fLQdveweHl2/aR
	rwX08A6BukoyAU9I5Ifke+y1trjUYXEQS9zFqzFGZsOxDiU57xBR6myDPDWXhfvsE+r4uYTMk1+aa
	4OZbb70NObjOIxPtOlER+oB7NYiO33WLi2Lb42+wzgk8LgH/1ur2pjTQKJ2T/DpgnRHtkBFMpVhJD
	MSzEc70namodc3pQ1dsHPqcZrv41LuOcLHXL5C6/eSy5rNXS8YXaAAQ5pg9nyDyR5Oj2UxPkLKYls
	jdnfNqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm7CG-00000002S8t-2i3u;
	Sat, 31 Jan 2026 09:23:16 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm7CD-00000002S8Z-1mI5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 09:23:14 +0000
Received: from 8bytes.org (unknown [IPv6:2001:67c:1810:f051:57e6:3c1a:1909:f41d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DCAFF5C784;
	Sat, 31 Jan 2026 10:23:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769851388;
	bh=oq9EKKdg93DkudeARIZwtKEHxeGstm9HG6iU9TSazns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=386OtMbcoCIT9uW9KBmYrAmNmaWlPUrk7hOHA4+rnI0vTlSAnxSYkPrD9B9/Oy317
	 ZSjZBo1yAAqtcYgKAJ3pGMG1XML3bn22Z5+0srlen97ffG2+EP0hGkWxc1bWwjARjO
	 TzXqqymqQS51qamNH2Bkvl4ONngc4mSC+BvNRCbkukxHjdOFjDvGFYePMJlxiA7FIe
	 Kx9anYrtLNHT+fOIBOfQ17yN+CRLQMeCt8+lwvcAUpg8rCbOQxPOYCMt6qcVd+tHmL
	 GUZR1oKljzoHcH3wKN/kZS26Nu/QAqxsF9S7mFg92KeYqmdV6jAZSimQdVhyhCcrkK
	 Wq4MERPytoOGA==
Date: Sat, 31 Jan 2026 10:23:05 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jgg@nvidia.com, robin.murphy@arm.com, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, ncqb@google.com
Subject: Re: [PATCH rc] iommu/tegra241-cmdqv: Reset VCMDQ in
 tegra241_vcmdq_hw_init_user()
Message-ID: <x75l7ibr4o45dfdmdxlpefusks4maovaf3ugukcxuszd4dvmx3@w3hmrgo4e4qb>
References: <20260129224341.1594785-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129224341.1594785-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_012313_685917_1C9D9959 
X-CRM114-Status: UNSURE (   8.28  )
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

On Thu, Jan 29, 2026 at 02:43:41PM -0800, Nicolin Chen wrote:
> Fixes: 6717f26ab1e7 ("iommu/tegra241-cmdqv: Add user-space use support")
> Cc: stable@vger.kernel.org
> Reported-by: Bao Nguyen <ncqb@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

