Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920CECA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=; b=KMx8cPFFoD4y9hiGEtIK/aeyYG
	DPKcFa5Vy4Y6M5PPDHYDx+NT63bjQBRQb5CxrSTdc5PZRHjPyOKslCaOcx2P0SJMxshMGR96N9QZ4
	kLlt0lLlJ7EiGXzxX84yuZPKe8XDvP4hiazBfDCiAEYA7186LlOfOybauIT/21ztbq8JZAAfO1cKl
	T3PcTbvo7Uq63vnYmO7ibbFYVr62qBb/2isYUuWL4+KwttXJwsH5eNfkG9K/wJi2P+u7/Wp55JOvV
	tyvlePsiKBzfdYcYxZzMQWP83aQ1hY5sjTaGXtVUsDlIEbR29L0shsSTg/dXmnt5PtAWQq4t5vxZk
	vIQML8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFD2-00000008fFS-37Nq;
	Thu, 01 Oct 2026 11:44:20 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFD0-00000008fDe-0GFx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:44:19 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f63546c5so5684926f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855056; x=1791459856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=hLIpVfwHkidZWUsS0JKO41f6JbXxvfc5lIDqcLvcZxsgqQNL9bEQPIpiqTR608oR3S
         YYk/WZ4j1IAix21xcO36k1pnO0UgSULpZK3dZE4rj3zhQ79jqt7hG8+3XsDnZRw+T1bf
         hpndpW96dSsbG0Z4s/zC3x4Q69/lUyifVE04pMpXGDoZ32wI8XwgNSZrvDiFCTKf+Jrs
         8bz++hVOoEN7It8XBzDLfX4J0ZWpbfKgMsMxsscy2jc9qSC79GGGMdhvCTcCmUM0jQK7
         H5CbSwcmBzQTR5jvEvywRBKoPunY7hGAvSAB2jy3BJINE5aQOJiml81lFxru98eXhy+L
         GYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855056; x=1791459856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=A01LNQ4HJimpUheBLzb8EfhDvXIBTqlTSYOCwwDfNF1X7yOMq1T3vlLUiXJEbfFOpb
         PtWmgznTgPesXdQxw0NxPEb9h7wfiV5G/gP1in/AqG2di1pF48xcLJC/MKreJaGdm5Ln
         ZKH5iQhqrjPLXQiUMSl+naM6PVGFWgRa4KPxI7jYkyR3qRYRRHkLqOZ4deqP7RUZqIPd
         MEv32ayNv0eWv97teT9/B0Pa3Wcyg9UtnTWH49fhkWxOE9jLIjs9u4K5PsZ5M3jlYSKM
         A+gUzMGD3AOTFyxbrlfOC7wvCNbYlozrLYvq3dwZWAbecc9WpSic6BS+AdabAmuGZj+A
         7BqA==
X-Forwarded-Encrypted: i=1; AKwUvBzj/3EFn1We2ODg5ofmajUU6RE6BU2GZa1J8pqXzqvG2/TpfNcdsaUoWQN047fvAhHnzbbH4nvGBu6B8KVDg2sG@lists.infradead.org
X-Gm-Message-State: AFq9FYIwokOCXRfXnfE832yucZ4g6J4K4Ac8BG2GIo8sLAoHaTSmY2x2
	5pi4S70Oz7A514Et0RLWWCUFlZ3ozCRoInHTOV8Y7AI3h73g/8vbAyA0
X-Gm-Gg: AYBFou3shHN5Cme1YdH+kXJUV+6QOWHxM3dGCLl2GaLMYyu6ag1nuDZZPJ2Gz4lf8iB
	SYSM6fGckcHxMfaOZCHFbvpdP+n8SfhfEQgP3gwr/mDbJVsxNFgOgMNKzcfdenG4T/qt8Lbq0ox
	zVR5Lo3pL6FuzZNlQx/hW+qF/DvkIGEmiLH8ZmiRojFjQrGC5nL4aR6XhRKWy4WTLkdXu2oXbCt
	oDW4A1cUK39u23tEne4uNOH7tYEbtyb2e2q4oIkTSgYxUs1NhxfG9vmGfu9yYj8JVlHKtu0vExE
	N37UeOZ1IKcFiVwmijzPFNwlGbS9iQ7LKhcQ5MZZR4pQQ62D+itKxDd/EmiOir9sPREzUMDeKwp
	i2sqRLDJC0h8DvqQvUt9VaMqZQz+RgXKap2B966IIesdAulFRMlJc69gidglNjAkzbSzTJvTkkX
	P6ECR2q3qJqtzf/unFLM0NoV4hW0+BQ01bkODF+9mh8rFZixx/UcN1X5pPJCvQHAxw4fORFwkiI
	B9FMtbd3gacopk06iF30eyQaktL26imtOYHdeUxk5Yig+NUPZ7zNclrpl1N3M8v4PVAHw5jpNg=
X-Received: by 2002:a05:6000:4b18:b0:487:14b6:b1be with SMTP id ffacd0b85a97d-48b024d523amr7320787f8f.25.1790855056060;
        Thu, 01 Oct 2026 04:44:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:15 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:09 +0200
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-1-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_044418_126647_D174F37A 
X-CRM114-Status: GOOD (  10.67  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
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
 

-- 
2.43.0


