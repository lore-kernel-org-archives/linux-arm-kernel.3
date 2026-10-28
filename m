Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130F60A6F5B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fC9P4dCA;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tiL89Qix
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4A7a+lLbAYsA78ZT0ERLpUjSwA13WWgnKlHJO2aUu+k=; b=fC9P4dCA0ZapB1
	qEimHuQCZVBOiDQob/TqMjhTJoidJHtv6p7v2yNcKM2L+VaUelY8qrf4YH8fAEjVIiPR8uYGWbiKD
	CADpP2GK1jBj25v2VtjFNSy68pLcoJ49YZ4CrO3bcUwRubNLBJZ8fG56xOrYxv7otx6YB1o+GxCHP
	N4EX3Fuh9XXLR4mZKPPpyaH/htY61WL9UDBtLnjZb2oxq8Gwl7AhrGGdairqOrTWPGuBWX8XxWdvf
	yeBhy/53rnoNyOH/quVwxaRTovOX1HSeAb2SGk/t/jUNG4PvHKr9GkcM99bbVJJxUk0bgxzPctf2G
	4Wt7PMGtLi4/skov65bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Ai-00000007UUJ-3Goy;
	Wed, 28 Oct 2026 16:06:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6AW-00000007UML-3OdB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:06:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso12064215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203586; x=1793808386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A7a+lLbAYsA78ZT0ERLpUjSwA13WWgnKlHJO2aUu+k=;
        b=tiL89QixgDQziaZWl3LlsWRhxPmDp/OE56AF8f758WNBjnmcLF2nLmHnnIBhRckt3W
         dDMAxKDBeeETpGfT3vDAARMuQY0U0NAq51mwcTioSJ0cCh0hx+bBLAAebI4O8kEnanfK
         9PEiq/Khvz7sLO9payGQrTBqC4bXo4RLQNLvZh0tnlQthLp1Wv/p/HB13wbUhT6dbHxt
         CjTr+t2O052lptDhzuTJ6r+jTx2DQ46xtGjPDDfaBp9nWwiECJ7ldC4bsCG+UT3NgW+R
         a9Yn5GHWymOkOrVcEpnPQcRydQL6Q3Lze8djgLuv8T+ihyzxmCjOfHJJf/aygp1vsG1i
         wrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203586; x=1793808386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4A7a+lLbAYsA78ZT0ERLpUjSwA13WWgnKlHJO2aUu+k=;
        b=I6Rg7to68mXD+PxO4TnhUjM9f7G6JdiRrBKrgxlrEfrOLHyfiujuR2kFJe06WN5f07
         l8dZhgh5bkhCRmpKdu8CQGASVkQSBhWGhOTnpNA/htokCpJPYfM31zrgNVwuunRVDY0q
         pPBMh+13UnS3wHSLQPFrDZVE7NEVPTljlmYcJ9Vq2D1RLlKjprf+JJSbN0Qmp0NXqjbR
         N44tNZ9qhDRqlJ1qEHYSr7dFipwmaTQ999cSrrk3LOj1Ms8O/aYKVYmq6uTW5K/6LTcb
         0w45tp/jQy+mznA6JBUvSIeZAmNrM6TPHCVfGihC1CMPYlGuFL9JE5YENaDgIRQkXVgc
         czxA==
X-Forwarded-Encrypted: i=1; AKwUvBwmPH+t4u27fOwUYsst6sQ+qkdcDdKwX8IemWTBwYeb16EQSvW3uXyughtSHZ1Jhv9P1Uk3iUiZMGsTt4lB4VHQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1d5Io1Lbsvii+IuGHwYtizwm8xu/1t6VvliRcMwlS6LONUFVy
	6jnZlmPw4zcldTKptWVVyiaxqrgXJZ1dFanadyE6066wVw1JFVtsJoLy0fdyXbApLHo=
X-Gm-Gg: AYBFou21biCYJTgHvI4wtrWw/HTITdKTpWdPW3kG0hEsN0ZVVRu6dKYPUBC3LjnLU/F
	kqfrU5glN46PhGTQ9BHatvbF5/IFwsC+57gK4dC8JCEuLRHjZ5S/iQBgX0b78SJYfZPZyumjj9J
	ZllkDdwuoS9VM8vx+YZdMvtTrdoKMRKPRkfC8ho5euTiFT0o+acHIMLR5bgeIJQQZhwOzW6AEfx
	iX3n7Dy04zAX34eDzfYvGPu08YA6aAodcn4SRO3Ag4WMYmQLWaBQAZ4hfMwJDhfXd23QESdG2FI
	a+6efINkFwHwCUsjHgPFB8NuA1cUm0uzhR3Ds+jKgtSpi63E9g718o0VllkN2eOfzVBe72Y7RMS
	JWos8a71tv34MMTrBz1UarFxlt4RPZ+LXd5/s2J+/IoseUfgNCOr+f4vpZnVb6/1VpObtS0oXOi
	i68Jo3NfdXobXzajisU0+/QEdFY6lvU0ND9m6sVXcQ/M3Bk/O8NSdWJYA6Afwkmmp5ig6UOxY9c
	RdkBk7qisWitdIsBfaraHiBUEl5hcU7FVNpTHzgPvv6lf+qHlnwWhXTKwIzcFrg86Dba3vvl4eY
	3ZGfOww78NOB9lGr5r6lv7rKbJ3g4DxL4mVyNLYwm3KEnCe1VCNOQ/j24ts3gCDRhqSSTkr6Uzk
	Lu6wjMdXSLsPINtWOwjDrxGgd5Q==
X-Received: by 2002:a05:600c:4f89:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a966c4110fmr63881135e9.16.1793203586322;
        Wed, 28 Oct 2026 09:06:26 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:25 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:03 +0100
Subject: [PATCH v2 2/9] ARM: dts: omap: dm816x: use dedicated SoC pinctrl
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-2-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1104;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=h6W1WAoyAkjjjopOOo1a7vzZ6TBDQswOUA1Q/6FeKLI=;
 b=gvU6qdCGfmNuZ9+vLONQblCUNyQ/FTfMv29wXGHB3AHN77+6/hhoHgJy+LfWIKEOD86B1AR7Z
 Hk2Azj1uAdRCsEawkL0a93nWsHJgLJT0KXiPrySo2NVpfiA6SqFhUl5
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090628_867832_6ECE6130 
X-CRM114-Status: GOOD (  14.06  )
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


