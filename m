Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83FECA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xe/85hlUcEsxOvUu4Y2TtydFL8DXWRl3gCCd21B9y2M=; b=Lv3OjDlTom19VagXFuRKTS20BW
	N9xsLUZLNT6799ug2GWzZRwrKL0YS2u/wYikmffAJp1xgmGuNdf1hdRkMwgaO0YH9riYacewilr0Q
	tzIxTv+q6hV4AAxgOa/QxyVqtE8xuNLr2pi2Cou98i/V0+mfe5Jm1fIUbzc8QguX0fuzgnNc/LE4Y
	fIMjRvMfk3MjaYLGpcC+M0CBtebDC18FaLpTud6BGF05PngVp3k7dS0pQJBSSX+QONChmq90nL+3X
	dlvuG2JLOpESIGRZdRS/bYQgWDlESUJe0hvFxX9e3YjthTZn0L7X+oliA/AK4aWzJCRcP7izoV2x7
	zwBrWPCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYQ3-00000002mPg-1yct;
	Fri, 05 Sep 2025 15:32:07 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV6L-00000001X82-3x69;
	Fri, 05 Sep 2025 11:59:35 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-77256200f1bso2118955b3a.3;
        Fri, 05 Sep 2025 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073573; x=1757678373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xe/85hlUcEsxOvUu4Y2TtydFL8DXWRl3gCCd21B9y2M=;
        b=Prr7y8d49Lm5pYeFOiRPP7jwwQikmRy36SDMu4W2kznbVrF703OkCmiHlsgpe6jevG
         2pdG21jSAcV2D6w33yEFFTU+mUZvQZfH9QaFIA/T8I9Zaw0lcL7NDh5ifgpfM+mp8mks
         KzA02GyBc0brShE1EX/SRD+LdYKS6a44d4rL/s5B3r7Mlx9Q9pO40l+ZAiZ7EEVYT9sU
         dXMfyXSunlKtYtq8kinqbkqSv0JRg+a1JKqGtfXph3l/PZDM7lZ0HnY+EcB1y026dIkQ
         39HmIYXNSvug4tA7cg+aaIKsiNuuGXF9xINVy3Efhoh47tIG5HEtYjaIjVaNysdrdPr7
         cOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073573; x=1757678373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xe/85hlUcEsxOvUu4Y2TtydFL8DXWRl3gCCd21B9y2M=;
        b=HKbxz6QSCoFeS30hFG67m04ubgQ0xNZv+0AhD0HfqhiIsVzRZq+m7oQuj5VGoyXsBi
         QXNQTGGq44nbf0fiNrrEMCyfGYK5aDhJHQ/I9rDkzT0DPJzMkol8PVm+TAfe49aHXgjT
         HRtY0956Aq9ygEGYXEF34/mgy5FQ+muGURvvjk/YEZFddzCdbGNAOwiryRbDOWaE2xqp
         bAzlhlJ+fuuClEgvW2iz9jDN/vggEDjEhJTPmIBTMnqMrjob0j2GgbHu47Gd4JNYwiL3
         WqzijrioH7TbbSCg9j5GNDp4Z9r2zBlbDhQF6Rl193vsQcCQToMNe7BEPbqLCjBbnQv7
         XLEw==
X-Forwarded-Encrypted: i=1; AJvYcCUlS8bNO3ZsJ838+JwsS4TOVvLQhO41PsUZwAUviFMhx/JMwG2j9XL+qGZLMHlw3HkCBV5hOvcE1o086wgC013fOA==@lists.infradead.org, AJvYcCVhbBTuqwBEP5EVHGC9RfVhAbVx2MbClXx2ftMyDNAxM2z4ID9v9vRuZ/laD6MCb3puobYEJXtexv1a4bCE@lists.infradead.org
X-Gm-Message-State: AOJu0YyfG2BSEjHIAU2fT1+mrxVaTnjO39g4g8OO9yCdE8gfnILRAenJ
	HLD7UFDhU8z5wu2l/lBY8kamM3MyYZPRu5mh+nzPzN/KTwxynFkKlXV+
X-Gm-Gg: ASbGncuO/LW7j8OUu2UFJE+WZVgqdv49c1AsUtWeSsOvD9TkBD5k/f973HHc/byQv6r
	UkzykukqcvqcArsHn5KYi/qeK4J4KnbRninUKEYJLI5fkOR0XZ1p9QGOEAY9geSNKmZpoT2jPje
	75sOEjSiw7qBrcJbujvNSDu36IpurYppfw9u+KVxbfnZPML2YiknaXIxmQvwCJFEs0Tbh71c8MP
	M8XLNWOpuSlgSrh3HFsXghGv3QgYIMuUbCNuQcrynEUFOrfXUcGQ+1Qf5qMBfEW8YZg+Pyvxz8H
	M7ufjuC9o1iCbWTaaXSK7Ah7lfH64J6+ZYEHuK9p+QPnlQJ0ezcGka4BkOnkWX4SUgm6279Ce8E
	IFIvTdvRKoYPuygRdLLYKxhhj+Twcmrnz8Vp4V99QKQ==
X-Google-Smtp-Source: AGHT+IEl+0xk7RVZLv7F4wywYH/rRyYrCOnztdqRPEMZQDUlqWWSAiXr6DyjaVRavuWX0eJOl5nnGA==
X-Received: by 2002:a05:6a20:a11c:b0:246:9192:2778 with SMTP id adf61e73a8af0-24691922d32mr15582255637.45.1757073573202;
        Fri, 05 Sep 2025 04:59:33 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:59:32 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 06/11] arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
Date: Fri,  5 Sep 2025 17:27:37 +0530
Message-ID: <20250905115836.7549-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045933_977299_D9344B8B 
X-CRM114-Status: UNSURE (   9.80  )
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

As per the A1 datasheet add missing cache information to the Amlogic A1
SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index f7f25a10f409a..27b68ed85c4c2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -27,6 +27,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -36,6 +42,12 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -44,6 +56,9 @@ l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x80000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.50.1


