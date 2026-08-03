Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A5BC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=; b=Yn1+DW3+ue10UjlT2PQ/jvFZ19
	FWj/xSMqvYjs6hhkiu8yiNY8CmXmpOuqEt/52uWqDpBpjIrIsD1U0ZdxnFuAC1eL35tFil19G2+mo
	/bDbQq0NVuQctgGDTuFFXrbQQV7TKoyY/4LszRmxOQpVN9ic62PZLkeA82RzZPa22GRMuxtlwL8TL
	mio9EGgcySxcXkOjAJio1TJ3y5q1vas5R9avy3m2SBKxYlZwj35jU/7XN9dTYAN71CEBdReGWLr+p
	rrj4EHo1Gq+XIRQfsHlYESVeETObhUwzfYUoUC2sfDsqTOD77fWyPYgP0rXQsUTeUAU1F8oZwGAKs
	6s6Ju1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnK2-0000000GXMq-04mE;
	Mon, 03 Aug 2026 07:42:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJz-0000000GXJD-2Dhe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:42:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1960406f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742969; x=1786347769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=juHoLk/ZzbhyV06VNeso17CiSROYsyLG1i5trrxbWRdJ15OMtuTh9fuoQo6EgjObrH
         0GEH70na+CK/Bt7FeaZcL8xnFR/WBjuPTs/kTUTRcSxHgA5p9lfs6lRdlSmPGiqkzDaz
         aFgCqZfPSTVbQ82un8VEPcFfwdnq6HRCkvq7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742969; x=1786347769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=SIvHI8w8xOdTkaN1MYkn8x8f+daxiefu+a5DkjHdBuQp0Rr+LhU124q2DmK6bWn1Tq
         fxZJgFtiEnFoDgso+4IOpSzni0GmlFQWD2IYQrF0ZuqOxPtMQp61IGJ3CHBJ4VZP6W7m
         ptzn3NrQm1J+8eDIn9wmKLOoOjp0ibeqwV19bFSdexNnaZ9aK/gaEV+QngScRokvQF7X
         JTaVOD5tktGxNS3d8B3de4Qf0/Hp1atX+JLdYOUkYSHZccgU6C3pGA0iyS6m8Xv16vaB
         RIWlMfU4s+OLvKqYAJmqQR+vIGoRLVHKb9+vmgGT9S6BEFXxy2PqFqcR3ImhpzpweaPx
         EqYA==
X-Forwarded-Encrypted: i=1; AHgh+RqIom5enPicYB/m2Kvg6HKKRqqBSvMRa9+zKO8/0zwMpGuI12PAGGJEq55FfvEjFxLDQEXSXaqBiM+OFBMhVsbM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Nt6nlRz4fM/5pWo4M46ABCkz3eq7YNINhvDsjaH8EfVh1+fX
	Jx3hLrgV36crV7Mhgnbhyg9SqP2c9kmg9HC5sY2FZE+NeshQEiiqYHiUsjKh3G/D6io=
X-Gm-Gg: AR+sD11OYgaXcIyheW1FiDB8f0jbd+QsVld0tmUhmF8s02SUkjmVkt5gYAdbTRVNvtq
	pSlKY1O03e6RcWGJioicCN97my9PFNUDr0CnMGR3+W4nw+WBvTMwWAlgL48eTR19QP+ixWXp56k
	k3ARce9ICPwIwLt18BdQR9LVxvD7u5+GbBalIqjrtKDihYtukkxUqEfA8Y9FNIqM4BqU9b0vhW1
	khDHHDkoDt3fQD3v8yep0LA5R+s1fhY4lW9s92+9JZHiu/qKsCUIZyCylFe9C1JOCl/UKa/+pbk
	ugYWyiUEuc3kkR2bkX0A1lupnShs12zqTh5vuktl8BSGK45xvM1UgFc+sEh9LYN1y55Fpxa3oFb
	QMpEm7+uSTLCp9Hgrh5ZsMMj9EmES4DFClJFCfUffTpMQ1Qg86/CTetnJ9rcfKj/8bHv5ig2aud
	lq2SPijigjx0ROZa7YvxGSjxCo8CFezTb/q4/sU5oz42sb/LyH681rRXosswz2zWt3ettoVq9OS
	x4K6CqSiAowN1Ds1uxFY2ckZ5ktw6xZkMsM8ZKOzBXNJRhX8KDKZsOD9O0PITzjXLxiU5GTl6Y+
	zPJaCk2DXor9fY/+v4WXvImigHYNioOpwwSoRCAKdhrvf1Ebp1ahH3kuwVcaXaPIP7BXsHlZv/K
	R
X-Received: by 2002:a05:6000:615:b0:47f:81af:1a3b with SMTP id ffacd0b85a97d-47fd72c4be9mr22840453f8f.22.1785742969562;
        Mon, 03 Aug 2026 00:42:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 06/16] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:01 +0200
Message-ID: <20260803074224.3821911-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004251_592806_EF7674CF 
X-CRM114-Status: GOOD (  10.64  )
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

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0


