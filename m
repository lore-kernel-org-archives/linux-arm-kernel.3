Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D85D29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeoXieSnOUp2suxUyup4DIFABiZcUldmtlhqTcLvzHs=; b=NV30g7nnAdaOCAXC2jU9JcZtTo
	aZtT9KU07vrFU6DWHjschYs6MY0hlR7UCQjLIgil791wMM478j1XghdZNHcnzUtX+ktxfGld5cmRP
	TFEs56JxR6VbM3MY7a4cdfk+OSLMZc/tL/XMbDcJL6TmAFb862+rsVqK/3JBwGu8/UVau1x9TGX0t
	JWmZwseSyJdvP/5+C8cpLVNqMQJ5AxMNIRe2qV++8ARd+6uXEbUPTR1MqzmG0+Ty7iIXNLVN5J8lH
	0F1FtvHyL4zeyTEcY9VW5pjAUXCToPYVUqo/vzSY/oxUp2X/c0AqdHBVC6vyQtnX//Z8tXBz/CodM
	Mc9el/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bFL-00000002FVb-023j;
	Wed, 06 Nov 2024 08:18:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bDb-00000002FCq-246H;
	Wed, 06 Nov 2024 08:16:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B465A40A9C;
	Wed,  6 Nov 2024 08:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7ABDC4CECD;
	Wed,  6 Nov 2024 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730880999;
	bh=47cL+BYGPWa06/iNmD2zZ/aGmskQxi7SqHCrJfaPG1o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y9TGYqYq+3i/of8TfoNB+MveH6ytzW2HGQeqkLrss5pFUXCkhr2vnxlgb8jYMtAwN
	 ABbMiRjNKpu8XDK3Xg+GSqcx+n43zalDmBI4fuqszOWEYkqXo/FSEr40plFNQkDJXp
	 pLhTMDQWBEguxTqT1RVx3rhIOWpdVZcI7oG7QzMtedl9OtvGEOP9NS4bSX+mCbWRpi
	 cXszXILIpXEHvg/Ter9JaaD6L6tfHNJLz7Tl9Te0L4d3BG7pVw70h6OF4qxyfT2bJy
	 JUg6oAKmDBJSlz/eYorWPtFwinq7koHHzYobA1z5ohVjgNKdJ/qpOD1hAjiJz02OkN
	 8EKNim7d1DLeQ==
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
 linux-pwm@vger.kernel.org
In-Reply-To: <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org>
Subject: Re: (subset) [PATCH v9 4/6] dt-bindings: mfd: Add support for
 Airoha EN7581 GPIO System Controller
Message-Id: <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
Date: Wed, 06 Nov 2024 08:16:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_001647_614427_F526FB3E 
X-CRM114-Status: UNSURE (   7.04  )
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

On Wed, 23 Oct 2024 01:20:04 +0200, Lorenzo Bianconi wrote:
> Add support for Airoha EN7581 GPIO System Controller which provide a
> register map for controlling the GPIO, pinctrl and PWM of the SoC via
> dedicated pinctrl and pwm child nodes.
> 
> 

Applied, thanks!

[4/6] dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Controller
      commit: f49f37f3cfe1482d4dc77d26f3e8c38eab630d52

--
Lee Jones [李琼斯]


