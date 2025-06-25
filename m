Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DA4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbxa7UZ0S0035G5A1ROv+nrf62slNKhn8QB+PrS0INk=; b=QTvw2UqqwkYQ1pi1RX4eequUMM
	TUxvzazCgb84SRAQPQD18TbUkiVEh4N+nuDnhBUEj2tfSS72Bf3ofMtIWZrPbNe8Nz1fa2KEhqT3C
	vdO79eaHTQDmTrYSz08pg6Z3Pu53EWsV7aEbde50pAElmYtqqdw27hKMk6izQ89siLln56rjnK+Ta
	mYVFwKgwGxeULHRrv2Ql2WlRzbeXktpngXyOSvkCileanbbHb9VaPg9j7zQYatVemBXzduFtTKpxO
	LjLxjAcHDeEoJgDiMqgjlQWwutQ7MeoHM2v6EtBQpio9iTtWAICl5BCNVjz2Lf1pnYP/mOOJWBwcj
	uKTZ3R7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYS9-0000000A3KN-1pjY;
	Wed, 25 Jun 2025 22:18:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUW4t-00000009mF4-0KiT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:46:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7806060010;
	Wed, 25 Jun 2025 19:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D85C4CEEA;
	Wed, 25 Jun 2025 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750880798;
	bh=NODulXK9mLHVaLI9aDIG8467kKcmn3NIW0YaOkXodiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=as2omF8Ee8BkRGXkdGdQQSLwl2mF2fOIbCOBaJx1KR9FgkLStWvbk2ML3Ql9DlQaI
	 cd8bd4cxc9c6kyLTi2aYDkP7WW1cOEm8eePxXBbLDELH/sns1RTZwVUyk+cy8yJs7p
	 DTFa+wXt+FXHAlI7jmD3NRZF3+qUz9yCQjGa0lQ12lVI+Q0pZSldXZbqyVTwGqkR2l
	 s5Q3epf1dJy+GVOUU/IMgfQycUwcwjAMPWAcb+8qdEWcThi9SKKV6oLL4tW/DmKcdE
	 0LLu2/p1YCrsNgEHnLZukj5qh0kWxq9DA7aCXEgpLqMUfBnQxV9us8KGVVE9Z2vnrH
	 1xFNQRShp4G/g==
Date: Wed, 25 Jun 2025 14:46:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
	nicolas.ferre@microchip.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	broonie@kernel.org, krzk+dt@kernel.org, andrei.simion@microchip.com,
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH] ASoC: dt-bindings: atmel,at91-ssc: add
 microchip,sam9x7-ssc
Message-ID: <175088079681.2102370.15282339476917735877.robh@kernel.org>
References: <20250610065005.64070-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610065005.64070-1-varshini.rajendran@microchip.com>
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


On Tue, 10 Jun 2025 12:20:05 +0530, Varshini Rajendran wrote:
> Add microchip,sam9x7-ssc to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
> 
> This patch is a rework (adapting to the newly converted yaml file) of the
> leftout patch sent [1] as a part of the series adding support for sam9x7 SoC
> and sam9x75 curiosity board.
> 
> [1] https://lore.kernel.org/lkml/20241010120345.92844-1-varshini.rajendran@microchip.com/
> 
> ---
>  .../devicetree/bindings/sound/atmel,at91-ssc.yaml     | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


