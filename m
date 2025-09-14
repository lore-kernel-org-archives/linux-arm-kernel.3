Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510DACAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzpsFwgy0K/DxDJYX/SrJZ1GM6eZbKrUNMro6hrXahg=; b=xCbNBSyf0HPxlr+3xhPESaN8BF
	xdbvX8BaYMeCa0aK/S6HXadWRytC2JxFRRA9ipCMAcg3LpySQjybtQYJ/j+PbC8whQDv+WxaSW3IE
	QD5HDytBQKureK750RMiuDeiqaaq7+fAWupHDw1CCUCzpQoRdTR55FUMozDCb0iM/2UcuSo/EJLmn
	2O0hiyB8HHyXHxcat0Z2G0ps7qQSKbufQGPhPYQ/lMkjHXah6GtT8VuBOb1q1uNaGG+OD+bkjPojh
	KtMV/d1i7MPk613VL6StPFEhY0GRUYn8RgEvjQdHgGw58jqKfDVRsiau9RB6pEE9F0mmYfmwOhY2w
	0aNE6pCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxpbv-00000001qiv-03oN;
	Sun, 14 Sep 2025 16:29:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxpbs-00000001qi6-37iZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 16:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 438CA60193;
	Sun, 14 Sep 2025 16:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C050C4CEF1;
	Sun, 14 Sep 2025 16:29:49 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 1CF4D5F846;
	Mon, 15 Sep 2025 00:29:47 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250913101600.3932762-1-wens@kernel.org>
References: <20250913101600.3932762-1-wens@kernel.org>
Subject: Re: [PATCH] arm64: dts: sun55i: a523: Assign standard clock rates
 to PRCM bus clocks
Message-Id: <175786738705.280883.1529731611819017307.b4-ty@csie.org>
Date: Mon, 15 Sep 2025 00:29:47 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sat, 13 Sep 2025 18:16:00 +0800, Chen-Yu Tsai wrote:
> At least in the initial version of U-boot support landed upstream, the
> PRCM bus clocks were not configured, and left at their reset default 24
> MHz clock rate. This is quite slow for the peripherals on them.
> 
> The recommended rates from the manual are:
> 
> - AHBS: 200 MHz
> - APBS0: 100 MHz
> - APBS1: 24 MHz
> 
> [...]

Applied to sunxi/dt-for-6.18 in local tree, thanks!

[1/1] arm64: dts: sun55i: a523: Assign standard clock rates to PRCM bus clocks
      commit: e6fad4960fc67b7225255b10b080765b451a7bc7

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


