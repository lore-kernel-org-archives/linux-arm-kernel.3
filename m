Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456B6C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Imu1A98L2KP46AIXwK/kKuPHdfCAq0a74bOMQZLOfVI=; b=OmIG/wnYtiFQqRJFlDd3Rvr3qP
	U+Dw5kFdPbVxKn1NF/Oii4HhuKMuCTsiYHGTC43pxD9wX8TIxRJ2j6k4oItPNDbgDxhEDZ9I3pNmS
	v2TJFDJ9C6MZlMxiFUTAa5nxWxiM03kOf9PqOPFqlbGpLMKbj3R3Aur0scA2egyMOi1aKlrjHy07N
	vCU/OaC1KUU0J/OeqzzGpol9jPQyT9lm6dUtu6hg/mmfZj9oyma9WFjKajWZcAM8tcWL9lEpwcLYE
	Ng7wJBwD7NwxiTvvZQp1eWlLB9AwhTIN3yofzoK37kYR0B8l9rbMxg9pZ4uZpWrbAmjXensetQla9
	8fNLBubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB39-0000000B5Sn-0ZVr;
	Sun, 23 Feb 2025 12:25:35 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB0E-0000000B4qD-46vx;
	Sun, 23 Feb 2025 12:22:36 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38f29a1a93bso2827405f8f.1;
        Sun, 23 Feb 2025 04:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313353; x=1740918153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Imu1A98L2KP46AIXwK/kKuPHdfCAq0a74bOMQZLOfVI=;
        b=FxWtkZcbJD28kWeHfA07WJfgk8FXZZ49IEH0TrTP/g7mhIbY4iGPs4z11xSYROo2yO
         9q6v7mxVx+l/fJYt0ZYmH4ANS23W2rG/yjeEveW/8/z6YgNyKm70QCe03a4RtXgrpwKG
         40HabaCFSq+u0/54+eZQniDo7UJobh7d9A+NeNmrMjHL+2QQrE67UJVjpnF5Og0ReD+2
         V/yFoD1uhOd09pcUlLTCDLCoIEAAQL2AE7N6KmllP3ctFvi5c9tTeY6G+8aVFSxFDXEC
         zmxB16LchgLCCoyez1+v9ibwX4B9kzE3YkiX3fMgHeRrWRO3rGhDGsqzFqr4QJIVTP1w
         sKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313353; x=1740918153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Imu1A98L2KP46AIXwK/kKuPHdfCAq0a74bOMQZLOfVI=;
        b=FBCgGLwo94TaODK8hsHESuYyu2+FjqNcrE+0CAiYXN162tL+jmsA66IzES/AIpBX+X
         ENKRZH3q3HURLBAqkItEw5Ea9OjJD6gRCZ5b31JyTmRsIiM9AwOhzZhv09FsAzQovJqu
         AELdKZfV+PqLefPwpd/WEtRCKB/IxWVHNQVVw1JTRH3G8XBHTKf5hNUT9nlqnccCyuSy
         0kIOXstzwz6BYOSPRrzoZ9aoRnsGL96LSd29oy0z3YWoeuvO0e/LoS+rWQBIyUViA/0C
         niDCdp9rlDEFQXck3fgO0A5hVddolQluclVAxPImjAkNJbxW/0K/zpOh7Zjp50El1SKh
         rolw==
X-Forwarded-Encrypted: i=1; AJvYcCVC9hjfY7qfEb329XRA/qn/20cADw4wS4e43YsB2wyGlZb8RUl408eGu4gzt4+qDQZj9GHnUyWr/pSb45//zKFk@lists.infradead.org, AJvYcCX57LX+odsy3pITkkEgUpCT+wzYNdTu2UwcOkRU/ZrjweIgAI87xnC5ViWvvHRUfu2WfG8v+RTvblxs@lists.infradead.org
X-Gm-Message-State: AOJu0YxA9MXHfRecVn1LHWKgFsEWZ/KO+baLN9rvMQ/Gz0S79RRR1QLf
	knSOuBpyzGkpSP+qjBLMIKhZDNoKJ9R1myKFbQLlDgbwSrHusYGS
X-Gm-Gg: ASbGncv2LxUcEYsxvFXg1SPUeW8KXMD9E3Wt+BLq5jhvFy6NC2CNc386xfWMaofG/Nr
	kp3srGwuETXLJpIkt7Fjj3wEs4zLAijGjfc9570AqlfA1UImsM/ivsyi+pC81tWYhjxFP+gbWHb
	eN1Nvt7Nv8NQKfUrttyxbHCz8Yy1IgSxTFkIJ06ttwml81PguOlIezyfupMUM91tqnsTRZiqtNq
	LMNP6AfW6L7sX6HIbxrQJF1B44LsthxnuXyNJpKqZ0Ee2K6Hrvpi9XVbTc4Nix4VXGQEkUSrEkK
	+xYaNvp6C4h598vJOYGwaqpFVtQ6fJrBxQflxtEmwVAd3wXRhBBNFIhk4zocIxvoTwxtqKcmHnF
	EFw==
X-Google-Smtp-Source: AGHT+IHaUz0XhpP9SWkDpIHgSlmiijMV4PEbmK8V+w/DLEX2GzBOqorv8lkEfT706XJetrp/boI5lQ==
X-Received: by 2002:a5d:5888:0:b0:38f:2efb:b829 with SMTP id ffacd0b85a97d-38f6f0d1d04mr7837154f8f.50.1740313351723;
        Sun, 23 Feb 2025 04:22:31 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:31 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: phy: rename qcom,snps-eusb2-phy binding to snps,eusb2-phy
Date: Sun, 23 Feb 2025 14:22:20 +0200
Message-ID: <20250223122227.725233-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_042235_016613_8A2C2AF6 
X-CRM114-Status: UNSURE (   7.82  )
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

As Samsung has been using the same Synopsys eUSB2 IP in Exynos2200,
albeit with a different register layout, rename qcom,snps-eusb2-phy
to snps,eusb2-phy and drop mentions of it being only for Qualcomm SoCs
in the binding description.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../phy/{qcom,snps-eusb2-phy.yaml => snps,eusb2-phy.yaml}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/phy/{qcom,snps-eusb2-phy.yaml => snps,eusb2-phy.yaml} (90%)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
similarity index 90%
rename from Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
rename to Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
index 142b3c883..22c77968f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
@@ -1,16 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/phy/qcom,snps-eusb2-phy.yaml#
+$id: http://devicetree.org/schemas/phy/snps,eusb2-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm SNPS eUSB2 phy controller
+title: SNPS eUSB2 phy controller
 
 maintainers:
   - Abel Vesa <abel.vesa@linaro.org>
 
 description:
-  eUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
+  eUSB2 controller supports LS/FS/HS usb connectivity.
 
 properties:
   compatible:
-- 
2.43.0


