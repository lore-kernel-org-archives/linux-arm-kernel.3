Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D8DD2AB1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dthOVvsNfRXr3q3blWKOOHKAo/CHNI++jDGd6dc/psE=; b=qXHvPZOyEpONmrWFrd4Q+6xL6t
	MqUsoZcEJ1LE9S1Q6RFA2qztBINZfIlfwzvCiGxZdSW3TkHuci56Jks0pihjRc9kRQ4FPGeNWxAXF
	9Vzb9SUVfr2a8rqPOQ6uhWi99kWj8F+6RO0WCZSYuJEiRI4/LdDMjsK5v5PQ+TTbCeIsxMWvi9Ioo
	k4h8dH0IqHd+aVN90QpcG+RuW7Mlgip7VsU7kof3Df1JKk6XsrKAOsckQRulDH+Fj584nVmCp36Jy
	5qP3oStaDPJAr2lzFynZUCEUSAoD+7z+mK3TxC7SwFuqlETs23uIkn5CCGrWHCZMfc5AoAMSHzVut
	FhFyzYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jkI-0000000E5dJ-2pEU;
	Tue, 29 Oct 2024 10:46:42 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jdb-0000000E46b-2ysk;
	Tue, 29 Oct 2024 10:39:49 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 5DDAD61645;
	Tue, 29 Oct 2024 10:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1730198386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dthOVvsNfRXr3q3blWKOOHKAo/CHNI++jDGd6dc/psE=;
	b=ln4NT4jPhsriKEo6oFajE03/kX5+a1YyRQ055Tt5u/KzoncMfGcBi3QWu1pd4OSWaV2Zdz
	Q1NPtC+1CK4RN7BKYrk+G+2Tsz5jhxxPcRGn+8yvVdP6jOMlfgWsb7zU6hPWMcrbm8fTLV
	XijqEvCSy0z2QV1qIvMJ8lwEoqNL9K8=
Received: from frank-u24.. (fttx-pool-80.245.73.173.bambit.de [80.245.73.173])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id AEDE63600D8;
	Tue, 29 Oct 2024 10:39:45 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC v1 05/14] arm64: dts: mediatek: mt7988: add label for pwm node
Date: Tue, 29 Oct 2024 11:39:24 +0100
Message-ID: <20241029103937.45852-6-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029103937.45852-1-linux@fw-web.de>
References: <20241029103937.45852-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2f832f17-7fb7-415a-b55d-2c417a14bb51
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_033948_016345_D2F5C08D 
X-CRM114-Status: UNSURE (   9.96  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add Label to allow easier referencing in dtsi and board dts.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index e5e7951b24f8..0425aec8dacb 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -159,7 +159,7 @@ mux {
 			};
 		};
 
-		pwm@10048000 {
+		pwm: pwm@10048000 {
 			compatible = "mediatek,mt7988-pwm";
 			reg = <0 0x10048000 0 0x1000>;
 			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
-- 
2.43.0


