Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAAECCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JplmjhIjd3VhaXGa0kbTCPiPnPU64Mu+Urlcbp2lmg=; b=QTcGBIraWGNzrmKX5yH5yPAf4M
	zvDGZkJz1vK+EgNS+DtpuD5veUp7d2D/k96txKHuaZWLjmwHLItjC6hxqLZtXaMpqSYEdT7bo9iVr
	+KFIbwZUT2nQo/QsfQTtnc4azvWYlSijKo8mBPRh7ez8AJS1RFQ3gVlEmrw/b+eBnNZBf840v6W1V
	kMCW1+5enWJPhCOPl/S/pTLoSzhnoVsi2tBios+43clupxT8u3E2H86XC2WPnZ0nkjiYa/H+eZsja
	xIah84OQGb+yeMUSatMUJHljHRR5u6y9ln+UHVawdwiYu9RJtEmPBMTI2YboQ7qHBfJ18BVQU55Uj
	JuOyNAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjw9-000000073Fs-1M4s;
	Mon, 19 Oct 2026 09:45:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjw7-000000073Et-2Efh;
	Mon, 19 Oct 2026 09:45:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1473600CB;
	Mon, 19 Oct 2026 09:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0461F000C4;
	Mon, 19 Oct 2026 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403142;
	bh=/JplmjhIjd3VhaXGa0kbTCPiPnPU64Mu+Urlcbp2lmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fXzDXaC8MLvjws1UhdHOLd9MpZPZfvPuFMwvo3Du8hyssAdRFH4fXcdPY6LLws6v6
	 bC0lhOLO0t00cB9o7w6DsUfNg2MHERYEMOyPeCX8ZSREO6peI2ICcUW7Iac277Ol1Z
	 r8LrzZaxWrrDUquZQwcDBbQ1+JbrwDllV8yQSCVGgQUjLjJaCzc3fAPFHXduQdN6RI
	 8mLtC50KT3tsPxYmJHl0AdLCf14kpjfHHlh93uzj8hB52Cu45wQdh/ZS0mZc+8VlUH
	 0RFJEZXhiE1zWafj6nmFPOc8T/e4fbTfo7AlruD/BUCoR6oHUgZoVqd2wAniO/Bbe7
	 IbsvU3urNalbg==
Date: Mon, 19 Oct 2026 11:45:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: watchdog: mediatek,mtk-wdt: Add MT8163
Message-ID: <20261019-amazing-cerulean-avocet-e5bcae@quoll>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-5-f2462b2d2437@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-5-f2462b2d2437@protonmail.ch>
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

On Mon, Oct 19, 2026 at 01:40:01AM +0100, Ben Grisdale wrote:
> Add a compatible string for the Top Reset Generation Unit (TOPRGU) and
> watchdog timer on the MediaTek MT8163 SoC, along with a header defining
> the reset IDs it provides.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> ---
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml        |  1 +
>  include/dt-bindings/reset/mediatek,mt8163-wdt.h    | 23 ++++++++++++++++++++++
>  2 files changed, 24 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


