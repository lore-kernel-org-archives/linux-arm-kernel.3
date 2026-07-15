Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EED7C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=; b=LoQdA1LI4eQsbT1Cflj8sL/HOA
	Fh/H2GsnsihrdodYAVgwwWD20h8Gi0P67i6xw/WsLCMcBlUcJkeCVjGzVLr/uHF97iic0FwiJv4zR
	7OR3cUgx4tKXQBr/1QZO/h7biHb9/Pke0BhBpMrZWYd/+lai0r9RJ9Ue3Bj8+7EZZp5qtGM1ivRK1
	BW2wOVD7tGK+ykqyL/jXKuzTw5Vnp99HHcR5injzHHP/YkxIF3sra84bJ6OkF+gI1IFEtAz4h/F9d
	pPvgagRm+7OhxH5jKj1eakVZjtnIzRVHxfLv2KfXTJUru/86uts48dZrnKrzKiWMfrwmIVwqCGCWp
	74avbGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt14-0000000DsdW-2xen;
	Wed, 15 Jul 2026 06:22:46 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0s-0000000DsS9-3sFj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c15d111ca99so499330366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096553; x=1784701353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=;
        b=FN1GmKvDvwLXGVfuJSQy/tgQra2nxnThuuUZpeUb+x0R03VnqaHJArFgOl/rp9W+Op
         DJMiRDKUmKzI3EQHtXZo4M53jpJxAxLkpPcMDA0ZZhRzztSK+GeLRm+p8VGOMmbHGP52
         4MX/ToPBuyTRLHuewfFqsgOdqxF6hVGjbH5nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096553; x=1784701353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=;
        b=Zi1ylvIstow2W56fqSJoxQtCdgma/5QeUZfoNhAw7RtsD6ZMUkiVoZfQWMGVlYcqCF
         g9g2Hc3luTB+wQ+gwWGqj0mMQQmCVt8a94JKP1lBGhKOso6N77DB3NKKhAYv1WXhkbTc
         bM1J0WpdD3UbwLhvomUAt5Z1Tbc6hjy0pkLpW3ndn853zzCb8nvwTxefbMiUSPRWLu/S
         vJmojgzgDDDSP0KoDshPwQWE/20QLAfDkPu6bGq2rIWIt7GRKGY+X6FqUzz+/rlwu/fT
         KWvym6pK8bWh/iaLj4sKKGu6O8NPjiGmsmLZGuy7xU75QOS+bj1XhHgFN5y9mHZ5eY+o
         7KKg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9KC0xcNT2xe02D6oVIXqnaSoXnrF7xkvC19lI24HtZY6pIBW/NdrCJHW+XKFGclvVHv3EJkjqo/Q/yf0gRDlL@lists.infradead.org
X-Gm-Message-State: AOJu0YwRHpZnqXEUbjP0hLzApEe+ygfjvEA0EjONlxt683dIozztXTth
	3k2whrB+h2geis+4FkdztDDt5TX21SBr87Dx8Wi5rfpOpTAKIQWv07mGCDJhaHYRH/o=
X-Gm-Gg: AfdE7clzO8UnoalggOgJmHdxe+tzJIf7ZmAuyb5Y+ouDu3UDIhoEppmbxthF7tCEJmO
	7rdAV7bLK0vD2YZ2qVdLywVcschasxrx8KvrwWecPHoQEfyOLOl0h8M+PmjSB/u3JjVXo1wNLlX
	GhflPGHOrnAmYFW2tmIaZ+qggvorgiwcTClyNi9adMqiFB31u+MyNPaFZ8zrQqRl8HIPiX/ojWv
	0zW20YYjxGCLMxh5lPsWleVdyiIeYuNFgQTkfI0w8RzBm2gkKLu+zxe0zBSNjsa4CUNWS+oBwNB
	txNKdnjLDkZOjIfyZvhRgBuSRkwmgKAAsld9zDcjnvv8hu5d7ESvWkvnO+1zyp7E4KUqnTxV2Ba
	uCWqYFN/j366lmrRGEWJK25xXHSD4/ZoCFohQy1v3eIbEApsKwUReR6U4WKWM7mVvB4VNbsOAP5
	OID9vA9xF1qAYvnr5ksiZwCfnXOm5uyFrhHMZrb3snWp3BXIGiWZUCN0fnSnOTANvUNVb1pTKlH
	o2nfMRTEflQ
X-Received: by 2002:a17:907:3e9f:b0:c12:86a3:5425 with SMTP id a640c23a62f3a-c16794d6874mr98915166b.62.1784096552988;
        Tue, 14 Jul 2026 23:22:32 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 10/16] arm64: dts: st: add sai1 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:27 +0200
Message-ID: <20260715062201.3599458-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232234_978615_649F2407 
X-CRM114-Status: GOOD (  10.96  )
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

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

---

Changes in v7:
- Add Reviewed-by tag of Olivier Moysan

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 695c9d771853..002fbc724b9d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -520,6 +520,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai1a_pins_a: sai1a-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
-- 
2.43.0


