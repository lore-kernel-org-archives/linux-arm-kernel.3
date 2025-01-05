Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43ECE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtzdoCK1pLVvB1zE9MUnJC58og1L/CHaPNxbBawxTyg=; b=ZW6NcHfCFdvW4YmpgNXCuMl33l
	5CNx3uUCvrjSF/wxkjvLOi1XQre4rAUx35Lo1/ohNHNkAWxUw3+tKbg0DeAAwRbMlSLz9cOScRGM3
	A5icxmTrCs7oB82d6bzkyBpvwCFNJvXfe5z/T+a6/2IVX9PfEu2brXLdq5Mt6WHMTVenYCQxqh8aD
	9hC+J7RQnKRWBSsfks3s3CBWYElDjVq6IGbyTBB3U2qiPppB1tQj3hZe+HHRe/xQibrlsAXRavSH9
	cz7d1jAoMQTnKgN7d6jIPUWhLTyNdeVdQYo7jqPnD9RZ6eU/9p8yhL2Kkm+nP3bxGLd1DB7QQuc1h
	RScQzppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUSCw-0000000GxjR-1q5u;
	Sun, 05 Jan 2025 15:06:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUSAd-0000000GxRA-0JQh;
	Sun, 05 Jan 2025 15:04:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4363ae65100so140793045e9.0;
        Sun, 05 Jan 2025 07:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736089441; x=1736694241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtzdoCK1pLVvB1zE9MUnJC58og1L/CHaPNxbBawxTyg=;
        b=nCpfoeq0t2R6zExlBwp26GiCbQxAH0ihqHqqvcki0h5ZROOh3CgtcWq1mKvm/2MOmt
         ITdGprVGomL+O5bb+BUcWS8bedLKMnc1zUYXTsBm6Iw2hPuLDyF80ESC3bT7WPioQ/N0
         QYciI0A0rf1TucdP0Jyv59vgxMlC0rJmGe6rHbuZqeSM5AWANmxkKakXVBBU7SF4ml5/
         bf+9GPRxmgxCMW63PY+n/GSymFDddDppr45pImAs6jvt52kLlN39FYCznXlog6+6VWlZ
         jK+QruNoJVxeu5130uL2L96bzEY7ZgazaZ6EmzMdEfE/hdTI+2KNsICoLvOqf/ZL5Ntf
         i1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736089441; x=1736694241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtzdoCK1pLVvB1zE9MUnJC58og1L/CHaPNxbBawxTyg=;
        b=DuRyIkdzsJDHlNThmCs1XJA+QZBw6I/JyxGUmIKu9frKZVdAWI4vnBgvFKOFLSf/cP
         1XQ92wq8FwRqzQ4gWC0fJ0m1qCyprU2NL/FtYxlL1/3SdTELw3yw/frB6vJpA/IIoG4V
         xMjDjQUZWsMRvAIuSxngFTs+qhVBZKAJ7CFUxs8r4Y7QOxmT0mcCzSMa4W6RzHzFbOwQ
         Fv71f0aPHHmDB73aInoNdSt6fxxzWK7Qxa9Qr5EWzkUDaZpbM7LI+cCOcHSumdqDmEJZ
         wNManBUlDHqY4kjVwko+/0LUMSR/JTukXQ9fIHfvnI03HFm3Ej61+NxbC1gw+9cFfyz6
         JU7g==
X-Forwarded-Encrypted: i=1; AJvYcCUjOWpxiqlIl2n7sk+CuZ0sqGtymy7G7HEUSg84Ii3tMp+BpLaIxUQcvTfJAjvxWshA532Brw3NKD52Wl1GbohA@lists.infradead.org, AJvYcCUxYQhK9D/R4DM+ggkAifas4PCygN4r52fiD+EA4rjvUhq8UwOWMzRai3rAh9w/PxsVR0Yvl9TqmRIbz5lHJAg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDJI2yYZL+8pwqMjqxS/JibH9WjLZQ2c7V0BArPTufIUrmV6qV
	+65SJM4hUM0d57EWKEMetiUpukDzIa8pzK3XEjXHUJRNVYlL8S2F
X-Gm-Gg: ASbGncsWpoGLcYXJXj04+zKT7tEcIE2zVkFmV9CiZ8/TRX01WZTXgRKjeu0OWVQbBBu
	9bED74CevU93t+IMaWJ1oaJpYNxuAOdYigJHMqcff+veCRWn0OFOyBdK0+lPWcomAbqgSN1DcyC
	fBB4v52PmcrbYKNdQjPbNn8H1Lq1HTIw77EDIAUWCGzNBQMHY4JCTrHDnSD06yzwHr2PBGFYbjz
	kmjXfh89ashvg1ySinnHNhqNYGxmdhua5bby3UWTlIMCMkrAgKpBFlyHnzoIzwazLnFZy34Lmdk
	ijkHnc4nrbnOAtozpHQsc6mBo+VkWjixj3F9zjJopQ==
X-Google-Smtp-Source: AGHT+IF280nSFgoXoUlNi8TvaM3rt+A989qx+fLP3YDk+HkIfh1cCeGL719PHIZ5TukaCSGyzW/aog==
X-Received: by 2002:a05:600c:1383:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-4366835c41emr474736025e9.4.1736089441256;
        Sun, 05 Jan 2025 07:04:01 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366128a62asm536258685e9.44.2025.01.05.07.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:04:00 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Danzberger <dd@embedd.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 2/3] arm64: dts: airoha: en7581: Add SNAND node
Date: Sun,  5 Jan 2025 16:03:03 +0100
Message-ID: <20250105150328.15172-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105150328.15172-1-ansuelsmth@gmail.com>
References: <20250105150328.15172-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_070403_110463_0A7E205B 
X-CRM114-Status: UNSURE (   9.87  )
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

Add SNAND node to enable support of attached SPI-NAND on the EN7581 SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index f584409e72cd..dbd296b049f9 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -143,6 +143,29 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		spi@1fa10000 {
+			compatible = "airoha,en7581-snand";
+			reg = <0x0 0x1fa10000 0x0 0x140>,
+			      <0x0 0x1fa11000 0x0 0x160>;
+
+			clocks = <&scuclk EN7523_CLK_SPI>;
+			clock-names = "spi";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			spi_nand: nand@0 {
+				compatible = "spi-nand";
+				reg = <0>;
+
+				spi-max-frequency = <50000000>;
+				spi-tx-bus-width = <1>;
+				spi-rx-bus-width = <2>;
+			};
+		};
+
 		scuclk: clock-controller@1fa20000 {
 			compatible = "airoha,en7581-scu";
 			reg = <0x0 0x1fb00000 0x0 0x970>;
-- 
2.45.2


