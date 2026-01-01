Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849C4EEB57D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 03:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KI+UGanmxYGqAKse2EbXibaUExpozwdVeK25/oicMI=; b=Qlb7V6Nzq3jkCl9q0DQJw/JGld
	eu9EiwCb8z83pwN6gPjMZhFzId/Ur9NL0af0WpaAbUIEyDaxSAOes0y1WKclsZtU9vgulksBoi3Vt
	KdsAbhAVhBPDS4zbo0HB+xIAT3uaq9M+d5st69KERrMDXertluA+xGtDL3+PbotzIF1pGLg6saSuU
	8UW6dcCQdYyTD1Skf+KcL1Q4qJ4wL6soBxrxJitRLX0TAm7tWvM6OlP7VdNs22SNawE9PWhKc4kBe
	GbosHPM/8K57rQoe4+dW9mOd1+0xFIkfw3RG/lZGT2qasTQle/8K/R/vncNWiHoy84mmq1i3egImw
	UFmMU9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bC-00000006YqG-3stO;
	Thu, 01 Jan 2026 03:43:42 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9b5-00000006Yo0-0v5P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 03:43:38 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a12ebe4b74so200332215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 19:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767239014; x=1767843814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KI+UGanmxYGqAKse2EbXibaUExpozwdVeK25/oicMI=;
        b=ZfEyF7iXAgDnNJIuFxpwFziDEsT7ocfwpxkSpJra+8O6TMEH+WRiKHBRCQSNW+3T28
         /psNmE4/l0tXsP5ghEBv5i6uQZ4kEVsTsDc7A9wEmPc8myIUHPh4msnnXQyuKcieZECF
         aqIOjVtVIE9rOPsQ9rVsU5ZWK+XnEb82ri2II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239014; x=1767843814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/KI+UGanmxYGqAKse2EbXibaUExpozwdVeK25/oicMI=;
        b=AhIrQjdvZ2da+NDVeVjpgUnFHIAkd43Ve/VvgiKg4f79L7rEJLaQs3qlnHhSUbgPrL
         Tt7bSJ8Xjml+hTLZRGYAxPmRHNSl6jcPKHtQmcqDNylemFN5VCL5zIIBv/+j128hi7R4
         fTKlhbedowiyBDh4tVj2ttLNHjrZHAVJl08KB8LjtpEtwHVXcgn79PH+C2nBZlDkCUMX
         2E/1YIgP08R7vSIyZWGMlbqrIztEAsbdtcb0OcKqcR1OCKRajxkggZpxUpJHANpYJm4M
         1C0post75VmBTcSk/JGDRXCjrR4Jz0q9J91fJoZxOQ5G2h8JEPAYe+NgYcnBo54m9QJn
         1lAw==
X-Forwarded-Encrypted: i=1; AJvYcCWcTQhwM10fzSuHwzscS0/GMyiMI/qNDwXmJa0FfcAlhGsEEaCAXiHG5nxsU9qko6tTIhKsOyfMlYLF75AQhfN3@lists.infradead.org
X-Gm-Message-State: AOJu0YzfWSG6Q7njpfhFhqMq3j1IHwa9lvMr3evYGYdUm3mAhzOwHynP
	WuoUicdtpbWaGtE7JP1SNxpdTzr0QU50NAiedGGGuwlXvP50vCOs71vLOkeIKY8271Y=
X-Gm-Gg: AY/fxX70IdnhVukXKwhTpweI/d8K8/xHSQkC167vOvJmteiZqE9vcv6WmEt8Mv0dXxv
	CZX5fzGv6DGQfbQSKwUmrvZNjao1hYdtdZ1/YUAjwjhzDZccXTkIr26cFgXX1O+XzVS+4jFJZov
	M+cvr2jNFmgEbnYzuBUEUvuQ1hrzrp7JWx3L1qzCqeAdsYqENOL4KLP0Srb+4roU0v0X/VH/30E
	G+DDadMgRakxxO6+Bo/r2p+0lWzaYGZzs2GWgb9snYL4MlhkgBnrAyxu6rDU3pqoLK1eerSrfq0
	6oqjDFhxnXiFDS2qx3sYZ5PLRwouQbBuP457ex4G/8a0dAl2r09DJ4W7ofXrMrAuL+u73WmWXP5
	LOYs/VoOc3LxKGexGa7juRYyKf0CMzBjM6COlELPsqmbkR3AhYsq1hjCsdb7QLUeK44kOcF/9EY
	Gehs2EWgaLS/jYdTO+F5GRC70moOROpHvKm4aT3LNNUMEpxc0zbXFG
X-Google-Smtp-Source: AGHT+IFP/Po4KbsYeJgW+vqwUnVd6wIylfBCZgy7LIUD5OSHe88aJPgScWN7w+I9m/BZkSpnQJSIYg==
X-Received: by 2002:a17:902:e747:b0:2a0:b02b:2114 with SMTP id d9443c01a7336-2a2f220697cmr371104935ad.11.1767239014441;
        Wed, 31 Dec 2025 19:43:34 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm340437965ad.33.2025.12.31.19.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:43:34 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 3/8] arm: dts: mstar: breadbee: Correct LED names
Date: Thu,  1 Jan 2026 12:43:01 +0900
Message-ID: <20260101034306.1233091-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101034306.1233091-1-daniel@0x0f.com>
References: <20260101034306.1233091-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_194337_340668_B50507D8 
X-CRM114-Status: GOOD (  11.53  )
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

The dt validation stuff whats the names of the leds to match
a regexp.

Prefix the names with "led-" to make the validation happy.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
index 99f5a5603dc7..71da10d9228f 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
@@ -33,11 +33,11 @@ vcc_io: regulator-io {
 
 	leds {
 		compatible = "gpio-leds";
-		red {
+		led-red {
 			gpios = <&gpio MSC313_GPIO_SR_IO16 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "activity";
 		};
-		yellow {
+		led-yellow {
 			gpios = <&gpio MSC313_GPIO_SR_IO17 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
-- 
2.51.0


