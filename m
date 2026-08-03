Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C60C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXf3pmqi0LuFkHaGKT6fPlR/31eLp6/vBKgBsz2saXQ=; b=k33gYocExUdwzPsZ3cmGlmAMpf
	gVFCIoSeO0ANuvtKp4P4u1J9ramMR1QOeYdH6GsY8vBGisnibo7XGIFcWJYKFRiGeuISJf30uCwA9
	P+FOt9ZrpPXNhuwQv4xtp3AJnQrJTWcGb2D8GUoRLmMXD4ve4OVII1S7jbE/xMTYUeFWCLwIpYoSG
	qSCfwhlwBKU6Fwq9hH8ogY6HwGGaPYZbzv42fASvsAmaw/igsyHeHHrHs65xwPAnJCmRa3yr4KQtQ
	XF5A4t2G9xJbE4pNpWpC63aixXUfkl9ZRqr3q8cpRH56FKU5OhhAtKPEjgOohhHswCcg1pi1gXtiB
	3R9ddy5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnVV-0000000GZIA-0hmd;
	Mon, 03 Aug 2026 07:54:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnVS-0000000GZFK-1urI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:54:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f6609c657so1529012f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785743681; x=1786348481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXf3pmqi0LuFkHaGKT6fPlR/31eLp6/vBKgBsz2saXQ=;
        b=MebYBdRFUs0Icwk1Cir0PNLrbrIsl2pp4ryaCDopxXUshQGTjMD7QJdBO4gbxBILP/
         kLJFY9V2IVOn6NTxtAkIO7tNu116P11azGVepJGecXz5MVcGqUuPq9L4q5MzLCLJCMjP
         PfcvvSwdDPBESnXXs0VxB6zUM4UHda7C27i+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743681; x=1786348481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXf3pmqi0LuFkHaGKT6fPlR/31eLp6/vBKgBsz2saXQ=;
        b=h1TnDwB5sVYMFpEUuRQ63+gVwx2AqhNCzMiJbioWcYhK1lx1I73bLjjow2tCZnYzXc
         aZEN6pJZOSKO1vWI2cXiNbpnPkKwcmn66GzufCl0crLGhQqCdSmqioDKhcchJzUOSORK
         /6EXCoKHS6E8KySAnc3laX359jNZM5fwQNDvOT6hdRDdOz4ZLX2TShYCxR5o+nA9F7xg
         Zi6E1bUlLGQ7o8AVaoZBiEX0uv2i79qLtmGHGu+QoWvjSoYUvXBlrtXzBiM9LHNe92up
         Kh+aa9a0sxNe2loCcvkTOh3UdwOduv7d91EfYGm15UUEIwnw3GT90nCwYo+CtN7aeCY3
         gtaw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+l8N7bhYhCJI4bmVlOJUmWMTQrvIu/VIG4l9wG8b/msOSWJYYviNmLyAtiZJM1mSL21hfFjE9+YxSy3likuwc@lists.infradead.org
X-Gm-Message-State: AOJu0YwGliC01cSn/NaPfC9hrP7Vcagwvf8qBFZycdtzzCwCGOKrdMbn
	3W8bXHwjQL59pZOTP604gz/BFjfN0rLFVEUs2Rbev++hF261DUveJ2qt47/3ekgQKMw=
X-Gm-Gg: AR+sD11chSZwSoscRInWAeO2WNZcqazwq0Oe7jelWFdav+/EBoEqN+54qMqjMQyfoBg
	6/9rbzCyW9+v5YNm1ZyOsfyABvw1+DLl24xv02n9LTawBIlsXm5G5Hqp99oNCf4StqdJgJa42v7
	AIuNmjByw1EbwQVg57WF1UOOgQqKTwIhwAca6m263P/aO8yIW7q/Gzqj4IvZdpTUL8SZX7Rp0LM
	MyC6B1arCVUijIiPMMdWpRRkvQPM2K9w/DQ9AV/onUG+dXZe1UqFoSLfRsv6VK87jilnRtnBBik
	TxKGyHB34ghoZfUHRNbljwt5RsiTGZRWV2p7OHAh+6yPSAzqoKkz0ISa0I4zgOn1bM/8kuTnAe+
	80cTiD9xBFFp+EUJ+l8DWiVELjn+hQ4ZhIysIxJH6QzPjlDL8QfF5ZPJ9/15DQ2zAAxmGCaA4TU
	DiVYxoaiFfJtXvZLo40lXEqakDzTxSqsQtyddadYGOydK4vPkNS4MHV9fH06ltdMXeOu/ADxncN
	uBdY2pULlx3GKBRyeHrB448TEyoMoakSQg8EdiEDHsxfNqjBNwunptJdGHgr1JjvWk28RokecrI
	ZYmJ9WkUuYQYfHPxRFOsyegEbr8g30rvVHkr7vTRnaZnDPuEntnBBMb75ytuF5rj
X-Received: by 2002:a05:6000:26d3:b0:47f:93e4:5389 with SMTP id ffacd0b85a97d-47fd72d4a39mr20707280f8f.20.1785743680715;
        Mon, 03 Aug 2026 00:54:40 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm29411990f8f.34.2026.08.03.00.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:54:40 -0700 (PDT)
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
Subject: [RESEND PATCH 3/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32h743
Date: Mon,  3 Aug 2026 09:54:28 +0200
Message-ID: <20260803075435.3825122-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803075435.3825122-1-dario.binacchi@amarulasolutions.com>
References: <20260803075435.3825122-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_005442_502294_61865057 
X-CRM114-Status: GOOD (  10.29  )
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

arch/arm/boot/dts/st/stm32h747i-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/st/stm32h743.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index 2f19cfbc57ad..845d13c61da8 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -732,6 +732,10 @@ gpiok: gpio@58022800 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clock-frequency = <250000000>;
 	status = "okay";
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0


