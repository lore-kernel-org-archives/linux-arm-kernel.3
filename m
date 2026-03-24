Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC7AF532CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnyoblSrnRUmCkxs5sCCjnEJUyDdJlaStlWtZvBiVF4=; b=3KlaFB3RR0adxMpBu5R/PgMPZg
	EZ8n/nf44e4Dg4FnHJa4a/4ciLoHX5W/8pFREGE6l2zl903YnWQ11n7mS55YMssLSZisgCIjf2LMO
	+OA5wG9k2SXH/DJrs+bT5G9QtZ/L+PCMMVnhELN/tV/YeWVKT/OmQzyY6Hgx9gTszdODJvTYldAjD
	etUs52pxbaVPMU+207AfunaZTZIEIf2S0QjuU0Oqx3+cxh8Xy7aMP9K1DH2CVNE81Xf7Oz5cDeysv
	+53Yh3h900d60s9uOXNx9uh0nHSjgYFttQgiHUifgorw8Oq0/+o7/6P7fW8zmReds30+EE7uqcsOz
	TIiujTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4s8O-00000000SPO-161g;
	Tue, 24 Mar 2026 03:08:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4s8M-00000000SPH-1dbG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:08:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C5B260120;
	Tue, 24 Mar 2026 03:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83954C4CEF7;
	Tue, 24 Mar 2026 03:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321724;
	bh=L6bdm1UAcNyRmk3Mc5xmi0ANiavnrf9n3FslWt3Q2V0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LHF3aDiVHXC9i/nGJ35BLo1UOhtq97jikR0glYnrWss/+pr2g40JoNyZuFhWYQt3R
	 7SKZJY6TQxfnqoXDWCygTMJtcaKbbt+h4y6OnNdUFmK1ewGTf9/QEBX0QfCXzYJDdY
	 VOlw/rYSRUgVuA4sV6kDoqxIF4szGJE2h9dwGMunbX44cvG0XMME8VsH+bzTwEB4Yx
	 aTtYoBOnKL2+dznMugbQE07SPUgoPaPcwSClyl99RuelalvVBcmmG08iroRDz69xZ5
	 HMF75t+N1OQDgHWDZe8CluOzczvZuedXdIb0wE5rt4bcT7pEHbzSGH1TBFXYhnUORw
	 +c9oedL99psnQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260323171927.1256507-1-wens@kernel.org>
References: <20260323171927.1256507-1-wens@kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: sun55i: Fix r-spi DMA
Message-Id: <177432172322.21043.12372539373263161573.b4-ty@kernel.org>
Date: Tue, 24 Mar 2026 11:08:43 +0800
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

On Tue, 24 Mar 2026 01:19:26 +0800, Chen-Yu Tsai wrote:
> r-spi has DRQs for both the main and MCU DMA controllers on the A523 SoC
> family, however it seems it that it is mainly routed to the MCU DMA
> controller, with no obvious way to change it.
> 
> Change the DMA channels of r-spi to the MCU so that it works properly.
> 
> 
> [...]

Applied to sunxi/fixes-for-7.0 in local tree, thanks!

[1/1] arm64: dts: allwinner: sun55i: Fix r-spi DMA
      commit: 6896ca5a9d05275fbeb38640c9bbdb95698de188

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


