Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F63FC636C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSMGllCz9tMfYswt3AUYSiavWgtrCi20va1xoKb1UWc=; b=063LAepfIT5LF1qgZEOXfxKLik
	T1urKDu2co5IxqPxRZzgwqZGDGv65ECLe+PCWNskhUdpTOuAyQ7A9+IjshCO5kZY1Olnoc80TwUEn
	ggDc1usqvZxDmbXDrT7K9pae+01/uLKbgrQt+1LmFfiUIR+2PtB6HNeM5llKeR3xW3uhkwHqtTS5f
	ponDe1QXRLYT4UBRrzV6kJQgxxNZ5TmFM0W5GZ+EZPYcJyP8FFLMmO180a32zIUyujegV72Nu1lm+
	iQT9smzyml1gy/et3QaIcFD5ElDNfqb9nzgWQGHUf48vYpDDrZVXbDsnizzA77OyGfFNV7/DPcegf
	r3Hbk7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuIAq-0000000H1HN-3Nc8;
	Sun, 22 Feb 2026 22:43:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuIAp-0000000H1G1-0Qts;
	Sun, 22 Feb 2026 22:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WSMGllCz9tMfYswt3AUYSiavWgtrCi20va1xoKb1UWc=; b=bJve3SgpG+XbEd5mdkZzyDcNrx
	Z+AHBtHNkCIH+iwuIfvw8yOkAWJ86+wkY2WY+L/LAl64uPAcJgWIO7rYSDiEy2TOtw7D5npr7r31R
	EQQV7ehnTsjkRrESEh3E8ci5PC7EFo54DeifbQ0L2YT69IM/OJcnztqYaCUvTNOg0x+BM0ABHF8b+
	dyssUHUEzQGy66KDhDTig1Qlgj7z6wGLU32iPWtUQCFG5Kf1Dap6xlItt24p0TKhGye2WT6BB9xVL
	E+R8vor3/WOIA+lGadjFUbaTcR80+1rme6evXwe+NsS6Qw2alVAwLSXt17R5iH6SZr7LsCnTntuhQ
	vsusqBXQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	wming126@126.com
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Ming Wang <wangming5719@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix Bluetooth stability on LCKFB TaiShan Pi
Date: Sun, 22 Feb 2026 23:39:15 +0100
Message-ID: <177179992297.1861430.8124521533934492277.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260206090453.1041919-1-wming126@126.com>
References: <20260206090453.1041919-1-wming126@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_144335_141056_124FAC10 
X-CRM114-Status: GOOD (  10.31  )
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


On Fri, 06 Feb 2026 17:04:53 +0800, wming126@126.com wrote:
> The AP6212 WiFi/BT module on the LCKFB TaiShan Pi (RK3566) is prone to
> communication timeouts and reset failures (error -110) when operating at
> 3 Mbps.
> 
> This patch stabilizes the Bluetooth interface by:
> 1. Updating the compatible string to 'brcm,bcm43430a1-bt' to better reflect
>    the actual chip revision used in the AP6212 module.
> 2. Lowering the maximum UART baud rate from 3,000,000 to 1,500,000 bps.
>    Tests show that 1.5 Mbps is the reliable upper limit for this board's
>    UART configuration, eliminating the initialization timeouts.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix Bluetooth stability on LCKFB TaiShan Pi
      commit: c215b9681a1cae05e8d52b5b57ffde2f17fd3029

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

