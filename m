Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9E4CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIttbaon04d2Rvlw9j5ImGFlCSyQwHXs+hliMJ7LO+o=; b=uv6Y2fBcmPGJIy2DrX/hrCaNM+
	zGEuKJwpvE1lLRh6RQ1HQ8KL1cFgUi2BJbstRwUTWnUdAbwK7EJeWvPz2QcI8awmLUPVOihy3rDrP
	BOTEPkZw/MLoDx16KZzKaUhzWmiFcpr4WEa4Drw0ky/ra3VPl7y7VUW8iHViAIR2iQaSpIV/7e9Zh
	jCXmgZ3No4okyFd+EmYkoVBp+sivnhjKGeuIMa4rYusK+l/DkMtbPNnq2xpl9pLQsE2UA7Y8fG7cq
	e5IhdSH+HgAw7a9LrhSIjkwr6eF/6ffDK0TBxd3krGosCT18TkVdeREqaPkT34W6CkLtoqUgmyLax
	ZzhTHrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8sD-000000064jB-2lg5;
	Sun, 24 Aug 2025 11:26:57 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8UF-000000062NX-0QDI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 11:02:14 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756033282; x=1757333282;
	bh=BIttbaon04d2Rvlw9j5ImGFlCSyQwHXs+hliMJ7LO+o=; h=From;
	b=AkLRjobEuUDghIilXe3TbwaEbnRywcDUzkz+gRf8Xt0NDsSJ0aZ4MIl+HGE9aHUSM
	 m9TK1pWAvaDQY5nguuP+HT0iM9dcmDC8b2G5R4EKPdAY4fmZUob9Hpu93gxWll8BVV
	 odXnZvDoXpcnu3++yj3+Snoj20kFUzW5XkRz3SoVf9a3t8Zjd5sAGqdgONCM0Zn4MB
	 8OHd6b1CsGYAYZigjCjtvUxAr1hbh2llGPNTWb6WNFm6Be15d6yjzswiYiexipXJeX
	 8FkPlHYw24vtKcSkD3j46vUib8cP5k6z22+DZ+7BnWBBP2Iop6TGnJ/HxcvaNyWRNu
	 1h7QUM9DxATGw==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 57OB1L4X083631
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 24 Aug 2025 13:01:22 +0200 (CEST)
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
Subject: [PATCH mmc/next 1/3] arm64: dts: samsung,coreprimevelte: add PMIC
Date: Sun, 24 Aug 2025 12:53:43 +0200
Message-ID: <20250824110039.28258-2-balejk@matfyz.cz>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824110039.28258-1-balejk@matfyz.cz>
References: <20250824110039.28258-1-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_040211_732254_402000F2 
X-CRM114-Status: UNSURE (   8.88  )
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

Bind power management chip to the samsung,coreprimevelte smartphone.
This enables support for onkey and RTC as well as for regulators two of
which are explicitly bound here to the SD card.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 .../mmp/pxa1908-samsung-coreprimevelte.dts    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 47a4f01a7077..240021e7a371 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -303,6 +303,28 @@ &twsi1 {
 
 &twsi2 {
 	status = "okay";
+
+	pmic@30 {
+		compatible = "marvell,88pm886-a1";
+		reg = <0x30>;
+		interrupts = <0 4 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		wakeup-source;
+
+		regulators {
+			ldo6: ldo6 {
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo14: ldo14 {
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+	};
 };
 
 &twsi3 {
@@ -328,4 +350,6 @@ &sdh0 {
 	cd-inverted;
 	bus-width = <4>;
 	wp-inverted;
+	vmmc-supply = <&ldo14>;
+	vqmmc-supply = <&ldo6>;
 };
-- 
2.50.1


