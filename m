Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1068DC678DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 23:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqgDsCG6KOcBqitJq9JMX849ZPDRQzOs3fqgijVu2+M=; b=Boie6D4pKMX8vobu/N/thulBFw
	CLupgWtong6XLptbh5SfKJhDMCfRy4J72bgU/q1tQXAmZBbUepnnX0W6bA7N6wQ9//Jyt7n7y71Ny
	O1mLkk/HRAfoE9fwuUbiKsVag/Tog5Aeu83GSW0vAzpGs8UVNI6Xvq2diRjQIH3726kZ2JtOLytEf
	dED8B21ljuizslp7xVnRKRPF/s1BA//LpU0sD5NBaO/2nH2GHkGzjFC7pIAIPuTbjE9D3kWrKPOzf
	jrwCcmQxokS5Upap5U4KTcZpw+t0rOBIzaggfVxiccPgvjeWiXDQUUyTj/hSpdFkckBnd2hhjIPGv
	4Eta2F+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOmIN-00000005TT5-2lOV;
	Mon, 09 Jun 2025 23:52:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOm7m-00000005SF3-0ae1;
	Mon, 09 Jun 2025 23:41:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4530921461aso15416555e9.0;
        Mon, 09 Jun 2025 16:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512513; x=1750117313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqgDsCG6KOcBqitJq9JMX849ZPDRQzOs3fqgijVu2+M=;
        b=nD7c2FjSB64E6eapOViTdwSMP0PgtIBQTNILXZ8MMNNXtNlEzWE6FYocN7dyfjzdEk
         Gwe6O+4l52YcOBVMdcSwRyL0z5dXjy+e3rh78gDynoB+dyZRIrMYktNc8+nkIBUBcSiy
         iCQtGYoDoxDg97mZd6Q1sbKi4bzswa9Nbs78sxmd5xl4uKtyhXfI4M3px4de3P51x/V9
         nZocBjIHkGmUQcF0MguskgN/DUs2meeitM3ycwH12frQSL7/EZ93dTXHbvJTTtbHod0G
         /aXs+viCYNa+B4X4DIPlYSND4FmtSR1VIBhUUXHC0OijHmsOcL8YntJYSSLX1ChVXqfw
         1rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512513; x=1750117313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqgDsCG6KOcBqitJq9JMX849ZPDRQzOs3fqgijVu2+M=;
        b=DhGPC9UVc5lFWBQRys5SvFcLpA3bJ2X3rLIO60EeEE8LC3jl94SGv2DoPla290DBk8
         ZQVyRNmUe8adQK/t4O96LD/JO7koqGU3nsZzoccpc9YiKY5mrXb+5zZBzqXBEK0mZlRh
         PPss5jYpkn5U5m0rsWs1/pDdI0ZJeqoCpqp0SYB3AIgKEjWdP8T6w+BCVt2Csta4fdYl
         0NvEC+r2Yxi9S703gTknqiefdZPBhp4mEKVJ0/BCNBGXfJxu4A6uv7pkA0ts5yd1iHQv
         qH+2mUefEZ51IIwrUymftOs/guHTFoWJcVSX6jVv+26sljAqQJzPe5xXT6PPIcPyFFns
         Mo8w==
X-Forwarded-Encrypted: i=1; AJvYcCU0DoLHE9dVL0zu3JXuAeNVSOOL7RH22jWYRYGn1k2WtBZcf3xtiYHKil+Hw3weEt9QiEUXV7u+uJ/IJa8=@lists.infradead.org, AJvYcCWIopTa7aPjmSrZzwyg/E0lm6H0dQ2xwH28Celue19F9uzkUWrckWA7s+wGeUobJeC/9VBTHUUte1zbVC62w29Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxKmjhLY/zl2amWd2hWzrwejYDv4E7Qmf3A7jpXGqPUZpdFgVxF
	57aY0oz7tuix8LQ7P7MsuE5U2ZzIrF1EDnJJHtHLgsIABhNDuGL/Ad93
X-Gm-Gg: ASbGncvkSr7GmixKzgjcOYAWAQE1WIQUlfv4WNTALuP37azGS4cqbAo3xWvf2tAE4Ji
	2cbkILN5ZKmLbkE8GPJXZ/fV+CL3DCpIBeMwFIXhuUqpIOyFLth12mc+/6NkQlpyj2wvpHDjFf5
	jLnZDSyltJNnzNOXfBftAwia5OkdH7lDYT97LHgIoHc7KzR8hqzYJOePwKNslN2kfbJ78hRnkTR
	7hPYvEyewvyEm2ZlT4AcBrMsBBYbOjeotOwunPW6b8oDuy4GWHEW77wMegfhetfxveJn1Tgxecl
	kvxg+X3nw8wYbnfkFIRaiVZ+FQ48c8gcJ1Ur5pH/4pVNgevS5D0J1TjcFzzDb43z7UP6Z95L6ps
	=
X-Google-Smtp-Source: AGHT+IG5E01PKSBDa2CpXIcLDEcgVeBGbKs91/xwnRq5LzqDPbtpo47hhaQbCqu4sMTtO6Hc0+CScQ==
X-Received: by 2002:a05:6000:250f:b0:3a4:dd00:9af3 with SMTP id ffacd0b85a97d-3a531cc1d47mr13174436f8f.56.1749512512569;
        Mon, 09 Jun 2025 16:41:52 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:52 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Tue, 10 Jun 2025 01:41:15 +0200
Message-ID: <20250609234125.722923-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_164154_176289_AB3A28AF 
X-CRM114-Status: GOOD (  14.31  )
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
2.49.0


