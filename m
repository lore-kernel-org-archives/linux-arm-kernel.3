Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B360CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yaTeFtLRO5tvXwPuK3rKpMfJKgvbP8eLKfJv8XhYE/E=; b=ACHsKVA8al+lMXb8CxPDrfRBFL
	tnlkAqz5UM2s+T5pwOaWHeaBelbxQe9l8JrUu4gJ6Ouead+6kab3lgpdr+zfrskU28QQjFtmMWl9Q
	bpMalBd8+Ehsf3u3Mh6q4y/RhZnNQ0NEpJcYC26uzhiJXHiIVl5GI9b1vxLHAKZu92onAe6L+iu7W
	WYXU+x4fdBdDDqnIceScwweeX1f+7LAZB+eQEAgMsZbr8JrwDz8sriJGxSENcPgRFqE1l7+NIswSp
	UqaCo7iEdHRTcGohDdPrf3qnl3h934IELZX1nOnxB+rFDbgdQYAIUpXmLbriYddnpEsPJDjyeRFfz
	7q0N583g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1LY-0000000BpqY-2mlG;
	Mon, 01 Sep 2025 10:01:08 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Sf-0000000Bgqn-41Wz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1756717455;
	bh=yaTeFtLRO5tvXwPuK3rKpMfJKgvbP8eLKfJv8XhYE/E=;
	h=From:To:Cc:Subject:Date;
	b=cljPwtmrAkZeg8IkGCVBuGqJPAgyLgrV6xteO5Jd2rdpEwZVwqjx4d/rOQ/7UJ+fm
	 dU4lDMh/0QHzqKGIPDMG9r88STauudtDsjU5p5n+YgEqd+UyzipY/Hkc3fz3WQ28Mv
	 eTcNagklQwIxyt1dAKuz5OZgLBKnqRAdVw2Z+Upw=
Received: from localhost.localdomain ([112.94.77.11])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 10D1883F; Mon, 01 Sep 2025 17:04:13 +0800
X-QQ-mid: xmsmtpt1756717453t5ocrcnwm
Message-ID: <tencent_64909A540A8CD9063D28DEFD0A684AF9B709@qq.com>
X-QQ-XMAILINFO: NRYSeI3Ux+UPKBqenge/iM5apnt4JgNSf6hICTmL6hwIFOvHFwQt6jEpO5mfZ7
	 ff7W+zARH/K2ohCTAQtNOZ9K/+dzervwNbcHVb7ZOPLd7PFftSOx24rKqtKjN+SI/46ipWyJp+mf
	 N3Vw6kZdPI4mUdaLfxCn+zYw1OSGkXo3qA/OwlYGCwxG91UYkF3Cy1JKiXIKAyo20QP36SsvL0ed
	 tQFXw+789q+0a+vxtOOjcO6tatqpp0YuagsZ8T32dJvGzouFltZSPd2V3hpo0+F9s4ltPnnkbJ/n
	 aXqtwu6CUGo8ihauxjnGFUKOePrn0m008hP4OBzwYE6/ZCb+d4RiuwfLymeh7VllGN1tGTCIA+Fb
	 bIvDpbgBCz2zZdxUZh3IO0gxHZGK9wssu6IfrSi/NC6ocMWQkqI3oAHnEjwwnAB/pWr/vCQbYKTw
	 4l8FPj2hLZ/TJU8jaNnfWyiyt9PGFwZOYiGbuZoI+CbqC8gTSFodeRYfl5jmRcv2JX/BjNDXCtpN
	 UwBeMQqqVwn8IXoFrkFZFWBlozXZt0cEkaB6axoiIAA/5Q1FD4mJJvugXIaT7EJjP+SvF/yq32FS
	 LeocQal7ou8z3QjpOcPDH4OXXRNmJr7d42lY3tl1sC+b+Dy7WKdekCzJ0It5GumRrocnY4XEytUe
	 ux78PRYagET3mDYgss9ymWWPySrgAAQJy4U26Q5NEJLvxAfwCr4omlw3m+5hsez52WvPj6KpRBan
	 3quRgn7OWzmeMGfxM0hcpX5i75UBVnGquZfJP/TQQ5fcAswl0X4ioJj6cGPADKxMu39Q8Q5DulYE
	 rOa7nDnNzIcF0qYoxlJRs/zSd3DsxjQhvEgwE5zbE2+YqF/TCM5J06JlKgrzDQ1ULxkewBgMXQSn
	 LRqY5L7U+FK+w6pFRr83xq+rDeKAgaQJV+txukzFb1nEzRnU8hvFEgK8Wpzp0mMjUHV0nDa+XtcT
	 5ehyRPrRKcKkW14IUAaGrNdTGrZOAPY6NsT2JaevrDdeiH5NrQ/3tIA5Yzz9O9zu8923LMv+h8PR
	 ktlx0pYv/6fKaJI8SqHQ7rc1dXt6w=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Conley Lee <conleylee@foxmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	wens@csie.org,
	mripard@kernel.org
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Conley Lee <conleylee@foxmail.com>
Subject: [PATCH] arm: dts: sun4i-emac enable dma rx in sun4i
Date: Mon,  1 Sep 2025 17:04:03 +0800
X-OQ-MSGID: <20250901090403.533184-1-conleylee@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_020426_498259_F4846DBC 
X-CRM114-Status: UNSURE (   9.47  )
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

The current sun4i-emac driver supports receiving data packets using DMA,
but this feature is not enabled in the device tree (dts) configuration.
This patch enables the DMA receive option in the dts file.

Signed-off-by: Conley Lee <conleylee@foxmail.com>
---
 arch/arm/boot/dts/allwinner/sun4i-a10.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
index 51a6464aa..b20ef5841 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
@@ -317,6 +317,8 @@ emac: ethernet@1c0b000 {
 			allwinner,sram = <&emac_sram 1>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&emac_pins>;
+			dmas = <&dma SUN4I_DMA_DEDICATED 7>;
+			dma-names = "rx";
 			status = "disabled";
 		};
 
-- 
2.25.1



