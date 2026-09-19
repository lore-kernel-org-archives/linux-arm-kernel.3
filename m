Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49523C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 06:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqoS7CtS7otHvpEEWAssDTS0dRw8VkTZHsiNyXGmz9Q=; b=Qy5XxYUTi1k3+2UoNM4N31DnFp
	NwklRij2kGTR+1QUglzrjwtgdKw35zc4NKbFnGHTojPUfQXbqHkQ3E7k65xtqvVHLvzvbG7NeU49t
	6GQeZs3tfIK0d7CgcTBHtW0HidTqel+kzkUVH2yrvgkblNWMXR3S8YMaMDG6ZdOAnvvTrp7lu9Y1Q
	WE3dUGQw8evY1HGIaroFJwNawgQj1MxewRc9vBu98KTonhrK4LnznyPC6eYWkCCuVBP5VROHa/lX0
	QJoFWadEkl61CeZkvH+yfIEo/vtZWLtEryDyDq6E6/oMUZ43rwyfr52K5g2cCv1mTIqLVGb936e5G
	Zg5rTGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7oyF-0000000G0ZL-0Ea1;
	Sat, 19 Sep 2026 06:54:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7oyC-0000000G0Tm-0bun;
	Sat, 19 Sep 2026 06:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2E32447E5;
	Sat, 19 Sep 2026 06:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7848BC4AF0E;
	Sat, 19 Sep 2026 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789800882;
	bh=4TErQuEjK4dnoTXRokWBIC4tz/jwVFRAFjVLyycjBCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IpCLTOKw8AL4mRHEOeZTvtzpsDZP9rsod/xWvzi6oQ1+fnafC5o04R53ulda2SLq1
	 uBjkP4gs+6FyDev2gvDIYCWdQgoOmN7paCGL6Ha5Z3YrrBZADBB3R46V1ZmraNO5Cz
	 6XjLYxhGyF0FaTk4OLhCP29C1I177rK5NMApfwqIGerewqMuJVVjypiIuHPzFiOSIk
	 xKDBgVcNl5fx7xAaDsBDJd4MD0CeBT45IQHu1EKJNQ7ZZVY4VNzKb4VcSJwn+Zky+F
	 tGEYFUsDhC7eolMfXWf80yFEvtRavhNemVdJ41D+4bSOKW2IGaygSCkr9PU4z9Me+C
	 RE2zj4ic3yBJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634FCC982E1;
	Sat, 19 Sep 2026 06:54:42 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sat, 19 Sep 2026 08:54:37 +0200
Subject: [PATCH RFC v3 09/12] arm64: dts: s32g: Add SCMI reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-s32g_serdes-v3-9-9d68868c1e89@oss.nxp.com>
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
In-Reply-To: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
 Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789800879; l=1526;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=s7buOZdDvodKw7Hq43O6GmpzZ0pqHm5HLVNx4kLjU1Q=;
 b=UKoL7keU5f8uRgheEtd9Ox/5Gs7CzetGT2D3vJQ2AR2FYlGInxWjJh0Y/JoIJzY2VmneeHylO
 /4trx+wVwMoCfCuRY6oJj2e7JzCffJCDPKfpcMr1ohHIKB8IHg8Xg4u
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
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

Add the SCMI reset domain protocol (protocol@16) node under the SCMI
firmware node for both S32G2 and S32G3, so that on-SoC controllers can
request resets through the SCMI reset controller.

The node is labelled scmi_reset rather than reset: a label that
generic in a SoC .dtsi invites collisions and reads poorly at the use
sites, and the sibling clock protocol node already uses the shortened
clks form.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 996494e34593..6a2774d53747 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -100,6 +100,11 @@ clks: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
 			};
+
+			scmi_reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
 		};
 
 		psci {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 31f7aad00b76..da3915b7e915 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -139,6 +139,11 @@ clks: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
 			};
+
+			scmi_reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
 		};
 
 		psci: psci {

-- 
2.55.0



