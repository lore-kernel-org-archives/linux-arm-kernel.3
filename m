Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69096CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qepFOU8T20KaFaLq8hgY/wsf4nLF6or1PKzI4CKHSjo=; b=hro7Nf3z7tLiNMQUExpuRutjt2
	NmugK3E9TzK1/8xuGnNkgEmZuDooxzgRjZSWC3aJl+gJi4BkN7sFcB4k1TK4f+7sYIgkQWRDBg5Um
	k5d6dLj8pJ/E+HtQNEk5xGvdJKm0ivRAc/5+LDS26YPt9zFlCgyL+soV+PLtDcfFQGpkYb5znnp63
	hMDcWgdyJx8+wO+iXlOduqECgMTlCI/ACSpMTOkWV/WxDIFx4nZBI3wywJDbMx/H6RGUUTD3GTb0K
	FyiqLYkNyO2VcHcRL+9jw0UpoqEXhRwf/R7KpjpFKajKda2NYghemgLCJLUnd8i7aeUJJADp8y2wt
	ZZD3EkyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Nv8-00000007wAG-0pGi;
	Sun, 21 Sep 2025 17:32:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Nv6-00000007w9u-1BSp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 17:32:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D911D408BC;
	Sun, 21 Sep 2025 17:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EA0C4CEE7;
	Sun, 21 Sep 2025 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758475935;
	bh=qepFOU8T20KaFaLq8hgY/wsf4nLF6or1PKzI4CKHSjo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=koEmKzV1JfTshEqlFj/6c7QvIt4O4+AHiKmF7yCgAUnIyKNJIxq9QY9yReUExzRoo
	 RSvhAKRzWIrcDfEalNx1esu/opu2awkjrnj422ZaEVyM8UAiBR5Y1tlzXYyPQu1471
	 aLqmqmtZYDSsdLGvO1EOWFqtUD6CP+miBuTkvXhV0V8CZbZP9TFSkXVFAkPmy49Jhr
	 Svj0EkBVcIOOcxkobOQjkJGeKUgLFJprmv4hWdfvhZ8fsavVZ/kIrGFHsuzv8lHStU
	 h5wLbIr3AQrfTmrDxio/6aC84uqYlgnMEjSPV+BsvAsow1UtRBq124elLPoaPI8WGQ
	 mamP7+Lpb83rQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250625-upstream_rcc_mp21-v4-1-9368a86c8515@foss.st.com>
References: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com> <20250625-upstream_rcc_mp21-v4-1-9368a86c8515@foss.st.com>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: stm32: add STM32MP21 clocks and reset bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Sun, 21 Sep 2025 10:32:14 -0700
Message-ID: <175847593403.4354.864826415550352713@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_103216_341091_DCA41990 
X-CRM114-Status: UNSURE (   5.87  )
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

Quoting Gabriel Fernandez (2025-06-25 02:07:24)
> Adds clock and reset binding entries for STM32MP21 SoC family.
>=20
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next

