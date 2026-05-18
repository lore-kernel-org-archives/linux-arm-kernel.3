Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85BACD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Sy2PqXZ6ebOtE0DOUjyEW5oMkeY/jMTLVTy3qbrNxw=; b=pgiLkSfgehOHVAnoMj1nNReyek
	TwM5n+dpHwY2g+1+lHK9+lk2YGNhmm9fDvQrKyKmwR2tw2QL7RS5LWIJoUxOPrvLW6dAyR8MqQvg3
	jlw5p3dky0Hn/URnT0bT1ckza4LSP4lAoKZEQzPZPb4XtunSlXulZn/5EclLdKvyp6oeyGkpucR4H
	Qr6I5TulRlguORPiWdwcyceCCriUHZAOHzMO6CdomPVb/VbQ366rKcBcXYcp83cXrlx06w9//C+mM
	/qc+ttut5TtJWPHZ/1dxKcFq+b8vVcYw4F0U+g2jJrug830ZpeiHgJmQFbS/Yy0YjfxjW9e3MCSpn
	Y4mTXe/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0t-0000000Fz9m-2geY;
	Mon, 18 May 2026 14:32:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0n-0000000Fz4x-3369
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:06 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso2163328f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114724; x=1779719524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Sy2PqXZ6ebOtE0DOUjyEW5oMkeY/jMTLVTy3qbrNxw=;
        b=XlEVhWHEmV0mfHDlwYAOWyZ3uVp9kWf/2jfCFNhmZSNmqIQVuR8zoj3J36YGllYfzk
         C6T3OApxLLYluMMpPhZiz0kTaZymlqy4K8V1GCiIlY9qAflzzGzP3ow4LAUAp/UrLhb4
         yVtJUsT5FrsUB0KW3AyEHt4cYvnfuqAPo51gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114724; x=1779719524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Sy2PqXZ6ebOtE0DOUjyEW5oMkeY/jMTLVTy3qbrNxw=;
        b=c0VPGnpEiE9B7kZjJsr32bi49AgPIFwfegaIUiIaYnG8LihbYvJOrCgcvVhsrxW/P2
         50bgpH+WkEsQ8aCtFoDNgd5ckN+M3w1TTDHnMEwyoUt46Pmgz2zNGhlYpX3ghm5ohsnF
         Stj/8/AtiV9rlXOs9N5/sJsOYuqWkknixerB9OInVm9H9NuLIw7aVCZ5XCoQ7vKllbqJ
         s7Oid4xYBbcgbvBtjgn/CzSSbl7QuhtIQyFWGC8KfpjH9+no7NMkNLrqBiuMJ97+K1pK
         0fQdMLX0r7Q4UOHhzwHFiGIVk+zuKgzz06Uj0nEF6PXOPiuFsx+HssFEFIJmRjjwxY1I
         ghvg==
X-Forwarded-Encrypted: i=1; AFNElJ+WY/k78lbSWXNOc44uvoEK5wnak6z0baIETBVfwNPv7EXC17cd0E/xLbOsEycURq1Q5OrGrMwsmMOjqoFtbx94@lists.infradead.org
X-Gm-Message-State: AOJu0YyTA9mV4x1HmQLR9Xjpd0moc6SJy/TZxs7DeO9k8CByMLLZ2wR5
	DN2sH2SoCUO5U0GRUtbX0nJrJiMK0w0PJ66tJ+aQPFXyazWYrXa2yFwGWXOOXVkGt8U=
X-Gm-Gg: Acq92OEAiyBjp20zi7WWuqnVD9KV2abBiaPLYwPDD17CqyTIkwFxRQb1eL0YXOQ38Ox
	CFbXhVe61tiayd6QHjS2iW6dmM81ODuP0ZJeEMRdap/1tgV/FvkJnpY9KWyEhRjbt5j/gHyssEY
	vHOsi65SUds0VXTQfc06Yl/KrN5dB2E+BykV1cEqnlh98oneb5g7kpYGFBtCiO3MoATIxdJgEMq
	IkNILkautMxMafyOk84fTTYwsXU4f8Di9AnnfXEbksUroJ3BtgMuDcwfICa2IuKIjZXMvxyxvzk
	MCdPuvq3YvZdNJ3gWFZC16dLAzpr67QeQtNCIvkXHFIKfZihapaFMV8ZZK14xkC0qMH6f8bQdDt
	739r0BrWRH2MbRRd4OAnzML+mJ/CxZwCnL5vhDPIa63SbAOpQ+zyDAzJi8uoropDjMf/iIoSHj3
	yBx8PVpjTi5tD/cFAHuFtsoK/DBYZ/IlcsqRTw6MxJYkp0ghb/M3gnz+k7Ud1UF0H+9j6g7Jsl1
	Dibi4HZbbdBiWuuGFHl6jBGP1iqHNCJltSWlLayMp1V+H1F
X-Received: by 2002:a05:6000:1845:b0:44a:47a4:ce91 with SMTP id ffacd0b85a97d-45e5c58d4b5mr24057819f8f.25.1779114723899;
        Mon, 18 May 2026 07:32:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH 03/15] arm64: dts: st: add CAN1 support on stm32mp25
Date: Mon, 18 May 2026 16:31:18 +0200
Message-ID: <20260518143150.3138712-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073205_782707_C9B972A6 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..d5871203ccb0 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,21 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0


