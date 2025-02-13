Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DACC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYYMYkxftkNwTdyqS8CRT4NccxOq5tlDjvnPZc99yTM=; b=eAStk7H2fn7J0UCv0EYJoYwcs6
	7mE/Ju9glTFhMAvaI/lZWbFfAvJXYYmJ/aKKCoETVhWfws4ds6qNK5NvatVU6+XoNjOt8DcmyJ/zh
	Xq/TBmFf7I6/4FM3SupVxIF/+vpv9Z/kZsPdSFg0SXK7aKGpxWklHP447Cp4c76SeLs4urgWJ0GIH
	qZfuT8TZs+eaaX8Nr3Fk0svKxmBJhSjBlQaPaL9aKB++V7+baWT566wMcMx2H3kHh5dTT0nC+epUH
	H80vjM5YMinhBoK5Hm1CNyxq/aCwNdfik3lRz0rDqR+dkyK0f7jpGBfYpw9LWrpNIsjHj2Sr3riAA
	0XEVHAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVnt-0000000AWpw-3Hfc;
	Thu, 13 Feb 2025 09:46:41 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVib-0000000AVXH-0xvc;
	Thu, 13 Feb 2025 09:41:14 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-308e92c3779so18493961fa.0;
        Thu, 13 Feb 2025 01:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739439671; x=1740044471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYYMYkxftkNwTdyqS8CRT4NccxOq5tlDjvnPZc99yTM=;
        b=UQrlCwUThgoVm1h/Vj/wlTjRE78d7A2xk6WtakhYpXxoD7PX0L7IZ7x+OsBI2XJOCJ
         j8vgoBZERiA+tdsObnKwclWz7V93kcfFzAYiM4V5eWSWkAr3PmrhQztevvawFXaYXRGK
         3WUsbs+2d4gk7QQejxUQq3u3Ct//ewt66sXh5A1f7SB3dcaFJajkrmoxTUT/o8BB6JZJ
         /3n6Lb0urS4Zo19ImmuIy5bXEYOEZcaZUx3H0fiU5pQEFmWnjY1XeZiKKZinmefsCoV0
         oJgXZIFPJOVLhRk8oXNuUsKQd4mvZCHPoNhvBh3GeWZl/KDYmUcdx0efONQ7XKuFVK70
         +rgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439671; x=1740044471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYYMYkxftkNwTdyqS8CRT4NccxOq5tlDjvnPZc99yTM=;
        b=ojmaLB7F4AGWmSZTYAb0oDXkfj9KTmO+wc6POnq67hO9uiFy0fW6DbSX1iafZY4v7i
         kWYvKA0jZUOH/6TKWQe7u69d2XCx8B+RN04T/6jeJJGNaIoocxcvDIVmeZrbVbDEg7BT
         2JOPalXIIm8eaDbARo/AeAJlsz7CpbFDKzpXeUQiZ5Bq/V+HDqFsijeARdSDoj054GkR
         eoY/wvizfc0YiFmnyJEPBDf5X8Bdx/V0uXKTnrrak2hVnxz8BNwcJVxB2DtJAnAQV5Iq
         CETbhQWzi8JQ6YsbcYZ80UNAhmukD/zEQteE06OOs/k478c95/2vcnDUVcknUSLEJhVS
         XCKA==
X-Forwarded-Encrypted: i=1; AJvYcCUxkoaqN7wD8qT2pfxP0N2dQOkGHc8RwMRfksDwf8eJUg6aPKS1Yz107t2L3SHOiQdi+JDQWqoKl+gQF8k=@lists.infradead.org, AJvYcCWWv0D+JMhNhTH9BH+tVVfPV1uy/V9cBIxXz3uuY+m+kem3/tvlLNq2QRK321YGlg+t+tKsiT1cBiHaAv30+YAK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4bhLlgwhYb/EQajyR8L1prXDRfZp03dagcSOWBWggAvBopnz
	90QH4fm0n0QGKWgdB9/JQbXdib/WeIRoDytnbQt6RDo5z1j3guw=
X-Gm-Gg: ASbGnctoDmirblIm2BWcZI439PUVD3tTjKJuCE9rv4sf/sTchf+RAfqUeRu2+64aLT4
	6kQVUK1+UWGqSwS/l9VxpJEbpCRc4VkC7O1HR2ir4RX6XBFcZbD5Igl4aVZ04P/vU5Vqhr+actK
	0QXCbUBW3LIEC79zfBtFkX1hg7IrBZ5KHAqxnwoYzWlz6Z11/nh8IJ4BdAPWC1hT1n5sAiJgjT2
	1nCDN9RhGchNOkmlBWmqD2BWVY/8foFZBe8tKIkTRkPLFi4L+lZSm2qbnh5xlaWZaomdZ3GvaOD
	Qi6BIZvtXTDikipNKXdPqMqUHqUcci0=
X-Google-Smtp-Source: AGHT+IEU1Xe2lAmPO6iNBTAj5sggwrT8IjsKe7vRboIZMPv0WTY0Zwji2mjdrlZbGMkJm2gu+P6b7Q==
X-Received: by 2002:a05:6512:3d1b:b0:545:8f7:8596 with SMTP id 2adb3069b0e04-5451e5080e4mr706332e87.17.1739439671065;
        Thu, 13 Feb 2025 01:41:11 -0800 (PST)
Received: from localhost.localdomain ([178.176.176.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f10cae7sm119518e87.183.2025.02.13.01.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:41:10 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v11 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Thu, 13 Feb 2025 12:40:14 +0300
Message-Id: <20250213094018.134081-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213094018.134081-1-privatesub2@gmail.com>
References: <20250213094018.134081-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_014113_333246_1759BE41 
X-CRM114-Status: GOOD (  10.30  )
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

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb028d..2c26cb8b2b07 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1


