Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88EF606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ChzMwV2v;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=hCxRexOW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=G5XOvsID
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=18pDHMm0XqeCRNvNB8S0ooGOx5P4hUMuhrJSq5OimuA=; b=ChzMwV2vROH1+7
	UolCNLcD7W2jOvb+UiVFRi6y4oLECL3Q51AxR46H6HYkyRUplG5RlWFCIz6xCLiN+2RosEu5F5wUJ
	8Dt5er0wyB1tR0IHHTAMwes9sVUhYH/2j7D64MViTzYzMUkpQi52JCVg0/57th0GFyK7w2AMg2VnM
	y+B0nP2qRQ1HIzgehkw+igPt9U558mr4DEzLTJjG+ZWjuJ+zviLYftaahVYaVblCmjoyx1bZ9bUkc
	TQNov5naEcGsBB46agiQbBQ1iq3k1Gh1q14blkG8t7odeGK4B0xOg1WlAED82DjTOYKQ5FxLCz6oL
	rLDWevno8pbLVFdBHczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNf8L-0000000FFcf-34Hz;
	Sun, 01 Nov 2026 23:38:41 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNf8H-0000000FFbX-2BMk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:38:39 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; s=arckey; t=1793576317;
	 b=b2qrnDTXi3yaFdX271KNFMw/EGKL9XqRp8hyUWHxqbT3FklP9C4R653YqL5DxzbUtbDn3BVc1j
	  affPosKVMazw5bqqUcZhQkjqvOgawK5G4hy1YmY61XrjYMzyvQngU9LCz3AEJ9QV1ke6O1G+qZ
	  nsC6SxFg2aekh/7hPkNjRgLknHY81kpbL8Xt8GBr7RUjyjWmPWJPvQPOvDCC3VoGKljUIasL6R
	  1p+nanvHCYWUb04kcBjhZ6sYWubO2iRKbqWVsb9ubKIbSvJu3btsrI4V68u8s78AeSu/tGMOIx
	  uSN0+d5k0HPKWW1PCaty/DH6nD3FNI4UeUxdWuF32POuUA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com; s=arckey; t=1793576317;
	bh=7sSWwWaTdi8eub1qzTC0gPuMXFcGQ/27nlgu71hjiaU=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=NhdADNbXcB+Lo1o2TiSbKP4t8nlgzdPaJzh3DgYl+AsnzyRO/0FExD07f54Iec+aa8G5tJxyXl
	  HXT7bcfdGszVsLGbZlRVqrifAEafmTg3XupBtLkZa7PyTouPuzzvmkgsGw3zVY+hJb+uGJek+k
	  ul7VUMZeJRsd0G0r4xWG1tJB0Q8WC4FIWVcgN1h+cXasTp1TYrWB7EKIkNAaM3mvPN6sSw4MA5
	  s7S2wkjViFNiZtKN+W8D+V6s+npHnoYejyCu0tONkf9rjO9rZ2FzAv1ca9m96QtK8pyQHu8Rth
	  W4fM28jHK6JB0Suqz4olLIp21+Mqbo/z+u3r1ao6nTjOyA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=18pDHMm0XqeCRNvNB8S0ooGOx5P4hUMuhrJSq5OimuA=; b=hCxRexOWHc+NyaRLFB9rkewpmL
	zwsn+/INWV67RS0nVjIzgw3DrVn2v8q6v8PnF3bEKmyXoGEJVs/Wx+k5Zc3bUfP1DqBwybSfRDCNr
	Y8XY+f2EKmazE0MriGK4X3kPWkq1Qr0JLZXNceg8jr6PZmrIICzivedwzdxb009YOq4o=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNf8F-00000007FL5-0aam
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=18pDHMm0XqeCRNvNB8S0ooGOx5P4hUMuhrJSq5OimuA=; b=G5XOvsID4NOflI9PqG6tJoz65d
	CPoIHKRNxE0wJRiKaDQuuqn9GWbsPTeP+qeZOaH2dQbcnD4GKW8u2Y4Irpp70QlQ0M+lHH8Y95Ryk
	lG1gsdql1owqhV535+itVZvb2xWwlsXLHVmy4qtzOwEIg9GN3D70N8jv23gRh3zEJgow=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex5-000000002I5-12xV;
	Sun, 01 Nov 2026 23:27:03 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:48 +0100
Subject: [PATCH RFC v2 11/11] PoC: arm64: dts: imx93-11x11-frdm: add
 multiple vdevs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-11-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5433; i=francesco@valla.it;
 h=from:subject:message-id; bh=7sSWwWaTdi8eub1qzTC0gPuMXFcGQ/27nlgu71hjiaU=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+3Zf6yTVVnmlPfLqdymm19lH6yJfiB9QiFRdeUrt
 S3P2d30O0pZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJ9Gox/NM5KtapZmmRzBvZ
 8rt/Lp8c4z5Jhf1dwYYbQ1f9t2SfIcXIMOXAhi9lc16/mzFj+gLdDp61l/UY952N6FV7MrXojoy
 aITcA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0a7c9f082515acdc1aaa901989aaa46d
