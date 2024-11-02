Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81A7E67809
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 20:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Fb34FGXqzMNx+nxE4qoPozuG7GAzwlPuHgHmRcGRGE=; b=aGRwyYMoCS5IkXlWdOLQMWPCPn
	NcOtD5SMkVa0ugVfs7nv68YLaV8lsLt5RnGnSaBbPeIZW8H7iEVzc3LKESWmhKEOwdCjMD1t8FkjP
	w57Me0O2d5EztCYPnKPQuQV3Goo5hLOj8n6jtsusmX+6a6OTQkK7/doGKahflPuXBkGtEQ5RfUj7r
	nkNyxXlZ43rEef5Hxf4TURP0Vr9Wzc6gcpJkAMnnJGlQO7GmcIru2V20ZckjSqCIy1O3h+Crl3ps+
	v390wS0pSQglZDr/cr4dJQafyRsc1orzJqlmzkL4bzUEO7ixyogSvDx5J88KdKhEcsUoCrZxj82NX
	6Cwtgjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KOH-0000000AKqC-191b;
	Sat, 02 Nov 2024 20:06:33 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KEW-0000000AJRu-2AoE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 19:56:29 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id ACC684C854;
	Sat,  2 Nov 2024 19:56:26 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: [PATCH v4 6/6] arm64: dts: allwinner: pinephone: Add power supplies to stk3311
Date: Sat,  2 Nov 2024 15:50:45 -0400
Message-ID: <20241102195037.3013934-15-aren@peacevolution.org>
In-Reply-To: <20241102195037.3013934-3-aren@peacevolution.org>
References: <20241102195037.3013934-3-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: ++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730577387;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=1Fb34FGXqzMNx+nxE4qoPozuG7GAzwlPuHgHmRcGRGE=;
	b=Pjp06f/LQfljxy4nUX7anE7BKppC4jnYqRqIDe1m7j06931HUoyxpBYZ6g1MUUe0uReAXB
	89CSOhXwYBG+oYdlidrjtzcCkFSUADPTFl3zAgUDxisOqeX11FOGMjeZExcKpc9yHtVrk+
	ivqT/Kd9YSRMrm65fNEpQdifcsk3ZAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_125628_653675_F3B9EAC5 
X-CRM114-Status: UNSURE (   8.33  )
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

From: Ondrej Jirman <megi@xff.cz>

This allows the driver to properly handle powering this device, and
disable power during suspend.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---

Notes:
    Changes in v2:
     - add leda-supply

 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 6d152066a59a..618341b63db2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -260,6 +260,8 @@ light-sensor@48 {
 		reg = <0x48>;
 		interrupt-parent = <&pio>;
 		interrupts = <1 0 IRQ_TYPE_EDGE_FALLING>; /* PB0 */
+		vdd-supply = <&reg_ldo_io0>;
+		leda-supply = <&reg_dldo1>;
 	};
 
 	/* Accelerometer/gyroscope */
-- 
2.47.0


