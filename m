Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A822CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MLGavuNYB5iTf/tcHTfN3eihfxl0iV3kcgrKNTrad08=; b=E+Q/PAmFcmHv8rB3pBALfM8zwt
	hLllNw/v04OzzC3A/aewBPAR8lGZO7pN1ttMghXqw9jq/Fd03qVnJH4AWs6E2DsoTXhPvkutwjr1/
	/REOPdE8hkAQQTnfDdFBQA7YlpawWZZvIEDkni/l1LiM19oNKml3U34cangjXl7tjD6VOQDrsozxV
	O0d2q9vhznnJqU61RX8NRmPcFfN1p9AH2oIqPQk52Vk7SLKkPq26bV6h7OV18Q7D6Raxa/CQWLvPk
	9KDsJkbOlPwRFNd6+WPEKqSBn+/cZt2GP/maAen25XBdMlNBx9T2CVmiMO7RVjIrcczBRqVx1KK6t
	34UZbHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYxX-0000000Etbm-2kG9;
	Mon, 11 May 2026 22:18:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYxV-0000000Etao-0JhK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:18:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69CA115A1;
	Mon, 11 May 2026 15:18:33 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2B853F836;
	Mon, 11 May 2026 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778537918; bh=gw78jt7vc7Qe2unAjmzAV6lSueBAGQ5VKMrWZ7C8lG8=;
	h=From:To:Cc:Subject:Date:From;
	b=ZHuzlzpa/q2kYfPKIy3ZK9p/GeP+9iBl0ufa0na+6i8CPLsnnCsb+sFY9252b8yPk
	 rPs0EgKdA3Uzdv7xvn/jNqbEMyIfFZpUAFMxj4jK87SFhYj9w5Dh5K8GZ7wfu9lc4F
	 ERwrvw4vxpKpZU6DKQUHGhKM+bidYmJZtMPvxlQQ=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
Date: Tue, 12 May 2026 00:17:41 +0200
Message-ID: <20260511221741.25888-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_151841_335295_5AB25FC0 
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

The Cubie A5E board comes with 16MiB of SPI NOR flash.

Enable the SPI0 DT node and describe the configuration.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index bfdf1728cd14b..7ad22fc85d1fd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -344,6 +344,21 @@ &r_pio {
 	vcc-pm-supply = <&reg_aldo3>;
 };
 
+&spi0  {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
+		    <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "winbond,w25q128", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.46.4


