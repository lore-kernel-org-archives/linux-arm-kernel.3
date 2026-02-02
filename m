Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57EFE6528B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 02:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bnoxyPKF+Rg8GiRVLp5t4eHLstchzXA+8KDyAQ1KtpY=; b=4PgZkBXe3aFZAMEU+ctFmwQ8w1
	Nw1sS7rW1hJwFnL6Gi39WWKwRYvrwn2EVL6Qc9joFcYfSdQDzqVhz00CmeoC+8g9roe8EOIORh3yg
	A8lczpzacxSVNBmQVRwFpdMa0aJe35q9OiPbqTTnIbcK0i7lwyABfOwd4xoocxlSQ4WNEzMWxEq2i
	6yE9cO8RUg3ZWBzYzxaGUY8RHqqPbO+oMm1aqH6D/S03Rbx0i6IxV5sjLFljZm+JFvaJl2WHM8diz
	mXdzqjbWZ7YuHUmZbFVC2merkyml0pCpxR8tLksSbZZ2uHXDnHuK9uG8gWkqvn2tLdBddnCZGqDTE
	bRe6voTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjh3-00000004LQx-0SCi;
	Mon, 02 Feb 2026 02:29:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjh0-00000004LQe-2GCa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 02:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A4A74034A;
	Mon,  2 Feb 2026 02:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 207E1C4CEF7;
	Mon,  2 Feb 2026 02:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769999373;
	bh=/3ftTjYL9LKJOXS5WEGQ0d26TpXZp1EuCYw55ljuW48=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=L4MM8flNYr9Lbq6j7XSlI9aj2uqqSx7+X2B5pf+kPBfQh+Zzt9rkgNWCBO07pf7k2
	 t8X+q08BqvJX0MI8NCWAY3LXv54sAKWybUNzBJirkTMyksU6VuBMlr9ZBrLZ3ISb9d
	 LYvQb5chkC8jv2hnH8xjuRSWRZU6WQhqz3g5TVHlMienjnKq5Hp43bvRyGZHkAUIBe
	 /qV5DHEyHj8FPL3JLLceZpdh6ruNwLRWxQUcpOjA8Ml0mjUrI6h5pTRaVQUqnp11bl
	 EvoQYtEkkxVp20fMZjcCBY2CJu68qhyKJfqwqh79ahfJgyc6Hi0hN7vDtBh6l0PZnd
	 EnE1VZwzWimIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C9FE6528B;
	Mon,  2 Feb 2026 02:29:32 +0000 (UTC)
From: Dirk Chen via B4 Relay <devnull+dirkchen.amd.com@kernel.org>
Date: Mon, 02 Feb 2026 10:29:31 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-b4-anacapa-dts-fix-v1-1-20d4b0114854@amd.com>
X-B4-Tracking: v=1; b=H4sIAAoMgGkC/x2MQQqAMAwEvyI5G6hVFP2KeEhrqrnU0ooI4t8NX
 gZmYPeBwlm4wFQ9kPmSIkdUaeoK/E5xY5RVHayxvVGg65AieUqE61kwyI3WDCHwSK0zHnSYMmv
 +T+flfT8yIKM9ZAAAAA==
X-Change-ID: 20260202-b4-anacapa-dts-fix-207ffe9a3b0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Dirk Chen <dirkchen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769999372; l=1234;
 i=dirkchen@amd.com; s=20260202; h=from:subject:message-id;
 bh=7UiIsc+JRhKInxcNGMi5RJgMeig8fwCF34V25zBzaew=;
 b=HGTsrHSELPFy//GaIT4xCbcD3IxgB5enkX4xOed+Zt76V75ZNZQ64nOSSHnJjSMBUOjfvCB/4
 hI4PMdUVGWHAtomTjdx/g4w4bDKOJ/GG9o7vnEZsj2t4I6+xPqEA2+p
X-Developer-Key: i=dirkchen@amd.com; a=ed25519;
 pk=NBIyLsVg/YYtGLruq9XLdLWx2PP/1MH4jDDQ1V+7wes=
X-Endpoint-Received: by B4 Relay for dirkchen@amd.com/20260202 with
 auth_id=622
X-Original-From: Dirk Chen <dirkchen@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_182934_607662_09571A82 
X-CRM114-Status: UNSURE (   8.77  )
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
Reply-To: dirkchen@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dirk Chen <dirkchen@amd.com>

Add Atmel 24C2048 EEPROMs on i2c0 and i2c1 to support retimer
configuration. Follow the same compatible string usage as the
Facebook Harma platform to maintain consistency across Meta boards.

Signed-off-by: Dirk Chen <dirkchen@amd.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 221af858cb6b..b8d248d99d7c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -328,6 +328,12 @@ i2c0mux0ch3: i2c@3 {
 			#size-cells = <0>;
 		};
 	};
+
+	eeprom@50 {
+		compatible = "atmel,24c2048";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
 };
 
 // R Bridge Board
@@ -362,6 +368,12 @@ i2c1mux0ch3: i2c@3 {
 			#size-cells = <0>;
 		};
 	};
+
+	eeprom@50 {
+		compatible = "atmel,24c2048";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
 };
 
 // MB - E1.S

---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260202-b4-anacapa-dts-fix-207ffe9a3b0c

Best regards,
-- 
Dirk Chen <dirkchen@amd.com>



