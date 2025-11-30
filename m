Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADF9D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Y5LGb3g31rjjIXxiw5Jdr35UaFiGP0OuDnqqXz+mjE=; b=AtW/5ANQ/efpVtn2kKylXwk050
	4Lnj6GEinunxwKipEX8f8i0rGVnT0snxg8dlAo2NjdtMHVuiv8kMThbY4E+/f4WjJRe7aRRaAykn1
	yfY3sw14lJv9BICxEAP+hX8wpD4Ovcq6oH+ATUREoBLZ5R0hZ0P2an+MDhiidmgoPWUqWBrcl688j
	SQTRSg1Z3m7fDubyVgx6bOmAJuzRcJ2ZwWrxIQb9iwWcMyUP9//2CzKGcD+5Rq7WC9BphPOykPucR
	KcdmXXEiaPJFpOZZ6n2T4v5sr3HB8X3ynvRpNxl7xGg2MC9ddBAokD3B0iXpwcialmEqIcohtB24G
	ovRJW+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPk3p-00000002Pgb-3pTQ;
	Sun, 30 Nov 2025 16:14:05 +0000
Received: from mail.jakse.fr ([45.81.62.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPk3m-00000002Pft-3iOg;
	Sun, 30 Nov 2025 16:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jakse.fr; s=default;
	t=1764519230; bh=1Y5LGb3g31rjjIXxiw5Jdr35UaFiGP0OuDnqqXz+mjE=;
	h=From:To:Cc:Subject:Date:From;
	b=LuiDZvuuhNnGg0sLq1wfUtOo/qR/8tevJmuGB8ogaSX7N8Wl8iSvIJSMM9YcR8YWw
	 sVb2IZqacR9cRCL5mD+Tf6pJU1ircz/soUQPv206H1tyr2cedv+2mETHsLSYBH7bnV
	 Lpt2/E+/LBN5B7ldPqMKN/mRB9HRX+7Kn9aISmXQ=
Received: from rigel.lan (rigel.lan [IPv6:2001:912:1ac0:2e00::9bd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.jakse.fr (Postfix) with ESMTPSA id 8B83EEA12BF;
	Sun, 30 Nov 2025 17:13:50 +0100 (CET)
From: =?UTF-8?q?Rapha=C3=ABl=20Jakse?= <raphael.kernel@jakse.fr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rapha=C3=ABl=20Jakse?= <raphael.kernel@jakse.fr>
Subject: [PATCH] arm64: dts: rockchip: Fix Bluetooth on the RockPro64 board
Date: Sun, 30 Nov 2025 17:12:59 +0100
Message-ID: <20251130161259.9828-1-raphael.kernel@jakse.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_081403_386171_B4127E8F 
X-CRM114-Status: UNSURE (   8.55  )
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

The RockPro64 board has an optional BCM4345C5 Bluetooth device on UART0.

This patch fixes audio stutters by setting its correct max-speed and
compatible properties.

Signed-off-by: Raphaël Jakse <raphael.kernel@jakse.fr>
---
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts | 7 +++++++
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts    | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts
index 304e3c51391c..883d9bcfe792 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts
@@ -28,3 +28,10 @@ es8316_p0_0: endpoint {
 		};
 	};
 };
+
+&uart0 {
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		max-speed = <1500000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index 4b42717800f7..ae3ee91dba2f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -28,3 +28,10 @@ es8316_p0_0: endpoint {
 		};
 	};
 };
+
+&uart0 {
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		max-speed = <1500000>;
+	};
+};
-- 
2.52.0


