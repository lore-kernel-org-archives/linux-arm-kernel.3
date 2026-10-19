Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB85CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfIgP2F0UjnpfeyonWfYgy6p2kSRUt7R+KarqRZ8Z3g=; b=y62JorD7NfT1Isk9CzqN+gTQgi
	Iq4XvzSYioi3LVu2/kJBU7pv/qjnyWcaqX/2pq5dr0xKHSj9BxXZIhzqLuLe2WTT0XqCxfEAjm47q
	nmeaGVY1E5UcrSSUeitt0u2bY6tklny17A64+4pUrTopIpychQVGKR0Ry2PolnYAlAzkRbaxiHaT/
	luNQ6fbWntgEHSGtbMZDBUyVMknKg+vpDPIGf4hvxZBYgWsx27OqbI6DOxUJrhYb82QKIiHf31e7D
	PPz065lBG2IMQZtDQrrqaMEjHQ5n0csU/ngng3oZqFo2SsdJMiuiViglPNKAFDp8tV4E1EBTtEJDM
	PzJt/JPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvg-000000072yL-3x1a;
	Mon, 19 Oct 2026 09:45:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvf-000000072x4-1Vww;
	Mon, 19 Oct 2026 09:45:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80193601DB;
	Mon, 19 Oct 2026 09:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B961F000C6;
	Mon, 19 Oct 2026 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403114;
	bh=TfIgP2F0UjnpfeyonWfYgy6p2kSRUt7R+KarqRZ8Z3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pi8Az5UEDU724xgXcqeSPm5CHi2yKWAtm5vrkXCTezJYRKgoR704E3Ew66vkxS440
	 nEuRREEKz/FsjFE/mnZZP6Tf0OVl/VrJlO4M9aLm7fHC5Z23wUw5MqkKpvadmwet4R
	 FYqIyW0vdQX32ego0GtSqJXzC6ZtKjsKILh8hP2PhaAIM2tjUiqzdUbSyH34zKTVGw
	 UANh1+cg6c5692prADQGy0b1JckFIJbGwK+MRA2iNW/OnY3QHK1MhkuEacGKC9KCrM
	 VC6gsvPfmZV5WFLVMVr2U5OFN/ORiuAGkAuR9xuKkTBFSOzPHvm8tSd9DDSGKJwAhf
	 qU+K/vDP2C30A==
Date: Mon, 19 Oct 2026 11:45:11 +0200
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
Subject: Re: [PATCH 4/8] dt-bindings: serial: mediatek,uart: Add MT8163
Message-ID: <20261019-friendly-notorious-giraffe-dae2e9@quoll>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-4-f2462b2d2437@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-4-f2462b2d2437@protonmail.ch>
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

On Mon, Oct 19, 2026 at 01:40:00AM +0100, Ben Grisdale wrote:
> Add a compatible string for the UART controllers on the MediaTek MT8163
> SoC, which are compatible with the MT6577 UART.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