X-AntiAbuse: ID - 0a7c9f082515acdc1aaa901989aaa46d
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNf8F-00000007FL5-0aam-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-2pfm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_153837_726509_17C129E7 
X-CRM114-Status: GOOD (  10.26  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add rings and buffers for multiple virtio devices exposed by the
firmware running on the Cortex-M33 processor which is part of the i.MX93.
It is expected that such firmware exposes, through its resource table,
the following vdevs:

  - vdev0: rpmsg
  - vdev1: entropy
  - vdev2: gpio
  - vdev3: i2c
  - vdev4: spi
  - vdev5: can

The order in which the devices are contained inside the resource table
is critical, since it is used both to associate vrings and buffers to a
vdev and to map additional dt nodes to them.

All vdev buffers except the one for the rpmsg bus are declared as
restricted-dma-pool, because the corresponding drivers need bounce
buffering for the communication to work correctly.

Nodes for the gpio and i2c vdevs with example children devices are
included.

NOTE: this is a Proof-Of-Concept, not meant to be integrated!

Signed-off-by: Francesco Valla <francesco@valla.it>

---

Notable diff from RFC v1: the rsc-table node has been re-introduced to
focus on the changes that are truly in scope for the series. I still
believe something is off with the current implementation, but I'll
tackle it separately.
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 188 +++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 6e8351d12016..84324b02c45d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -137,3 +137,191 @@ MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
 		>;
 	};
 };
+
+/* Multi-vdev PoC */
+
+#include <dt-bindings/input/linux-event-codes.h>
+
+/ {
+	reserved-memory {
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
+			no-map;
+		};
+
+		/* vdev0: rpmsg */
+		vdev0vring0: vdev0vring0@a4000000 {
+			reg = <0 0xa4000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@a4008000 {
+			reg = <0 0xa4008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@a4020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0xa4020000 0 0x100000>;
+			no-map;
+		};
+
+		/* vdev1: entropy */
+		vdev1vring0: vdev1vring0@a4010000 {
+			reg = <0 0xa4010000 0 0x1000>;
+			no-map;
+		};
+
+		/delete-node/ vdev1vring1@a4018000;
+
+		vdev1buffer: vdev1buffer@a4120000 {
+			compatible = "restricted-dma-pool";
+			reg = <0 0xa4120000 0 0x10000>;
+		};
+
+		/* vdev2: GPIO */
+		vdev2vring0: vdev2vring0@a4011000 {
+			reg = <0 0xa4011000 0 0x2000>;
+			no-map;
+		};
+
+		vdev2vring1: vdev2vring1@a4013000 {
+			reg = <0 0xa4013000 0 0x2000>;
+			no-map;
+		};
+
+		vdev2buffer: vdev2buffer@a4130000 {
+			compatible = "restricted-dma-pool";
+			reg = <0 0xa4130000 0 0x20000>;
+		};
+
+		/* vdev3: I2C */
+		vdev3vring0: vdev3vring0@a4015000 {
+			reg = <0 0xa4015000 0 0x2000>;
+			no-map;
+		};
+
+		vdev3buffer: vdev3buffer@a4150000 {
+			compatible = "restricted-dma-pool";
+			reg = <0 0xa4150000 0 0x20000>;
+		};
+
+		/* vdev4: SPI */
+		vdev4vring0: vdev4vring0@a4017000 {
+			reg = <0 0xa4017000 0 0x4000>;
+			no-map;
+		};
+
+		vdev4buffer: vdev4buffer@a4170000 {
+			compatible = "restricted-dma-pool";
+			reg = <0 0xa4170000 0 0x90000>;
+		};
+
+		/* vdev5: CAN */
+		vdev5vring0: vdev5vring0@a401b000 {
+			reg = <0 0xa401b000 0 0x2000>;
+			no-map;
+		};
+
+		vdev5vring1: vdev5vring1@a401d000 {
+			reg = <0 0xa401d000 0 0x2000>;
+			no-map;
+		};
+
+		vdev5vring2: vdev5vring2@a401f000 {
+			reg = <0 0xa401f000 0 0x1000>;
+			no-map;
+		};
+
+		vdev5buffer: vdev5buffer@a4200000 {
+			compatible = "restricted-dma-pool";
+			reg = <0 0xa4200000 0 0x80000>;
+		};
+	};
+
+	gpio-keys-virtio {
+		compatible = "gpio-keys";
+
+		button-v1 {
+			label = "Button V1";
+			linux,code = <BTN_3>;
+			gpios = <&v_gpio 23 GPIO_ACTIVE_LOW>;
+		};
+
+		button-v2 {
+			label = "Button V2";
+			linux,code = <BTN_4>;
+			gpios = <&v_gpio 24 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led {
+			gpios = <&v_gpio 18 GPIO_ACTIVE_HIGH>;
+			label = "LED V";
+		};
+	};
+};
+
+&cm33 {
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev2vring0>, <&vdev2vring1>,
+			<&vdev3vring0>, <&vdev4vring0>, <&vdev5vring0>,
+			<&vdev5vring1>, <&vdev5vring2>, <&rsc_table>;
+
+	virtio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* vdev1: entropy */
+		vdev@1 {
+			reg = <1>;
+			memory-region = <&vdev1buffer>;
+		};
+
+		/* vdev2: GPIO */
+		vdev@2 {
+			reg = <2>;
+			memory-region = <&vdev2buffer>;
+
+			v_gpio: gpio {
+				compatible = "virtio,device29";
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+
+		/* vdev3: I2C */
+		vdev@3 {
+			reg = <3>;
+			memory-region = <&vdev3buffer>;
+
+			i2c {
+				compatible = "virtio,device22";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@50 {
+					compatible = "atmel,24c1025";
+					reg = <0x50>;
+				};
+			};
+		};
+
+		/* vdev4: SPI */
+		vdev@4 {
+			reg = <4>;
+			memory-region = <&vdev4buffer>;
+		};
+
+		/* vdev5: CAN */
+		vdev@5 {
+			reg = <5>;
+			memory-region = <&vdev5buffer>;
+		};
+	};
+};

-- 
2.56.0


