Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E8DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 19:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I53LaBUu8Ez10WiqpcVihTs0+/nH9igaC51JF98rWw8=; b=VKJkid6U6lLD/ZI2ZOseencoYr
	PH8991LevNihDt+mXELvYS+ALuZXWXoJ/waemiEmPORRh1wwxZgSHpmuq0jJv3gEkJ8iKMbKVlkUy
	J00RtmpdEFhWaFX1qUrEQQcbr9Fp8kyBkXNvW1Y3kus90r/EYwoYsqIivUq7kKb7U51LKWFuclYOf
	5lMbcjMF7dZxch1mr7gPYI3EYmMMtU0VwB3zbLc76Q6NVYQOkNByEwM7dRAspJXtUGpEmrUlgCzOT
	TnmI4Vwi4Y2rQsN+b9fNEatgb9ODeArRc0s/MrgJgLjxjxTGQM4SJyeZKQ87yrdLMV51N0vNPMWuD
	OJuHzvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZxP4-00000006Jpw-0Gly;
	Mon, 20 Jan 2025 19:25:42 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZxMb-00000006JT4-1Ymf;
	Mon, 20 Jan 2025 19:23:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so4855636e87.0;
        Mon, 20 Jan 2025 11:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737400987; x=1738005787; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I53LaBUu8Ez10WiqpcVihTs0+/nH9igaC51JF98rWw8=;
        b=kRXnPUbnXm+hNvMu/5ULtelRWDthAyxorFjE+NCemuBqXn9uRpy41/jZFgQFmrzj0Z
         Kq6h+oY0PWZ9cjStlosKIBUwdLg2Id3LEU7EhWcHdR+EghReSxH+IguV2d6G3vDjoNXv
         XQ5NpAurdgapg5FhSqo9cjhUsqurWy3xJ+bfDAVYraR7QOO27b1F9fmhPx8A5OSWgcee
         GhYxPTZ9cbHNXwwt8/lYGOp5X+vOk5L6ahljPh7KvYsfOI/pDxdnLCUYkr8Aa6QZawI7
         xNDjXECtJITVawogyBOkXBeLZgQFLdOa3OC9HCWjyOLjurarSLZENzsCA9Gw/5svOQyU
         oBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737400987; x=1738005787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I53LaBUu8Ez10WiqpcVihTs0+/nH9igaC51JF98rWw8=;
        b=jdfVKk/DFT/L+W7AsFyKhYJBeoHonPrmICKTDtxSWz5B+jhWaiDM3nkG1Py0Ho6rn3
         NEJWYxILvL3N2VIfJFExVPBMbfhl6QblogjafaHsb84Bj5xvmn4t1lHPgcSHL+yN/3AE
         /lenvL22HjHomnkAkkwY+5UeQOI18KZC0AhxFhxsdu7rK9ZaEvGEHW0kd/8x21nkBuuD
         yO6QfGoFEyvO2+G5aPUqWGma/oa7QAlIvShNhA3o8jQBtPvvaiifIuVXr+GzXorV3UxQ
         TExoGSOW0Vv/saBskmqJuVbVHsgQ35vivLBBatpHsoxfcQyRTHhuoXqasUrgIyRs4OyG
         rQsg==
X-Forwarded-Encrypted: i=1; AJvYcCUyrfJi/MY+TZeQQypAEAW09yQ5mvDVPYebTcUDhqGVuPryCBhOmpB4AlPGbS50h196ufuCe1Yfkdd/pS2O8QQ=@lists.infradead.org, AJvYcCWi0IEvqDMtNeBa6/ouKgWSKuhTgXtzUn06soA68dl67IzVh18OQ2O3dtIoDYL26QRobKzKSacyjnyBpPwYeyfg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/a3DgVAm4bwcLDZkS6woIrLxw1zvC5NTVX0+VXNPWuEmv2BDT
	TDj+qyZ3hZm4epm47GwqXlKSQmCOi2cq3yWQBCtktBhbGMi28LDhVLV74r03/50IMA==
X-Gm-Gg: ASbGncsa3GTT/a91W/eDqfvoRWtD+/xFslKm3aY4wzB+/17FaTMgR2SJL11v8WnXw7X
	9UxnfUoNDb5Pt0LzRsaT0B9LTKkVipfSUWupyd7Gq5QlRu6SRJCvR9bhQiChSzn7UM/JF6ztTxj
	9u/9CHRn5mxXW+S1YPlvTcO0cLKhA+FFyb0P1BPsB+0/GktKJI8mhR/dAvT+xjuAHmolxpfJazR
	XDDEbYox+ts49Wra3/VPFcRQrYljyNFTQ1fqp+RmMuvk1FTiAYPnd6PlkYhJX7quxjm8C4=
X-Google-Smtp-Source: AGHT+IElRyKrCmUt6OC6FXnu2gsUAFzklkHyKtm/jFhDVjd/e3YzmckkNbBqhhmnxdhf9DgrgRUQ1Q==
X-Received: by 2002:a05:6512:3989:b0:541:3182:4578 with SMTP id 2adb3069b0e04-5439c224b0amr5131344e87.15.1737400987194;
        Mon, 20 Jan 2025 11:23:07 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78fb0sm1460156e87.247.2025.01.20.11.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 11:23:05 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 20 Jan 2025 23:22:46 +0400
Subject: [PATCH 1/2] arm64: dts: rockchip: Add finer-grained PWM states for
 the fan on Rock 5C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rock-5c-fan-v1-1-5fb8446c981b@gmail.com>
References: <20250120-rock-5c-fan-v1-0-5fb8446c981b@gmail.com>
In-Reply-To: <20250120-rock-5c-fan-v1-0-5fb8446c981b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737400976; l=1368;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=GT4q+7Oh5vTPRM/jyU6qeqv283kNMR9D4hEHBzqc+gM=;
 b=aOYxsb0GguYiX9tTUBCfaWsXYlypAboa2Ll0IUMIBVy0nqbAZ6B6xIG8N65VHw+89tCFLiNwZ
 kzFt+v6yAw1BDcmFu3M7dWP2vt0DhlsVNsdRi3f/oyp86Rj0Sb7H9nn
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_112309_414399_5171E62D 
X-CRM114-Status: GOOD (  12.16  )
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

Radxa Heatsink 6540B, which is the official cooling accessory for the
Rock 5C board, includes a small 5V fan, which in my testing spins up
reliably at a PWM setting of 24 (out of 255). It is also quite loud
at the current minimum setting of 64, and noticeably less so at 24.

Introduce two intermediate PWM states at the lower end of the fan's
operating range to enable better balance between noise and cooling.

Note further that, in my testing, having the fan run at 44 is enough
to keep the system from thermal throttling with sustained 100% load
on its 8 CPU cores (in 22C ambient temperature and no case)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index 9b14d5383cdc16947c955b1c6e2a32a50c5df3e6..1b66a69cf0f8795d7305852fa7fef3d0672ada7f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -71,7 +71,7 @@ led-1 {
 	fan {
 		compatible = "pwm-fan";
 		#cooling-cells = <2>;
-		cooling-levels = <0 64 128 192 255>;
+		cooling-levels = <0 24 44 64 128 192 255>;
 		fan-supply = <&vcc_5v0>;
 		pwms = <&pwm3 0 10000 0>;
 	};

-- 
2.48.1


