Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294D2E94109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 08:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nqu+PRD3eLZS4CrB10/3NHxMcMXWkMgdMJnvNcIuVmI=; b=Q2sVxf+o31LZq1FzWaXT2epYa7
	8cjdWLaLpWNuCcEWNCb4TELFFvv4aTaH9zW0FU1IuUNJeMjP5NNketxAtxtqBw5lUyZrn/HFE2HgO
	rksox3bagjrgW8jjtQP2Kco+P/QsYK9HjYP985bv2/cP3Z0A4IT8Ux3FyTyrSQUmNygwwrUGTNsU9
	TggdyVBxB6ZxNrrqstiFqp9MKk/53B5BEc4ucyQLNvVnwQ9mvicQEZYfwzudc7A6mDfemyIXDMXR9
	X3fw/fl2MkhHMjnVZzLKyq1/ta2/Up/MtK48w83z3dw/tVMcB3AAh+YfWxTzvhWXBlnQW16GRpb2W
	KXBfG1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUn7-00000004Yf9-0DY4;
	Tue, 30 Dec 2025 08:09:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUn5-00000004Yen-0DjC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 08:09:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E20243DE6;
	Tue, 30 Dec 2025 08:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA07C4CEFB;
	Tue, 30 Dec 2025 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767082154;
	bh=STvICv03DYY1Jku37i0sIRJQGUTF4yyyZ5Dx965x5Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hse3nS7Hgxdn2r1IYMDI5XR4Lf77RBYLfMX9EAqbLW3mmmOTcdgPOUGpvdjKwdP32
	 bTkzD9cCMZIfRJ4dGmyKN86CRBAagpwBC/BJfNaGcE+TRrwDhCSDNmcelUjMMQIdsN
	 rnj7jmNfxHIkvSv2OdpgnplQvmlpGQfTMTsdyxJQf/XFBmtJHLBjMgh8pVjztmVX9e
	 Dc868hwov5rvW7Sj6Gbv0wBIZ5zKFfAj8FrGYOmDO5Z83jRZYIhTpsGXBkkIggv539
	 0JEx/BDlWMJSY3gBbIg7lm6w7f3HSdWp/b3tiaQHvc78E/j1akEN9ukG8KgmTue4XE
	 +QStvYFH6rOGw==
Date: Tue, 30 Dec 2025 16:09:09 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: mba8mx: Fix Ethernet PHY IRQ support
Message-ID: <aVOIpTeEmhFrs5rO@dragon>
References: <20251216131529.886546-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216131529.886546-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_000915_131239_6800573F 
X-CRM114-Status: UNSURE (   7.38  )
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

On Tue, Dec 16, 2025 at 02:15:28PM +0100, Alexander Stein wrote:
> Ethernet PHY interrupt mode is level triggered. Adjust the mode
> accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied with tag:

  Fixes: 70cf622bb16e ("arm64: dts: mba8mx: Add Ethernet PHY IRQ support")

Shawn

