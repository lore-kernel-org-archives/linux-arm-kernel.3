Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F44CCEBF97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 05:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MijlO79Ek4pYSUrwAhA4ytrEq2ptX/lzXKkKcjkRX4Q=; b=NJCMTbl2WsevQ6IuSMMo6VTpcf
	UIE+IzcoMn/qMfVzuVr38rhz9TXiVM/kfyU4hDCPPwmcfUeNSD1NnqybA5y2huWQy88eMqxts9FBE
	E0kTyQQ++kdxR/Io/bGwSu5EIrJgZwz/4W0xMsCmYMOEM0TlYCBty43RWIrOjO5UktNngGZ2zcOaY
	aSEAsnOg23m/lDuRJxNgrnpF1XmhuzQib0BeuobcuNoC/bPDXZ5t6b37dRDSxhqw7DxCgfmPH+lYB
	AAglY9taDS/6UZgLCcLprv8Pgqf7pqxTbnKjGHneZAPY0SRQtuIFrm9jWjrjXbs2o7MhHobiXxr3I
	VCa8KzBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEkG-0000000HSIc-1c7h;
	Tue, 18 Nov 2025 05:59:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEk4-0000000HSC9-3TWo;
	Tue, 18 Nov 2025 05:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4993244384;
	Tue, 18 Nov 2025 05:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C81C7C2BCB5;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763445544;
	bh=K/UsZ1gWQPrXE8Cmyyx1itR+TSnLgVk5ZkCZ5Z2VCCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=muIbDzM//nQ5qQ1f4EFe/WmwM95YS1Ckp8AMf36CqZLk3tnJxzZM8czPqnDIS39I/
	 27J5KMlpzFNs2ZLieEkOBsZe123zBt2LzJnUmqXsJTwMjtsVf8/oNe/FsFaceOCf+1
	 LuG2J6f0y8QbEyfnaTfrtOFrtTcr6lzGJuijwGSuhMCUaPqXiyCVNU8/ynUkG2YlES
	 sjc+DzNp5c8nRCnulnHQN3SQwb6poYzXQpEgIAgCbJw/9E0ZcYBG0+fIai2Lb56Bxd
	 6xjeV1cPTJbENPPmAWZI4tcla5GTsdHZJSBvUCczWfmsef3wcIczM+n26bPq5NmJ16
	 rEc3az0mKI40w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAB6CED249;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 18 Nov 2025 13:59:02 +0800
Subject: [PATCH v2 3/5] arm64: dts: amlogic: s6: add ao secure node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-soc-info-s6-s7-s7d-v2-3-38e2b31a88d1@amlogic.com>
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763445540; l=856;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=lkBjmJL/fA5SfT99KKhTn/IbIqqAL9gYKbERk/NBAp4=;
 b=/4j2wGfR+kNruk3cqjYP5no72jgN2ItSWlXKlprbI1PYFezCj5zK8v3ryWe4WQOTUIJCc8Utu
 qpS1C6qFYGXAEHhkAuSyPQEbXRua/PUatPIAlgFieeUgwmRfLd1tZoi
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_215905_647578_7715EB55 
X-CRM114-Status: UNSURE (   8.41  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add node for board info registers, which allows getting SoC family and
board revision.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index 0dca64a2ef9e..da3e607aea85 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -199,6 +199,14 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			ao-secure@10220 {
+				compatible = "amlogic,s6-ao-secure",
+					     "amlogic,meson-gx-ao-secure",
+					     "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
 		};
 	};
 };

-- 
2.37.1



