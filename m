Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E802CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kup10a0B4002ciw0MPHAfZ8hDEDF45tuWf47ra3TKFg=; b=CyAcW37YBUxyhyX659Uz9ugp9L
	SfWcyRRL4mr9WlkXGO+XyYPnCCyzVJR7Hx1OhrCqPbmrXHhY0cnCw2JxFn5Y8oOIvQxFp4L9NINWT
	xItYUS5DhBP8u9TC7N60SxxXuLlpmHix/PAqjS4PJkXEUiJQbenUzdNXIX5LS2pulj3URq0IBcp9H
	KQMO0MlUcwUFBe93DGpX7Ljd7ssEEPnL9YF7fJ8bw7DvswZ4uGtY53n9UetYMI5WRpMY5BfY9Dagb
	isFKeCBKvg7l8wVMjiFJ9ptEEH1tinWZpjAcdJ2G56CLnBChMqKTWzCv4nEa15XvSEB/zTGLLQk8a
	dLL0VdxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1A3-00000007oFg-0PSq;
	Mon, 18 Aug 2025 14:48:35 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvnQ-000000070eT-147e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:04:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-afcb7322aa0so55208666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 02:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755507891; x=1756112691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kup10a0B4002ciw0MPHAfZ8hDEDF45tuWf47ra3TKFg=;
        b=KlDb7mZGcl1bG5bkEmizaY8zyR4zm+O28AckmYqstZ0Sa0gjOO9PH9amUkEfZ4lKv3
         y0kJDk7CMraHD/601GTrXK6YF321JkDpnqVRxgXZ9fWBVU/I1igeVr2lVxRhplC46hrf
         mNTnoMjLuKmhsdMleV6oQHfPmAxA8SgFUvA/pPPmmNmWqiqBE8XPFmCTq/8GBcnVjAHj
         CJ421k+0vdNovDa4FgzWXu+rLPA/AtnphLsbNStVvY614j7Cq4nsrMMRwJw+jup6Jihm
         ZfsDFzcXVLtw3RkMsJ99p9O85/37QhQUYAMIq7XyqnEcS3AglodJnLRUaXkiJHCHvX0+
         OIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507891; x=1756112691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kup10a0B4002ciw0MPHAfZ8hDEDF45tuWf47ra3TKFg=;
        b=W/L74zKPC58SKMGxyFzlEvQD2Sgmal8Tr4Atm+7gaG2q/4UKIfsTQHZ/3RGHk101Fh
         DEnrbczmDolVjcj7WuD92dWrk84CwEEDG+zdq5ZO6EYG6HRjxfUAts5SJ2dLXcwF9BiB
         c3zqj/GY1SGwYCsye5n4PYbZrPhRuKau39o3BF+fETctBHV0hm4cFrEvgcLVbvZvzjmx
         9+uHHZ3khWVN80ha2Uuch7b5VTylYHrncLNAQq7ET31OBrEHRbrt4lJQ2pMutgAonXYZ
         +El8e57E3ItCVBzLZ2ZUZLpBiGq4WGu9qI0KMgwsWC3U+NBvfhBvm+Tt2+q/Mper8vOP
         UcCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLeR7uj09M0osWfZKL+ityHdDtoj+Byqw69a8Em3EUxmpN5X9E2i8X24dOTkmSVCWgK73Hsel0maxaw6F1PLgf@lists.infradead.org
X-Gm-Message-State: AOJu0YxJZGPF1InLGGPzPAewdWBE0COumBpOkAkO6k+IufypZ48OgO67
	Lg8Gd0zvB+VZzSmLkbUVcZYtRpsOiBs6/tL4hA32c1v0M24rLY89MfkLnibOZo8uNbY=
X-Gm-Gg: ASbGnctyVaLrdGh7mQZngSTQ0CIN24SexgbdHj8olHR5TE0Lw+dnde3n9YOTVX3wi+X
	fdtTpIkehKXvoBLy5GPQ5NkE5KUQjW2uYOD5qYpQw/w4sbKQ9ELyTvEPBnqWkfP01TJdF+wjOhL
	xwJSPLy8YI8HfaZ5//0wIB+7zO0z7V3l1j7y/djAUtDdLHt0u2hqPByx3q9xP93VQ+VBgwyVMXl
	XjTJQnpyW0Oi7tuOD0lt2xm6WWE3vW71ZTDS6cK+XMin4my7aealn30Si8cPDNrgPoqNbiN+CJT
	JSmTpdrTDOjmkMHARgRXKlQF2aQ4LbGMAStlkQ22GvzjirR4vmBuOU2kW1ZbdujgmBg2//zFvce
	upNhH9V+d7QECb2pC76aaFOYSYoUCiZJwTA==
