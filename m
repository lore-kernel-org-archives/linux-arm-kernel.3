Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D60C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBlc6cid6Zdhprde8Ttn51tlH17S4udYPClRtcpScIc=; b=2cWT6UMlIqAPdN/jGKNHItGojX
	M+HTk4T9oA5UbN5TCge1rEQXNiwRly3QcQqo+xHXdkjVZpLZoojhcPtEQw+spQdQfkVaVpBFD/Wp1
	Mw87+7obixRl8DhZwW91+U/SQ5wMo8b+5SDPN8h1ozBvh5uwrOkrMw7sDetQFy7bHSAK7CuQ+8y3r
	o9/yiKSmTTPT0Kc/n8xdVuVOlRqok3abGxbSDBXmtKs9nc3jWfInyUmmkDksEhlHoq1w0H0qk2J5r
	Q0vQVTS6yc9qYQvz7GcG8tVpTiaDQDvNZYYwI01mECh+xZJGvkAwIYYnFR38veCowsKKufzEaa0zs
	ANLesgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUIQ-0000000033o-3LN3;
	Mon, 10 Feb 2025 13:57:58 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUH1-000000002t0-1uev
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 13:56:33 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AE96C41FFB;
	Mon, 10 Feb 2025 14:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1739195785;
	bh=rg8scUOnYxi+bVfapaE6BRs4ba+F40ddEiWf2X94Xzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/QRmJnS6IVNJR8b4xfYiQlO+6x1MAt57tY9PNNlBDLAVudUyQft4qiE8xpUUAcjJ
	 5dWOhFkhzWYalEweRZQm1ElwFdm9MY8MsKZpgZv//NaK4zS3NsAcWRf0GfeobEbw3g
	 pAFpGr1/lAX4sJSY9Mu7ZcT10f561+adaYu40StXZ0ukNdbgvsBeQC35juHm7pcftK
	 BuimgMxlG8e2sMWZNKtp6VZxN258M/ysbBHzeiSgGrGKUSmbCbBpmWCR5PpvS1MzKN
	 LoipCDmhJbQjzFXD3p9FmOO5kRei3FxQQe5/oiyKyrj0L2pO49eTaLUu5RubFs+3yy
	 OunFZhRAKMj2w==
Date: Mon, 10 Feb 2025 14:56:24 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/exynos: Fix typos
Message-ID: <Z6oFiDMauvXp4BmR@8bytes.org>
References: <20250210112027.29791-1-algonell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210112027.29791-1-algonell@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_055631_648967_6ECEA0AD 
X-CRM114-Status: GOOD (  11.94  )
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

On Mon, Feb 10, 2025 at 01:20:04PM +0200, Andrew Kreimer wrote:
> There are some typos in comments/messages:
>  - modyfying -> modifying
>  - Unabled -> Unable
> 
> Fix them via codespell.
> 
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
>  drivers/iommu/exynos-iommu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied for -rc, thanks.

