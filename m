Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474C8FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iREvix3JcsTfQWQTKWPlT4HwL/HpIqdr7S6OUO9s+6o=; b=AfHhDEA7R4bvcQwmhh9X77PwjA
	NNKLC4+NWt+WuW5XWGonK6D8udl3xaCneUcHSP/EolP0SJKEKOqpjzAJHRMt8z0qfzct9uxeBr5uI
	zodiG4i/AtN+vFtSVlwol27jBvGYrUbbi+RLmGG0+w/nCereCaRasWmCAJj61McpRyTDKvdP704gk
	rfofw0urU2eTW+zyWb7LFuVvbRGoKbsPArtfX9kA3LRECMOq8x2AgdEZFyj7ZxIPiMOT03yKBs1qR
	5Wj+tkhdFeFltIbgyZxTOhvpIVnDQ43kpimlCFkgEa90p/dreOUqVrJWHp6Q68lDZino38wB6aTZx
	XNJ89NOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKzs-0000000Gt5z-322P;
	Mon, 27 Apr 2026 12:23:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKzq-0000000Gt4d-1kCR;
	Mon, 27 Apr 2026 12:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=iREvix3JcsTfQWQTKWPlT4HwL/HpIqdr7S6OUO9s+6o=; b=zGl6EttV+9ZMroLhwiCaM58v4J
	KpJoVaGbRlLp6A2HR1Yy3GKSDmOuKUH87Jm4g3pbBhpVsnNI3OCTzbsabIxNlm+0eqcWHzXiGsEiL
	RrRl8T1JRNGGr+9qoW5jI+ogY4x7KfIJYOg73Ymu8iFM6Vxhj+o8ZzNhJG2PcdFMYQxMqPQUG9qpS
	jQaR0oHlua4tlbPhhZowwr4adxXrR0fICK7qGH9A43jn8xv/utjy8M5Fqcf1Swluma6KdlNrURhMB
	mvvi4C15FLT/I3Wy1tBkqtMkry0P0G7ZLVhsyqrEguF+7vnontteZcwyBYdbSNmFTzPnFiIDlf6Jq
	rJYuo0ZA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH] ARM: dts: rockchip: Remove invalid properies from rk3288-veyron-analog-audio
Date: Mon, 27 Apr 2026 14:23:18 +0200
Message-ID: <177729258232.1866089.9184760635267258389.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260404195008.1951910-1-festevam@gmail.com>
References: <20260404195008.1951910-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_052330_452763_542E9E18 
X-CRM114-Status: UNSURE (   8.70  )
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


On Sat, 04 Apr 2026 16:50:08 -0300, Fabio Estevam wrote:
> The 'rockchip,mic-det-gpios' property is not documented anywhere.
> 
> The 'rockchip,hp-det-gpios' property is not a valid property for the
> 'rockchip,rockchip-audio-max98090' compatible.
> 
> Remove both invalid properties.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: rockchip: Remove invalid properies from rk3288-veyron-analog-audio
      commit: 44a024778eeba377d7ac882d15e27ba784e0f647

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

