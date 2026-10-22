Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B260A606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Ol9Rjp5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WyMNzYk3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=; b=0Ol9Rjp591FiZx+7HuC9X4Qs1A
	VfJ/TD0iLNkWQQaHLCVyeZ6lA1xj8kh9qLIo/wYu6i6+r8Q85UhmDRombWK2/alupMoEGd2tr+FEZ
	tnfINJDgO9QwD5WGglvgIdEQ36H/gsBrd3H98gOaO2rRSYtC4LC+Ya7RrtHl5AKZdCrjUnWmTRu2Y
	T08kgLQV5DFrjvqdjAE3sjje+ztsNoURNT31BGW+IFLfryKWphNnaYe6ivoA4qZGUxQxZ0mDO3EFP
	Quh9Jw1kAXJAmd0CG9kO6k+B0i2xxAjMrHETq4BB6RFtEJ77+cua+m0d+IihtdOC3ZWK0yhjlEY88
	bMHBYTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJthF-0000000EI9m-2lxu;
	Thu, 22 Oct 2026 14:23:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJthC-0000000EI9G-3ZLY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:23:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso6253035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678985; x=1793283785; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
        b=WyMNzYk3EkZY72/q5T3u+POiN9FT/Y5L2xXoidTn+kHGqCHIsBk5p8hYGnt6rwzUOp
         2fAgutE/RNe6kWp99hYBANbxF3+QYtoRGbnxDytQZuSQNI/p3tAEV+qm9SgHSqIMVmbv
         VoKcV0OqreU8VZFM8hytXfGv5D8LOdTvGZbDthXLT6I21hixV+2GuaYcCM8Zxaxjmjse
         0mvSrWL5NIckar0Cu53NYVX5iEu5ZWFca6I0QXE31NRMBZslSCmeESY450uivtW152Th
         q0/2EGq/EP0uFbkBUBV0VLcPIzv6zMMerKuaGyPgrIu5Ph/g4fpOcpfRP/kJ2zzbiMUe
         CbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678985; x=1793283785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
        b=nCqfd94OfhyCEoE7X5A6dyeTaJxUz6Sly7Hne5PmPTbbBlxxFk4n8Ln/LYTumseO3V
         9EhtSxRnvGTdI3tVb9duIZ7L7Mvy4z7OK1VIohKUE+dwj9JBYWM9uo20zWboIHU45njl
         YQnbD9faGLuvNf4ReT9oUGHl8I5lANqscRn4PbIpvt+CFoQ/rfxV60hYy9KnWePC6yfI
         Wq7114EVdoOQfWHwXb+xIe3uBqjbGmTyxpqQLrnpzWPMS+mB8A8gnS0W5VB6vGFt+6/W
         Tn5GL/hvaqkijsIFsPyDwY5ep/Cr0TOJqkGT+X+v03wgpbpJ9fsNnpvO+E2eWyIul1JQ
         FYaw==
X-Forwarded-Encrypted: i=1; AKwUvBxs04dVM3Fp/GneaKapV6KtwPeohf78Iun0+FMAVq9IXqxpAZ9pHr1CVSdWx1jvdwxGXE6yl/8MMFHKczHlDqdY@lists.infradead.org
X-Gm-Message-State: AFq9FYIFHvJbrmrAzmSVF5iWcWIX8KVK2TcZ48RO/zgYR09Ant+kpnrs
	gtg6BgiwdSgM4s2q8MfnvWI5UuxKHdcRkfxBAw1zOXd1qA4Qh0AsKZkn
X-Gm-Gg: AYBFou2XW6Jft5MtTeKyf1rz5N+7K+/cydyApVO93nM1Igk5uE6NimnYJpXaE3XsoXg
	XGka83dbaROkAIvxrqHkehe8XylnkhzVdmN6iGs8uVpZj6/alcayPhTnxHayn/+bvCS9oAG1BQh
	Y99fbACM7Z5DAEn1/mqbBJf7UqnwQn7P7XxZljvSnUxhC4VGURocdqmTZUJ5zuNNDTEy8BfNG5a
	mrUc74xqqNM4ZTN0FJNgaFYjbZX7k3cxX/rKLD9jrvw/f+5QP7i1wzopwTh5rSUCItAPyesGHzP
	CJPqHedQWkDq0K/pPNsTEOOUlMnTlF8HpQXPp8JtwOnX0po372XGdGugtnTJRV7W6S6yPk69Old
	ARV7dhgtfMwgkH0Awn8rCj72+/knvsCoVvCOqtO4yiWvY8QeP+oNPPYVvcb66mf4QNt3sfFfxFA
	/2R/hcuHKCs+yq+RFZdS+dI1cZ8NnJdazwDQX+0m56Qmc9WM3jxlz/JECBH/IFiL2G5RDTbqRZ1
	O5wvSRH8DEKK5BPbcNAKq8iVTqdjRABXGb6Q+dmBUnCVzsqzH3GolG9tazIsihAxXnjGCGOmx/9
	0VNw6t34yU5XTHWDZT2+GcwwrGVQwW+I/sYK9yt9k96cozPZ6kV+IBE=
X-Received: by 2002:a05:600c:a49:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a204b20321mr50739115e9.11.1792678984170;
        Thu, 22 Oct 2026 07:23:04 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a207b29276sm95945435e9.6.2026.10.22.07.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:23:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:22:59 +0200
Subject: [PATCH v3] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com>
X-B4-Tracking: v=1; b=H4sIAEIc2moC/4XNTQ6CMBAF4KuQrh3TH1KoK+9hXNR2kC4KpDUNh
 HB3BxYmunHxFm+S983KMqaAmV2qlSUsIYdxoKJOFXO9HZ4IwVNnkkstuORQMPkwQIhzGyeIDVh
 tUOpWt00tGM2mhF2YD/J2p96H/BrTcnwoYr8eGDfiF+spzkZMFhJav0ARwEE5o2qDzj9MdyXJe
 pzPboxsx4v8gIJz8ReUBDZeqFoRSPkGt217A40DcXcRAQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_072306_914266_980ED064 
X-CRM114-Status: GOOD (  12.09  )
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
---
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
index 9fee2cf9ef54..45a4713c260f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_DIV>;
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


