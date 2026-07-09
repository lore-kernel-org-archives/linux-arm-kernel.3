Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA09C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/M83H4/jN/N0EzWc13PFnwEGauG0PFNjZUcyRXiXXc=; b=QXVArG7Uni0mCe5z5SkgCGmJfU
	uIlTMOd72TsbOknNd+V3MG/jXjy5EIu5o6pnFmhDSITw5NQPMi5Pmc8DlBj04mpGmrVKniBwGWis1
	9qyu3xqhXtkHM2ImMvU5YsLdhn5gQKVJgO4Z2McHiTcxVQspNQ1ZYN/dKVYrQIooLqiquIVamPAgb
	Zr8mNIwsEWopqDTxVTJd5KBqibTGu29qBMZgbIgRFLpHCNoKXQZSi2tYGA16K2NYmKMCQpBM8R4ip
	paaUg8HalToQ0hFH5puiI/nfL6fD0UrCjHfbjah/JHM6AqGOmQ0OKpzjPYZKw1AhzTRb6fLLE1lJe
	tMfqDnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu2f-00000003OF5-18R9;
	Thu, 09 Jul 2026 19:04:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu2Y-00000003OCp-2C3l;
	Thu, 09 Jul 2026 19:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0/M83H4/jN/N0EzWc13PFnwEGauG0PFNjZUcyRXiXXc=; b=qRCPB7nMzZWdNulYo7gyk4jSM+
	91NPVKvaMGwE/8hcbL2c0F9+hTLNXVnTg76G7QweVkEMTYDpTJ4kwYIEN9zJ7pvkn5ivZ2MnEEz+q
	7b0qXx3P7mtpKcjd4ZaIMPgDBvxDrNC2eYZyDprkKrdXv3oN1g0sf8LsyGufRnnbJrA9pvQBNj7a1
	3crPkDqFwvysPFX35SZxKBDpaqIk+fz411HlOAPVCRV6yfTgwlmplaLeR+RbqcDMyPEyJZIRZMz4Q
	ACNojsu0AOGvx6bJBEPvFOo0ckl1w7P/yWbDe0xk+ogKwbF/GaoPhmnwVoQi5p+Vp6pwj/utZ/MCH
	x2eoVLog==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whu1B-00000009TMy-2evy;
	Thu, 09 Jul 2026 19:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=zAIpPhnBqJTD75ki7fc8mqrG+OsdwFQx0MWSBhIwC28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ELam322a6jPqmycCmg5uLQxLpIGe+qschMJgTv66UWWusil457l1sQGNe3Bv22Lnj
	 4hKcWsOdfeveiW9GXgDt7MsGszCc2Mz2zTQOLUHLtTN3qlXe5kTM2SENYMumsjmkfq
	 ebN+V6MArocX7YTabVj+Ss9SeLT5Hv0FZfkjrL7j1IXulOva6vyopB70iD+OerAFbK
	 1g5us25stgYVP1ZjLqnYb97U27lafUWy9CmaNU8IQdbJ/FKXW7VV0tW031M5L8k19z
	 +vdYvwQtrjr1emOnEAF7MqXe6CNCGIj+RrYXNct3qcfPZ6G7b1jKVINV0LaDjHyvqq
	 x64ZHzdMX4GBw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E2D8C17E1078;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C99DB48006D; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:49 +0200
Subject: [PATCH v11 26/36] phy: rockchip: usbdp: Avoid xHCI SErrors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-26-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=zAIpPhnBqJTD75ki7fc8mqrG+OsdwFQx0MWSBhIwC28=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EUsqxDjyRpYmP/KrlICmmaxYzsBb1exY
 RFPTxNl4Yyol4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qa1WkP/0GrRF7v/bnHHnjREPF92AFSWya2wTPYzjOYPZ74aYdJjnjGxizciFrIB8atC/BKotR
 NKZQ/WSWTbns+caQ43FJqJ3dmtp66jy9wo/WRQ98Oj5FWX3l0CSdBCpvEYpmLQJxZtHDrOnpwRi
 MTLyqD8nE/fA3Epsz682SFWYXmjmpgrzySWoXyY3kiQhzpJ2eztQCu9NbAyiwRTf9gGd+IDLakC
 Z3Ip6tlXD3YiVa1WSC2dK7JN10a5avyseQBl/P/6ZQSVMrdgWEkoF4g/3efi2MCozPK2TkRlISM
 olthzv7MGlgPh9wR7CYmMlnAsr+TKwV45FZS/qSlB/582KzkuCcNKSgsu3uP81DlBSjIWVp2xUq
 NSKxrfLQi4wW8UL8TFVTHm70bl/pP03UfEUrRKwf0JSs9KkfbRUBc/Ern4kvg6np8wFQ4aeorhq
 LSErqdSpz7e4SEnfT6pUYs/qmd0wOiDcU7y9LH/0T3Y3jHae8CY7YTSilFs9JmH5ZsJgg8/EV1X
 NNQ6wDVJeV6+VbdrjGvKbmOWuvUJtutFYgEWtZT0j9FHO8EHhKTzMn6r7CQH1/BymZWEVVv/KRO
 d2Vkmba5qwrz0livLMVWRJSiB5D/5TSMRKrEv/ZEAXhscdZFGroa+uSlvjJxF8ddyVqh13libZg
 fIsEVP3JoVpgcX+n5hfMt9g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_200241_825339_9434820C 
X-CRM114-Status: GOOD (  15.58  )
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

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers.

When switching between USB3-only, USB3 + DP and DP-only mode, the
PHY must be re-initialized resulting in a short period of the PHY
being disabled. If the DWC3 driver decides to access the xHCI at
this point the system will fail with an SError.

This patch avoids the problems by disabling the USB3 port before
re-initializing it. This does a couple of things:

- forces phystatus to 0 from GRF (not from PHY)
- switches PIPE clock source from PHY to UTMI (safe fallback clock)
- num_u3_port=0

The last part will be ignored, as DWC3 already probed, but the
clock re-routing will avoid the SError. There is a small delay
afterwards to make sure the mux happened. The datasheet gives
no hints how long it takes, so delay time is a guess.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index edee27933d89..9e77513643a3 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,8 +1000,8 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)

-- 
2.53.0


