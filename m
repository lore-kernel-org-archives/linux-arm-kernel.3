Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F49109318E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWqNbTB8lPl7NXUj5bx+sUi8aqMzplYLnizvMqOci1s=; b=fCvT+hmHNIMhkrm9YsCL7+uAri
	s5KoOgR3xm9JNSeEVHt4zpsamBfvhC7H1UrpLlSRk5MCypJuNWZwIjX/uX1ctwGNhoOo1KK4Q+OsW
	ALE47DeL8Z6h36n+2hwpTRi9mAwmN5MTZs+CCyjeXGwG/tcvfEXDSjuw+w7DxD/NOchj2xSaUjIH1
	SEX01ybkk6kp5mlg1D65pNTArPJGPAHvBKbDT4CLR3erwTxAEhNwyP6KpIWCpdh0LrO/NOVfaG2oJ
	6WrWAWpwzNpGBLnVS32yirhqu/wyMXNx32mrS8s9jGaKlX2/oEb/DsFMJNZ2iJIGzz1jXCqrOxIcR
	5a5dUaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSm-0000000CNiP-0FmO;
	Fri, 20 Mar 2026 08:44:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSe-0000000CNbm-3sTU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b0603ee486so12511655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996244; x=1774601044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWqNbTB8lPl7NXUj5bx+sUi8aqMzplYLnizvMqOci1s=;
        b=R4f5CeqEXyL9fa6yaWjRAqgIZNrZhISHEDxP1e5B2krfUK7mL4SxII+lweqyBinita
         UuJeMh+4ehn/ZxENMHVo+8/LALdPIUuMNPYQ0JbzMXM6a1fAhHA0N1vMZn2u+LQHOTos
         r4wYrCGcsomG0mOhn4o7LcKmEJUnj+4kArQlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996244; x=1774601044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWqNbTB8lPl7NXUj5bx+sUi8aqMzplYLnizvMqOci1s=;
        b=tKSzQTnuoyjoUEcu4ZiTEVPS3llABQFeiuq0CSck3HNZA4zP3ClOyuRCLBzZwkUiqJ
         2Gig9c8OsxIY0iUESk6KSI6s6HkC/hqoHsis+QPlyXfc8RPrRz5GJ+zGztYFWt3sepCn
         uEuZGj7E0Cb0GXGUzhj+rbMb7JxvN+jW1y6XXP/Yb8NnlX2nsjH4XUta0LGTyvDp1+d1
         hsP+I4LfgtXg9OjUlQmLqpepSzzjzT/3bhsDPJyZ3K+PkzQs7rIK1aCnQ38NJ84zy1yM
         t/R2MNIs4/A3QR1+84RxXnPz8psCc/yR2EyvHCCSQ59LN4/iCfD2ZulWcuRrUvvnOdUb
         Av5g==
X-Forwarded-Encrypted: i=1; AJvYcCU/C5ZtEZI8qM718HC6MkD5KDBHsjpsHu1ZcwnkJjy46Ww14MH3aKMS6Tb4sVtW5rhuBqGdrOuEqLvPzd/7hJnJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwIsptr31nbUV44Hu3XkfR/glr0KUKqQlQRK81rXfy4MFi4DHqI
	MEHmZtzM0gMTzibCwrCCan4iZlkq7GiF1cQnBX3b+v0okjBlUtlS/gfYSgN7tCKJyg==
X-Gm-Gg: ATEYQzwAMIWx6tXjSXVXGl7O8gb/1vw1/SBJ23eXmGlFFrhzx1KQ2PkWKtIvD3hkeFu
	2wuugqhvStJJeYl6m8/iCn2llNKWKNsc476qUZMgUH8gcsvsCDt2c6zwYpm9Xbxkrrc4GFs+MY8
	RyMahrBazj1k4J5R1xcztfm/xNTxNM7qbxH41rFeTUR3E6cQFw7bwS+rhBQNxjFNBfg8kog24Up
	kwrS0WEVczeMvSKe3tNt1g2s3vZlSfn3ovoOf8mJ3Dvhn6/rsv0mFHjfNz6GUE6lGiWgCDIOGFz
	kiQCsHnoDktO1l+L6yU5TXzZgSRKYMI+IQn9N8Hbhe6qekZw/AZjH042lf1domYhC70c4XfApp1
	AzUg2nh5Mbgy/xfjltvQv210TL9uNNpmnoQF9i5fdKHMTWhImtKaaTlTRYo07D8WvNpWjVOLLn/
	rbkA6t+iGsqW4ieAYVLpuNUCfzxIgEWGtUi9uQTt9K6/7IfNzufxt7lFh0WYCdZwYST2dLbAUoD
	hicNqIq
X-Received: by 2002:a17:902:e551:b0:2ae:6755:a258 with SMTP id d9443c01a7336-2b0826b8b9emr20276665ad.3.1773996244137;
        Fri, 20 Mar 2026 01:44:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:03 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] arm64: dts: mediatek: mt6359: Add label for regulator sub-node
Date: Fri, 20 Mar 2026 16:43:34 +0800
Message-ID: <20260320084351.2461060-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014405_012962_7F91AF17 
X-CRM114-Status: GOOD (  12.93  )
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

The MT6359 regulator bindings gained supply name properties. Add a label
to the regulator sub-node so that board dts files can reference the node
to set the supplies.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 1c41c4701319..a3542186fc64 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -19,7 +19,7 @@ mt6359codec: audio-codec {
 			compatible = "mediatek,mt6359-codec";
 		};
 
-		regulators {
+		mt6359regulators: regulators {
 			compatible = "mediatek,mt6359-regulator";
 
 			mt6359_vs1_buck_reg: buck_vs1 {
-- 
2.53.0.959.g497ff81fa9-goog


