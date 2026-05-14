Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD23CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XrPBUdxveGevad2ZewXPqw3ZVwqDv6ZHIn3lWZU72po=; b=WQH6cD56GNPmcP
	qy64Viz3BWT+bq/SIVI+X1pEvwSUCIzfJciMb8OUSw6cbgA0KWWVzCmJdQoJZwBfLot3ZgEcq5hTd
	OVaISvMEQdBEplV0csxGZH0iGua26mSpvBA7u1uIZvI9HwdmKxC4RVvZxHjzx4lIRCBsvPqggdNdJ
	oEYG7cw9P7KmpG+xPs1+qEdHEDc7tOexPBxSXWQZwpGTJpVeRoa+5Lz4U3oBTD0W8hHAChJdEti4a
	qolxkiwv4hdRSvvi/tcgKQJzZze79Ip4U5AXANvehRFUNMDSah/y2ttjAxjYaTXwcv1PNz1NB2z3j
	3MRBp9+LYGynyS21sLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXUw-00000005oGV-2z2G;
	Thu, 14 May 2026 14:57:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXUs-00000005oEl-44dy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:57:12 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 048D156D;
	Thu, 14 May 2026 16:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778770616;
	bh=jf0R18WespItFzG7ULJQW6zPsWauxoz3heCTUJvRNI0=;
	h=From:Subject:Date:To:Cc:From;
	b=A4c+OwLBiKuD5/Ckxxh+/cq5XKI9Qsd1wK+F1MR32yca/maexmXtm7/VGzHpvIIU9
	 MZDvmPmzkg/es7CeDea/80X9X6J3EtJxN787Vl1BmqGoA6sO6+cNTg7JCNAjT+h4gD
	 OF4QI3F7bXv6f7b4jazJA/JSw9J0sM7Ngjz20OwU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/4] arm64: dts: ti: BeagleY-AI camera overlays
Date: Thu, 14 May 2026 20:26:26 +0530
Message-Id: <20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMBAF0atIrw2YoHG4irho41cbnEhAFPHuB
 pdvUfVQgBcEapKHPE4Jsm8ROk3IzbxNUDJEk8mMzQqdqx48LbiV4xWegzLawXJdcTlqitXhMcr
 1H9vufT+AMx70YQAAAA==
X-Change-ID: 20260514-beagley-cameras-21ce6a98a7f1
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=jf0R18WespItFzG7ULJQW6zPsWauxoz3heCTUJvRNI0=;
 b=kA0DAAoBQ96R+SSacUUByyZiAGoF4q6g2UlOdI+V6i/UR/BKlMTnnU6lCwZf5/vUmdcnXyJDm
 4kCMwQAAQoAHRYhBE3g2Bjl1XXo1FqvxUPekfkkmnFFBQJqBeKuAAoJEEPekfkkmnFFg7gP/Asy
 l3HUOHGfxTu+T9Lh0u/IhJt4/Fk3/cK4DlJifXorUTFn9+5ceRrH777f5M/ZB5r/uXtuPkKxBqI
 NDBNwInjr0WZepQuJlRBlignVPp4iwfqGg5NRzdP4UI1AI0N3u5tw9ukF4Kux667lDgCkd85IuX
 jLK+5IxqZUtXCiclOREpOyft1/Z0qsJDMVwNhHpKwAQpGdZwUqcz2L1WhlWZ6hYdNm15TAcA1C4
 9oTdjd1AKkphIMROuszq6NJpQImmE2SKzCws0VgDqazZLX782xdchNzYLQn+fhPfprVbZ0CCyn7
 T92Q1lavdggBWumzQJrTYk19gJxX5Z0URDrBsy0WHjAZrrZymn6OcZfbLyyeNWVDG//h+L1Q+sg
 7vR1zd2gBk6/7Jo7nOd5hRf6A6+3/zPNtSLhXtqTXmkSMUh7Ksw10sRwNLahRHVGcXFmQP5ZVZa
 mSXjvSfYTpIJW9Veigp2HDRFF8IHWjDgdfjAzYe2km47Rs8m0qULHIXEBTVBFnzv2rMjhkk1VST
 VImUt5C/6TJQix2U32pvlaTKgtINg7nGFVKcNKI5I+FwgYJ2wl+soMDOycyuO5S7l+M1l2uJJk1
 JasDSzn3SK+6IJfXNdN1Hqspnck/zkv0tvWzNviu4Pfp6qU51l4Z8H0A3HkdFSs5OEyBAaZi8Zc
 yN1QX
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_075711_468481_A399CE39 
X-CRM114-Status: UNSURE (   6.81  )
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

This series adds support for using RPi V2.1 camera module on any of the
two 22-pin CSI ports of BeagleY-AI.

The first two patches fix the base DTB to support I2C-2 (used by CSI0)
and setup the DSI0/CSI1 mux (used by CSI1).

Next two patches add the two DT overlays for CSI0 and CSI1.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (4):
      arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2 pinctrl
      arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1 mux
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI1

 arch/arm64/boot/dts/ti/Makefile                    |   8 ++
 .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 121 +++++++++++++++++++++
 .../dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso    | 121 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     |  27 +++++
 4 files changed, 277 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260514-beagley-cameras-21ce6a98a7f1

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


