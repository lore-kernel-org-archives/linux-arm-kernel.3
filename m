Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D314F606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yvlHQgv1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2Un4Mws
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=; b=yvlHQgv1TUXNnzwqhYzj3AZyqu
	3YJyfw+tYdh6KPaDCiCPJJcQEdNpPYV0nS8rvulc7oWVDalaOYd+Cp/AtMPele63/lET22byvzeoc
	t/hIBy76lHoBJkyGZ6g7LhQbEZOXc5rbE5faiXQZVbixURzuNm/QSb2R98R0KxiHlpBrkWUq3jWCG
	S1UUZsf78J9WEavlYFkKppPPpsoy6+YqHarWoCan0oRn7EaCssOTqp0hHdUjA82VP3vVV0dkFFvSQ
	mcP2CaJLLnNPpOhpu12gaJmse7v/e44HqA2DzacdEFw+wF3K+RP2xFPZ6ddc7wJ5tt7vve1emt/Mp
	ZEyiHzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1w8-00000006ruc-2dBM;
	Wed, 28 Oct 2026 11:35:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1w6-00000006ru2-1Nqb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:35:19 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48afbd2c386so499917f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187316; x=1793792116; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
        b=i2Un4MwsIh4oI8fCZPElNM/YSECxIdUK4nVcD5NPA4KKiJ6T9RdMVsgn27mw30prUG
         /EhFTTRhnbok0H2fTQW6Wx/twgzVtDtC8If50aAHzl4e95SmW33RShszggYDw0ZIJCxV
         3q8R4C7a3Nav0aScYGuyXHqMxMc56qpu8PhfIoAVG+LwTgxkP398YybEITMehyUDmalx
         PYUwmGaHuEhPkfTQQMSscFY8UDkvpJhKcS1xLkMuICISjogthEvJVTOBrrJro5M8LIrX
         k5RajbjFMIxHVAZooT55WVIZahLNRymGcWSdgdDexD3pKPKbfO1YK32e6SZO9L3jz6cY
         2xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187316; x=1793792116;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
        b=Ez1jVz/16BkgB9YQWUo1VPxdLokCys/d8Wl1NuU9xzrvhNKves9PEACOoJiOn6KUf2
         fHIuQiJS4/1obQy50kTbg1MB0izjf8DOB8mtL9C02hkPyi8JXuEoO6x4L6hmdxgWN4Mf
         FnaQKxxUh0/8mt/AS86ES/Xe9rM5BoAW1XUMMvvB90FRpedF/cr3uwWdubg+4qDdk1Za
         VH555HZ499TIghyHPN3PGLRX+8/NafoZtq77ymCbA9RUs1QjTjHYP/6E9tGWiYREez0r
         zWjZbRdFUf+T1uCvYPzTVxCHD3mnoHQnJud/9AvpupcQNa86tTwlKDff4sgGYrtp7hOy
         jTlQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ7F1SVhBL6cNcQ7bOqfA4YFv7IOZ8sr9g63qxE13cGIHxm5nuWI2ACXXn+MNkZ29i52LkPapwgjcQQ8zyRkjA@lists.infradead.org
X-Gm-Message-State: AFq9FYIUCGYAjQ1bZDoTwhLT8BrL+GyE1sKGlL+q6GkBQeHbN4MX55K8
	6S1g4dkBcmMG5NzpS8r2Qr6jqxA0uJj5x+8e8Fa28VhsOR3bVv+ERw/Z
X-Gm-Gg: AYBFou0K5MQULQpgRS9izEaMEWT2O2U3UfyY/1ty6WXVx4vkxNH0wCEr3Z1ZWmrdcIj
	98xzUHmYY3eEGqqWM+bwpIzjeH0Z/vVBo2qmOymp7gykTAJH3L+eRwdwPI4fur8E7ZzKnqVc6il
	OL24y8AiZStTdOfNtWWxa5hYm466B1V+7rfRhfhnUsSUMvi/+6/LOaFv3hKRL9cjCu77f3ZyrTL
	hif5T9jXecPh4pUwK1cW8741NEjmZktT6dARZRrqyeeZJmKNvfmnXxHKgjhFxdsfyiq64C/nypQ
	t57qtCX7V79VKSD+UiodNjQUxd/OkzdJLC6/yw9AfJMcFfp7X/rYhbwk8Ml4uB1TK7LAxjoLOS1
	/oWckE2m6rZvgZkFKId/f5yd1AbBPGqIrIwlgY21+cAydtnblgo7q9EbdE29Deg0j67VuVPXW09
	IiK+0nDWdf2YyrJUyBq794cLGzBBftb7miJqQ3QPMa9h3UFocJ9U2VQXrAP8XavKajn7/dU8ROk
	PTJXKB4kLurOwX7mkmA94fvlpwjc4QPXuU4tmj+odZwWcav4ySA+bDSrA+jIzBS/8zswJNsKt8l
	NCmfrKFtmp9UY303P6VRWXzQy33h9arKxlSK3StiOZHS8qs1/d2qmFNEP5sOuUnX9LXNmuk4oW7
	E+ASVvuz0AuPt8819pNra46mBzyQLfg==
X-Received: by 2002:a05:6000:2207:b0:48e:5df2:fd24 with SMTP id ffacd0b85a97d-48e5df2feb5mr4476377f8f.32.1793187315926;
        Wed, 28 Oct 2026 04:35:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm28144706f8f.1.2026.10.28.04.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:35:15 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 28 Oct 2026 12:35:09 +0100
Subject: [PATCH v4] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-verdin-imx8mp-m7-v4-1-d4e23e62ebea@toradex.com>
X-B4-Tracking: v=1; b=H4sIAOzd4WoC/4XPMW7DMAwF0KsEmstApBRb6tR7FB1Uia41yA7kQ
 nAQ+O5lPBRtMmT4wyfAR/CqFq6ZF/V6uKrKLS95nqTYl4OKY5i+GHKSrkhTh5o0NK4pT5DL6so
 ZSg+h80yd61xvUcnaufKQ1518/5A+5uV7rpf9QsPbdMe0x3tslMRQuAaoHNIFGoIGE72xnmP69
 MObSCHxeoxzUTe80S+IWuNTkATsExprBJQ8guYPSPT4bjOAEAZylsmdDKb/xLZtP0UfMshUAQA
 A
X-Change-ID: 20261020-verdin-imx8mp-m7-a69e26868741
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_043518_393995_D2EFBA05 
X-CRM114-Status: GOOD (  13.03  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
This patch was previously part of the Verdin iMX8M OV5640 series and is
now sent separately, as requested on v2.

I am away in November, replies may be delayed until December.
---
Changes in v4:
- Use IMX8MP_CLK_M7_CORE: IMX8MP_CLK_M7_DIV is not registered by the
  i.MX8MP clock driver, so the remote processor got no clock (Sashiko, Frank)
- Link to v3: https://lore.kernel.org/r/20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com

Changes in v3:
- Split out of the Verdin iMX8M OV5640 series (Frank)
- Move the UART_4 overlay to the shared Toradex Cortex-M UART series:
  https://lore.kernel.org/r/20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com
- Link to v2: https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com

Changes in v2:
- Rebase
- Link to v1: https://lore.kernel.org/r/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..8bffa4a27776 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	sound_hdmi: sound-hdmi {
 		compatible = "fsl,imx-audio-hdmi";
 		model = "audio-hdmi";
@@ -185,6 +197,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261020-verdin-imx8mp-m7-a69e26868741

Best regards,
--  
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


