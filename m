Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DBC606EE97
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M/xgpBt0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wx0zE0cA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F+2LoF4byTV9cHv2bO2DvByyuIaiEa2hM25/syzMkH8=; b=M/xgpBt0ZrPws7
	1MibnhMZfhSPpGWlScT94ogsLen/7/j/ZzMsp08L8M+VzzS9vlAj3aj39udVWi78bLjTVDo90yRy1
	daL+GLOnSAnwg0iAnIU+OhJBSwoSZBEQPHARxxuQMqfNkGjf9VGT805clBFgAXewtshra/Y7tbu8k
	thlQ5QGmcCUzcqIynIVL/5pdoC4Ms3vErcpkOEKZrW8XddLvt39ggbSpm5lYgt3uGo7G1q9HNiEdh
	P/NqNyunyilv38OXkXchcg8edMh5DjWgeqDylEYCyd5GcJzCxmvVf0gjCY2sCmdJd1BzOzaobgsP8
	6YUpL4FxI6Z4zDZ0vzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4ge-0000000AgT0-2cJL;
	Thu, 05 Nov 2026 21:07:56 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gX-0000000AgKm-3rMI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:51 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3371285a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 13:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912868; x=1794517668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+2LoF4byTV9cHv2bO2DvByyuIaiEa2hM25/syzMkH8=;
        b=Wx0zE0cAvVIm0/g8EV+pwTwHD67XvXJkNgC87FWb/JY6ciuBt3mtJymPHEesJp9TLx
         qQ00rhLH8Tam4EENt03SMK9R1Ee2KyKeUg/3DttI+0YO4Z+or/79wuhGMW93gTkWYSil
         tnsTR+/QLo9KIvaslPeWkHbYcs6Qw8IKvwAf+0TQcM09/XZ9kTgzmM6NWZ0TJrvLFOFH
         vSiScsUBQUESwvGbaCUZwdjuwFxxNcYd+hYfXxzsQxBeHcFWdv3flVqevtijXoyc1i3X
         JGshdPLMyk+nBRQ+u9ET7oOl+3VpGE7BN/mmGETIWCyNwnoI3y6elUSGtr8OgKP2C37Z
         xm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912868; x=1794517668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+2LoF4byTV9cHv2bO2DvByyuIaiEa2hM25/syzMkH8=;
        b=LWL7i/Y6u9fz3AScn/Wh2IpL5Lmd2/EO4kkOzk5AXr+jhOz4xe+jt16z7CCtweGL1L
         QnANaOIDh0gyStboV4tizRrQ5xfVnvn9C9glkrUtrtRAAvun7P21pGv0FvvrOEGGW5UU
         8ooBG+/9+TLA3kFmWoOSx8uSFsSAx94cWWWxwGXFs8BHe5CzivG69VU8jveoFihpTKCr
         QoA8RxwytGUcR8sB3c3AdH6PTZKCS7F/p/UEOLUwLFPt7U4qiioOYnhS3IvCymgPdAVi
         fO54xlubCgrh6YPbB3wwAXDyMGxLiiOYidh4zLMQWRQnY6cChK1L2JagReOTuP+nQJP0
         bjDA==
X-Gm-Message-State: APuU4Z985O7Cp/zmiqr94paCfmCTUV/oLAftDVAiJijRZ2NI5LM3YDMp
	RMSeM34JvZAjHc3JQ4dFTjKO0JVr6fBrBtp6uy6rL3zYCFfPJSCLfUFV
X-Gm-Gg: AYBFou1xWe0H3KU8DRdmITnLrfthT+bXl+vHnTZcJklQEUbM2taIFMbdOzT8i16B/mL
	1xR9jXYFaXXXKl9hjYUi9AuYgDmL7jOIR0UK81j2sVKl3KMkOD3btPM2EXE81bk4YYUGUIcjp9x
	Rs9kVul1pbXM18rL3hDsv5DMtPwRqPYBRhkfu759Dcu9BMQSE+v2Jm9Ki2wmX10Wms1IqxtXTKb
	9I46JkCqg99ARH96uyCAy1qADrHyjl5YXJfeBF9TCdu/BqvXLDBhJL45U+wGRH6mac3btZe0CZi
	2fDqI4bo1cnhJx3SKd8Hc9XTYAntDGN+jLfEeG+k2nFCv7MJfgwO5hf58lFituEu26DmJVVXXKx
	7XWlMXB/H3S68JK230MgQxfcCUzJXAdhn2y2Nmr7VWPjWp+hMGZn4vV79s8V+s1Ac2uVMq7Amlg
	w+rhWh86nwYmncpUR68/329rEnL9Ho/ALO8vr4BFUEOB6AhZBBodOYKEdC5QeO+Hevn9Idc4Ez0
	A1znlMgOIFEAdzeWXR+rZIyOXux/0RTwaakaeSDHFYjs9dkNBU0MFr8sqHKoqwL1TsCnRhuCYdZ
	ZNlZR1ExgFv7dYWycj0XeDxOLwE/DPI4fq+dzfGMv5/9iruHIg==
X-Received: by 2002:a05:6402:3808:b0:6b5:8758:c1ad with SMTP id 4fb4d7f45d1cf-6b5975341b5mr367900a12.3.1793912867890;
        Thu, 05 Nov 2026 13:07:47 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:46 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
Date: Fri,  6 Nov 2026 00:06:03 +0300
Message-ID: <20261105210622.523747-6-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130750_055862_0FB3B335 
X-CRM114-Status: GOOD (  17.67  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
console on UART0.

The DT only describes the memory that Linux itself uses, which is the
ramoops region. The bootloader updates the /memory node and adds the
firmware carveouts to /reserved-memory, so their addresses are not
hardcoded here. This DT must not be booted with a bootloader that does
not do this, as Linux would then use memory owned by the firmware.

The ramoops zone sizes place the console zone at the offset where the
bootloader expects to find it.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../boot/dts/mediatek/mt6895-xiaomi-xaga.dts  | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..d73489149ab5 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6895-xiaomi-xaga.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
new file mode 100644
index 000000000000..f53425c536c3
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+#include "mt6895.dtsi"
+
+/ {
+	model = "Xiaomi Poco X4 GT";
+	compatible = "xiaomi,xaga", "mediatek,mt6895";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		/* The size is updated by the bootloader. */
+		reg = <0x0 0x40000000 0x2 0x0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* The firmware carveouts are added by the bootloader. */
+
+		ramoops@48090000 {
+			compatible = "ramoops";
+			reg = <0 0x48090000 0 0xe0000>;
+			no-map;
+			record-size = <0x10000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.56.0


