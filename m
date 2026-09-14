Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A90EC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6S6dPizeTTA5G9J/3AscJ1/w+xNcAj+7ZW10z8lG2o=; b=KdSSkB+lwh1lBMJajH55Hni4oQ
	w5iJE3Om+vGb6El14wd4zKpI2X5UHWDso0PfXPLADBF/DDijcWZiulTkohHi3xvFtPha1ckt6MTRr
	WoShBVdzJxkupdCizwgjALj+yIv0jo8Bi7s3Rtvs3uGDJ3UUgKEiHnlItcxMGmFmoxVb85SWkG9gT
	vTWgA4mJmKMvnlVfOj0bj0dAVqnNyrnyXhaEvZUlWWIbA8jwF9SewBTegJjyt0hEs8v78kP0W05GJ
	IkgjitrQMnDxh8bjB/cakvKiykgORStFEvb4Bl14OB/TiiGnu0+tDmJIp5QXVIpEkaPLIwxX7iISH
	weH1loJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671Q-00000003q0M-3KJi;
	Mon, 14 Sep 2026 13:47:00 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671N-00000003pxd-0JLz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:46:59 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6S6dPizeTTA5G9J/3AscJ1/w+xNcAj+7ZW10z8lG2o=;
	b=MBcdRlbYG94TxOJvM03IV9Rx1AzOLQtvx+o4ZzORZe0cMXTKNYqBHc5QsQZHP40q7k+4z0
	tJmADmcPamyLoa4xtWv0nAIDSkaLOvpwB1w7WYn7JzxB4kfcFEb4MRIW1bvKO2Ky7Spt2C
	NAT/H3AsA/BLXBsVyiJIiBTG5+fBqfLWe0xkT0Va9nX+yw/Zrnbv37DNZlhrn+dvyyH8L7
	GTowi+ytAdZF3VgNX+LBJ9eGFHIN0NIK9Z+NH125Nw9l6bgN0U8rvTzoj4OFtiMmdISBk7
	sfelGb1H2OSDH1RVxDnT258vPxo7+8p7t7Ds5/VVwbbDbubKJgoelNjU18eClw==
Date: Mon, 14 Sep 2026 15:46:11 +0200
Subject: [PATCH v2 3/9] ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID
 pin configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-3-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=iCuZlno55Yjn0MkpffeLuEkr+4wHGhog/vQ/6EFeyBM=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1OnpKPPyzKmXI8oLHS73lnIPdfooPFJ5o/7s1dZ/
 r61RLOzo4SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCJXuxh+3NLXru56vOLGRCXF
 nFmrLoaWqX75VGv6SuXehQlLPyz5wsjw0Exmp9y8jqIch4yr+dZaJ41yxJdrHW59YOBw5VXE0T5
 GAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064657_562184_CE6C69CF 
X-CRM114-Status: UNSURE (   8.74  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Add the missing MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID pinmux entry so
the USB OTG ID pin is correctly routed and OTG can be used.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index 65c5f4450c36..0658584c9f11 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -357,6 +357,7 @@ MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 
 	pinctrl_usbotg1: usbotg1grp {
 		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID	0x17059
 			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0x1b0b0
 		>;
 	};

-- 
2.55.0


