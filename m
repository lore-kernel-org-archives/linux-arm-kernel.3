Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8BFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 00:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lgGYLAXMTiBSQm8B4s04dx6tu5EKRE0LsYmfPrbRJeM=; b=bnpsUDuEwuXm7iurvtWu5e9IG2
	pKm/lMyLINxNDlVpTb2+adqoXxaLgYu1FaOdJAY+QlaoATfRamUIsLpjmi50GOiStMrl0x7zIMso4
	gEzahR7oZzfU1mqPEIBymcHWXsCKoqa2SAMMNnXgkXJb6OM7wxR7GB/onAJw2hMPCHJYc67BfCrQD
	6bDlyvw4i/w4Vjw4olO7CqitQbyI3JZk17JgJ5jfHRoVECt/PxjUknuEJtdJNjTeKiv4UHat2Oi6V
	9HkrLA4pry96buOseIX9svxz751l5wPSEItIqi7/9HHbJ1S/ZKfqZGHZh+2hJwfgOEGFytdIlW1dF
	SLjy8sHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMii-00000009Es2-0SWr;
	Thu, 13 Feb 2025 00:04:44 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMhH-00000009EjJ-17fo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 00:03:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f44e7eae4so3943275ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 16:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739404994; x=1740009794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgGYLAXMTiBSQm8B4s04dx6tu5EKRE0LsYmfPrbRJeM=;
        b=Waf6aCqjCrSn8poKxpEZzK3pbACiICXsHJkQrrqpMM+nOxHDB7PN2FpMBB8LCMV2dl
         v6UMvBLA7ftWmQ5ZhNs50X5sp/XqtBJOfPjpmS9T1ALkEKNgv4bUfVTR/w44heFVTE2E
         HWjv20d3iAweGyQcWQTA7tuv4YWoZ3jV/kNG65mzya2FaCYdRsFWsoNbjbh7okb2OhqN
         qRhi4Ucym7/e+vqeU2oR4WPAVRWA3z1fS4GBudvE7MmwRQw8PyCR1p0uwYrr9LmRsbVu
         DUGki+TfEKXHti98kttbEJ02QFipOGQ3WzALH9Dkhq24q9SsFJ0R0caAcZ9HqPJuqYIf
         JQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739404994; x=1740009794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgGYLAXMTiBSQm8B4s04dx6tu5EKRE0LsYmfPrbRJeM=;
        b=ii2PWPQDBCcrjJiFdrY5stLCH5un+udOASp6b+xkgUY/20ao6cfXG+yMmJTZn1V368
         FVJ7p+eRv0qRJZUzYTB5ME+Da/AsrjJa4wAdU5wvkehlsW/vG60CVxqt7j7ji/eSdP5x
         nnmMAqKyznn+tvdGuVIEG4AVK8FAKcZCdYoS4YeeaT/f9YKxOibcwt6al/F5VMN9u/EC
         6hjdqs8w3v2MhyQe52ylk2xOYQFEfd0A7Q6yvrYpgdVvjE7hkWgt6roEU2zhpXL0CFQI
         IbnmrI2ZbGVRXjjdV3wBdDlFa57jaYYqqq7FK4W7Dv3Y6BJaFBRbKw7hZQFemY0oGj3V
         97qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDIJ5YB/ppEoPASMCgk0bF/kHQ+ldJmACfoNQh9AwMW5XZ4aS+dVVUx21bip2ZA47Z/37gSuVDXN6gEHyU8D7x@lists.infradead.org
X-Gm-Message-State: AOJu0YzpRbHXVI9whNa4B1H5v39jLJhlPqYXs0CEwcJwWOFhmbPKOrEN
	LIRYMJrQpCumJGw3bvQsubMeeWEeU6w6fmz4DYUB/qy9/TeTUvzyVsnvSU4m
X-Gm-Gg: ASbGncsAsQnT6F/Owjt61NAvIMziAk7OPD/DbUcWVhfst3tcDhyWNBMgXrR1zcvWEAa
	9WkakjTjgLXamuOwT6LuA2a8uK8z7PvRyQ6QcPublB6bzkCT1TJzopL2uiURM+5pb/Xwx91aFq6
	KZJgN0tUY7x7JqSNmH5MehtBQgMb4Z7cW/YmIG3XkacXT2tHizi+RpwH7EyXdFnyaoAHWqJhs+r
	/Xgc+/pwOIYE+CPxJCD8rpL/r1h6D+mMIHdOa81RM9MGQy07LIr/bIkSQN0oNyw7pNfg6WCnMyu
	GKly4jaH/tKg6IibpaRiyGBq0plNoLpTLDalxqcoaI6/dRN40Grpq4mJtX26VGSH2gM2TmEjEaL
	fgg==
X-Google-Smtp-Source: AGHT+IF+D2Xb6/P+MeaJ+t2rpv7ibEkX8ds1s2CaO1BKsO9476v6xLKYDYjvadIojErLW8nWiv0E0w==
X-Received: by 2002:a05:6a21:3382:b0:1db:915b:ab11 with SMTP id adf61e73a8af0-1ee5c796586mr9410564637.24.1739404964623;
        Wed, 12 Feb 2025 16:02:44 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e4a0sm28014b3a.120.2025.02.12.16.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 16:02:44 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1] arm64: dts: exynos: r8s: enable UART interfaces and aliases
Date: Thu, 13 Feb 2025 00:02:26 +0000
Message-Id: <20250213000226.277-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_160315_305362_A2DB3CAF 
X-CRM114-Status: GOOD (  10.33  )
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

 - usi_uart: Main UART interface, required for debugging or
   communication.
 - usi_bt_uart: UART interface for Bluetooth connectivity.
 - Added serial0 and serial1 aliases for standard UART access.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
index 6bae3c0ec..049b40af2 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
@@ -18,6 +18,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		serial0 = &serial_0;
+		serial1 = &serial_1;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -113,3 +118,21 @@ key_volup: key-volup-pins {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 };
+
+&usi_uart {
+	samsung,clkreq-on; /* needed for UART mode */
+	status = "okay";
+};
+
+&serial_0 {
+	status = "okay";
+};
+
+&usi_bt_uart {
+	samsung,clkreq-on; /* needed for UART mode */
+	status = "okay";
+};
+
+&serial_1 {
+	status = "okay";
+};
-- 
2.48.1


