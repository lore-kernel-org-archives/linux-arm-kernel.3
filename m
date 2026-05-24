Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B84CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 20:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDZQdx0V4ORVSnvj5YQgBwCeMJlhihGjLYyEJL2le2E=; b=IEJTmAnpZZwv9rm4rri6aL/5yv
	lBrcIpbIO5NQ8J+4lzvH2ZWEy/CPp6R3sIMV6hKuRUwaKvOSHjjBTTt5JW6VVvuGZlJRyq1Pgle3O
	rud5UHyvvJ+GpDm7lQM/SQjDE57bqWf/rX2JxiN36SLmKlTISwH0yNgs/kEnFlj1U5c+h99O2FUJ0
	DBNwRjrQGVWsRzZej1uRSiX4JcUe37TyusZ6T/XQkLC7X8NIU22DdqNmb3Fgo4u3kykK/bn6/MQYn
	c3euUxM6qSR2L+NA2mdzZhn4JlZEZ8IHgLZARELoGfolMB0z1X/rS/ASRBLAtuS99lIUOXMfM2xem
	4mSN5aag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFOg-0000000FZxr-3BQG;
	Sun, 24 May 2026 20:26:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFOf-0000000FZxX-31J0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 20:26:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E577601E3;
	Sun, 24 May 2026 20:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15631F000E9;
	Sun, 24 May 2026 20:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779654364;
	bh=kDZQdx0V4ORVSnvj5YQgBwCeMJlhihGjLYyEJL2le2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lvRG70LLvT2JwbEMukCh4CI+t33SRUlZmpS7Ky+ttZxPDo+1IzCcMoigOb4fgJmXE
	 kQ9tEQu5g2jDjFZ73ALNDePZa1A/OiMBXp/PGLgjXK12qyhOIdKy78CYgESGWCy5vO
	 6zIGKsFyXSKCUz76MaTvem0XBU0VHmcXdhTDyP3PfRPYfkXbFvq5LsE/bnK8Wu86LM
	 yHiBBNnLTiPazFaGH0yLXF/COKD3OkqQAzQ1V3j6vExNLnvPiURngZgLsAmy+L6aUN
	 t1QJk9s3lkeM2DwNw4S0Bk3wbFdQw2gJGoos/UBk2BzALymCITlAZrfExXpydTGqe+
	 KE2w1p8sFdLUQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>
Cc: Yong Deng <yong.deng@magewell.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
Subject: Re: (subset) [PATCH v9 0/9] Allwinner A31/A83T MIPI CSI-2 and A31
 ISP / Platform Support
Message-Id: <177965436154.163755.7683015392753567325.b4-ty@kernel.org>
Date: Mon, 25 May 2026 04:26:01 +0800
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

On Mon, 18 May 2026 17:33:29 +0200, Paul Kocialkowski wrote:
> This series adds platform support for the V3s/V3/S3 MIPI CSI-2 and ISP units
> as well the as A83T MIPI CSI-2 unit in the respective device-trees.
> Overlays for the BananaPi M3 cameras are also provided as actual users of the
> camera pipeline on A83T.
> 
> The corresponding drivers and dt bindings were merged a long time ago but this
> series was never actually picked up. It seems more than ready to be merged!
> 
> [...]

Applied to sunxi/dt-for-7.2 in sunxi, thanks!

[1/9] dt-bindings: media: sun6i-a31-csi: Add optional interconnect properties
      https://git.kernel.org/sunxi/linux/c/4543300b2d55
[2/9] dt-bindings: media: sun6i-a31-isp: Add optional interconnect properties
      https://git.kernel.org/sunxi/linux/c/bdf22efc6cb2
[4/9] ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
      https://git.kernel.org/sunxi/linux/c/3c6867908ecb
[7/9] ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
      https://git.kernel.org/sunxi/linux/c/4fc5086a3d99

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