X-Google-Smtp-Source: AGHT+IFtlmbtqJ9P827bEqJH7oW+ZRuoRFw5s2Zc7tNfSX268H1TDEG69wyd3EdhU80P29JLLkcWgA==
X-Received: by 2002:a17:907:3fa7:b0:af8:fc60:5008 with SMTP id a640c23a62f3a-afcdc19d2bfmr422932066b.4.1755507890447;
        Mon, 18 Aug 2025 02:04:50 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm767622966b.35.2025.08.18.02.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 02:04:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hsun Lai <i@chainsx.cn>,
	Alex Bee <knaerzche@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable+noautosel@kernel.org
Subject: [PATCH 1/2] arm64: dts: rockchip: Fix wifi interrupts flag on Sakura Pi RK3308B
Date: Mon, 18 Aug 2025 11:04:46 +0200
Message-ID: <20250818090445.28112-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=tum7sSZZcgm8+tBz1nemvGULPNRMPULQo3/wNINBH4o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoouytECvArfR0uDxlZkn/yM+6/pk9krgoVi2Ex
 +KuIWr/tUqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKLsrQAKCRDBN2bmhouD
 14K0D/wPUzRE0762GdIlKZqVCw7QIJwhm6QQ7maC1A1pWP1kbGctVkv2gdC4IrGQzhVdVAcb+0o
 IYw6rpxiobOFJiiE9S41uqR7We+z83ecxPJdkjmNkddMaZF2dpMysBcPOspzBpDV/ItDtRCVCLc
 oUdQ525yCD74OLtL/s5kWlPK1EfxbPdLFhzSOj6CJIh5ct4LJ26xzgacvu6CjBpy2tyErI0AGVA
 Rds7A1uNaiadSEcWxGCogOkANLHvBjW90M3IdrzYjk76faBpiGE8t9jirPcoxyCIu/94HT+PgJQ
 5hGjSAYC1sO2yUNK0HjshaOD4bGx+JzpRF02+UEe/h0Xic6AsmX0tnTEpskZ55v8Hqf7jfTEqGZ
 413KxCeLLXuEiX2OlGMqd4GMA40y77A7Me9UhbXuS2C0cx+7jYRQ6BpPGWSycQrtR5KTon2Y4Zb
 AS4P5LT4QOi+q8sNcIR2npSkeY5Go69g169EvxairWf5ePkspzoW+lAlC3RAI0zRDjdFDykVnNM
 MC6tch80y9G254Kf33rR8CMydlaltyp/fZCC4zIV47YfPkLkquhGRjprPUzDCKnuqN+skTL8hmP
 7NuAZrbBvDCiBGcB4rgeqHsNOE22A8/IHlUCfS5XbHFrZd/LJRO8qt4IEyP6Ym0UsseZUx1jTSE 3P8zVqN+3rRaErQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_020452_292165_CD0460BD 
X-CRM114-Status: GOOD (  15.04  )
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

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning: GPIO_ACTIVE_HIGH = 0 = IRQ_TYPE_NONE.

Correct the interrupt flags, assuming the author of the code wanted same
logical behavior behind the name "ACTIVE_xxx", this is:
  ACTIVE_HIGH  => IRQ_TYPE_LEVEL_HIGH

Fixes: 79f2a1702441 ("arm64: dts: rockchip: add DTs for Sakura Pi RK3308B")
Cc: <stable+noautosel@kernel.org> # Needs testing, because actual level is just a guess
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Please kindly test... Not cc-ing stable on purpose, because this might
have impact, so needs actual testing.
---
 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts b/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
index f9f633aebb64..aee6643e33ab 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
@@ -199,7 +199,7 @@ brcmf: wifi@1 {
 		compatible = "brcm,bcm43455-fmac", "brcm,bcm4329-fmac";
 		reg = <1>;
 		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PA3 GPIO_ACTIVE_HIGH>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "host-wake";
 		pinctrl-names = "default";
 		pinctrl-0 = <&wifi_host_wake>;
-- 
2.48.1


