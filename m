Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B75C5B573
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCtd0uL16NefcjK0uhAGWR7QFGAbPCtFirOkzq/84xc=; b=SfSd/lSXDcQwGi0GIorcAs7eoI
	6SEDRweqwvOTAuBpM0EPaj3uQUyKhz8RsPnHl8VATMe+5m16tv7GtNjMNKZKnXXiwiUAQ5g37Lv23
	CcpcZzDwJ7Bqh4V8r0ZdNHCB8hUvZGGQe7xkR5kV6ER2w+mHTe2NPfFMyGJ2fLl7uqqahtI/fKKUf
	vxyJZVb05oqRe5U0OlbVW9MGgpbBYz/dsc+JVxUsWs+mKncK9utUqdRXtGUeTaA5rI7BjYsYkSdBB
	UbVs7IuOpRBYwctAtjN1KuzhEEddttTbH7PBIUGMDi2H7Im+XjcRV4Kvf8QcOcNUwLPvCi/1BcFB1
	r6kUtdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUOC-0000000CaSq-0lAT;
	Mon, 10 Aug 2026 18:06:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUO7-0000000CaOr-3TQc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:06:17 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F34D1D98;
	Mon, 10 Aug 2026 20:04:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786385099;
	bh=RjZzlaebzxRzYkIyzsrEy+VoPDIAk3bf2qODIVtd/x0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b+rPujPdKwdRwtbpP0WA2ymMtesh1qRg9SQztYNWQ49SGh/cZ48/ce8/rnxklYuE2
	 kMqS2QWmD6fooACJ0tmP6MwKc5xcZ+BsZvV9PQ+0Wn/vn8qh72q7kQBPZOkyhcOPND
	 KNlazpHZ8pUH4Umy45KT1P5PkaOivEw9k/DNZK7E=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev
Subject: [PATCH v3 6/7] ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor node
Date: Mon, 10 Aug 2026 21:06:03 +0300
Message-ID: <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_110616_025811_AFFB3DE1 
X-CRM114-Status: UNSURE (   9.90  )
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

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Drop added blank line
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
index ca4cb986efbc..0cc05d084f9b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
@@ -233,7 +233,9 @@ camera@3c {
 		pinctrl-0 = <&pinctrl_ov5645>;
 		reg = <0x3c>;
 		clocks = <&clks IMX6QDL_CLK_CKO2>;
-		clock-frequency = <24000000>;
+		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
+		assigned-clock-rates = <24000000>;
+
 		vdddo-supply = <&reg_1p8v>;
 		vdda-supply = <&reg_2p8v>;
 		vddd-supply = <&reg_1p5v>;
-- 
Regards,

Laurent Pinchart


