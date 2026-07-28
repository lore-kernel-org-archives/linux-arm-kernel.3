Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE46EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 19:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huxwkT+YIY5j8ccI/eBKthSOzoDq1eAsTS/gveNwfvY=; b=2N5Dp5jwRDEGqkViTkVV+K6iKo
	kGGil/gGcVZCF5vN+TP9qjb2uPXDDDJ0WTqJ1VBwlkyZKdIY8R4kWYjqLeHD8361pEDsqW70vEsNx
	Ef42VaLCq9J8ejHKRNyxRd+6GfEkZK3wMLR7MkxynZrXuzd4cHtk/3s9hpGVePkRhURtiyM+VI8TA
	JbWn7oRTH6gBw7zhO53zXGv8OIPfV1xR6eAu+9oNUEHOYhP3UosnJVfrwzZQYTgernZdhLS79BmBZ
	Ve6p+AvW65F68r7b2iv/cBGjCGQqGdKg6l1eBGSNSKgcqto6T/k37htlgJsSo19MK3ntPay1+3er1
	AIPenKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonIv-0000000684P-0Nov;
	Tue, 28 Jul 2026 19:17:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonIC-000000067cS-2Xef;
	Tue, 28 Jul 2026 19:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=huxwkT+YIY5j8ccI/eBKthSOzoDq1eAsTS/gveNwfvY=; b=qDP/caSjc4232sZbnKAOButDeu
	LlLhjJ7dANEywkTzJ8DLnSuaz6AFXKvjbALFh/Jt/oWpXlcFXJr9Q1uMm180waQWIaezdOgr/qZ7c
	QcZCC7ezvmjVmxaxXpam/c4Pv30qdVKUaFJ/sfpwAjM9ZulX92BMEAz3zr4VjK9iEg87nXKURZ4tr
	Y/noKsHYTLAx31lNOAObAQcdchFnZRC+JFfli+9zsXNMMGFLWRImHsk5jeFtvDF7eYWY2qkMAN4nY
	G1mgErzIVIeX5WHBs2Ln3pZ4rB9fxwxwRFhK/ZUkcZ7L5BsFT7L43Oxy4Iiz4n1cK1WDqJNJKhhPi
	G8No+aiQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	ivan8215145640@gmail.com
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property
Date: Tue, 28 Jul 2026 21:16:30 +0200
Message-ID: <178526609460.300371.6870449079631609036.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721135450.45286-1-festevam@gmail.com>
References: <20260721135450.45286-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_121644_640843_D9FB317A 
X-CRM114-Status: GOOD (  10.69  )
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


On Tue, 21 Jul 2026 10:54:50 -0300, Fabio Estevam wrote:
> The TSC2007 driver uses the ti,max-rt property to specify the maximum
> touch resistance, but the rk3566-bigtreetech-cb2 device tree uses the
> undocumented ti,rt-thr property instead.
> 
> As a result, the configured value is ignored and the driver falls back
> to its default maximum resistance value of 4095.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property
      commit: 7707e4555cf1d52689621e3206df8ad2debaa0dd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

