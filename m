Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28986CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69DHlsir6ZosfzMet4YEklAxrs9GZDpWfJvTKMA8vnc=; b=fG57WM0eqZjdXWZhJrpdTf9hg+
	Migmj53l+oWTR3/9HIhaMRSpZfOLRpDw89/vXu7503zwLUM6Cb6uX3htDBXchOOaQRhxw2DjBTFs/
	iFomZSdETpTVZ53GnKUe+hM8MoWFY3CBiHtJLCgYOwQdHthwZIc58Yi75Eoxsa5NR7E2PmoBHCuV2
	9JJpVb2TwN5V3bTKNSpLBLAOB8wxTqDLyYYpmHpeqKmhjgBJ9AvKQuHCY9XlAwjaXd0HKSljfDv8G
	OChr8XJofIHsoflza99+hVbtmKMd2BuW9+09P6fiagipy4RRFgsxiVtbDl0e2o8Vqd9mqXBY0AIU5
	IGfYU5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQIP-0000000F8UW-1slF;
	Sun, 04 Oct 2026 17:46:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQIO-0000000F8UN-3keb;
	Sun, 04 Oct 2026 17:46:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 355ED43E33;
	Sun,  4 Oct 2026 17:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF0F1F008A1;
	Sun,  4 Oct 2026 17:46:43 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 49544182ABF; Sun, 04 Oct 2026 19:46:38 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
 daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
 viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
 myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
 Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
 marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, 
 wens@kernel.org, t.schramm@manjaro.org, 
 Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, 
 linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
Subject: Re: (subset) [PATCH v2 0/5] PM: Use %pe to print error pointers
 symbolically
Message-Id: <179113599828.190565.13465201522154084612.b4-ty@b4>
Date: Sun, 04 Oct 2026 19:46:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Sun, 13 Sep 2026 00:41:50 +0530, Sumeet Pawnikar wrote:
> This patch series is a cleanup for subsystems under power management
> (linux-pm) that converts several instances of error pointer printing
> to use the `%pe` format specifier instead of explicitly casting with
> `PTR_ERR()`.
> 
> Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
> print error codes returned as pointers. By switching to `%pe` and passing
> the error pointer directly, the logging subsystem will automatically
> print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
> `CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
> numeric value otherwise.
> 
> [...]

Applied, thanks!

[1/5] power: Use %pe to print error pointers symbolically
      commit: 8761a4577c4fd489fb7af435f4b11ab6762dab66

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


