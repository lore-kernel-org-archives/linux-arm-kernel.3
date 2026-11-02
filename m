Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86864606D829
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MEpfulUZ;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VDP9b+K7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y5G5Oi9tmTaDaaDivZDz2djuyaQ/VmV0KNWnT/BwMm0=; b=MEpfulUZLDvJdP
	jP0tzFwOitoTt+ZSievr6mzpHAxP8NRTc0WbtYcl5AWvsim9GT/DAZMdZ+rG1528scul9G+krivBZ
	firR0quezyQDbnF7ieQ/80kPYvJO6Lrnbmkn1+2z9YfDrIrrHwtVNYBFtnWZ/H75Qt44qPhprDK3N
	rNmQ2qMS/K/zkb2mXCl9hYrvRzlgbEkLBGqeJRt/jCaqFdYwx9uV7DdXnjm/Fp1hic4C91VCTEWpw
	+jVMAwNFYURlX8NWLhhansSNy8/7Md9mN/FjV5koNPGRT5x/KoFETnE1aYEBwLLE7pUeCmP48NdTE
	KjhZkQVce7Z6XUIDCKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy6A-00000000DKv-3Qip;
	Mon, 02 Nov 2026 19:53:42 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy62-00000000DF0-2Ngy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:53:35 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e10a70540so1908284f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649213; x=1794254013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5G5Oi9tmTaDaaDivZDz2djuyaQ/VmV0KNWnT/BwMm0=;
        b=VDP9b+K7DWhP7W3CEpOmQaVEcLje3gDvExeV8Txrx5HTsZA/U1xU2LkQIYg73lgg7h
         7rolgmeLWWFfF2SVlVooTvXHna1C6PICGa7kmCziKwRlSQJzo7mfIk68ddD7SklB28L6
         qcK/+HhRYhRTz/A2uF7/f+fm1Z3Y3ni8wXMCQaLFwC9nBOyo0lY1lRmDNjkiMIr24rbt
         /eG2dr4MGx3yufsfzAjoiJfuJIdQXWvD36E6QB90e/Ml8KKRUSXY4iAl90WEqoG9qt13
         mkOWeogwOtP0i8cECb5U2g3s9MyVvIfrwdcYYcLC2aJoVJORFuFGg5IZ0tL1k2rMUld9
         77nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649213; x=1794254013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5G5Oi9tmTaDaaDivZDz2djuyaQ/VmV0KNWnT/BwMm0=;
        b=KQzkHljDJ1w4VOgd3RnJZNGB8E/kpI1NIfVh1WF3MxX5v4GvVcgZq3YZnQklmQHkio
         HuD1EpOW2q6DfxW7MKbjy6U+Z2k9Iz6+j6LEWMtfu2AJccPudIDQdYeP0zAFn/W56kVv
         RGgBbrqHE+5Kz3mkezmO37W1Rp4tl6TXxZUsaRBoOfBHJIGRTOr2eB/COnQ16kExxHya
         milv8uVUKdeQHUcej7/ppRESk78b4sMhRrgjo+3RxxK3/LTXt7TiHwfaI7n4RQeVqFPS
         aKuaCt7X0JaMPrXrQkuwO6oXIObUup1XotJm7fX6DXbiImBUBpIGA5uSheaQAoeGpEB/
         Xjow==
X-Forwarded-Encrypted: i=1; AKwUvBxmJktMlG5MjOi9md14gJ1WnVsUuLIiDGY/fpTgdIO+VwGivui984MXT2XVMjfXpbS9gVaL3De0DOBUGDAPWCEc@lists.infradead.org
X-Gm-Message-State: APuU4Z8KfT0T/d9Q7CHm4Lq2/wkSGK99V33HTSsOjgX8fSsjZnvWO8RL
	BOgdrLcpfTPrkhGS/p4iULY0Ce/3SGlrpWL046ymkwhvg7PNLWhoNMU7EFd82JnCWrM=
X-Gm-Gg: AYBFou0I+kKHk48BArbm275BK4ItpffRQPeCLSXC1J3MCt+Gt5X4DJt0wABSG0c49By
	w7cTKXQh8ycffDpzqDY5DzpMDmmsSlyKTseJpDsDdMs7nAE9C8jvjKu6X5tY+aCcEhRDvutjfzH
	OxF/eq6WdblTFCmCZZdgAG1HXwugtwmtQDURoPnSXsJ27sZp4cZy5y6AuJhLw4WAeyVfgJt0DLo
	rYOJHMzUrM/ln7Q3fEQnayolwQ/ynP0Wa2vaVMfogovgjaMN5GdG+TUFxNoOPrA9MOH4+qmrwdJ
	ai8uJPZjcVZ+Gwsx+4ahPPT3E51iMSgUFJLD70JxtWZ8ak20YSEhghdsqyIY3n9rb5Advlbs8iu
	bZgTHdGwlsYwOx/0wcYVRd7MHlLRrkNjv4nqo5WJ6dnGovoobvlmqvQyLz6EiZ63GMLYwYSHgNw
	QUBmU7jYIW5rxfKSnPTbDm0gARo6nxl4SRWiVaAS0Co9NzBGCMi5xmM5jHm8zlYyLahRA35qSoT
	hY6bH7D+24qvGsTvfWd5f7Ept3Mqyd3A7m8Tn8HagDa8d3ExmHEv5UrdIzo1bPgDhHt4pL9qK7L
	HYqE49UoenWmrzGsIp5AbqBTNDC59E1u8PEKorrzCHneD9CvrlhsNCESH6ZP03GtyKRk0yJ6IzL
	YhctF57cqq6sZR22LoDbhl9PlMA==
X-Received: by 2002:a05:6000:4013:b0:48e:6264:c388 with SMTP id ffacd0b85a97d-48e6e2ff911mr23181536f8f.23.1793649212689;
        Mon, 02 Nov 2026 11:53:32 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:32 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:49 +0100
Subject: [PATCH v3 3/9] ARM: dts: omap: dm816x: Fix pinctrl range
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-3-9bd6d1d128f2@linaro.org>
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
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1269;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=P0EUDiEV5xVvoAc15r04teIU1ur9dww1Y4noU9iuuEY=;
 b=hWsGqtoEWoqx9qzruR2/klCLZ1d2o0pZzDW9WAI4o5XM6uZIewzua0xt5k33Uxf/kYfLHjJI4
 6ez87CXChQXDvHN4LYW/ZD4wk7GvPZYihUn2fr+m9G2qHv0+6+iOc83
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115334_637109_ED92376E 
X-CRM114-Status: GOOD (  14.91  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The range of addresses accessed for the pinctrl module needs to be
extended to take account of the fixing of the size of the pinctrl
register to be 32 bits instead of 16 bits. So in order to allow the
final pin control register the address range must end on a 32 bit
boundary, not a 16 bit one.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 261ebca8863d..fc124f9ecfa1 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -90,7 +90,7 @@ scrm: scrm@48140000 {
 
 			dm816x_pinmux: pinmux@800 {
 				compatible = "pinctrl-single";
-				reg = <0x800 0x50a>;
+				reg = <0x800 0x50c>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				#pinctrl-cells = <1>;

-- 
2.56.0


