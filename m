Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A097FC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e13hcDNI+tjK7ZYito3EK+F+gJpiQQy7yUGftOidPTo=; b=lmpEa1cFK1vhNmEOSswuQKgZ+F
	56JUKRmSO0Q/MhFdAONzlr8YTVL3QbJGIEUX3uJ7on24VSpJoJwpjP5GcseHBRMJicjrA2RESsUFU
	7bFBl1LYdGx+28IfNp64pxd6LsMek18U3zmDBz5N6eWIABkpaSL9qcalq4F/EEeilA4wFEwcYK4iJ
	RaAxjePkkIZllkEIoJRczZwLq8HfNl8YJL9jKgfoljswFvHUnX0BN0Gq8nzDUoZpkBhm8YsgDXwAp
	Jphu07y1LdfMIdITCKHbmK0NoIg0RPJAqC7VtPOClOUe4UrKf8vzHGMr444qkFT1vC4jUe7NGF8KC
	Wyw6uupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1isP-0000000ESqy-3Yzd;
	Wed, 02 Sep 2026 11:11:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1isN-0000000ESmk-0gVe;
	Wed, 02 Sep 2026 11:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=e13hcDNI+tjK7ZYito3EK+F+gJpiQQy7yUGftOidPTo=; b=H0QaVw5Qja/LxL3EoDTsZSAWu+
	DK9KFWSCKqQug6/BxhFEznFPH/fb8uU+FKbmdcmGIJI8l7KZxIVVAK9cnRtqjmT1StRVezLK4ows1
	ax/aQocKpxQzM0sEV5+ZW1RnbtyO4lylYn+Ot1lL1LQY/I4dktFtVXXuWMv/ScYt71xnXh+/+Wgyt
	NFxV2Wxct9H+/9xCIV/NoXgBsy3vRKRrSpitX1seuym0/ZoHxX3pLC/RpNUJgSnkOaTQFEwE2qtMl
	wFnO0cNlZeu84wAPHLH8uFgJSBSEKC9TghfFt8sA78yOqRwkC+svXiAi9OLpcoe6+w71YkDZOUcsz
	A6FYh+qQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	kernel@pengutronix.de,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cunhao Lu <1579567540@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD compatible
Date: Wed,  2 Sep 2026 13:11:12 +0200
Message-ID: <178834747221.2268650.16431820094445507549.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_AE1A1199FC8C9ADC680C6458134A46B40309@qq.com>
References: <tencent_AE1A1199FC8C9ADC680C6458134A46B40309@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_041131_205612_B2A1DB23 
X-CRM114-Status: GOOD (  11.66  )
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


On Thu, 30 Jul 2026 22:34:02 +0800, Cunhao Lu wrote:
> RK3588 integrates a Rockchip CAN-FD controller variant that is not
> fully compatible with RK3568v2. The RX FIFO count register field is
> encoded in bits 7:5 on RK3588, while RK3568v2 uses bits 6:4.
> 
> Add a dedicated rockchip,rk3588-canfd compatible to describe this
> variant. Do not use rockchip,rk3568v2-canfd as a fallback, because that
> would describe a register layout that does not match the hardware.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: rockchip: add CAN-FD nodes for RK3588
      commit: 685b81f8c717b0f7ec7219f35ead626758ef3aec
[4/4] arm64: dts: rockchip: Enable CAN controller on RK3588-Tiger-Haikou
      commit: 0fb792388d2d39e35b7b366f491f846a7ebd8630

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

