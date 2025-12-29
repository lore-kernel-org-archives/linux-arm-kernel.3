Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6434DD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBwII3oP4sCN6eU0n2YZOnFLRpnKS88+gdYSYU7t+2E=; b=tC0yYZW8HiK27v8g28RS/6AfdU
	WgO/YkCm+kbYs3tgLSyBoziKKSxB/khU4ORenwnjYzQ+gDjUNB5RvjsubvNHwsZKkBu+BEyDFCLAF
	9WBQD6g+Mkfqzhw/BYLdok/+yL9eRz07lNQXbqBQBcceKPRMDSvMUMliC1ZIL72e73iFKgb/8sHLk
	QDNghQhJjWudykhlpKTiJpH/UU2rFi5Xck5TBDD6iGpown0ZCadKBoaXi34bqlvNCAseIc8pA1NlU
	OylhUZpZv0zgCgp8tZK/YKLND3qCdBfUndNz7CaEkquyK6Jl7om+FlwXWpy7XU2bU5fu6HWvTNfex
	I0Vdz/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD2f-00000003jWm-0Nfo;
	Mon, 29 Dec 2025 13:12:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD2d-00000003jWd-12rf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 13:12:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59E3760010;
	Mon, 29 Dec 2025 13:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C055DC116C6;
	Mon, 29 Dec 2025 13:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013926;
	bh=N70FETDs3GIYWbTtsUuIUscz6f9NjW6JqolYZNJHKVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MwhDpJVXauRnVw3ifyNjriNvPRlrkqBlsGtxVVbxdwOhJuz85OEN3m+mMrXmtg8yr
	 3WAHSkG3mflcn/TaR3Uu/n33jBxVHIeV+L8sMv/4j/LrCKPSFKuCW/vb+J0eXdH14E
	 eH1FVpi9xYr3uBfXsCuurQ4XWW1GM6svsPTEqVUCEUMz5Ni7eINY/bH9x1d1Pz9IlX
	 a16IMJPSar8Dwqj/inbLLcR0tDZIqVuPmnhaKvgYkwCJF/1gDHKfDY/sg2/PAyctSR
	 gUTh77AK/vyKFITvnGJYund1b+4Lgtp510zF2mGrI6TyPogkc7sLZlYmyH+X0NjGLb
	 J5N8oVXhX/MWg==
Date: Mon, 29 Dec 2025 21:12:00 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: multi_v7_defconfig: enable DA9052 and MC13XXX
Message-ID: <aVJ-IGz9YZajTzaP@dragon>
References: <20251128-imx53-qsrb-pmics-v1-1-a96f43ddbb59@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-imx53-qsrb-pmics-v1-1-a96f43ddbb59@oss.qualcomm.com>
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

On Fri, Nov 28, 2025 at 06:02:42AM +0200, Dmitry Baryshkov wrote:
> Enable PMICs used on i.MX53 Quick-Start Boards: DA9052 for i.MX53 QSB
> and MC13XXX for i.MX53 QSRB (it has Freescale MC34708 PMIC).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Applied, thanks!

