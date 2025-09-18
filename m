Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31DBCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YUVYuQB+xx60DNCjOrlQTz8ACmdWZgwCLofHbjYkng=; b=UMOyhI1qnnUJ7+RK1RzFwx/TaQ
	/1qe2x2Mozp/nj99D4oRKZ6zaIHPKnOp1TfztWxYzKTe1cEolEy9/+DGgkREBMzxcz5y0GZq+qMGQ
	chGrE0lNyLOgEeL3eu7iOtrmpBr6yYxAMlDosRwGFd2l35ScSZZaBy6SqkN48eb1KkLq7eWbeMtjt
	VWaTNja9tVllxphbMiO1DETKGdyYiRpBsY3qCagmSiGhbXrpUjVA/bvbcO2GO25+2jXoOFyfT09Rx
	J7DH2/wCUVvczOlTIGNHQL7Tp3sZpREcjKv6Oki1/fHFa8hwqRBGo0HWfGENIerrmSB7umAytWdqu
	WVeisBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzF3e-0000000HazT-39m1;
	Thu, 18 Sep 2025 13:52:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzF3d-0000000HazA-16tN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:52:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F96A60052;
	Thu, 18 Sep 2025 13:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438B4C4CEE7;
	Thu, 18 Sep 2025 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758203540;
	bh=rBM77CT0fDiwZ5fv3ggT1HQ8jZJeuFQd7kHGWdmBYPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mV2TgxXmBs7Jc1RRbR4ZgbTiwx8Xhl3TnF0eIEcSImofolTjNd32s8OiyP3gt2VCQ
	 OEiws3R2SAUQuFW4X72BkcW0HpD0yH21ZpVpixjCMFGCG619QvQYWAtv5hBcqNLh1c
	 kp0iy8t6FwRhH1+oCgNOnKJRxJ96y0hAjkdSecKX2awOT/jW7WXCF8rkNhOSNaWTcF
	 XIjsvpd9dmUOUsx+6wj8rDKbOZKgPvjBN8Hyhyb31Hu7D8gf7VS3Pxvu2kQSgYB31/
	 fKmGawJKXxALuhBi8rMi1nT5eqV1kGK6X3iMQ0zl5YV4afyhOkQWWgeNwtqKFj9WN7
	 WGAorlexjWeQA==
Date: Thu, 18 Sep 2025 14:52:14 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com, linuxarm@huawei.com,
	yangyicong@hisilicon.com, wangyushan12@huawei.com,
	hejunhao3@h-partners.com
Subject: Re: [PATCH v6 3/3] MAINTAINERS: Remove myself from HiSilicon PMU
 maintainers
Message-ID: <aMwOjne-iiFCdo9n@willie-the-truck>
References: <20250814091622.23269-1-yangyicong@huawei.com>
 <20250814091622.23269-4-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814091622.23269-4-yangyicong@huawei.com>
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

On Thu, Aug 14, 2025 at 05:16:22PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Remove myself as I'm leaving HiSilicon and not suitable for maintaining
> this. Thanks for the journey.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)

Thanks, Yicong, for all your contributions to the perf drivers and help
with reviewing over the years.

We will miss you :(

Will

