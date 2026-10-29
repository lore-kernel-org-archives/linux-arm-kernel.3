Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C17606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gdHztJMa;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDDQ0dnk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UNWkw8vYb7JpYpnCN3rPDxXzy3LWTgIRTpE3bVdVYK4=; b=gdHztJMagGIzzA
	/ubuyA8csVf1fVy9EpxmEj/KPrIN/pBXRSY8GZjSCt8Dv1o4LgIpD5PSSnRA04NhiCZB6WeN4VjYR
	0CqfFiyF/PtQAqic1adZdLASIN/7nAYhYV0fhu5IBMrsS5dRtvqOS0cLxo3NmB71BVK4F1y+AJziC
	AWe1Bsq0fILTnduEfgAZE2f3HaCwrb8MBXl5QzEDY2tdLmtOeTA74r8O+oRnkibX83I8pXruCOb7g
	NqflJLgVegANH1oRS9cNhCa4EgD1rQQmX7jegyjHpCrSzhw9EicpMJQIptXZfz8xtz/WTzY4QH2vK
	74XclkIGy8M8Wv4pnGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLTQ-00000008irc-0ahG;
	Thu, 29 Oct 2026 08:27:00 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLSf-00000008ifY-3DBD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:26:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so5444735ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262372; x=1793867172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNWkw8vYb7JpYpnCN3rPDxXzy3LWTgIRTpE3bVdVYK4=;
        b=aDDQ0dnkg0AMSOGn5+hb70tCt4xij1paQuEgLDEvkP2k3eX3NI5w4v3QFPmBYq+Y3q
         A5+cCYtMhxjONVCAKPUnFSbwVXwvY2fW5B3lpO06U1M1+XmNtagN39jbdWbLupAa3x1b
         4aUGxLM6WE2vhwkhl+fciAiWFeyKk+zYaa8afvYZESb1uyBiBSrty6Dc6SFJMBn5ZGg5
         RXnWdjzD+e9LJ89sy+vf48b89WZE+tWxoTR2bpxskF3vKLZT6Sb0SAZ/bZU2doQ3VAEv
         9wvbbHuXqgJIBHYFgchSeZ31qb9ykwelyfbVi22lh9ty1qCIMm5QVUvzAgmjkkiOb1bg
         owzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262372; x=1793867172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNWkw8vYb7JpYpnCN3rPDxXzy3LWTgIRTpE3bVdVYK4=;
        b=DxzTZlPW3ZgIxOzJcO454UTRofwLO6Dhol+ElDdforAjVnaTGFaQT0/ebFLRT1EOsg
         mp4+q9nC33diq2R9t5HgBujRrcvoO96XU69XMjlMTEVU+utVkDPZTJJcWU3aHckLqH6/
         rzfy4WK/MQDz4u7SVFJg/iKtIo1hJ9Ctt73091AgGN6L5O10sIraepX1HyIFUlZfQ9c+
         uyiGRDDTq7mxn8JGTmhaIvv4g3EtYmMjBNX5lgdwsO3mGAGxd+qGe5Ht2081INs+b/6i
         LXSOSFKz9n/vuL2bGwHt04vKbIrxqVZIWY85Wk7KMVevWHUq8LM4mLHdy6PR2JhhWC5P
         t4GQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1bhW6bZziVbLVsCz9z2An8T4YiqNuYNEQ6bXyX91t6FeKSGNyOtfBqjcjiOkLoafs0OXkVnfdsFeZfnSDb0Ux@lists.infradead.org
X-Gm-Message-State: AFq9FYLBjZ7OVshnj7VlwtPrtxYQJAY9pGBonpeVcVZnzBjv9CJcsr3K
	ziujShUoKJ/hrUDPsFNvHVrrj8YKB3kg2uWlVslXUEQcWoWehCiVcGQc
