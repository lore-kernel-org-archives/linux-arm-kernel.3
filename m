Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576DEE94109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 08:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUBh+zhlxsirULFapjwSNIbpsCz/Uqk8Yq2iMEGR/qU=; b=qe7R8dMnTXZUltoIB8Vft3JlA0
	bddt2sPeQrnv0WhcRVneJE7yGM+UygSvLTlaU/l78I+zZgR3yRJOC10KKcXNEn+2EURAhbvQED1+d
	L6KCSiqL8I76+9Tzb+1wRPn3ND3n+VwKG781kDUSPHlCWQ5p57yxltXMKYJ14USD9CBYxJtwsXKYU
	wDBE8uk6geOY62r6WayJDiIS2uz2QE8a9HV2G5cgUU0g80CCzso395smsxvE98f8dJU8v6DmruQ3e
	fm1ysiE36p/X83dYf2gvDBIiUbPXKxOAkzVY8KEMgRDlGOFyu6Sort3222jxv1zujfJKKendtlYUi
	u4ZDx7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV5C-00000004aAo-0kwK;
	Tue, 30 Dec 2025 08:27:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV5B-00000004aAi-0iw9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 08:27:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 813996000A;
	Tue, 30 Dec 2025 08:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5318BC4CEFB;
	Tue, 30 Dec 2025 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767083276;
	bh=FIR3ooFo7+8BFgEb51+fJ7l2bhQDYE13eiH+Ek+Ziig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZJTwRdUNraCuZoThxKB8cf1RRBJHB63FZXsIez33Yr268Z4qiJTzxNepG9YB0win
	 oOUIsFmmz32N1KRT2AkXsZoD/AaBUjJk8bkqEQrECfuugYU2ty8P6hCap+mZmvEDUW
	 ZVxW4XTbtJB3//UbEk95B9ZP0Ym19jiDGUUZUzrkPlYYV6z9Hqi0m3qQEKxgwepsrK
	 VtgFGtzPbd86/Dd89vd88PFfOd1/KzAJTVuIGG+tqcTtMeDGEkZWSEs7YkF6XIw+1d
	 CgwuSd7x7lBWPBRGU/etQPslEunWabx7ZQ1qnkof8nlQYAXV5sMHuKojImV1CtfDAI
	 Uh08VLxLry0Bw==
Date: Tue, 30 Dec 2025 16:27:52 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: imx_v6_v7_defconfig: Configure
 CONFIG_SND_SOC_FSL_ASOC_CARD as module
Message-ID: <aVONCCVuPbfqVPN5@dragon>
References: <20251216143522.1064563-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216143522.1064563-1-alexander.stein@ew.tq-group.com>
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

On Tue, Dec 16, 2025 at 03:35:21PM +0100, Alexander Stein wrote:
> This option explicitly selects other options, e.g. SND_SOC_FSL_SAI.
> These SAI drivers use DMA which in turn is dependent on CONFIG_IMX_SDMA.
> SDMA needs a firmware which is not yet present if the driver is built-in.
> Thus build CONFIG_SND_SOC_FSL_ASOC_CARD to avoid useless driver probe
> deferrals due to missing DMA channels.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

