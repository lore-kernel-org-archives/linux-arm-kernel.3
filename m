Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D26C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/kT84H5qLfmytF8BSF9mlL2QfF0LoMNAWpygrqKleE=; b=fWa09QuQuAxwKpWhSomx9CQQEn
	3KSx9KyakxNYERL2aX2MIph703iGDraF/BgXleSETCEskf6KCQsaUj+JQ/++IkW+2+lsTioLNSwTK
	1pyRa5/Gq4PKuDRn2qjeu0C2jJTVZcUMzWEV/b292CIEgqPmhrDKSecEatx2mZvhdIHABlI1RL1Cj
	Mdku8HOClHtNuroaXfbhIMt/jZrkqVwoyuMPwsu6MT1DqJzzMe4Eo8zEG3y2+WKdj7/9U9f5x3TT5
	jz9sBZVIskD8lsiorRpvkHL1+2iWeFEIEUkHqom30rSxyTaReuBuEqCxtxeknkP61HepsnLuF6JIa
	2f54BPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tievh-0000000CPVw-11xh;
	Thu, 13 Feb 2025 19:31:21 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidqv-0000000CDDB-1giR;
	Thu, 13 Feb 2025 18:22:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5de4d3bbc76so1945244a12.3;
        Thu, 13 Feb 2025 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470940; x=1740075740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/kT84H5qLfmytF8BSF9mlL2QfF0LoMNAWpygrqKleE=;
        b=FMuKJKisQTmdHbV5+v2MHUgjKa/vyIxPlQwGfS1KWvrBKFgo/k+5yedlp5e0av/pAx
         YkxkEV235eEUtRSbN+uKJc9RsolQgXd2HprrICkIv0pPYcoOi2NIjqBUhHVFSs4FACU8
         uhOSH3nkmqutv0YrWj25Cg2Rgtoetj+ia9bjvfFFz/Yk/ONXZLoKmGLSIIJhB14otoYw
         Z6vM3x2wpLsE2McetW+B4ROBPNyTpD8iOhFxgFFQGVgDorQmNjiRRQF+nzb3tBTCwU5D
         CcJ5I5i5Zkd5FH6RXyo/ovo6bBEQc0DDkTrxMVYRztBvKFMWgjEQJdSDnquNblkk0VcP
         GMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470940; x=1740075740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/kT84H5qLfmytF8BSF9mlL2QfF0LoMNAWpygrqKleE=;
        b=CCMqdUCAeiAQhoO9KhDHgXfDaou6b/Tybe3BQO/VgOhcOBIEgl+je+FrIx3mhQIr4e
         aitBYimBzSKtoy0/PM0JZiY8WRQHpPAEEuH2pUYQp4Gl/GIOIbArvZbXud51qnp0Q5QM
         Ly6Gq7coapfoU9o9Udguviyah6iJiTvqEK0S/LX0AhAYaULaAXN1yOA/B6JTY9otGrwT
         f08HS4GIAWCQqDyBJavWedvQr6w5Jn13GmRhdjHemSdkiX5F+sV/sgTchjKOqH/uahfd
         QqQ7y77/7HdGQdsW86y7xcd1LFgn8T2rjShRBRM8UvUqMPjk6gpk17raiomcoV55q2+p
         vekA==
X-Forwarded-Encrypted: i=1; AJvYcCU8yHGxufs4pKJNCjNtFVe4kBjrNApRsKaRTBFuTDysF/1owdrYPnO/NEKpHKqJG7LbGRk4yfkzQg2D6Zo=@lists.infradead.org, AJvYcCXYk4jQDtxe+RYk2qyT9kJvv26YHWHFeAgPk2EptkKJVG1ybdtTwhGiFpTRR5cODYjli83ixa4OwDGU/4/yNaYg@lists.infradead.org
X-Gm-Message-State: AOJu0YzDSukzdqYzS3yFTjfv0DYzpVUi/HRfNdNpDaGb+kLqc97THJK2
	urIOQgfcczxSJrx5CypWv9VDWyRPFMrLUUNw20NFMMbhlGElHdNo
X-Gm-Gg: ASbGncu4Qdl61CeblBdArgTnNmgZKT4oH4qIOy6P8bL1APj/23i4a0LjuAdwkhGRBP0
	vQFR9y14ICL1z1E1JF0aZOCbKmCJ/A64zreZwBQ9i/xJzou0rLWfjtZzp9/fYgXkgoFw4FuOJGf
	Q6+aZRezCeXNRarWiYd1Blj8F6bGonY8SJu4gJ5Qf9AszzguIDhHiu/bOCWX8PDrEdkp/zVM/gG
	hw9aL3sl1k4ZvWHgjhGQBX8cGVzUikoWcJEIcAV6Z8Jr7GNai3VeyU4Iu3xJJnZrHDjW98PQyKs
	sZdpIDZVY87y+E8k6ZPCNwRDgcwy
X-Google-Smtp-Source: AGHT+IGGrGvhErjvZtc60pickMx2DJtsHlYMmMxo5AoPGkhiDOh+yM3BqjtVUmG4xl6q+XzV1ek+KA==
X-Received: by 2002:a05:6402:4316:b0:5cf:e9d6:cc8a with SMTP id 4fb4d7f45d1cf-5deade00a52mr7137331a12.20.1739470939543;
        Thu, 13 Feb 2025 10:22:19 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:19 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 5/7] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Thu, 13 Feb 2025 19:22:06 +0100
Message-ID: <20250213182210.2098718-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_102221_437148_34141630 
X-CRM114-Status: GOOD (  13.30  )
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

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
v3:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dts not to use underscores;
- added status = "okay" instead of deleting it;

 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..3a32b157ac8c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -28,6 +28,7 @@ subdir-y += realtek
 subdir-y += renesas
 subdir-y += rockchip
 subdir-y += socionext
+subdir-y += sophgo
 subdir-y += sprd
 subdir-y += st
 subdir-y += synaptics
diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..94f52cd7d994
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
new file mode 100644
index 000000000000..b1f8a5787861
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000-milkv-duo-module-01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+	compatible = "milkv,duo-module-01-evb", "milkv,duo-module-01", "sophgo,sg2000";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.48.1


