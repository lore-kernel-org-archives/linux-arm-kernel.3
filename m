Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E97C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ+VTE5k0sR1ZK3QqyyvU9VyA3FsM9Zod0FdH9bBQvk=; b=mUUUzpLbIX+Z40YByxlNUAargn
	hcQ//DmlzdBSGs9eph708+Ss0r4YOKzRRAgJM+HNlStslIExM03GQOQQV8HSWy+L1viQxSNeU7UGM
	vqqb1E4hxZFPHTYa7YlsMbzB+GUANwmZfqefVu97aRAzVypQ4+5vox+V4YA00Q8PwSmadnRcPriZo
	ekQjLpfKdfFw/WiQsiJ7Gg4byyZkaKfjI12r/2bvRPtSQ6is8EPCOfCpSF9paK8VA5VSxv+wEL7Wb
	S5rb+587L6+GFXvtjIyu2UmFV3QCjkQp9YoGTSGPBHmXL7pEgjL9meFg9Hg0l28ww46cdn59Y9vX7
	3rvojNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tff4H-00000003KZS-3H9u;
	Wed, 05 Feb 2025 13:03:49 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfetT-00000003Hra-0TZj;
	Wed, 05 Feb 2025 12:52:40 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5dca451f922so6549157a12.2;
        Wed, 05 Feb 2025 04:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759957; x=1739364757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ+VTE5k0sR1ZK3QqyyvU9VyA3FsM9Zod0FdH9bBQvk=;
        b=lbq0lONY9GXjY/wDTRqQtsBZk1SvM7aEsv71rhlcVTSFlwPRAC86QkstNnDyx/b4iv
         QKUTzaUwZeMyzqhWbcpz44XsW52lq88grMPMDKUwOymA4817TvJkbCpCkEuxnLro3N5w
         iBRMTsyUyDCsnrJj4ZvYZ1UpMkTcP+X8RhTfyyQ61oQs4OTjmlUgz4XcWABqFyT4IULf
         Joh3/N2VxxjiyEGqipBRUCIP8zUKj/NvXBBWcj1JE0drqcNwNAkF77/CAdDWzsNBGQ/n
         9LOWjW1s76u/1zkcEQg7CgjwFj3vfPqoCyNibpN9Lq2xqlbXP2dIQ74Z8lIlcOHcda/i
         7Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759957; x=1739364757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZ+VTE5k0sR1ZK3QqyyvU9VyA3FsM9Zod0FdH9bBQvk=;
        b=cHlsi4vXGogqYNguRdqQjBo3cEQZ5IUEQX4ILJ/+mgZro1mqTxTo40t5sjP/UEXrmx
         V/PHSWJoeERWTZc4KOLcvprz7Sh4idOOQnVTKq4XrZ67Vgv8BlDZ7EIQvYBnASn3Z90O
         2s3yGeD6/1ioOKwxdJVTU8+rJxQE3fSnzgW/YmA3tDRG5CbaDSDKHZUsFGQngHJS5HOA
         KKr8U8saYH0LaeAlm7dJnIiq8wLiEmTwMdhvea+dxh/oYCa6Y1RumqfAxWmCUe/bqUoL
         TCxENjEizzqrv2wGSkpMHbMoqze949H/YN5LDeIehQzRebnugGjBrlMF+o3bjqH+n7ws
         kvCg==
X-Forwarded-Encrypted: i=1; AJvYcCURLxbJ1STNeKvmNEFnnR7vWCeP1qMHGFNfm8alEP5cuuKvnFr5z/BIUWVfRjt0jV9Qn9pLRGkMhD+Im+//6YJZ@lists.infradead.org, AJvYcCXHKTidACbe45kZOCilguLRV3YPHgXFgMg7q8XyB/rVNldN1kHE0EOUA6pW5jUqQDoBWqTyr3S2ur4BP24=@lists.infradead.org, AJvYcCXNpz2ciXerS+nGJZdltmGD3oeJFfpL4oThnbyAgeqxnQNJL2YM28U5OxMzBR0RL/4Qxmm46LVEmRVB@lists.infradead.org
X-Gm-Message-State: AOJu0YwTAhb670YgaxKQfHTJP/pJR1JH2GsFY5euuX5oERamT5rs4/ht
	VT/d9uaZBfKomt4t7Qu6iwniTjjsflFRA2HT/W6Pf8mXBT+3g2bT
X-Gm-Gg: ASbGncvAVI/z0hxUI2Q5goKKfcxZeOBTerglMpHNvZw7XqICGK37VLy4nReGPmNdwCT
	3Y6ZhquY4o8c1UsYRsJjawljW+RYhz4f/zz6THERlVsmtq0lW7q/PzNnys4O5MwaSJp6aSh0pbw
	tPTWbnz0VmNkDqQz+B5dBtgUxmDv1Pozx2Giw5fGUAMynr6PQyI36ajZ3u8uccGYfwVlGJg6Ao5
	+bPzbbFgy+jNfsps80qpNgTHTHciwrvLRV2/CrGxwUelzWQb5H5uBUjNyE0pzCSK/YZnme5qTos
	AT+WqSrUiOvLEwvwkGfiK8n0coII/reXKnzCUcO5DXFnCQ==
X-Google-Smtp-Source: AGHT+IGRhSv9Imhm+auTjNV2o2DuhUhkhyLQG8J8I3Ur0Zu+jneuDXHk2hYm/9qI5G8NhBI2TZOWSA==
X-Received: by 2002:a05:6402:278e:b0:5dc:c869:da4f with SMTP id 4fb4d7f45d1cf-5dcdb7645cfmr2783894a12.24.1738759957120;
        Wed, 05 Feb 2025 04:52:37 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:36 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 05/10] dt-bindings: power: add V853 ppu bindings
Date: Wed,  5 Feb 2025 13:52:20 +0100
Message-Id: <20250205125225.1152849-6-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_045239_150738_B9620F4A 
X-CRM114-Status: GOOD (  12.99  )
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

Document V853 PPU compatible.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 .../bindings/power/allwinner,sun20i-d1-ppu.yaml        |  1 +
 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h   | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h

diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
index 46e2647a5d72..f578be6a3bc8 100644
--- a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
+++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - allwinner,sun20i-d1-ppu
+      - allwinner,sun8i-v853-ppu
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/power/allwinner,sun8i-v853-ppu.h b/include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
new file mode 100644
index 000000000000..b1c18a490613
--- /dev/null
+++ b/include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_POWER_SUN8I_V853_PPU_H_
+#define _DT_BINDINGS_POWER_SUN8I_V853_PPU_H_
+
+#define PD_RISCV		0
+#define PD_NPU			1
+#define PD_VE			2
+
+#endif
-- 
2.39.5


