Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FE6C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHGf9I9jetcKSy3ZjSkoEOOlmvfoewi1ZT4SC8hFxRY=; b=XIzLDfeb8UJfpQTF+OHXQ70tW1
	ozXP0eaUQ/XmIGvFp3zsMFbM94Wy7M2aiYIDPl/0V3aaKGJOgTJKcGl0oakFMxt+PcQayKXKsw4Gh
	H523IWPqcqPm3hVMZZYi3DQaE23rYBZnsy48gsdSXs1vAZsqg5Skj0uf4m9l13bJOA3o70LCCDcYp
	iXVsOYrXjFyfL7mw5n7scv3a10FXuqSeZzakvOSjmxZqOC1358LkU0T1hmMjePDgE/B4QxYIFj/5K
	wUlJ4oVxAoGgjBe7hsXSFKHIRcuEdn1xarvBOw3BH250j6oBAlDM3I2oUnCw4jbkemjKIHOhczt+H
	tMXuoQeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trH4j-00000000d5g-32WC;
	Sun, 09 Mar 2025 13:52:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGk6-00000000aXM-3xBz;
	Sun, 09 Mar 2025 13:31:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39149bccb69so9069f8f.2;
        Sun, 09 Mar 2025 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527057; x=1742131857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHGf9I9jetcKSy3ZjSkoEOOlmvfoewi1ZT4SC8hFxRY=;
        b=dIa278FCxXt6INTi0DNmegQV6IrKW5DUTBCBO6eCloLt/2ZRsA4eIu1aE4EZ9UaHqP
         emtVM+UwySfmZ4nnlndNeWsrVOS2M1vjA56x1oLK1sm34WbqnjuWrvzM+EigHikPUAZm
         DtWdZaQJVSR/mBwRb7w93i7vyekBWSn7bhNVOsHZQGfZRXI5wjgzIdCLF2uezrsvKDJk
         NSDY5JlhG1bXQc7B8okHcwW6ByOHq8TovSjmAQZk+MK0rgNSJgeDwtEh1jE6tBH0crjQ
         GMFEJarvyINr8cZ9OzCNyHmbTIezf8vwzrE2FBMQ+L0EhwmNvyjRnEPoprIHmhR3ZT3h
         vCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527057; x=1742131857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHGf9I9jetcKSy3ZjSkoEOOlmvfoewi1ZT4SC8hFxRY=;
        b=oDbusejMWsUAY7G01NjH4iBxoXsZ8PVa2qpI9gddaQV8cAxC16+XKrNDCMXIZgkZDB
         cmEl0c1WEravhL2hNaXq+tGYrjYqU1mMfVvz9iJXt5voz+WtjBEJkPJ3BFWwbOEywc3s
         eMkTAG89FSrWeg8tMMvOpyaJvpPPpfeW93BNR0LzdoWOQgoqjpfDxdheCDIpvMLguFrj
         92GnxbFb+YZgsScJHT18P8F+VNXc7ZoNaJsqgBI3a/Jps3KJKc+pMEobWUKNcJgyp8Ep
         ktvJMKhz8gtKog6fA29trLcKkQGxO23Yr56XjkXCijW3WfmlQJJB3e9YmVQ6EeuArpa7
         ncNA==
X-Forwarded-Encrypted: i=1; AJvYcCUoO80Sf9GXTPtiup/+QSdZYhDutCdoZgkihe8YVqjvFQWQ0Bv37VTi/m6iOU0vwg0Qe7pIVANxVbtD@lists.infradead.org, AJvYcCUrCYxM7y6A1opaDIsy3Z7EBXdHW31jGVGPfGDTOcuLxS418FQGbVpQpPXXLNadmOyTtxez/zRkAF2S4fK6nTRq@lists.infradead.org, AJvYcCWk9mhqTyC6/V+mx7YuakKbRoYI9AK+t6oGk5SAVe+Qlm2kR41adPzGqaPJ9U1wK/aSLzL9rQetablbI65dcNQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp2LT6FIq/tRtVzXlZxwtoMApBu/YlWvdnUNX8X3oXVqDgiDTA
	+dUXFaYdRVId6OLVC4RMxFnEmxoGWOd4lFm/C7uZIqVu/jT5Dq/G
X-Gm-Gg: ASbGnctI3xT8gBfcwZ8FJEMPjN7Go5Drmq/AIQZJRTWOEozn+lwQp1UeQkVkqSNnsU+
	Fd9a3fDwPwnegMboLHrmqaBhU6r2YaTmI92Y3At40BuLNzTMAh2K/yn5sSN9Ieg0bpAjjmFtpTR
	bC2gDkli8J3fDUgfeKh9uwEG3Kqvp7AR57AgDm85KVfci8VBWiq9n3GpEHW+gZJV8vbe+q9uFzL
	a120gtwQ1EC1D3x019xIAdSnbYy5eKFq3bll5PSCipE/18t+ivNvHOQmOD3ykv0Lbr/ZGw8oYpF
	jVJlL2BTSvATqB2VtfawHZVyaMIomimd1ghiTqF6/p7D0BulrC4tAoD5vH0tYcxjjMXWhQKYNHf
	pYEVwITNZRhtOEw==
X-Google-Smtp-Source: AGHT+IHh2pIg42W9ZdtyAbGtU1E8eclkophsMoFuh4X5tdSn2AE1TqJ6fGru5g4aiRfyb7QzTWo1Eg==
X-Received: by 2002:a05:6000:1f8f:b0:391:2ba9:4c59 with SMTP id ffacd0b85a97d-39132d986d7mr8560947f8f.43.1741527057566;
        Sun, 09 Mar 2025 06:30:57 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 12/13] arm64: dts: airoha: en7581: convert SCU clock node to MFD implementation
Date: Sun,  9 Mar 2025 14:29:43 +0100
Message-ID: <20250309132959.19045-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063058_997605_28BFFBE5 
X-CRM114-Status: GOOD (  12.01  )
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

Convert SCU clock node for Airoha EN7581 to MFD implementation in
preparation for USB support.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 26b136940917..dfc12fa99748 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -173,11 +173,16 @@ spi_nand: nand@0 {
 			};
 		};
 
-		scuclk: clock-controller@1fb00000 {
-			compatible = "airoha,en7581-scu";
+		system-controller@1fb00000 {
+			compatible = "airoha,en7581-scu-sysctl", "syscon", "simple-mfd";
 			reg = <0x0 0x1fb00000 0x0 0x970>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
+
+			scuclk: clock-controller {
+				compatible = "airoha,en7581-scu";
+
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
 		};
 
 		uart1: serial@1fbf0000 {
-- 
2.48.1


