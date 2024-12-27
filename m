Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69195E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZExEvvNEuW3dV0zU0cRZTKoF2QfayutIaMaf9y7ttFk=; b=I/U+otP6Y9zG2KJE9kNayL5/cM
	5665ZKXO4t98XA1gG5dwb+cBv+xGcaUgdh+pq7OzK8sF3ioBCzZSXjGC4P4wWlJdKttw9a+YDVXFc
	IAypxV5/VFYB5j7fWq8YDmXJ9hCISHNr7FYqiBQW6JGVDxx0dySNgemn1ahP1/DuvHwD7AFdNg/wo
	2Q7st0PfwUG0PdWYrnBsK/rvObXN3J7l0q0twMpipldbMqiDAD+j/MHAvq7OV4VTHh5SWjtWafUie
	IrgQS8b6KM+ugalkBri+0B3bLydlYNC8PMKr8nseTEA64/fqav3zkHp+iguveGfUnr7bSoOaMMbwU
	pJHGZRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHvu-00000000ymY-1GTz;
	Fri, 27 Dec 2024 21:31:46 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHq9-00000000xuC-1mds;
	Fri, 27 Dec 2024 21:25:50 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d27243ba8bso14555040a12.2;
        Fri, 27 Dec 2024 13:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735334747; x=1735939547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZExEvvNEuW3dV0zU0cRZTKoF2QfayutIaMaf9y7ttFk=;
        b=KsyiXaycaBi57/fSdPWf0ogAkP8JHNp88xyU7BWidXOTt9BlfKpIih3tHPd/VDB2Bz
         GftfVJCwBjXUyZHNgC/sGgZ9+fkr/KBw4k6R7T7R1kwAhXUsdoqArUdFCUtMzV8BY0OH
         SlF6mZYvyOEAfkEoYe+Vb4pnGKDHw8JD9wi07meDCnJScWcwCsqamiG/dpaLsL4QpPWr
         W4PDNemmTH0AIQRZPTsMkhkqTJS3hVEt3+hINQa9nIGG8z9cvJrclyK59if6W7Inb6EO
         Da0ocQfKQ3uDexfOKYHx3lCffKnKbwZpG6LSIMxW9xQ/WNj97o/IZtCe/Az57ihpAiHb
         xvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735334747; x=1735939547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZExEvvNEuW3dV0zU0cRZTKoF2QfayutIaMaf9y7ttFk=;
        b=vM7aIi0LIaPRBaxTjoTnHnqPzwoDv/poxwrni8pFmgMSbm6b/ynGzbQG5UURjHO7Ht
         mS3dX+hM/rhEwEiIc/VdesTzKfxLabJUTY/NRu7pHDAjfWfR7Z/jQIu6GMhWZ/YGkZ9M
         SkmdsEnjCmW/WVKdXGDFQbTmmCi0RVQBcSCJWW0Bxvm9nj+EDDQyiL2OoX3nC5WFdCKk
         3AMCP92qijAkIPC6UfEvdKXvTQmwEbq0tXf7gMr89YJv16XyJkfxjbCcC5AtVNer1wh/
         raF/xE1kNDpVFMz0DL8/r4lkTFNOuwIPWu35cUD7MkjbV4GT1AZ/na9p/25BgS/KXYAG
         GG+g==
X-Gm-Message-State: AOJu0YwcVOyX97k6Unob1yXJv74l0PCHp61byoixQYkodM8SwM1z8IF/
	bO52vW3sUoqugW75ZsTHLTeRxZuhJ3K0QeHpvFfUjINpZoy9D4JMACaWSQ==
X-Gm-Gg: ASbGnct5x3n0MFwYMSIfpRVIaHmQNdo+ELoCKcFZRvJOseQ3PbHv41tomyA6EFLrQDP
	TzyEWiv9b9zpXJe4pq8mhbxAosJHj4mjbuU9/dlTb1YA+t6tl2k3UxhW599SP2g9E7ylD8Y2HZx
	5dMyZSlR6Har+NP2CfURiFpy59blDgYZyIPWC366l6yPkR6hlicLw/8fXiLNZAXpik34JWEZkj1
	4BUFtA/bQmA3cQzsjT4qEBwTlkWf62WGlyQLvjmJOmTIiHiapxRJJa3/NGEfG8xFdveyGBWhUs5
	2zRqBs9dbLjjGH4jYaINJpcRCqSt2ukPBdf/9osqNm3b6TVOB3O20B+NSBCNQmcsLwfKdyyGRPE
	OpykJz5kjyujJkamSIUuyVRY8+A==
X-Google-Smtp-Source: AGHT+IFexFOv7Agh8zbrzXXZCyg5le3bhbK9E3nZVfHuFx7ohPUZ1y5ALrIUcLf5zBtqatdc4/rIYw==
X-Received: by 2002:a05:6402:27d4:b0:5d3:e8d1:a43 with SMTP id 4fb4d7f45d1cf-5d81de22353mr24717574a12.27.1735334747043;
        Fri, 27 Dec 2024 13:25:47 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b2be-ba00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b2be:ba00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbc5sm11627950a12.60.2024.12.27.13.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 13:25:46 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 4/5] arm64: dts: amlogic: axg: switch to the new PWM controller binding
Date: Fri, 27 Dec 2024 22:25:13 +0100
Message-ID: <20241227212514.1376682-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_132549_470652_248D7634 
X-CRM114-Status: GOOD (  10.50  )
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

Use the new PWM controller binding which now relies on passing all
clock inputs available on the SoC (instead of passing the "wanted"
clock input for a given board).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index e9b22868983d..a6924d246bb1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1693,8 +1693,12 @@ sec_AO: ao-secure@140 {
 			};
 
 			pwm_AO_cd: pwm@2000 {
-				compatible = "amlogic,meson-axg-ao-pwm";
+				compatible = "amlogic,meson-axg-pwm-v2", "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x02000  0x0 0x20>;
+				clocks = <&xtal>,
+					 <&clkc_AO CLKID_AO_CLK81>,
+					 <&clkc CLKID_FCLK_DIV4>,
+					 <&clkc CLKID_FCLK_DIV5>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -1728,8 +1732,12 @@ i2c_AO: i2c@5000 {
 			};
 
 			pwm_AO_ab: pwm@7000 {
-				compatible = "amlogic,meson-axg-ao-pwm";
+				compatible = "amlogic,meson-axg-pwm-v2", "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x07000 0x0 0x20>;
+				clocks = <&xtal>,
+					 <&clkc_AO CLKID_AO_CLK81>,
+					 <&clkc CLKID_FCLK_DIV4>,
+					 <&clkc CLKID_FCLK_DIV5>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -1806,15 +1814,23 @@ watchdog@f0d0 {
 			};
 
 			pwm_ab: pwm@1b000 {
-				compatible = "amlogic,meson-axg-ee-pwm";
+				compatible = "amlogic,meson-axg-pwm-v2", "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x1b000 0x0 0x20>;
+				clocks = <&xtal>,
+					 <&clkc CLKID_FCLK_DIV5>,
+					 <&clkc CLKID_FCLK_DIV4>,
+					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
 			pwm_cd: pwm@1a000 {
-				compatible = "amlogic,meson-axg-ee-pwm";
+				compatible = "amlogic,meson-axg-pwm-v2", "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x1a000 0x0 0x20>;
+				clocks = <&xtal>,
+					 <&clkc CLKID_FCLK_DIV5>,
+					 <&clkc CLKID_FCLK_DIV4>,
+					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
-- 
2.47.1


