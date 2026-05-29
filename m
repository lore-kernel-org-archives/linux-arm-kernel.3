Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D64CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=; b=2On5oLihBDdm0SSzvmIknvu++5
	pT4aYNcInuxksZvaLITNVFc9kASHsZuS21SQae+fNlOtXfbuJ/8rCaihM62AATUobGq9I5fSc7gnB
	hHFgwiLZiiWh3YKTicQXqeX0g+fjbpX6Fs+47HgUF4oTaRYqCwQhn+fMVduxlMaAwB3ofrV+mkrqs
	DlNg1jApZeMC492/ojFTAT6EYn+GtFVVe/wXGp7MmtZdf4ujTG3WFbdYT9x8sLPR6tLVQ4GEA0WUE
	ZZj6SUulSJnJ6nmWNfjFRUPRMjJefHp7RAwubcq7taUC7nsiQIX2qaFJi/roSOBCNr4HzME3sDACW
	E8FvGieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyVD-00000007Ytn-2bd1;
	Fri, 29 May 2026 14:47:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUr-00000007YXK-1I8l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso83526945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066055; x=1780670855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
        b=CvKNCt70nem2WfaJ2+8R8f157py2wVKbNOqlHYHJMwItlP7kTkO/YATKJt6ov09Zgv
         HrgZeFFiW1KnSADb+Ed/QnWFDvnAJyUj8X8qN7BGuA3yPMGk+TzA3I35KrLB7mQZS9fY
         upUVZLBbMzAfCuoZafoNKloLqMdz7EEGGj6DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066055; x=1780670855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
        b=ppjqDz2xLs9VMMl+c8XZys9GJMjSWu8Zupz8Zd/IVnurYoIM7PUUTlTVS4RDlJu5BH
         3Q+BKi9i1YEqvgD/56UoFwxTxH8Md67FnkOzpSP/bkCGpmbrE2qvIEGb42lad1jSYBuc
         gXAqHoxqe3H4uoS7GpGBtsGkqrbfN4OWeyhhEf8949mKFtWOiALsJ8/ODDd9TkJRDx3/
         PyTAsGnJYHceFC+L1mSHMiE63zUsSzsYTjM5WKeyWddIufGWTYJw8nyuxGR5QNfqarJW
         nY7kirc3fSLPeNK4OA+uqcD+FO4W4tzuAT60Wa5TBcOQRNyo5/g/A49JDWsesMVvCH69
         xwcg==
X-Forwarded-Encrypted: i=1; AFNElJ9pERVezke63L+DPSM9PmTv31QbjzQWZsVdvORmE3NBS6+MkF4b3I7nYVTOMCWwQF7IhVicTAiQDy418MBrAN5X@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+5sISQtWXbH4SOMs2xBXb+K6vTXY+RoRJ5tU1+gePnkUwSapt
	9pqddZvbE825h0aagTU8SoV5Do2bdVM09ADbSUW7yGWGy8GZktxHF2/zfKn/FIEWtTg=
X-Gm-Gg: Acq92OG/8fGCi7EKZVJRAXNf+hbmxhCtegnqGgyv3O5t0LJWfMj3P+F9GK80dyecM+Y
	/kXdYR3lBaJOAFvecgDYiOl9bvrgZitbPey8W6rJ1aj1ZUYFRpOCZ1DhlLeACkqMaeCLqOiGDvm
	rLQGJofAvzVlKwnDqXOHOiEjLeMfrAjvaDKimLEA5tatXazNBRxB9SoxKjcxKdqR8k00SXj9yoD
	Nsz6BmjwqN+Vd3rOFtKag6/11Ihe0Bj+Y8OvPwLQskBUChVO0UeAAY7ZVwT4DoMOAk3unfWOHc+
	JKVEWA/eaEaSPBQFXSI46BTkhHw2xkvtofYyN/ZgDUAYfGjktP6hjrgd3TUuFqMO+/Rc46WnocH
	aKJ3OGSNsftLuOA/iqCIlhZV33ODul8MtHkjpc2OpcN4QOg0gyZgS9ug6MSk4nkWHJrOYLOZ6lG
	TEq915sLvwmgW1/EOhHcorw+TJRXysobbLRcEw/blp51nFj1C91k1aU/xUioft9+ae5HWqpguLH
	0+NCFYY94a9OdeinP6mRlOHjVJ2FRvW+yHumB9XJxwT9zSNPsFQvoVsxwGMwZ0YhH+O0Q==
X-Received: by 2002:a05:600c:3545:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-4909c0d67e6mr59175955e9.20.1780066055347;
        Fri, 29 May 2026 07:47:35 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 11/15] arm64: dts: st: add usart1 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:25 +0200
Message-ID: <20260529144707.3931919-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074737_401814_7677F821 
X-CRM114-Status: GOOD (  10.45  )
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

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 46c5197dcd63..a72c458b2c6e 100644
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


