Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA93FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lujO5dCfpLfAzjv2ZKWu1TMfvLXvEfolWEoTcgyYSpY=; b=gmB3/NF/y71FrwQx7qub7meQe0
	tDCq99v1NIVfFLbnAp9iUFwIbfmhQ4oLsfbtauZGjcuCOuUoKNCKRzk3cJ1mXCWCTiCrU2PXFiOIP
	oke+SMibxklUO1/w2nbJMhq6ArZR063/N2IBO6n7pjDnHgNn0FXNSsiGWefuniRQ17gGFw1il08Yo
	rgs3Y22C0BNtV4hJoJm3RC48+EjXJRSAtxadBij3VCkWMIjWKt2l5K2xnXwBOuzB7OH4FsY+qL9u5
	8zCw3LUVBRkEev5Kxe7IL8N4f4oHB2iBfcq/Z3TnXTQhIJ6swMjkRXoxZJnfQEvq/YI0WYBKyYlza
	PpNxFbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnZ-0000000Fqyx-0AD3;
	Tue, 05 May 2026 10:14:41 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnV-0000000Fqu4-3zKh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:39 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-839dc688d6cso40399b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976077; x=1778580877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lujO5dCfpLfAzjv2ZKWu1TMfvLXvEfolWEoTcgyYSpY=;
        b=B3uGuhce/yPxg5vbTzKgqCLZzLVLKWo/P2uyeifm12G3UF54/1vPzJJiU3MEcD9Wqp
         JFWiKuMiEsOzmKXN1ibreca/Wl7QvdYAoqY+lqEq8L8iFQoCANGPJNSVWIcHKMps8fcd
         L4jRVLBsOsCqysS0WkOB5hB7BOzGXJC15cTLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976077; x=1778580877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lujO5dCfpLfAzjv2ZKWu1TMfvLXvEfolWEoTcgyYSpY=;
        b=R5reQd9CVcT1Inz8OczqNqIeIhwp6Q5zjY5svFXymqxlLCyTbXrkTP5o38fTXRc132
         lFBHQSsg03+A+hTkkP1BiEkyVKBitwhNannO+ZgkJsM2kf/Xp9bUFaxoQOY8bNm3+JyE
         Jaopm62zqLjq15FE71k8b96kkpZKXgE4rWtkIGYswRXfF2aCUvseHPOrwjVUKyhgZA0D
         SF2E2GJAWWv3P9d9MoVqCum6iT+3boJLNxGTlGKXPGkQDH4jEc0XyEW7sCDMRUtB+1rt
         EVwWVXPgM78gS+bXbdXIwLjsEXHPRGYIqJerIyXiLLNUyBQNtzjtdT7a79FxcBMB6OnD
         y49Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ZStDPnMMv0Yi4s0Kasj44Sc12nXcSy/syFyz9uXjToqWZr8R73OI50TzvvpnGKHAae8dIYaBXeYEMVeAGp8iH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0FLI6ewKq7dZfn7HuUoEhFbERwN5Gkp+//nbXS1GnIejr9MHW
	zXDLdlotEWR+ttrAEbeyt63NFA0HaUpoS1APtXFloAAtSejPNJy577G6NFpEZO0koQ==
X-Gm-Gg: AeBDieta07bMCbq1kEh1Dr1sHNcXbsvvODHKcd08N1dU8KKZ9Hb1NOHGnNEO1SgmKyr
	ZJw0IWlJLT5jXbg/OktIhTwlZstdm83vNGnPaE5NOCTuIvp+On5tN9TE5sGteqtdRYWJELLhbql
	5ooPyX06zqQkiLuAC0/HUgc2TdgF2nPyuDYFx9rigKok8tKLmLhJhgDQ1v7LW+RA8aGoekSyDK9
	mnw5uMCwJy7VyDN4fzwU+6IA5ZJv2snXKE4l/hDJgl/mKX5fPnm53umwrzak78AlQV7kSsjG0wG
	WkH7uNw1dmu4HBRVv9a7QqefQ1weuctFwyYZt8eRC1FLlROKgF7DRxhiIzTm6rHEPDR2CdK4kb3
	K96ATMJukg6XrnGodWcYReXBdA5y9g8e8Kf90sK5tFCc2yA+4FC0kuDBnU1O7VxIjX62O7huH//
	kDX3YTvDokbXLJ3Xueu/P4puJCZDvm3p77Odsha1GFce78EEUVchPNMyLXM0Z64xlNEwWYK+z0B
	afWYf0g1daQGvy+4mA=
X-Received: by 2002:a05:6a00:8c2:b0:837:666f:8fcb with SMTP id d2e1a72fcca58-837667f0d5dmr8094589b3a.5.1777976077208;
        Tue, 05 May 2026 03:14:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/16] arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
Date: Tue,  5 May 2026 18:13:57 +0800
Message-ID: <20260505101408.1796563-8-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_031438_019010_E9316EFF 
X-CRM114-Status: GOOD (  12.19  )
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

The device tree for the MT8192 Asurada is missing a power supply for
the SPI NOR flash chip.

Add the supply for the SPI NOR flash chip.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index a6543bbcbfd0..aae9d5ccca13 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -637,6 +637,7 @@ flash@0 {
 		spi-max-frequency = <52000000>;
 		spi-rx-bus-width = <2>;
 		spi-tx-bus-width = <2>;
+		vcc-supply = <&mt6359_vio18_ldo_reg>;
 	};
 };
 
-- 
2.54.0.545.g6539524ca2-goog


