Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0495CED242
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLkOuRXSvJqb8AkzYVZPYylT0vrl0RqNN2txvnV5ACc=; b=dB3V44cSYApJ9LS2Hds3BW/1Yk
	iuug8eNrtH9VSWIw8vu5722I+R52tc6YajW2K78MkY9xLsmwoRFFNDtNZ68OwXaNDwf3hNUrFv0YA
	xL0iL2FKnJFYjc9ZHhBlyf4aTM0DKanvD9eEZJZSmsPGOiPMxp46FbY6lDlqCSdudhqyCFFsnE8v8
	rBKyEyR8ha8xVj/hSpCqNBf/Bqu8WcB+6+61eA2UheGd9+74s9GIJURUOFnYTVpITl8vuwVj6G9i+
	uEQuW5G6h3HjAKGxysmlXfG5sCSNTiYf8l5PSlb2epivcdj1tLInlwTEfGbr4Z/lIJxghMAdg2jNC
	tATnQb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwII-0000000FrUA-2UaJ;
	Mon, 17 Nov 2025 10:17:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwIB-0000000FrOE-3KK9;
	Mon, 17 Nov 2025 10:17:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C30E443F4B;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 751EEC4AF0C;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763374622;
	bh=93XnuD8OKydVSI/DK2r4MME+7UjXY/gqTm0Hz7nSjyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qmBcO2O9Xi+CcJV7QtAzLfGIDO9mlKEc74Uf6LdtNNW1qKj0LFLsuElhE+JKS3Tb2
	 A+pF9788a9pgQKzI3KIQGExHl5pm8i6L+SYhAtRzdIASJdvNM3xAm6PlUUy+6NLHxp
	 LZCYn/bx8xjfa0tqeH0JhwpLcfy9cXHJtxXMuDCmy/KX+h0Ik85TO49UgjfGdz0onM
	 c7Cl+q+L+dnp93CZfqJDgUUpF/ZJxLRVmLILzwQaDmt2T+ObO7wYyGYbd6xib6Gwqt
	 bIyL3Dm0SPnXh2WHCF6Lz7b0/M6SPJQHcYp/G+xZRO/5xkfqXKorKpz3gjhBao4po8
	 yHjQ+rAD+zxZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB1ACE8D6B;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 17 Nov 2025 18:17:04 +0800
Subject: [PATCH 5/5] arm64: dts: amlogic: s7d: add ao secure node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-soc-info-s6-s7-s7d-v1-5-6ab8aab03dce@amlogic.com>
References: <20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com>
In-Reply-To: <20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763374620; l=862;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=H+K4E15iswq/do49khTt9ccxoAu/8Vn3bdBkB4g+s84=;
 b=TSQr29OzBf7GcKXrMc9GvEDR0PWUwcJlr8rvHIDmIwH9cPtASRkMWcArueUbKoteedsmPpuva
 hMXJx/h5pwLAz08BaoVZ0i0BMcjQ1UC02X6w2j1+AdYIS6Hzq+slVZu
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_021703_868584_8F771B81 
X-CRM114-Status: UNSURE (   8.28  )
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
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index f1c2e91ec6c5..e60167af0390 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -194,6 +194,14 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			ao-secure@10220 {
+				compatible = "amlogic,s7d-ao-secure",
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



