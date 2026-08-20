Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67FAC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oW27beU6QgKp1gbl/qBDEPHQ8TY/2rtuftNabzT71Xc=; b=A0FWKhA/51mT/paRVXUu3UCoXw
	OwpUWVhhoI+ZnN2dDmo2kGfbAOoXBpN05iT2LzWCxnqOseUKdFaGnSZG+mMkDLqfyZ8LG5YOzPsjy
	jTo/8QdwuN66E/C9Yw41OsGFohzuM8LdDg6UQHeWZd+SAz4CMtIWaVziYwfmQlu/24o0LIc/F6XAS
	ULdaoVAInrpQ8R+nyfxK9uIouOAfDAipjffQ0itGBUSt95tA+JvI5vNtReOF31aAgWTLxbgPEJktE
	GJXCW7eq5VaAh+kuZGaRtYCqJskpHatcQ7FItGIPKTAH0hgBmA1EKG1njM/9cNucauH9EOR73CTMK
	hmabOmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyuP-0000000BFOk-2Wnr;
	Thu, 20 Aug 2026 09:18:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyu5-0000000BF7L-2ZOC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47fecbb7000so1051529f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217460; x=1787822260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oW27beU6QgKp1gbl/qBDEPHQ8TY/2rtuftNabzT71Xc=;
        b=lMnhvNDN582LMA3nkTlrcCw30QPmVmm0jiNxxh2r6VenbApBlmLVq/eQVCvn1BwtD+
         u5AiSATU/u+2M/bPvYfbR2x4wcWLdAkpUfUEn9nOQnDypSY6D2hTdwDiymHmxt3Ni9Ab
         848l/Dw9CmSXudXjo2QAaSix4e2H8bk8isE9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217460; x=1787822260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oW27beU6QgKp1gbl/qBDEPHQ8TY/2rtuftNabzT71Xc=;
        b=kk5y1wJrQH7loT6uFc04iIlH7zwZKFv82xyW/ZlSuhlc7WNjUDeewNe2YroW2QcAI5
         HN1qBFA2/ZzVDDL2KLwldREmBsCDfL2ykWSaPyW4UeMFc5SxxaYmf2KcG9MqB7jOou0b
         qJo98xJaEFWQwc2xOT2H0v5UYTC9Nv1gi0FMnIvyOAYJ1lyUGG3/m2r6bmAIEp2MhTU3
         ZpR8xR2+YQh1WfDdiGFXLSbggpcjwnNjIduGqV3aP0dO5rXVS0OzVTwc7JfNoVryrRTg
         UD7c6Xfo3E6fkTZguBi71TGqmJ6znrmYc/MK2OurKJQVg02nOhlyVtB03kstceugy+lZ
         N0QA==
X-Forwarded-Encrypted: i=1; AHgh+RraRc39ldxSmiEYIcKyFipvQNdg2SYprzsfWofw34GvPVHLvAjYEuTxe+5A/HxnFOlVIT6UmiLvLuFM82I5LTW0@lists.infradead.org
X-Gm-Message-State: AFuF++k6XhfOTWtLQryL7WcLZR5M2+P7SYgTmBDoBRePFXujQoCtBcfK
	4GPGbkjisRHloSAWIFobPLYR3Xgel0Z3FVfgiZ2USYgZ844ndH4L9AuD6yk+EhgWaz4=
X-Gm-Gg: AR+sD1272JBsCTIM/aGlvmZ2VCB26KGVs2HCEL6XTOR/wVpUuimjUml8lyZrfLbFtPW
	TbjA5w31F0gATfTYxKG5Py7mw4JAIGL4t6NFswcopjztw/Za2YXf73d3nbggfQTF57s8pWDIakA
	NyO/XBGBvZ9arrUVQISVwWAi4yacvQHoRLux9QpQiczPSVYGFGGQdZScklTYyF/H4klRdxBdrcA
	sQcFfyNnhlXy0AgTm4ks01W1kiphPbCY6UZkfl9w1MgtngLWlwEi/1DVlKUGKeKkG4/ESIAbwfx
	zG8eXdlPKPTutGA+7AkslBmZZrWFezMOx9ObchQaF+sUvDWiwB/j+yP6Lm0xW0oD4RR6WbKJpHK
	4kNUBgePbgRX7OAkOs9paA0iAmgnC6eso+o4fVouaQw+I/F3NttDU9PxOxOKCGSMPRnSlLwl+0z
	8QNfub0cL84bq7CUxFdJsC6KiDdlKuA2VHVLqCw60B/irv2KDgM6Nx4EDf1DPqDV/IGjnVLJHP4
	MMYXqFqqQ5qAHJCmifkOyX13uxb27dCLUaw340UBuvO0uNig1e1OIAqh4Yu+CVpmKfx9GLB4uW3
	7u/k9o9yHXDWUZBS8GUSfe2FmtNkNOsnzDazKpSz9gWFf+s1xPbZCTR1PLq6/w==
X-Received: by 2002:a05:6000:382:b0:47f:6f6a:6a7f with SMTP id ffacd0b85a97d-482b1e91ccamr20276156f8f.8.1787217460014;
        Thu, 20 Aug 2026 02:17:40 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:21 +0200
Message-ID: <20260820091652.43541-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021741_700222_CB60A5E1 
X-CRM114-Status: GOOD (  10.59  )
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

Add the usart1 pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4e570e2e5157..d515e44832d7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -766,6 +766,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, AF6)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('B', 10, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
-- 
2.43.0


