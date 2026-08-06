Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBCEC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg/NzKtGUicQWYfSzQGG+OdidfzVR9+xwhvbX8IlS8E=; b=Y5VbR9uthgYZKoxhuxoQIVI4sH
	WiP3tc2160c7tmEFAlHEFTbHX+rEJTEm9lbyt71VKRP5DYUxfd9HeBHMe8nk0N1R+129LcP2Ta9lJ
	Jql0Zh3dG1jwf+f/uRuwlgm5guhtKcRq8AEUl/1qgsNZNJJ2chDhQ2rHN2wMSpLYJCTKs4/JaH1cZ
	TtCQFu3oJep9OpxR/w1lVb7ygoA/4IGQ/PgoiNkO2krtCyqEYkt+et/hfp7MBOvjTJGkSPNGWo//T
	J3pJW2fs2hokXagMBKKbQwbgcfD7v91GFbbuUaL1rMrzp9bbhBdixhjBvZMRRFHUOumCX5fybd5tS
	4/y9BwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0vH-00000006Cm6-3Fd6;
	Thu, 06 Aug 2026 16:26:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0vG-00000006Clv-46n4;
	Thu, 06 Aug 2026 16:26:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BE5F60AB1;
	Thu,  6 Aug 2026 16:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4572D1F000E9;
	Thu,  6 Aug 2026 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786033582;
	bh=Jg/NzKtGUicQWYfSzQGG+OdidfzVR9+xwhvbX8IlS8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RCI2qc4E7HelIbD+i/JZbV5at6mCpJjahlktbvQkfbRJpNdXwsOoqJeZLa6gbG0j5
	 JOydWYADGn/69AphEUC4zJQI2ZEokL9xVVeKYvy2atuFWt7is3PCmat/TnspVVlPps
	 fMnL+P09IBYhccuCp2IcoadHHft4MhuwRjXo1uNz0kOzIYdnvdky4CLdWqVbFMMfAS
	 69z7dwN4ORxQdPKO82RqOKsxJ+dovsmN2SneARRlezt22akS3CnJGrqwmZUV/IUbqQ
	 Di413xABZy9eqjoRvUQo3n+SvMRY3nUwzlEDVQzJ3lq1fOE2JsQc8yrq2qGSgNvngN
	 eZy7hmH52RCSw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, 
 Xu Yang <xu.yang_2@oss.nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>, stable@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
In-Reply-To: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
Subject: Re: [PATCH v8 0/6] phy: fsl-imx8mq-usb: few improvements
Message-Id: <178603357786.674490.1895923542917045365.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 21:56:17 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Fri, 31 Jul 2026 16:11:18 +0800, Xu Yang wrote:
> Patch #1 fix Type-C switch resource leak if probe() fails.
> Patch #3 add runtime PM support to avoid register access issue if the
>       USB controller enters into runtime suspended state, in this state
>       accessing USB PHY register may lack some resources. This will also
>       avoid regulator leak if power_on() fails.
> Patch #4 add debug control register regmap
> Patch #5 add imx8mq_usb_phy_drvdata drvdata for better extension
> Patch #6 correct i.MX8MP USB runtime wakeup issue after introduce runtime
>       PM support.
> 
> [...]

Applied, thanks!

[1/6] phy: fsl-imx8mq-usb: fix typec switch leak on probe error path
      commit: 87a1805b1c346b092c34f96f3806f207792910e1
[2/6] phy: fsl-imx8mq-usb: set usb phy to be wakeup capable
      commit: 2602012b8c625e63493647356d7290ee7c8fef2b
[3/6] phy: fsl-imx8mq-usb: add runtime PM support
      commit: 56eec5d9665cebe580d41cdf2ea7abb52d23e122
[4/6] phy: fsl-imx8mq-usb: add control register regmap
      commit: 01e9e84a43a1b4e9f67b5bd36be3d127d773a223
[5/6] phy: fsl-imx8mq-usb: introduce per-variant driver data structure
      commit: 2d9dcffd5d3995ba04feeeebe800cbf1c0d4bbbe
[6/6] phy: fsl-imx8mq-usb: keep PHY power domain runtime always-on for i.MX8MP
      commit: ee9e2b39ea4890f804b0c75c8a40a0f68ecd8d0a

Best regards,
-- 
~Vinod



