Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C23C60A6F77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T6KO/Pp3;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m/HJr3gI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=; b=T6KO/Pp3nFkiJ3
	2uZyaOyDdff4CG3X8ktW28D9tXRas1zf/P9j35RcYOe7qpCcyA/FCO0JfVxkU1VhCLOGFG2gSS8de
	smhwakkZ4KgUG/jw4W8qPDQCk/FyHDL4EfntqYD36Ydl72kRsBwwVrJFzjmpte3aenXe7Ju+NenrZ
	eFFo+jmeWHhZJ3iawZ33m9L4UbM6r3BmhAOUCHfxhSmztkWew83ivWclvnq5ANKEOtC4OOERvBdj+
	A+9HM7dnYgXUDHwutSqQFTz3h46asAdtHeUSWpIHZPDEXWDUesfTst9gIdYmVM4rUzErqOMOkV5U+
	NvLBnh33pQW5jQVM5wBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZZ-0000000Ehyf-09jn;
	Thu, 22 Oct 2026 18:31:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZP-0000000EhoU-2JAm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so1689555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693878; x=1793298678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=;
        b=m/HJr3gI7mfxjaotONL/uyip/QBriWN8RfvChqfxBYGj/nCQLrgUDS1QPCDl4Zq4PZ
         sP9xCupj4tE4zHfIy3ky7DpLL8Ad+W3e1B+bSHdtacF5PH7TYJ+lnpOuLMCPU3ClsHVP
         LsqiTaUUlN4u5inDcYM8kjM8ZOvNyYhKmP9Rmqen8dTlgY+ow3QBRE6dYHN0Fd21syhW
         p5sWp3JVaJ69o+piLiKsaB/7/RbfDcpeIOMUUacWHEdBKE9GUyOdxHWIbxy3f8wVR+Jd
         lU9aL8Mw9+hBqtq5fSYvLM+0IXGhN6Bho6Sw/Sk3MiiKQk2ESYmJIcDv7ALzWUHwuV3a
         IH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693878; x=1793298678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=;
        b=tZ/x1o+NVCKsyPNi6q2+fmcc5vueVUyWSuVFZz5J0gbr1cv8yG3wCbb32aiXhdj6kX
         Jm9rkHYKR2wqP8N5hWN+nQDEW4LGjPdmfpRBEPuwtl7cawdW1GZ98q18VpYciJXAYl06
         GTBIv+QLLfjUpbsgnXqtPgJqmlzhKxET4cE0C70hacxNk6Espqx/oF71hdWdRhtf4lnX
         YiTN9LuIqz1ibnLE2UeSRvcN14xtNqqhcE1cTEU2iCiCbIc3UwBdWBo2TH+egZS04K1O
         IEv6rMqi3sCU5aP7aCrgZa4q91Is39UzwK/LSOD+feoJPLh80bEhVW7WcGfUcsI/Rdjm
         F8pA==
X-Gm-Message-State: AFq9FYIZ0WDPK7I+OWfv0SPWzh6PCdmzORUk8SZj3BiVtezVP0lHh4kN
	PMgnRy99CYCRJ1pEe1NgSSIwKW9CkFQf6YyDtYmE52hKxiJoonkuQPCfwXQfJ491w6Q=
X-Gm-Gg: AYBFou3LdeSlK3lLg1mg8VFtWPbYuenNAC8DgZmPR8+c+UsLIX4gxU3rErMWIo+kLki
	iI0dRw5tFBW/qR7sGRboDUzO1JwwvPxnYfqniaP5usOicd6FkM5+zFAAX72AztZcWpsAX85cnDB
	Jal+PQV5wgB5UB0+ac8r3kBcwTg2bruOf4o3Wr8/9/naBWg/0aJZNFA+b05eM05b0pKKLrVMd6N
	9qN1yuYj4I5XEDMhNiFlHP4UASEyZwwjVr5LhoECKgssEaf+sCgUYm0PNZgn9FM0naEqb436uL7
	ocMLrBNfHgVQNN519jAyOw4rKMdjFs/6S+z2zKl5j2L+letswz62mzlHXmzOTgojBwbgs4iiMBs
	7j9bejyA6LgnwOyw3g5b2f/bbI2FqnUjFDK0LUsRCymWgeW9bSAG7Lbrhpu3VlcKYTEGqLQneai
	/NZGfGeQG9m6CKZjYLEKxNgCKNYK47Mu9tEpRe4jlsavbp6pyT3PE5QHGMMMpbtz317iNKWZAH4
	MDOmWSRg7JXJGTboXhRveIW7FOC7zlIlDdD5g1+Z+YC/ZYiAXEmhO+Wzbh31x5oq1QV0Mp8xZbq
	pTPi861n5qsrzdywQtjTozBOYtUExXxReXbaLHX/CaQ=
X-Received: by 2002:a05:600c:8b8c:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1fdafd5d1mr136430265e9.13.1792693877622;
        Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:27 +0200
Subject: [PATCH 1/4] arm64: dts: amlogic: s7: fix the GIC CPU interface
 region size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-1-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_113119_866800_626D1A9F 
X-CRM114-Status: GOOD (  13.50  )
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

The CPU interface of the GIC-400 spans 8 KiB, but the S7 device tree
describes only its first 256 bytes. The GIC driver then disables the
split priority drop and deactivation mode, which needs the GICC_DIR
register in the second 4 KiB page, and warns at boot:

  [    0.000000] GIC: GICv2 detected, but range too small and irqchip.gicv2_force_probe not set

Describe the whole 8 KiB region, as the other Amlogic SoCs with a
GIC-400 at the same address do.

Fixes: 1b753fcfcff8 ("arm64: dts: add support for S7 based Amlogic BP201")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 64440df4f542..89b75bec40f0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -121,7 +121,7 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x0100>;
+			      <0x0 0xfff02000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0