X-Gm-Gg: AYBFou0vKsGsAfVcNr/V3z+dYmPj65wbjaMUlC8sn+wpp5RDO1LM3Ps0lTdEQG87xKI
	HxVIkZJpYHLwl3CrfCiLO4WpHCNA8oXS3rkQpIWaFjgocArXQrcHj9QFU0X/NW4qLJh0ftFkSki
	7CkYovBEfFH0jJz7RrkbMAU5wAjkzW2aexb/vquYKALzQ/ykPuGMHAP4qkZTjQS0XjbJmI7B/yo
	ZNmF6HUuaw9Vrhq5cvayy3lM1kjAgcXBaWM7lBiC6vF7LVYywdlZ1OEcTtjpyBeBU93WoVoRZXc
	UHCEIlEig7YsDxJSS2JPAKOD6eRnFjo4r7UfuJBYDuSUJasLHec+vH3FjnhI2gWNUbSfG4Tit7O
	cbbHbOV4DYhT3GsMvl9fvfM11ij4JoWhU2KqI2S4gw3CkpJspQ8XVFezJDZMlMNZnkHTevHwFI+
	rvyiZYc1IDjTbOJ25cMsGHIzZYldJcgXL5SjR38r5N5XWhMfKIzf8U0lEyzj6UTxDjTSlOIsbDP
	PCntHo+DgQYFOszmSUPZ1SrAIeqhUxqRjbrt/3vbaBm2DIToRm48AqePbnggX17jXRVc6dcgEu+
	oMxzT/uV4LjciNAtsaqXY2iTHHaqhXF5
X-Received: by 2002:a17:902:f545:b0:2e9:53b1:a3c8 with SMTP id d9443c01a7336-2eaffe75f83mr68645205ad.0.1793262372227;
        Thu, 29 Oct 2026 01:26:12 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm30031585ad.16.2026.10.29.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:26:11 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Amin Gattout <amin.gattout@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add ArmSoM Sige7s board
Date: Thu, 29 Oct 2026 16:25:21 +0800
Message-ID: <20261029082541.469999-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029082541.469999-1-liujianfeng1994@gmail.com>
References: <20261029082541.469999-1-liujianfeng1994@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_012614_078288_BD7C0E8A 
X-CRM114-Status: GOOD (  18.19  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ArmSoM Sige7s is a rebranded CoolPi 4B. ArmSoM purchased the original
hardware design from CoolPi and confirmed that no hardware modifications
were made for the Sige7s.

Include the CoolPi 4B DTS directly and override only model and compatible.
This preserves the Sige7s board identity without duplicating the hardware
description or changing the existing CoolPi DTS. It also preserves that
identity when a firmware-provided DTB is replaced by one shipped with the
kernel.

Add a comment explaining the relationship between the boards and register
the new DTB in the Makefile.

Link: https://docs.armsom.org/armsom-sige7s
Link: https://lore.kernel.org/r/2a1c33c9-8971-4054-a463-60f3ceddd627@cherry.de/

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v2:
- Include the CoolPi DTS directly instead of extracting a common DTSI.
- Explain the board identity requirement in the commit message and DTS comment.

 arch/arm64/boot/dts/rockchip/Makefile            |  1 +
 .../boot/dts/rockchip/rk3588s-armsom-sige7s.dts  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 442d322a20cf7..c8a5a88a0e46a 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -231,6 +231,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-axon.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-vaaman2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-youyeetoo-yy3588.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-armsom-sige7s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-coolpi-4b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-gameforce-ace.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
new file mode 100644
index 0000000000000..c3282581b42d2
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * The ArmSoM Sige7s is a rebranded CoolPi 4B. ArmSoM acquired the original
+ * hardware design and confirmed that it was not modified. Reuse the CoolPi
+ * 4B description while keeping the Sige7s model and compatible to identify
+ * the board under its marketed name.
+ */
+
+/dts-v1/;
+
+#include "rk3588s-coolpi-4b.dts"
+
+/ {
+	model = "ArmSoM Sige7s";
+	compatible = "armsom,sige7s", "coolpi,pi-4b", "rockchip,rk3588s";
+};
-- 
2.47.3


