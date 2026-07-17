Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF4EC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBBlU9d4X3MqXqNZ20P0uxNAlPU3+Ek5OXUU+9cPVUQ=; b=wETUnXH7FfKEJKcr9+Gh+wSmbK
	0Fm4oIoTIYsbPp9WWwbO84EkIFOHGjUxMGMnE3wKeKJ8IrMEzZ44qWU1NpfEtvEibfQ4Tyd/u8kia
	ncVBktHRCSUfMXVxzITay8xtwRfu3xkVJZdW/3h3HtSCldOXXUSPsNnOe9v5pNt6gRXPlNEfDoOkY
	GezAmbRAzOlSGLX+vrK0WM4DDJmS95D/devoyWrP7kaULcBiIKiqMcZhJi/ImkEnsF5nS7j8xShsV
	PwGGYoqLOWBi8jKOSHSruXO4gY5TTaAM1zKdQ5mZ3r2EJ4SMmumhppUuxPbXYqM+dCgf30o+8/Uh5
	6aJxkvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkego-00000001oI2-0htx;
	Fri, 17 Jul 2026 09:17:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkegn-00000001oHs-0CxH;
	Fri, 17 Jul 2026 09:17:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A42060204;
	Fri, 17 Jul 2026 09:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8921F000E9;
	Fri, 17 Jul 2026 09:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279820;
	bh=SBBlU9d4X3MqXqNZ20P0uxNAlPU3+Ek5OXUU+9cPVUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jDWNpb+mktS7vC051liZ6JnIm+pNHzYDenLFHlwwn7vY+ETqyn78DC72GAofKC4ZG
	 Je5uuzj+g0ZoeH/x5T9RNiPgNaavYvx1TGhjIEJjB/yZhrCZT4SYeTc2I/UAlQgirb
	 3FdYzaOw4PLqSlQVJv+yPfPZzX3M+/tjLf/5jGnGRtNhGrkCYb81NZy5nm/shlnFwL
	 TzEuP58+3DdRsXtDD3B0Wku+7BCcKjtAPYv4pBilGp49smoKmDog7Abve0Lrfpcc52
	 r0UPN6sBZj+2zvYlWY9EuH4Nj7CwQmPQeqBjon34TYWmL96oZR+QLBMqIwRV4Q6hIF
	 Vw4LUVUCjkY5w==
Date: Fri, 17 Jul 2026 11:16:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: watchdog: mediatek,mtk-wdt: remove
 mt6589 fallback items
Message-ID: <20260717-turquoise-sponge-of-effort-bdec7e@quoll>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
 <20260716161923.266315-5-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716161923.266315-5-akkun11.open@gmail.com>
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

On Fri, Jul 17, 2026 at 01:19:20AM +0900, Akari Tsuyukusa wrote:
> All DTS have been converted to standalone compatibles.
> Remove the items block that allowed the "mediatek,mt6589-wdt" fallback,
> keeping only the flat enum.

1. This is not a separate commit.
2. This lacks explanation WHY you are doing.

NAK.

Best regards,
Krzysztof


