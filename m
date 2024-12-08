Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60357E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 17:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGdxtvyMWbo1LnwJHWFxe9QnTs+d8g7MwRZZECMKxd0=; b=B4HIP8bNifPzrewMuudu9p1WsT
	PYfEkr60P5C1+hNIOh6qKIOLmw2t1uVLfOd8f0JS9TEm0wPanZVPRkLmyTF9c9WjPOnjKtoTo5RRw
	KudzdYtx9akFx8hBXI+Z243EkcQv5HrHTPYteyOHfRfm1nNsy1xY0hjoB42AMhtVdnRuSeOxWRvoU
	E08v1cAXMUwoO4GqyOIq9tmm1J/lbsrBmn4MW9+FWf6YUR3zXH5ZPEnLKRIBKIhGyOFtnZXC8Pviv
	SzU1r6mbGS7/Cteb56kFst51ihMtLpZe8ISeBDaEqtxYPnTy2PgP22fyfU0Yo4H/i5Hv3EiAQTmUH
	XWWooPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKmC-00000005csN-47yo;
	Sun, 08 Dec 2024 17:09:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKh4-00000005bzx-2WTl;
	Sun, 08 Dec 2024 17:03:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AAD45C1628;
	Sun,  8 Dec 2024 17:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E68C4CEDD;
	Sun,  8 Dec 2024 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677421;
	bh=OzDARD49R+n5VdNnBGtctFOhHbckqO7CziSzfIPOS0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=spyhw8Or7dDJtUGMI4hnzo/Cwi7FcY87M/3qsTGI0YPZzRmcGqps8JdoHSqycKF2n
	 f/94VbKItY+duEpzZYT7XPnL+IMuw7GDVMDuZUpK62qQe+2+xsgPOvgUXS04U1399m
	 pOlnX8BMz19MIvkAbBKk2z8DubpaD3nyQT6lnDuJcn/+RyMLoB5M0+4+ZZTPKrreoZ
	 y46FhLv40PSbTmV8tKG5SKbBrRGUv4a/RSuIk0NVW96JADf7g2wDwagSzaqdk9GM3G
	 7uEaMDMzoZxXZGbQvQR/Eux1eK9CW+DXoc2AN1GDBInaF6/wuQQMga/jxcRo5LtzEb
	 wmZFSr2EY/6lw==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
In-Reply-To: <20241031104631.2454581-1-andriy.shevchenko@linux.intel.com>
References: <20241031104631.2454581-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] phy: sun4i-usb: Remove unused of_gpio.h
Message-Id: <173367741843.1042266.6194820698713604064.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:33:38 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_090342_693121_EC35B33B 
X-CRM114-Status: UNSURE (   4.42  )
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


On Thu, 31 Oct 2024 12:46:31 +0200, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove. The drivers in question
> don't use it, simply remove the unused header.
> 
> 

Applied, thanks!

[1/1] phy: sun4i-usb: Remove unused of_gpio.h
      commit: b6096751a652a7e7526d4b3d59971a40c3287ef7

Best regards,
-- 
~Vinod



