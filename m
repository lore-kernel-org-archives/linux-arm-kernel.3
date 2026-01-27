Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37195D2FEF4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 23:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QJjdyYj/0KyvudCgcI0wEf2DuygZZAU2HNHAk3ZfA6I=; b=I2O0xq0xenI0Hr79vmFqXThu0C
	S7kOWLqVp7bCNtvFM/cc2+AFIJeyL1gCe2ReS3ueXm+UcA51HNl0qnu/MXYYbBqUkmxFOQZmk0ylB
	zQpWVze11wi5PRo73u994eOpsxWLIrv2GzPBATbmZG+rWtmsPEwKjEtiB0xNzWKvICqz7p49u/aa8
	J82ZiLdjE+pCC9Zq6f5ThA62OObD6j1pY6Hl9l7LEyXCIeQtS95dIl5y+d86CCWTK9xf5XWZYzvLO
	ChcNzRu8DhAn91j53OiJT+JYnaSEv1jNv9WWieyd4Bx69eQnY+ZPygEPeT8bm4ox3YNoJ7CjsDhq6
	GXRrQjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksUV-0000000FAKF-4BUp;
	Tue, 27 Jan 2026 23:29:00 +0000
Received: from ms.puri.sm ([2a01:4f9:c012:9260::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksUT-0000000FAIg-367u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 23:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1769556532; bh=nB5itl0OfsAcMlRRjvhiZa0Vpr0lRGlYy2oe6AKphVE=;
	h=From:Date:Subject:To:Cc;
	b=QFigpDm3M/HXbeVuJlEFZYhGpfUfL4MQrYI5JY6AxkEl+yliw1XHgziURM54N02MW
	 Azd3benz7gvhuACUuJj8fO6DE347VRQwNHn2LHT9tmyEoCwKvF/Xb/3kow2mKPVZeK
	 HinfDqYIYc594uaa/GXaF951mSIw/mhMelwfNTRhHXGCNp7W73LqOnCoQuWgpAQera
	 DjgOeQFP0dA6aF2SSXoNrYsv7BVJCt80BWZKD4o12Mi4z0K61rIjedtLvRuE6J7lRw
	 YNn3slOg/tn5I8lVeF4+Ca6rEMOUqFq5aOe3fU+/BdZC0F29eTjq5tECt4sLtHuGzJ
	 iV+4DtJ7bMqOg==
Received: from pliszka.localdomain (79.184.64.12.ipv4.supernova.orange.pl [79.184.64.12])
	by ms.puri.sm (Postfix) with ESMTPSA id 1C00F1FA50;
	Tue, 27 Jan 2026 15:28:50 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Wed, 28 Jan 2026 00:28:28 +0100
Subject: [PATCH v2] arm64: dts: imx8mq: Set the correct gpu_ahb clock
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mq-gpu-ahb-clock-v2-1-f32548d46188@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4V07Sit8nLlfxgWba10Ii3YAYIh/
 LuFuDR3dZL7WhiZgIbYNVlYMBMSdj6COCRMW+kbA/iIzEQq8pSnGaCbS/eGph9BWgW67fQL+Ll
 SstKykrlmMdoH88R5r73XkZUkAypIr+1W1qIf6eQkDSZsdos0dOGzn5j4Fvrticv/vYlDFNfCF
 LrMClXc+jHgkRyr13X9Asisg/TVAAAA
X-Change-ID: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Frank Li <Frank.Li@nxp.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=nB5itl0OfsAcMlRRjvhiZa0Vpr0lRGlYy2oe6AKphVE=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpeUoyEZCFYMXUwUaX5gfjPGTC/JuN9qZhu2+65
 pdy4BmhMaGJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaXlKMgAKCRDo8jXPO9vD
 /wG1D/0WomytfwAtHknFNpGvPysCpyApzfcnmCaY8ZJ8/b1Q0vuwi5TnXOZdm9ycpSkKEIiMnNO
 zmlOOXSS0ux0UzaZEZ3R1nEM21uEARQlw4xP2R/6P4H32ZJhMPumYGpuV1cdXzcHhsGAeVJZMhY
 NHnks19P0Y3ha1RRLIp9aE2I61x017aQAN2K8xRyLx6bvDSKsgITEJvDxo7nkdwfYH16KkDcpQU
 cuUEHeoXSPXoSz+wo19f92ApjReZfgZESTiyc325cuFzhm8C2/tHu+y7yePYVGpQvnNJuxKQ8rl
 i2YncQp+VFI/Wd0K1xSWrwISmQBLi2LVRqLdT4Uy0yYgJUq5P8dNN9awpzgLq4ICNF1SfLg8W9a
 292ZeqKhoWFH19xCIrx0bkyVRCYjy9N0f0srsL8GAvx6z/8WzTqKF1LIuaIaNgmd/nxCcnlRthk
 EubUq0NG28LmT6GxHRpcwH94jHHdZ+piTBJLzpiPBvnkzfZTZ9IYqn87Go5i46GDPCQHlKFoY8T
 +UdGwtPO8h6SPcGfbbKXEVY0UBZfzLi6OtYYYUfr/bz2PnhkizXEe6t+Nj/MV5NBVSn8JhQVra1
 7Ze+jafmKiwNq3AZt1r2kPCUlBjRwboumQOcayFcC67TqEy2yxaZadMt44qebUce4iYBCraXrvD
 qZj6QAXh8n87cTg==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_152857_946525_B3903E97 
X-CRM114-Status: UNSURE (   9.99  )
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

According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
frequency is 400MHz.

Fixes: 45d2c84eb3a2 ("arm64: dts: imx8mq: add GPU node")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Changes in v2:
- added Fixes trailer as suggested by Fabio Estevam
- Link to v1: https://lore.kernel.org/r/20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 607962f807be..6a25e219832c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1632,7 +1632,7 @@ gpu: gpu@38000000 {
 			                         <&clk IMX8MQ_GPU_PLL_OUT>,
 			                         <&clk IMX8MQ_GPU_PLL>;
 			assigned-clock-rates = <800000000>, <800000000>,
-			                       <800000000>, <800000000>, <0>;
+			                       <800000000>, <400000000>, <0>;
 			power-domains = <&pgc_gpu>;
 		};
 

---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>


