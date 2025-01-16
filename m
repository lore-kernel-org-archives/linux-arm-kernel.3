Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6413CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 21:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlAS5F590NglDo4EfCac5zFlGtiwAR/Us4/0af6GVkQ=; b=3AI828fkLuO5dfBt85easTjiey
	Dl6D1Zgqd1fOI9oF+Xwreea71xY0xO65TH712Hp9qOJY6I1R8WRzlCYK7c3UX9hTg6ZnYdepNTiQm
	c9935JfdXIh2hNzxbWlvJVcw1C65/IYFWfW62KYj3/Mgg+B4rOpJlHc0gHun2B3TfNLYIv15KzwWk
	XGKEgFe3SCt+CN82TfVR9LCS/UEz6mEUnk24iZYf7apFH3x8+M56EiJZpdO5LnaXJTO2bHKgsbkO5
	nnLR5LOdKvaoE38DrTVQ5wcB5WCF5PZWhKQ9lB59f45wiDCYUm1GDvON3EVimwF6ENpbRXBSkACsk
	mnxtn3+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXWe-0000000G9Ts-1ClI;
	Thu, 16 Jan 2025 21:35:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXQV-0000000G8nx-2G7Y;
	Thu, 16 Jan 2025 21:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52DD45C5FF2;
	Thu, 16 Jan 2025 21:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3716C4CEDD;
	Thu, 16 Jan 2025 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062958;
	bh=KlAS5F590NglDo4EfCac5zFlGtiwAR/Us4/0af6GVkQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=M4t5F9k0RPopTpZtkBJJbqz2DF6k6rtXh/lH5xI6i2G5ctrjfxS3erEsxNHH/EqJl
	 ELNarA+8nbat6jDQLnzfA0ydnzUODJi2IEhcY+t7RNBChemEBmf3Am6sEOHtG7Gf7Y
	 1F02y8HqFKIwBgzsmF5lWcLKb5agPkWnYIadSmJUBGsOMdM55IKTyxGxyTS636LcmU
	 u7rVFKalwtW/lbS8VGLYlB3CeIs0K3wXo/sRYdT/mTr4NwDz7he7/WGEIbNGYZrtke
	 f1IsH5oBgQQ434+36mu/Qll2gbgPjUjiLRqICjIZ52gF6oDWh3rprsfbWZ/R60kJX+
	 q1V74WhD/eQFw==
Message-ID: <248177c8973f35db3d6b1532c86909ae.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116-bcm2712-clk-updates-v1-5-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <20250116-bcm2712-clk-updates-v1-5-10bc92ffbf41@raspberrypi.com>
Subject: Re: [PATCH 5/5] clk: bcm: rpi: Add disp clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard <mripard@kernel.org>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 16 Jan 2025 13:29:16 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_132919_617853_A6EB2250 
X-CRM114-Status: UNSURE (   7.85  )
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

Quoting Dave Stevenson (2025-01-16 08:24:12)
> From: Maxime Ripard <mripard@kernel.org>
>=20
> BCM2712 has an extra clock exposed by the firmware called DISP, and used
> by (at least) the HVS. Let's add it to the list of clocks to register in
> Linux.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next

