Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE1EC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 16:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0stX3BqNRpzlRQ5BVjbEyHAioPS80mG3/aAoGk70nQ=; b=vAvIa2u7ui6uhhZJJd2ZC7/NfD
	c09QY2PBL54aApEc1SgefsMQU9q6Z64v+TeumEFLjuPhmVVq3aB1lenKDi9eHcg5jRqnkC2MQXeau
	PglrykYSI+eVbiBH/8xjjGHnhdolJF/buZIg+beuWJS2J1zD6d/zY/UrFyIOHi4px3r2SrtIas44Z
	EWfc5rNj4tX9rQs/ECKn885eLVN6KS19lt7JftP63H+qkP+zTvLJkY+DOaOjhmbJWR9Sr6FUDag1R
	Yn5hiwj7vatU5hg2Qn+nfV+5FtRXdWBIkjygrUAx3sx/hshwocoAmF+Szai2i0XUN07+jfwjNM9ns
	+BMjQ/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYIV-0000000H0sh-1BnH;
	Sat, 28 Jun 2025 16:20:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYDt-0000000H08O-3kok
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 16:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D16E7461F9;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAB0C4CEEF;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751127372;
	bh=6oH0nwNv26PaXawo3Ih/MoBWIzEnorKGZ6UPBCiGcIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OeW0cAYp2YSdtnU+vLp1dK5SikFM/cCHgwGeOi81Hx6aTejK83MONtlQls0QPiO27
	 cg52qSiPBRj6dQsB4UqITunAIQo5e6Y5w8pHYmnjAZvX18pRiH/82c2Wwzw6ET8kxZ
	 cV6ON0cWRyNL/XWyRl49TQkhQ88q2oF5uOSGvAC9NpNly+m7F6B5403jDqDPxD0sPn
	 04CstsYDJ0MG8u2KomTL8kQQC3yY2qsKLS0CvXvzUgkdKx83gCJvbgBXpx0/egAp/M
	 rzqif3hjfcIbSA0yMSEs+XMpVeuWPisvZqTcp4Xat1ZpIJwN1Cjo9VBp/7UMAfvbIJ
	 sft+V+9yw5hUQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 5DA655FE60; Sun, 29 Jun 2025 00:16:09 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 4/5] arm64: dts: allwinner: a523: Add UART1 pins
Date: Sun, 29 Jun 2025 00:16:07 +0800
Message-Id: <20250628161608.3072968-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628161608.3072968-1-wens@kernel.org>
References: <20250628161608.3072968-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_091613_958682_1D315493 
X-CRM114-Status: GOOD (  10.31  )
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

From: Chen-Yu Tsai <wens@csie.org>

UART1 is normally used to connect to the Bluetooth side of a Broadcom
WiFi+BT combo chip. The connection uses 4 pins.

Add pinmux nodes for UART1, one for the RX/TX pins, and one for the
RTS/CTS pins.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 4839411e51cf..cf0bc39aab04 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -168,6 +168,20 @@ uart0_pb_pins: uart0-pb-pins {
 				allwinner,pinmux = <2>;
 				function = "uart0";
 			};
+
+			/omit-if-no-ref/
+			uart1_pins: uart1-pins {
+				pins = "PG6", "PG7";
+				function = "uart1";
+				allwinner,pinmux = <2>;
+			};
+
+			/omit-if-no-ref/
+			uart1_rts_cts_pins: uart1-rts-cts-pins {
+				pins = "PG8", "PG9";
+				function = "uart1";
+				allwinner,pinmux = <2>;
+			};
 		};
 
 		ccu: clock-controller@2001000 {
-- 
2.39.5


