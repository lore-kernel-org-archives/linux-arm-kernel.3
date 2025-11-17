Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED5DCEBF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MijlO79Ek4pYSUrwAhA4ytrEq2ptX/lzXKkKcjkRX4Q=; b=BORE7YzEar14/SnaTz6CvwkGVy
	Ti/SstVjWsUPRFSMoaM/hK/xr6VOSJsH7NG6oJvoEgw09dAJpBsREROBLvXztEb48HxRORfx/kgny
	a7+IJiHLeJYowPTFREWHl2On/xXFHbmJVf380CAyLXORUF6nm1L0j7lNP8SM+aCOs6UiXMGYEEBnt
	QG8mbLS+Q87XL8/E3ArHegOOCNt/lSnbXFScV6hUYOekIdFFMavpRzzLYPE95wooIfCHa5mhFkzXO
	9IEtgawSYGc3Au6Ey11L+yR8rLh1L6IjJRVzFGZ56q/RJw+Ercufpkyz3b3FkB+8z+KKajM66K39A
	20LGTE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwIH-0000000FrS3-0hu7;
	Mon, 17 Nov 2025 10:17:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwIB-0000000FrO9-3Jjd;
	Mon, 17 Nov 2025 10:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ECAA44266;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CDABC2BCB1;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763374622;
	bh=K/UsZ1gWQPrXE8Cmyyx1itR+TSnLgVk5ZkCZ5Z2VCCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L7VmZmxyExLF7iJUzg1CUQ6ZCV1DC6AY7daQx1MHx/2bfEfoyiBurUWJBLmevLAFS
	 rdsXxCpXoAjREyozXGDU7GDhw4S4m7MxamMtQGIPZU6V2u6hv6HOQhkkzL5w308xHW
	 Q/+gbELPlGsP+H7lWxreGQoO+ETS4fJPAnkmg+2KcpPZrJejlKjXNvzYsLGxRhff6A
	 nivaMCxfYuGa1BAetdsO3WmhGLLXiRl9G+w4v9ScxUvV5whmdaS0HFAMHG8hISh66F
	 oXMj9weBMt7cUp4nIA3KLXbdo0c34YOBVyTbFO9f0+6mEWGgSoE7pVNs8F+HQB+lDZ
	 6kAg6rRKbpDPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41135CEBF8D;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 17 Nov 2025 18:17:02 +0800
Subject: [PATCH 3/5] arm64: dts: amlogic: s6: add ao secure node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-soc-info-s6-s7-s7d-v1-3-6ab8aab03dce@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763374620; l=856;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=lkBjmJL/fA5SfT99KKhTn/IbIqqAL9gYKbERk/NBAp4=;
 b=FYmhOJ/d0S68YIdLSBInWtC9YJEKXdFbi57b3erbXkHqIpuCSdJd0K9gFOpoUI8tb6S8aSZef
 GtvVAPnAavyAQtfmmYIwta/BTNKo74Jzs7XkyvmTGSTyo8oyFLHSgOX
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_021703_859997_A4CC90B3 
X-CRM114-Status: UNSURE (   8.39  )
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



