Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0125BC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGbEArrMuWDWY4KnUvGEebmz0jJ1pWwL3sEGMc5WZCk=; b=hrmwlw5qWSSLkD78DwFmi1ehJI
	+ulOMGvwhYPAzLEsfMHOQ+iPqnpL+yW9LOfMb7yOhgInYRtEinQ6gT0+EhRuzxVXJ9ur2Zy/EG0k3
	1PgQzGv92qPYDW4T7WmEXZd0y+8o9jeZsMbHyrMQpTbqDZFM8KrNra5X8w1qBsKUYPrnDt+DYmuYu
	zDkfNkjdBqRuwP41lIZJX1K4//Y5a4aVjb24Vq5bPhjHzP7DvSxH1qOY90NRQElYI0zYU3MVBXi+N
	Mbr0K+zsH/EXv/NdFZYJwlLuc/aJs+zrC//gnbBDzRDFXlCPK9dc3WT/2EcWenSZ0T7uVLFdtzhUP
	yqOm7RQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyyM-0000000BGZj-0W1J;
	Thu, 20 Aug 2026 09:22:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyy7-0000000BGVw-2ekV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:21:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-499b02fc590so7445355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217710; x=1787822510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGbEArrMuWDWY4KnUvGEebmz0jJ1pWwL3sEGMc5WZCk=;
        b=ih6M+F285BaDHIXePXZVeVRahzIIeOkwsczSqC+vDH6ELse4h5vHTqaAthPYSQzBWT
         bn/y7uNL8IAkIRrJwJIY6imOPpCwv8l7yHjqM7KNrhOgKi52Yv453wE7go5aGKS+E0l7
         Ify02vtAkhFPnZOTGuOtU/va9T2Wh/aMgBSWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217710; x=1787822510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGbEArrMuWDWY4KnUvGEebmz0jJ1pWwL3sEGMc5WZCk=;
        b=S304l4vnKobuH7JAwOXf1IWg2eW4yyNiin6w8FJ/BzoI8T+B/Al+nhtdNal/igOfcZ
         CpYcZSCcGGTNiItHJCAeLXP3tNk4x06mBmtYyRWcT3KPb/7GSZB3d+2cgdk/Rzbs2VcL
         pO+c6hlyrZyOcJaVgLmP6MMPe6MSg0ELkvOiLyPPS8X/Tocw3qt0zWCGUWfEr2GPYmoN
         obnX8OxqoH3HfGXjEH5P/ek4AA8s1uTdNLwA5td13ElREcihMM4x7NbmiSl5BQx3UNK6
         GaPx9ZOqowu6FexzvpilUW6IolORfrbRPOYjf9lSCOeEsVULTp+oYxatSbQKbLbSB0on
         sv1A==
X-Forwarded-Encrypted: i=1; AHgh+RqWSkM2tyT5MS92EfvI353ivfG8yBlt47GeUfXFYCIXuN9L2IyYwFZt4VEKpBrPwv6B5LMAx4/zahVNYlfcumLC@lists.infradead.org
X-Gm-Message-State: AOJu0YwES8kNC3yi0b5N83pjascuFSfMV8z2Pi8f8b91GrUpSAqt5ox1
	4JnOjvOewRBwxBgwcQdwq6ZHvp8MooBeGknYhSgKRkIcmk3lBMh+DISNwk6uKM4fvdc=
X-Gm-Gg: AR+sD11UP2hFw6jSCmm/2N+m8lH4JaHeESTq/wOWHWiGhxtDONm++6D0xKvAainuiIj
	a8OsJa1HdnLNIBPMmtYoYl9YlU7K151jg2ab0SO2/iyctCsRpTyTF1P682OjxPJ2x/JeWKEXxb1
	yPiaj6D/gQ5tAi3imdYpVeg6pvGmlG/hSrsuatIqOmBYNRV41KZeXbXUfMGXtB7nnYlFrgNtJkS
	rKAkRvd79gtnOcs1vdogfB/gbZUAeffWYjHk7DSTwUrLfBEb7XnPzSlVbThokBTXsYpTYPb2o14
	FAHI2qe2+FumFivM/XMjkVesr810tMoRS2DtOXu65bVCwU9FPk3Wuscp2mKMvhR6USHv5jS7Ooa
	B9G1Vo6bFhIKK1X16i4Q5gyr6DQDnzVG4wPXmgzM9Y7wCbkI4nlde4L9ZS6gUZRidzpdCqYbCL4
	FanDEpd101gDiteh1NBFk2MKP5gMvTpQsJ5frl+oBQtWf4EA2k9E4Kg1SXGvXZbrx25Q+38l0uH
	1J1YF1Tb8oa+mmSiXnGhDTgh45QMHgk3Ym9FQrk2F9WRCxsFFljw5H6m0Jot5qazOVFfuTPIdm8
	tpFTtFzAjHqYlicLZM7e0hsGpm+3x9tRJV0KV8sJB6n1zrTX4lPORzPbb3d+yQ==
X-Received: by 2002:a05:600c:3f12:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-499aa0dd282mr208031135e9.0.1787217709881;
        Thu, 20 Aug 2026 02:21:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd7a9sm165259515e9.2.2026.08.20.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:21:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH 2/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f746
Date: Thu, 20 Aug 2026 11:21:37 +0200
Message-ID: <20260820092143.44829-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
References: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_022151_699217_08CDE8B6 
X-CRM114-Status: GOOD (  10.27  )
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

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f746-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..82912cf9c4e2 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -721,6 +721,10 @@ usbotg_fs: usb@50000000 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 0>;
 	status = "okay";
---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0


