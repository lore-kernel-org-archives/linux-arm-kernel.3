Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A8DCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bZGnPlTMpQZXOQnGvu5jFaSq6gkq1eV4ibzrQOHzFss=; b=njsI8A67E/rQxoK9e+QMmYD+1V
	FtQcMdn6QubEqMiKKyZGAhL1axJgJu+34fwZtcscXkFVCtJuZtgXSGnj4HnM4iOkfiWEDlHm90x/t
	SaCP8qZy8qv9fy4IBOfqZV4i3JCI2rk79nsH7K2jVZCAt2F5zYkDwRpdZ7STJtbKI6jpOxuYldvRZ
	LRmqxOI5JCyeyT83ynhLcXomhVriWiBbtmexek1vhqoICWPpy+0SztNQcX9TXVv7x/8cSkiGmhSJM
	y/JiLC1qceCxrMw0srSxGT6f0VOHl93fDso5OY1OPMJNf1mz9h2pbOakHr2hmdlb1jbI+qh2rcW2s
	hJigwgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBjv-00000000hee-15bk;
	Mon, 28 Sep 2026 13:49:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBjt-00000000heR-2N6a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 081BB60052;
	Mon, 28 Sep 2026 13:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A84D2C2BCB3;
	Mon, 28 Sep 2026 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790603392;
	bh=6c3Ov9/W6SQNfFxGr+9p4dhjPVm+YEtqa/HcaGKCd5Y=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=O7ouKAB4YSDZ1dhd+C0+8bIkqBdnj1b0IyKgQC0eEtB9IpJ66VmvDHNC0OprXfPad
	 Zc3bRNOcWpaI5CpvINTTgRDB9bb2Dzm4v/9uIoGVWAQ1WzoFlzH6f7mHWudqwdrHQh
	 5Mkavg+jWN7LU9DVp2JItpi7CVqbyko3rcf/qNVWpz8U3RQhueU33ix56Gn9j4BISD
	 vjUo4rCFSk/fZSzfLKJUvA1OcfEgAqOkZgNQEssEgOSPWd6U9ASBy08WyaRSWdJDHG
	 eDVwdws6QHcmL6tNsJLVRBxCqEejDnDwaABqWKNXicTrAP+M6g/kfyxxmZ2ItVYCIF
	 4FqD9KSi+oZ1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91780C9833F;
	Mon, 28 Sep 2026 13:49:52 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 28 Sep 2026 15:49:49 +0200
Subject: [PATCH] arm64: dts: lx2160a: set #pinctrl-cells on the pinmux node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-for-upstream-lx2160a-pinctrl-cells-v1-1-4faa8a341cdd@free.fr>
X-B4-Tracking: v=1; b=H4sIAHxwumoC/x3NwQrCMAyA4VcZORtoMzY7X0U81JppoHYlmTIYe
 3eLx+/y/zsYq7DBpdtB+SsmS2nwpw7SK5YnozyagRyNbqKA86L4qbYqxzfmjfzoIlYpadWMiXM
 2PNM09L0PdA8DtFBVnmX7T6634/gBemrjAXQAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790603391; l=1124;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=F0blJHgPfcv2wZhfmtzs3uZ/BwHnx9s7GUCpxGKKE58=;
 b=irunWbeaCOH99oscPjVx+F1HEvnbOdO2seB4xYU9BDCB3RpM5+MKE0iparZordCaXVEHrSPhv
 6zGF3LvVep2Bpkr1OqmwgSdKeL9pdVIwYWpV8D1vQJ/p3nUBcRWYG5M
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

Currently, we have this message at boot time:
  pinctrl-single 70010012c.pinmux: please update dts to use #pinctrl-cells = <2>

Let's declare it in the DT instead, the value is the one the
driver already uses, so nothing else changes.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
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
base-commit: bf184a29ad1b33bd8922029eb0ca3f2866007258
change-id: 20260928-for-upstream-lx2160a-pinctrl-cells-729533182b85

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



