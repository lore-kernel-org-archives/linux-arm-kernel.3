Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B086CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 21:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+iGvRCyA37i6FeCjp03nx9FENBP3HHrZKK42V4lEkEU=; b=QgaEq7niw+/JVm/cAjbb8Vc/cy
	8pF0NkcYspBjN3Btvn77/lfSbWMQW18LttT+3bcc25SW3rbk1kb6skBVhWzf1yyWcMSMZO7ssckio
	H0QYRKuB6D5FfneAYbj4Q+1qmHsyXBySEEqBsgGird9yeZNEOUUT3uCehYtgqNd00xcTpND9GxtVA
	AFwZCeVWbQW24dwlngMHY2D0B+W2PvP0E5KqpH6KxSlkuOxKrPBeD/ajXfEWRPsSiB8JBjlW52Mq8
	7Y1WEpyO982gubGJauPN90hliCdAakuzQL7PRq8Lv+zrRoCIL7IDwij6ow/3qxtiwjUqate4j3KNG
	5d+02nWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIaQ-00000001eYq-3I7W;
	Mon, 28 Sep 2026 21:08:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIaP-00000001eYk-1xff
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 21:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC8D543586;
	Mon, 28 Sep 2026 21:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C41FCC2BCB3;
	Mon, 28 Sep 2026 21:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790629712;
	bh=ubCLZOqyKtAsDaeaTiwxQToK3l52AquCJw2Wy54Kq+w=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=scFcWAFPzVwlgk6Mfuy4dGt/T10sb3XTyF8CZvofpLpfICykWRUzpp5Nv0QPzvo5d
	 2spSQHugSGLmjwWgUQsmrDnYCrkJiDPEYY2/oZTRMrGaQeLYWEV+22AvFUnL5X3hHj
	 H2/xU+ojjPIcLxRjonDJN7A8Sh0xmSlEnEVdfgQ8rlk/rnt1KQLUbcdyRy29ZItgmh
	 g6ikvlvyMCTA9y2IWYXcn+UTg5wkYrqm0WmraLOuqQgD9UUQk6F8tIX3jcNeZm8d0K
	 SZkNDbvYk0zhz8w5TzvODjbo+7BtKL+zFUtEDyqQ7YIPl3KeOVOMG0FjWZweuT6iZZ
	 /CWyG53GgaK7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E792CA5FA1;
	Mon, 28 Sep 2026 21:08:32 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 28 Sep 2026 23:08:28 +0200
Subject: [PATCH v2] arm64: dts: lx2160a: set #pinctrl-cells on the pinmux
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-for-upstream-lx2160a-pinctrl-cells-v2-1-1227b2e897d3@free.fr>
X-B4-Tracking: v=1; b=H4sIAEvXumoC/5WNSw6CMBBAr0K6dgwdPhZX3sOwqGUqk1QgUyQYw
 t2t3MDle4v3NhVJmKK6ZpsSWjjyOCTAU6Zcb4cnAXeJFeZY5w0a8KPAe4qzkH1BWFHXuYWJBzd
 LAEchRLhgUxWFNvgwlUqhScjzekzubeKe4zzK53gu+mf/yi8aNJTeWmOLUruuu3khOntR7b7vX
 ySey0bSAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629711; l=1258;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=MLG+A3X72Uzk7Ufcvox/+HKIq9Wjjn1mtqOgeCdt28M=;
 b=Kg5Dd4el+o3eMbJo2GVlTwYzVEDdR0ZdS9fQGXKBUZ0xTpYc1C8lDtrgVM07nHcjhgFnBKUlJ
 +PQXpdJPPEPCf6JomddSRVqbGzuQO4hkdwxruh1kqSVsU6J4+eG2jIl
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

The below message shows at boot time:
  pinctrl-single 70010012c.pinmux: please update dts to use #pinctrl-cells = <2>

Add missing #pinctrl-cells = <2> to fix it.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v2:
- Reword the commit message (thanks Frank Li)
- Rebased on imx/for-next
- Link to v1: https://lore.kernel.org/r/20260928-for-upstream-lx2160a-pinctrl-cells-v1-1-4faa8a341cdd@free.fr
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index bccf2d673023..2085362ab0ea 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1536,6 +1536,7 @@ pinmux_i2crv: pinmux@70010012c {
 			reg = <0x00000007 0x0010012c 0x0 0xc>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			#pinctrl-cells = <2>;
 			pinctrl-single,bit-per-mux;
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x7>;

---
base-commit: 5d034f17b24642b2a764c0e3a68b4c6937c9ba75
change-id: 20260928-for-upstream-lx2160a-pinctrl-cells-729533182b85

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



