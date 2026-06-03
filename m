Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CE0CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 19:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MUli1JoxEQbWBrb9joE2Mc4TgK86sAz55tkEkLlNDw=; b=1P3Agr5Uz7WWcXOIOrCHuU+42K
	AmogvO03zPsgVGGrfzRop1HW5CSqQhJjApygYW26GWEr0KyegSSvZHJlXlEzxyHhX77ezzPjx8PKw
	coTEg6tLGBgHSssePW5O4stjAtuGXwA7A3ncnNhE/q2pvPRWd3uI/AETm/fdLmz6ZI0bNhUxhkgXd
	79TYfHM3qy3sB4globu/3Nnq9ArqTSe69v+Gg+vGXxjQKIS+yGKzqcrkbE5WM5KX/53kaw/3UkaWP
	Nd8bl9d/9Kbvzn4stIe8IsxysAkkN9lFeQdZeaFlsvZc2bdjStGbsu+1/L04eL6WiJ7mJYvqKXonC
	VcaCp22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrix-0000000FmfU-1KdX;
	Wed, 03 Jun 2026 19:57:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUriu-0000000Fmf9-0hZI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 19:57:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E710E41951;
	Wed,  3 Jun 2026 19:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55CA1F00893;
	Wed,  3 Jun 2026 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780516674;
	bh=5MUli1JoxEQbWBrb9joE2Mc4TgK86sAz55tkEkLlNDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UMMLVrYRm3vM6D0yfWNdTaVCYFOEf5U7impxG+wsP3S81Ycr6mgMv5h383VrlgZBI
	 r0k8DC4FepixUcoVduaNdZT5EiImztr5aiQNuu6QjuRw7BI1rjhSi9BI02IP1xDlVu
	 iqZcL537RsY2LdB0lc0oQRpMyOk0VZfK/klGX2UKFOiA1SZtzN1Sc/XLJNYybVhuCW
	 OfvcF7n3VwSCp1G1nnqg5TH7YQMwN5z3d4gvKumtJoDqXOsEcjleu3ip26T3HrjoVj
	 ENtz6nHXTvQsx5TLShIvuMXXLGcqQV1bXAZXEKBJcxrcTmxwP7yDFecg3ou5l8m1dO
	 9FhWFaYxofXaw==
Date: Wed, 3 Jun 2026 20:57:49 +0100
From: Will Deacon <will@kernel.org>
To: Yushan Wang <wangyushan12@huawei.com>
Cc: mark.rutland@arm.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	fanghao11@huawei.com, linuxarm@huawei.com, liuyonglong@huawei.com,
	prime.zeng@hisilicon.com, wangzhou1@hisilicon.com
Subject: Re: [PATCH 0/2] drivers/perf: hisi: Updates for HiSilicon uncore PMUs
Message-ID: <aiCHPe4X4bwAtZ8q@willie-the-truck>
References: <20260423152959.1458563-1-wangyushan12@huawei.com>
 <001403a3-513a-4c17-b2ec-2beafbf221fd@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001403a3-513a-4c17-b2ec-2beafbf221fd@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_125756_245213_B470A9FA 
X-CRM114-Status: UNSURE (   8.47  )
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

On Tue, May 19, 2026 at 04:42:32PM +0800, Yushan Wang wrote:
> Hi all, a gentle ping on this.
> 
> All comments are welcomed

Sashiko has a few (some of which are bogus):

https://sashiko.dev/#/patchset/20260423152959.1458563-1-wangyushan12@huawei.com

Will

