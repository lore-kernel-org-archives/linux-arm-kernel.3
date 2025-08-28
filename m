Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64547CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgSVyNvKT8tyvT/0XuoEo9brNM1Cm43Vrq9buFP014k=; b=GujNVwk53frKWuk3EIdbgRWHZc
	SLYo/4AGrK54an6DyrU1IO22Ix6A4pU5AsUmqfJnIcled89o1qKVX1wdRH+LTXuX45yQ0jYIgeedb
	vjQYSSkESCIBKw78S/H4mD4CzRoU7xiL/HRTF7wyN+5lOnSnYPGIVTjTzHwRPvLYcTq40w5h8fOZY
	5dK681RT5+5SWnazF2p6Q+DU4ANflfJPi22sahTfMpjPb2TGF4eUhiIKfLP2IfqdY1RYS0EhRura3
	TX8x0oDARbq/cCIWN6hMiz6D7vi1olbK3S8v82wv1HPaejvo03jdjoRDF4mCZDq1CNYxs12pbUQoP
	Loo67vNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraI7-00000001Evp-2cSC;
	Thu, 28 Aug 2025 10:55:39 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZI9-000000012K2-2YlS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:51:39 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756374653; x=1757674653;
	bh=jgSVyNvKT8tyvT/0XuoEo9brNM1Cm43Vrq9buFP014k=; h=From;
	b=R53Ja39T30QOM1NlhT7e/7bA2JxalQbl0TlvpE5eVDx3h8RYX+YmMfQ0LBIIrKYqD
	 pLhj0hGeLDy089hgAZNBuDRBpi72pQTsgqr5j6++/zKaA3zQedSCYONaN9FYnbmsQs
	 e/VcHUXb/DjlStD2gxnqcZz5RP4Mz6WVTyd1zxHPO5EVj4+zk1HxeOqkJ5/AiXSiMW
	 eHZZw3n9q0nW2CoY8R9ww3DneGrDepqsYowyUxeurxYPh8kRkNdX8qWGjX5pX7Dvgt
	 8G4/pFsYzf72/NkNQFO2iXVLBtfQYUjkAlNUph+bRscAJaK2jVQnskxT3oFUHbJ0/W
	 ZkD7ymMSPFtAg==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 57S9oqFd046278
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 11:50:53 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: linux-mmc@vger.kernel.org, ulf.hansson@linaro.org,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>
Subject: [PATCH v2 2/3] arm64: dts: samsung,coreprimevelte: add touchscreen
Date: Thu, 28 Aug 2025 11:49:03 +0200
Message-ID: <20250828095028.24503-3-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828095028.24503-1-balejk@matfyz.cz>
References: <20250828095028.24503-1-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_025137_945671_2483511B 
X-CRM114-Status: UNSURE (   8.98  )
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

Bind touchscreen for the samsung,coreprimevelte smartphone. The
downstream code sets the VDD voltage to the exact value of 3.1 V,
however it's been empirically verified that the lower bound used here
sufficies for the proper operation of the chip and is thus used for
power-saving purposes.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 .../mmp/pxa1908-samsung-coreprimevelte.dts        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 54131b0e5617..0ac1a24dc410 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -311,6 +311,11 @@ pmic@30 {
 		wakeup-source;
 
 		regulators {
+			ldo2: ldo2 {
+				regulator-min-microvolt = <1900000>;
+				regulator-max-microvolt = <3100000>;
+			};
+
 			ldo6: ldo6 {
 				regulator-boot-on;
 				regulator-min-microvolt = <1200000>;
@@ -328,6 +333,16 @@ ldo14: ldo14 {
 
 &twsi3 {
 	status = "okay";
+
+	touchscreen@50 {
+		compatible = "imagis,ist3032c";
+		reg = <0x50>;
+		interrupt-parent = <&gpio>;
+		interrupts = <72 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&ldo2>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <800>;
+	};
 };
 
 &usb {
-- 
2.51.0


