Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F15C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPDc/x8gaJW0c5aULIZGHIxcxrtJnNo/YxUmTq1g6fk=; b=xybYIFcA6xF/SiixlW4dpW5ABz
	AQ66tliKPAWJABooSPlSux7mCodwo80cccBcVvr++S91WCv+RwoqnBbNKYbi2e/QnH7ec/vXKMuEU
	0gULFiXyRyXai5QO35HDNstgvj+twCB9IoaIAJvDVfWyrkWnqfoONDLLx1XSNHHMetZeyYKJRan+x
	9BrpU1yDmxViqoti9XoynwmuSUmWYyZl6LZ9M5+5bWEfVMmsAUSuvElokKkJ+vg6qnb/e373hrcC/
	7ujab8rO4or+TvhySK7E05x5HRXaklLDFV2EqK0jmr5h4CFpqXzy2XBbXQPWXB6pitnaC3M6w704J
	JuUqX+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUTQ-0000000Gfac-16Y9;
	Mon, 24 Aug 2026 13:12:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUTK-0000000GfZe-29QD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15A8E43BF3;
	Mon, 24 Aug 2026 13:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E396EC2BCF7;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787577138;
	bh=aLPrKh54Wlnah4cvi9tYM9DMTZkazBiSOSAV5SDrO3o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PK6Y7xs9PAWTTHFZ1ropQWLu+ifwdHwiU8nUk9O7jgFGZ5gh2itx0GmqxS4sn2HSf
	 RmRJ2To34w5eLv6bNhqMp8ghlmVVg5WperuKYsYR6w5sp7OdHHH+UmYZADH7KsDfOz
	 KFUylocHTGGtwQNs2fYoymsDok3nYqbfGu5jS+kUxSKPfRy/g0REOJ3GtQs8gtY+31
	 d4JNDm6M9K9PP1LwPqy2f3IYxr10PEK277lvGD+w4jWEZzpxgEftqsx6yz0UmZPwLJ
	 ClJgG6dMPS9oATHvz/JrFP4egZgvNqq0x9AuRin27K/qIghGipn4KA9nw5LtC3kfri
	 iIykgDN7Usbew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE254C5DF81;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 15:12:02 +0200
Subject: [PATCH v2 2/3] arm64: dts: lx2160a: fix IIC1 pinmux submask
 rejected by pinctrl-single
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v2-2-0a525d5f4cd5@free.fr>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
In-Reply-To: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
To: Frank Li <Frank.Li@nxp.com>, Carlos Song <carlos.song@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Josua Mayer <josua@solid-run.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thibaut Collet <thbt.cllt@gmail.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787577136; l=2029;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=O+VGpUg5BMz3UlWXVE3y0mK/EDo+jBPNvLqqP9N2rrU=;
 b=9Ed/17SijE21QKnYqCS+wmMMquGU+wut4XYtYPBK2z9I734J/iXdafdkfxzBHcSF8wg6ghV31
 0FGmBmeWpd4ApF2eECQlKiDvxZBfzEnxrOpJ2ESHJspGQoNp27Xlyro
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

IIC1_PMUX is a single bit field at RCWSR14 bit 10, so the mask for the
two iic1 pinmux nodes was narrowed from 0x7 to 0x1 to avoid writing the
two reserved bits next to it.

With pinctrl-single,bit-per-mux the driver does not take the supplied
mask as the bits to modify. It derives the field from the node's
pinctrl-single,function-mask, which is 0x7 here, and then requires the
supplied mask to match it exactly:

	bit_pos = __ffs(mask);			/* 10 */
	mask_pos = ((pcs->fmask) << bit_pos);	/* 0x7 << 10 = 0x1c00 */
	submask = mask & mask_pos;		/* 0x400 */
	...
	if (submask != mask_pos) {
		dev_warn(pcs->dev,
			 "Invalid submask 0x%x for %pOFn at 0x%x\n",
			 submask, np, offset);
		continue;
	}

A one bit mask gives submask 0x400 against mask_pos 0x1c00, so both
nodes are rejected and the pins are never muxed with this message:

  pinctrl-single 70010012c.pinmux: Invalid submask 0x400 for iic1-i2c-pins
  pinctrl-single 70010012c.pinmux: Invalid submask 0x400 for iic1-gpio-pins

The values are not changed:
  - 0x0 selects IIC1
  - 0x1 << 10 selects GPIO_1[3:2].

Fixes: 7a3cc49ad1fc ("arm64: dts: lx2160a: change i2c0 (iic1) pinmux mask to one bit")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index d4522a19405a9..fae705dd07669 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1688,11 +1688,11 @@ i2c6_i2c7_pins: iic8-iic7-i2c-pins {
 
 			/* RCWSR14 */
 			i2c0_pins: iic1-i2c-pins {
-				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
+				pinctrl-single,bits = <0x8 0x0 (0x7 << 10)>;
 			};
 
 			gpio0_3_2_pins: iic1-gpio-pins {
-				pinctrl-single,bits = <0x8 (0x1 << 10) (0x1 << 10)>;
+				pinctrl-single,bits = <0x8 (0x1 << 10) (0x7 << 10)>;
 			};
 		};
 

-- 
2.43.0



