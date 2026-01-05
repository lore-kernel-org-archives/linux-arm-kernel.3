Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE6AC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRrn7iXBX54ym8ORivPRiW4qF7+GO2bv+9LCoG65VvI=; b=4oM7I/MhQv8UgWktrbRcmrOKQe
	YdZMHoSikU+0DLH7VszTtZ3HGfhOH2eqJxtJ8CJbTlXKeUy4THbHLMQRyD0iz8LuxMeAi0xZWX537
	B/0a0wlSW7uEa4c9sV73/meuVvEO0G7YPxa261T+c57qeEyZXCCzzNoGWUCr0y8r5Jfp5CxDwO3YZ
	u5LvZj2ZvoZ0TEok4U/psgL7o4ytlRW9Edy8NQ2ynWl4W1Gj4FT7CiFLcDXbMaoU/jTQYhonJAFDF
	pW9PioEV3ytMPWihtOu7u3pfHwLnbzLWevT7MREgevoJVvVGcrkrL10GXad4zebBtwIibNi1vvyXB
	sjTbaXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcg3j-0000000Azs5-17g1;
	Mon, 05 Jan 2026 08:35:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcg3i-0000000Azrz-0mqJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 08:35:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 539A66000A;
	Mon,  5 Jan 2026 08:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736E2C116D0;
	Mon,  5 Jan 2026 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767602125;
	bh=5BG9GD5tzxlgpo0fpFvXnFFO5JdVa3ur9v+uv3OzPOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dt7inGrujEUEquTjd6QkbLSE4dU3RYh+293qKlFjAt1qPVFoV9oIWSQ9+JLRQZM2T
	 /Y3PQ/ha0SknxemeMtJ+jZyMC4NJgGee5a4AqlFJKJ12zx3leoTQZjWMZra4gfpzXG
	 RJb3F38WsZ6YSQwePz0NzfiBwraz7UQehVUbzqUUlHyQR/tX0xSZ+IXiVqPMwvbcFQ
	 9tYLLbdhUXx4Sre7MtsOi3SmqTDOKykyedyTjuXBfNs0TOBjHoONfJrUdjrmrhfQZL
	 LVUnyXxM3w7Xwa1xRoo4vXr4nG5YiwY9he7OCXGMq7uPX1L+Mk/ig1w2Y7lC+cr3VY
	 tvgzPM6r4H75Q==
Date: Mon, 5 Jan 2026 09:35:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua.mayer@jm0.eu>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: netronix,ntxec: add reference to
 power-supply
Message-ID: <20260105-auspicious-swallow-of-prestige-3c13cb@quoll>
References: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
 <20260102-kobo-aura-battery-v1-1-501f2a8fa575@jm0.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260102-kobo-aura-battery-v1-1-501f2a8fa575@jm0.eu>
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

On Fri, Jan 02, 2026 at 07:00:30PM +0100, Josua Mayer wrote:
> The Netronix Embedded Controller supports monitoring of battery voltage.
> 
> Voltage monitoring functionality is self-contained and requires no
> supply- or battery-specific runtime configuration.
> 
> Battery design characteristics (e.g. voltage-min-design-microvolt) are
> useful for users to understand the charge level and are commonly
> provided by a separate battery node linked with monitored-battery
> property.

b4 diff '20260102-kobo-aura-battery-v1-1-501f2a8fa575@jm0.eu'
Breaking thread to remove parents of 20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu
---
Analyzing 6 messages in the thread
Could not find lower series to compare against.


Make it easier for us to review, not more difficult.

> 
> Add reference to power-supply.yaml so that power-supplies and
> monitored-battery properties become available.
> 
> Further drop reg property description and replace it with maxItems 1 as
> is common for i2c devices with single bus address.
> 
> Finally replace additionalProperties with unevaluatedProperties to
> allow properties from referenced schemas.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


