Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE76CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjOr4H9y7pf/UM8HUksqz0ra1NKogRSArAqzqL9fYis=; b=YysQZU+yglEfYkmEFdgHILoUJy
	EL4yzkfYGXqD60SqoOBzNQOoVKpqQ58dy+liBbWS0Cw9vUNi2EElw5zgmHtrmIgkhHd0rLxl1FORw
	Rr5oq6ubDzBpgcURkpzwC5RRXYPWN0xzDRJVWNUHOmRBvFB8rTQqUeAeo8vj3OkEKC8yuKhu+msbP
	3OptV3DIZ4M2inTiwOPuSAnAxAL1mdHHAePfmi9DEwTWoEXtomjk8w64/sX2DvyGXUID3S7YbIWOS
	Q/WHyFFQgjaXoWjWXa1IA/wFonAH4Ke6MI6C1N7RCeTHGSMG0TttpSXZuotesg9ZyUK1unrfuLrLO
	m1kfw8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjeL-00000005986-2MHc;
	Wed, 20 May 2026 16:20:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPje9-0000000594I-090s;
	Wed, 20 May 2026 16:19:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EF6B60018;
	Wed, 20 May 2026 16:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BF61F00893;
	Wed, 20 May 2026 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293988;
	bh=BjOr4H9y7pf/UM8HUksqz0ra1NKogRSArAqzqL9fYis=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cxLV5nGrw1AQwISieejxGEycRGrdpDKm1teSD/EoQtKlIE+wZvTHLp4LpwWlIe/Lz
	 S9v74BahBmqdRp6EpT3H9jnX10PzNRhC9KpGOlqllRCfXey92ZxYvtk6L/jlwFeJwE
	 cvv5rpSemoPawa/nVJNWLQ/DI+9XhiprdeHwsSjYmFBdpICqOcBPl5ZJZC7hTKpyTo
	 7fwqU/ji1NIv8/Dmyp63dog0fSJP03WOySxI6WRvHP2nhIJtbUNeH++yKZ8yaWUIYm
	 fhYjDYpNheEmIE9tWUvdsQOYmjvYttl3yCXnYQEP7vziAeEGikkOZS4qlirzd2IGQ/
	 2HXt1zaJnSc+A==
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260514091520.2718987-2-wenst@chromium.org>
References: <20260514091520.2718987-2-wenst@chromium.org>
Subject: Re: (subset) [PATCH v4 1/6] mfd: dt-bindings: mt6397: Add
 regulator supplies
Message-Id: <177929398525.2887671.6192290013124869675.b4-ty@b4>
Date: Wed, 20 May 2026 17:19:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Thu, 14 May 2026 17:15:14 +0800, Chen-Yu Tsai wrote:
> On the MT6397 family each buck regulator has a separate supply. LDOs are
> split into various groups with independent supplies. There is also a
> supply for the regulator control logic.
> 
> Add descriptions for all of the supplies for the MT6359.
> 
> 
> [...]

Applied, thanks!

[1/6] mfd: dt-bindings: mt6397: Add regulator supplies
      commit: 4e01a05330d4366924e622467a6654d69a6555ec

--
Lee Jones [李琼斯]


