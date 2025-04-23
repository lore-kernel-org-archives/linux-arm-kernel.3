Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB63C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=; b=cMTr0ntk0yRWZDvnCqHuoN3Am1
	CBX8+ke1+/+wPtRisO9EZa60ebLBLL5sxpbfRSm+X35/BlCpub7R2cMDxHY1mEZT2d4s3DWhQlsLi
	a+pW+QHJXTwBvB90a8BwifWs1EQgLmf7Smo1v6N7ITkpXJA4OXnHl4d2rmWfCmGOk9TjTvS9ZmMJy
	9f7HbkUi1FtqcyRc3JaBWGIQsEXyDJCqCZ7on5u3cj6Rm2RMArBp6+0jUTKHbEXdqSVjP5ou4fq+i
	Jr5Rh/eXP1obua8FYToT7B+z9Tw2jUBlFu6ZqyX4oMx0mGls4befNLT5A7dOuOmQquVH4LnO6GOek
	fNKzU4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TQA-00000009KGQ-3IhE;
	Wed, 23 Apr 2025 06:17:22 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCM-00000009Hc0-3Nn3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:07 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac3b12e8518so975783866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388185; x=1745992985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=MBFdgLWlfhbeaUKd0/Jw+XPPZ8cVtUzFRbDTgzBXok/PPlJ+FBe1x5tBBmknY3Uz03
         Xmc9/b7p2vJcxbTxEuNBF+YpOkACdCFTGfI5RvAoWAJl2f1XrV3HMbbZme4dlBbrgfMx
         FW9Ghb8iV4AWqOfKRFMcr525TzSRQwTSATGes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388185; x=1745992985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=o+tceSXbvC1WwrbGeeX+Qu/FGz90sz8JaHqszxIzRLY7lXP+QnDj/YZBGxodrWE6zA
         KQTmToi8r1I4KuACo2HzJWwzwUbXxT6ApkAZRoXzByUrdxuRhURWgeO3vqS27Xo6gPwb
         HTeMO+HUwuNYkdhkOxg1VyY0YKDj5iLezpjI7b0UpsaegDSWZzIp5ItSm36DhJtkATxj
         dWxcwgvMGCMPruE9rMoNXFjQFm0JiRkNFV+jnvfH2Ldmq3mNhr6WSJTMlObCzta3kLka
         AP5SY29/j1oUyx6Lxm7l4D+Gka/6SqwBPgmR1/5OW6kUcDcV2S7cdvULhb4oHIDTq4yV
         Uo2w==
X-Forwarded-Encrypted: i=1; AJvYcCVF/k00iDZ+bEaxQDFtF5nFDPQIb4dcNuKjDAOFnOGoqWmBV7Q9lUE81eVn6S4p3j4OGZrl7i8aw2GJUD7+ltDp@lists.infradead.org
X-Gm-Message-State: AOJu0YxwCiJdT7uNJMMIOrgv6+RAMSS9Kv4CA2vMxsn105NVGytLOAec
	pqIuMHS7jjk6V0e0pzob5bEg7I4OhbXQCtzkqahz3PuC7VB3FutPU6ur49wZpjY=
X-Gm-Gg: ASbGncv7AN8gjDepVycdJ4RSPOZodE4Lh6AFLnC6Y6iWB6LpaVZmx9U4UvEv4+a/wxZ
	jECgzthhfdE1EOfkmqH05wwIJny31uokGyyFNBQhqkeh/YXKL7cs/y+nGXqfqRuBrL+M01NAKpP
	jYcPsPtAQApasPfYtWPfA7n/uByXIPEzvj2yvx0gDybGmtekbVe9CayiNZB7iv4OJv4ukheAQ/X
	/NtpCNQ00Us2McyjINakOWTvIofyQ7HUcQPXGlb8Vw1SwZyBFGvtl9UN75vER+j0tCupt/D0V2v
	FeB9bD6lYKrpp5w5+2rQEy4k0JoWYjhTwlz9oF8WJVyq/BiY9g4/J28txNJzmfOH4sJ7mV6+m8k
	a3Ze/
X-Google-Smtp-Source: AGHT+IGrspoHDsYpuHpBd0xkLyZI/0PkKVqNxamXnpGvjKWbNAnUwCBvXK83/LAVhSGUiYAa3+5Q4g==
X-Received: by 2002:a17:907:1ca5:b0:ace:31bf:30f3 with SMTP id a640c23a62f3a-ace31bf409bmr477621966b.43.1745388185104;
        Tue, 22 Apr 2025 23:03:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 06/18] arm64: dts: imx8mm: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:23 +0200
Message-ID: <20250423060241.95521-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230306_841706_5D355668 
X-CRM114-Status: GOOD (  10.23  )
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

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


