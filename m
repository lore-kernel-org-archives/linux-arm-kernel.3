Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFB4D5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nC4fgPYS6/bFKTSWXMYtOK21V9EtzszA0WUGBlglaM=; b=dtOkY0ii+5rAimOxWD9TJCioWL
	pT0sHN7OjroFhq51Yp/rtetzCuHLFlcNQcQaSbyelpqydKMAhRoe+STPkng4A+SZeKo3iX+d3JD7v
	9XUQqEGqbcuH2StlN9QIVqIEXVw9oeB/fp9BaCJPuUqWoFMoVgyuuTXMp8qL2HXjUcEIV3oFcy+l1
	sDcaSn+XWUg4OeibqQsz8eEQKe6uXk/WkXvBLNGsollxv/huesRWfFBekaJLFFJScKFY3/gFd346P
	xC2Nrrpk7Dfa4uugKMisN5+O0y1jO5TCNfY1x9UC6BkuK82YVYHLKbsy4u7uRiuL6j++m/K8KktRt
	Y8AwYAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Wky-0000000CGK4-0BpD;
	Mon, 28 Oct 2024 20:54:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WIw-0000000C9GD-0xVo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:25:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FDA35C5D72;
	Mon, 28 Oct 2024 20:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6FACC4AF0F;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147129;
	bh=jxQx/kC5pg0vkeAlqNxn4N25veg7t15SHzEfOOwKjGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uo7E3LzbY+3bzk8/RMso1OTbJVUsc4rOAtaC+Edpm+2ftPU3S0NTe6AnA5pHxzM3D
	 xkdmfmbQ6vg99SUkcfJliTLm6GhYyrfNRhiUWKyd4YVhRWEVLgWbuJICyO0FZEGCu3
	 ibPMZe62+IrcPG8g5PUUmR1qoCq9mLEUsnF6monhHZq0OMskzJeIzrd34qMKnS25HJ
	 8gPvO1xYb2X4yyA8rj+QQ6hICH0g84ozexvwuCWWe46YUvDYM0XZhoBQCEsAslMUD7
	 tSAMN5qKpS3LfI4NrSuAXsfiHsJx7rpZhVHADUzn9aaUt3UJz7/DQ6TxbdzgTAgz8b
	 N37SIJQIvYM8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A58D5B14E;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 28 Oct 2024 21:24:57 +0100
Subject: [PATCH v4 15/16] MAINTAINERS: Add Jan Petrous as the NXP S32G/R
 DWMAC driver maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-upstream_s32cc_gmac-v4-15-03618f10e3e2@oss.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=872;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=VB/vrGkvv7jvc00z/vbTqiGVarHa+aZl+nYsucQdPaA=;
 b=bn7ewx0FKW2MErkpm0xYudN3oWv+jr9Xuygt0x2WfE6hXuiQu0ZgDPmA+22ZPkycgzAP1pLI/
 dy9T9aaM1eICPVc+Z/UefbcOkZitkFT9+M0G4OQBd2LAniBQwYI+Mfo
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132534_583254_9AFBF9C2 
X-CRM114-Status: UNSURE (   9.51  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Add myself as NXP S32G/R DWMAC Ethernet driver maintainer.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ad507f49324..9cc074f7ca7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2803,6 +2803,13 @@ S:	Maintained
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
 
+ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
+M:	Jan Petrous <jan.petrous@oss.nxp.com>
+L:	NXP S32 Linux Team <s32@nxp.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.46.0



