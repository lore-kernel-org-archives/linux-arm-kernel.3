Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF48606D825
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+rHMi98;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U2I6J7FD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7f/afSnO15hayW9629dG+dsshQNBLmVWgINs1QselwE=; b=I+rHMi98VaalHJ
	nLxsQo17euk9hJ6JsyeJD/5KITm4X6BbJM8KEvWS6TDnOWD9EOoLCV4lC/84bnw8upntrSyIztkD4
	mIrytu7bcFquIyy5Pkj3eTJeHHpwRk9n7Be7EhIqEE1Huj6pkXP2FXM0Zl2RlO5KWJMbl1PmTCXwc
	Up8J64zXvkfcNpanCVcH2LlOnplghRT21Qq8VrSOZp+BD30CYyymQXkgwAnfEd0UtqWz3Li0FTK3Q
	sBNdimVhLnn5DieZFiAGmBeWvHP6Js3tTYVO9NfhCF82iVpVzsqOHhy95T/3f/Ao0VnZ1Tez6PmA/
	2Tg3SbtBbd9AMOgN9xkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy66-00000000DIH-0oNJ;
	Mon, 02 Nov 2026 19:53:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy61-00000000DEK-187m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:53:34 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48dee593f18so3276300f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649211; x=1794254011; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7f/afSnO15hayW9629dG+dsshQNBLmVWgINs1QselwE=;
        b=U2I6J7FDk5b8LFAvc3llyCmNrDzSUE/tD4ZNglPPh5Vgh7dqoRKSf9eo3MkFY62Jr4
         ZMT4G/CM8H4j6QbvT2vvWry08QaAE/TlfSeWwfw+9/cA7aqfEXzq3K9EcmfJ685DGNCx
         /rSm0yWxWM5m+Uc1ANmM2SC/dDSxWmU05CgJvQwmTAtGGQXWObrFemklae+g+19CuJyI
         5Jg4aNoGWl4I2df0dZzW1D6+QfUd2U1i3V9AItNgho4Y9mTL5dIPJ8hXMeGSGJ4s3G44
         ts1w6377mp5JteuYbVBdecGPyzvVdRXiMjFmNqc/sb3iMIXwjauSZ9enSvxTb3maXwfz
         KIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649211; x=1794254011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7f/afSnO15hayW9629dG+dsshQNBLmVWgINs1QselwE=;
        b=CarSNS+93uCbLNtPPdnSUSCEkISTXMK+KpiJY5aE6sIBEmomQ8uXw/m/M20sg5cIL0
         /o2Cd1QMcyizBVUsp4y9O7pKxYbNn57yvE8TqbjY7ErGyBmgTJi11IqUjeoZVc6KZmyA
         u5bIpglBGktNN2pSwQTAKPXKjeBUk9KO2Fzxjs0AHSoQXeLaugtcjL6TKz+nM1fWGk01
         GXL/WlEX9dySasvjrg57HcOfqH7HZc5tjPKaZeF4IsxgSqKg0UPNX/eP9mXP1wXMIsqf
         nEJYt2wpewimWyflShLC8lk4EA77Af4Auxm204p9XU7PPHdqFJdzoYI6kiaBIFklyph9
         VQEA==
X-Forwarded-Encrypted: i=1; AKwUvBw1TyJ+rW4HjmIOHNingvqXgjP65Oo0LRfCF1YJquWMjf86nIZKDmgBWx81Mxmg5vyMS+bUUQdq6Vu1dK5a99h/@lists.infradead.org
X-Gm-Message-State: APuU4Z9XZKJ3FzOM4AxjnehitSS66HnA2L6Jj8a/F3Tn9PKhsoJYVsfc
	aQVpMJos6U/zTCxAK9rsys2P7RKxxzeO2tPDKeZ0VjZoZxDYqgUDGgY7qXyPYpmvqmk=
X-Gm-Gg: AYBFou3f4MwsfQ2tR25peKS4zzaep4g4xwZfRnAsVv8eMrdcRHZghegA0w+j1Vssg9N
	dF/5TYFaHgLgkzBKkpjxs2j8wUdGK4rgnobVx8f/jmFKZ4vW47yeYbBBZfSPsUTei59ccsY7kAY
	NLeZvirlrczsw61goWwRrcBGqRRT09V6duLXzKhZrrMSmrg4oBssdeLMkrU+xJH4Yg4G1B8lt6z
	b/cu1J5lT8igPs45NDlPHaJ55bDg4no3j4TfLpf2bexMKeJ/T8s93m0mg5GabhWo0aYRplDCUYI
	B2jVl+dR1TnnmvVbCzwry19djpMeT+/bqVVon26XexkjhQ9TEMFuLgrEUVTkfHCkpntBXF4Oqlt
	qMX7be2ka+d1tY+MzjoSwYB3pgz3s746e0bd2KXnTg5UlkbUVBQIhe5NRZ391cm0LvtOZ/KOCV4
	vOHwxjtMG2SJgkfv9JAIISfCNVABqdomHSW1Smu9q6oTzZj/8xpJCO9J8sfnDxyjKHRpUjlrN54
	Q+rHDzQdTVX6MOmIdN9GDOZC+/GSSxOK3OP2xMjilppMt+kizRsDvtWIhJfmfLfixNkCQUNnyFf
	EGczgOoeYZtZE9kB/bvLAkr+DY2NUsUzbbNcTKIvQoUuHlQPHuTkAoT/mQksf5TaWdYPnAZUPZ7
	AotUZR36NA4NKjDUFGcwVABZRIA==
X-Received: by 2002:a05:6000:46da:b0:48e:73dd:855a with SMTP id ffacd0b85a97d-48e73dd874bmr15997035f8f.51.1793649211435;
        Mon, 02 Nov 2026 11:53:31 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:31 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:48 +0100
Subject: [PATCH v3 2/9] ARM: dts: omap: dm816x: use dedicated SoC pinctrl
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-2-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1157;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=fKPEsKCzv++RFN5u2bDuWS6LSClWwdOaKJr//P58V+M=;
 b=I+VJBZFPeuOC6dZiMIx+ofqumWARXfAbmku+/vywjiPGFscrrRHCMe45QSz37TGQ3hlsrboa4
 2i9XJN5sOURCYIyX0iXcOUjIyRKAHdlikFVLmW3aM+mjlyewJ0/KKqT
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115333_335988_23A4EC26 
X-CRM114-Status: GOOD (  13.61  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In the TI Sitara DM816x SoCs, the pinctrl configuration macros are not
identical to OMAP2/3. They are actually inverted between Pullup/down
enabled and disabled (third bit in pinctrl registers). Using dedicated
DM816x pinctrl header to differentiate between the SoC families.
This changes the effective pull configuration of the dm8168-evm NAND
pins. Tested on DM8168-EVM with no functional impact.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index ee0090f7aa64..261ebca8863d 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -3,7 +3,7 @@
 #include <dt-bindings/bus/ti-sysc.h>
 #include <dt-bindings/clock/dm816.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/omap.h>
+#include "dm816x-pinctrl.h"
 
 / {
 	compatible = "ti,dm816";

-- 
2.56.0


