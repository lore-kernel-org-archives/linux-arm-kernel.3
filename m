Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAF606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dWt+c1/E;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bN+TEsgj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=; b=dWt+c1/EP12yvG
	52hXniaMicDo3U8VKqb1IrFC556qczVANSDnc1byXf/S8SJAu/uzgiP/Dy3AF3nZ91Mcej8fDF3hl
	l60kMX2knpxeURtC95b9UuHOhrhX8m1SN7ConQ8LFHD0ZbLGzhQKlfH+AezKJxvAjPaF9jUhbtfsa
	2CZY6HnaBs75Q7cutmI73UTasnJuKYBAC2rtLqcvl4EZWICrMGo234HcztdR7jeRLcCYwXO0vHlqI
	ka7XCsqPc47EqYYzd5jE/nnJvVV7zR6gLjpWc7h+dOQqQBdAn63gZDzzMB8o8x8w4ICLRKIpEelWx
	aUwRHKN37IRz2yGKhutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA4v-00000001bTn-0lOv;
	Tue, 03 Nov 2026 08:41:13 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA4P-00000001bHv-1UiO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:40:52 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6b19e291cc6so4037469eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695240; x=1794300040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=bN+TEsgjVM9FLzTD4eLNFPOqE/1PHRHCf7E6SsNHlhhj39IwzNezojZhQeEF0XohyX
         RGBYn/KAH+5Qr+mDN5e98hxvL4SUkjKqMs60XXmjUFzgS7EE4amM+WeLkqEhrfTN04YK
         xp3uRer3yhGwswSOn9vnwMNq4OdoulUIcBtotVlOHohk92t0wnqT5zr3UwXIEGDQPI9E
         49GwN6DcKRTrfFV7eiY118Mx7yu5KqxefD2R3H4oRsYrtBZLGBALrLXhCuph9WP5XvGI
         pBcVvndlX/T6VDcnL1plxOJgnp7FwXEcZMIV12EoEmmVkeTKRblxlaW+V2skeF+fXNDw
         o9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695240; x=1794300040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=R6WwgUiTXcuLE1CgiJlTLkJ75PYIZ7nXTsJbzdhCBAp+PKHsiSbsiLW0js9KFbX9kx
         Z1cxtorrh2mF4m83CI8VTiYQUvVl1F1u4mJV4szaJYIgR5NuS4HXxKyNW390Y7UOXlWk
         Q4sSptQzjubbp3aTn5ZL675U28Ar7ppIWqIVzqdrB5evyjPJZ9UsmvYQEA5AKcOXOrPJ
         N9tU57tuOCkRzPn9O7QrXAVXv/fg2Vr3CzXfeGe791YEorJ9XF/BVWz9pC4F2vUN3atS
         nQDTmpTBsFJW2euta7qYy8huVp335MS8SDcU78fCbHAuHSa01Kmc1uEC08aXiEI3+alK
         aeOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1Nlv5e4gaploitERoyuEYDWkyj22Vg7GS0126hEBXbbCl28WkhewKsPBoN4Xfb4WRLjvb/twKIMkGmBte47qm@lists.infradead.org
X-Gm-Message-State: APuU4Z8xq5J5omqH7TFVt0STk8GsDRyWlRnjngUmABA/iFe8IpGAhjbm
	bbeE1CUc7vZMgzuUSjbmtLpTcQic7sauA1cTlB4eZLZuYESLlS0vMCs8
X-Gm-Gg: AYBFou1vjQ9gj1ZF795Blk1tLwdcIB0CJBjjrXfoOJefZuKATEpRBpQCqQSm20t+wKd
	g/vSpURe+cdqA/d/49y1fUYBx7mPlbhvhhWe3gCjGj5fyaiT7Nbg7RJqeO/oRTHXyBzMDahlRIj
	qPFJezX2/+vQkA5FXsmozAB+qcC9zCBC0+ovtX1cwaicErBqdf5+PisVbmHyXZkp0SvzKxonPFm
	TYx3DWf0w82+RjEEgnM8xbyzyb9XwPSX+QMuXJ2lhD0GLfUy5mGx9oOLi4o1JgVoJ14RB5dtnrk
	aNczVQ62mLsAJCp4zAijfDl7+13QZYfXwYX1uhGL64D6jLmMmY0FA9O3E/7RJXZBuG0YDgmZjmx
	J8uGcd5FScJoVJpTCWtBIMQ6rmoJ5x/YTYnPHO4KYFNwE6g/MLGnfH8UaKP7tFtYpacG69VBdc5
	jQ34ukcUDPqdj3NpnMZsiwJJcydET+jFK7wYxna6tjoee3WJJj3OkcqJ3MuN5MFFylo0vGVYVIC
	/G4WIC1f+aBnSlHNPN9TFJHtom6tSFQ4osmqUvuoM9wKwkkqwdeD8LOP2/oy54HBkpBNwvY9khA
	5tE5u2vHegWMfWBaiuJYWjahUNkZmvpHddlnE29DY371UsW6LnFg+cFKNsNkykAoFWRUmz7GIbc
	zPIABOZpn8ON4hPwvJDc6RR/KdvYRVy1pLoGfzdjhvtK1x3KdL+c8Vc2gClOWJ7JBplnmYq5jQP
	/5ytFxJ33vT3umPvV9DmJGViVx+Z1GBmdo6HojUthhPIgoTVCX+sfmNtNpI1O5I65x6AFBdq+N
X-Received: by 2002:a05:6820:221a:b0:702:778c:ec5c with SMTP id 006d021491bc7-714f29d36c6mr6837555eaf.53.1793695240569;
        Tue, 03 Nov 2026 00:40:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:29 -0700
Subject: [PATCH v11 4/5] arm64: dts: allwinner: h616: add PWM controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-h616-pwm-v8-v11-4-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004041_430433_DCE50D1D 
X-CRM114-Status: GOOD (  10.28  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a PWM controller that can provide PWM signals, but also
plain clocks.

Add the PWM controller node and pins in the device tree.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b6580f0c6e0f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -293,6 +293,17 @@ watchdog: watchdog@30090a0 {
 			clocks = <&osc24M>;
 		};
 
+		pwm: pwm@300a000 {
+			compatible = "allwinner,sun50i-h616-pwm";
+			reg = <0x0300a000 0x400>;
+			clocks = <&osc24M>, <&ccu CLK_BUS_PWM>;
+			clock-names = "mod", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			#pwm-cells = <3>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h616-pinctrl";
 			reg = <0x0300b000 0x400>;
@@ -397,6 +408,42 @@ nand_rb1_pin: nand-rb1-pin {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PD28";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pin: pwm1-pin {
+				pins = "PG19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			pwm2_pin: pwm2-pin {
+				pins = "PH2";
+				function = "pwm2";
+			};
+
+			/omit-if-no-ref/
+			pwm3_pin: pwm3-pin {
+				pins = "PH0";
+				function = "pwm3";
+			};
+
+			/omit-if-no-ref/
+			pwm4_pin: pwm4-pin {
+				pins = "PI14";
+				function = "pwm4";
+			};
+
+			/omit-if-no-ref/
+			pwm5_pin: pwm5-pin {
+				pins = "PA12";
+				function = "pwm5";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";

-- 
2.53.0


