Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A5EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 10:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLkyZGCeekvVfxj4F5Ff3mUJERFzT096vqxv9ndUUfU=; b=v46DaVyVjIcmqXwP5oniBFU3ix
	ap5lXYuaJajnCPnHbHSlRrLabMnQ3sr7Au12j9RTlJe5BSErTMrxhrs7JSlIsla02pppYqio/4DdH
	/8rdZab0m6SEsUDE9oq9CeSe8r3l8VL3ncAu8Eg2P16i2HYared4pdYk2unVh/ChajVScXW24hpbb
	NyiqMYX3LdcZmvwV152QJEn0prUO7M9CL6PnpLKpH2UnnReY/QHkdC+r92xHKwc87UvWO+5n4AIip
	3IW3PFsa7uogH9Omu65lSdkxx57ffQoP68nn0VJWABKM+zb6IYrjEtehx2kp5Cp0Tp1TWQonK6lO8
	KspYDbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKPo-0000000DmlO-0z6G;
	Sat, 01 Mar 2025 10:49:52 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKJu-0000000DltN-0QKP;
	Sat, 01 Mar 2025 10:43:47 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CAC2525DBB;
	Sat,  1 Mar 2025 11:43:44 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ni52fxJz4eH; Sat,  1 Mar 2025 11:43:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740825824; bh=b7EbBDCtbwDBTCFmgFj8wrNPICeYFLhWlDWP8XBGTec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fbg4aZteoWIk1PerzubZjJTAQZ3pb5oTYB3WN36lEuux86x28ez/s6uBAeb1sWuXM
	 Di4rO7n9STt6wc2/yXaSHdQsvLqu8V+B9oupqqqp33wqTquKleC/pWAn4MhCGjpcpX
	 aPMPMMIkgJ2aSu0CWEINX+Jy8mbKYs2r0k88rqt6DqXSq9CH7wJfElqUmXjrTvDe/O
	 Rt7EKSZn+CG0WRJhLGl/HRfbfzOlk55c5sIHF04aig4AqzSd/dDxipfCDC700lL2bW
	 nhV4GnlH4rnAXD2m5pvRDMWSjCDh79Nd5/q0f8YoRvr7dLTh6TKL2+eY/+e3mWkWWD
	 dZ0RtcNiL8ORg==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 3/8] dt-bindings: mmc: rockchip-dw-mshc: Add compatible string for RK3528
Date: Sat,  1 Mar 2025 10:42:45 +0000
Message-ID: <20250301104250.36295-4-ziyao@disroot.org>
In-Reply-To: <20250301104250.36295-1-ziyao@disroot.org>
References: <20250301104250.36295-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_024346_268446_C44489AF 
X-CRM114-Status: UNSURE (   8.05  )
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

Add RK3528 compatible string for SD/SDIO interface.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index 06df1269f247..ea0feb733e32 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -38,6 +38,7 @@ properties:
               - rockchip,rk3328-dw-mshc
               - rockchip,rk3368-dw-mshc
               - rockchip,rk3399-dw-mshc
+              - rockchip,rk3528-dw-mshc
               - rockchip,rk3568-dw-mshc
               - rockchip,rk3588-dw-mshc
               - rockchip,rv1108-dw-mshc
-- 
2.48.1


