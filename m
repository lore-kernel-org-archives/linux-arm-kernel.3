Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1E2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a7HRLWCMzDk+F+mW5CjRyNEGYp+EzILmvaquYJWnTLw=; b=Y/CK6pfcbE8Y1n0uYDjOJhG7FW
	QJO3sVoIxLwp38Jro74aDuExekAkTXZZqL8YeaEZ2/c+DFknN4JqGTd9YdqdkLQjA0fwjr4hqvsSZ
	jC8+GmVv3GPqOP03W5DrI6TK333J5SbsBUvj4ZPtMbEfkYzi1H0CeakVKzojgRcW97ZUQaFvEvDRF
	MOQhsht7mJJnqEVzCFWtQKWGq0xgFUjNTP+QpN0ScIk1L/qoRezF1CQZvP11D4u0mBo3rnDTwhGMc
	Uc9VH+TlAz/Rk6hmsGZIn2T5tPTCzbVMZbdv6kNftAuvED15IZ60H8EJmrt7x+LpYTb3BczPWgYms
	1Svxc+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7yt-00000007OsM-1VFy;
	Sun, 11 May 2025 14:48:43 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7eE-00000007MK1-1LTT;
	Sun, 11 May 2025 14:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1746973623; x=1747578423; i=frank-w@public-files.de;
	bh=a7HRLWCMzDk+F+mW5CjRyNEGYp+EzILmvaquYJWnTLw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gLkcsA6+/CAZQpfD5IJwE/oHJMlZXksCTXzWrXrAWiV1PAbEH7ZL2RG6YLOPyUuO
	 e8yuZ7SLcP7nEvN/ByQxEfW3iNoPtYkqojlnUetDT38y90EMEtSIauGKL+PIGS1Q6
	 atDOwn+yV4TgdadUPE5XNP6uOt3wRRIxTxxieN5Dm5CYuYdJLydx01uNMiKnlVOUo
	 qV8h2kj2G3jaQ+E0PZJdy42crH6JvL5g3gVC0A2GOg0pCiLX/VPikykOc9KfHK610
	 EKMK19ESLIVR7RdENSVjbXhuoFR3kQVtn3J8xGf8Xm3lsjZNg1riqIspx8y6e/c/s
	 D4xog+Fqr/fEF8NYRQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from frank-u24 ([194.15.84.99]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1uaRkM2P8D-00Jv8J; Sun, 11
 May 2025 16:27:03 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 10/14] arm64: dts: mediatek: mt7988a-bpi-r4: Add fan and coolingmaps
Date: Sun, 11 May 2025 16:26:50 +0200
Message-ID: <20250511142655.11007-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ewdHyBDrD1MtlKXDBxg3/gwHWv+IMGI9iR3t4gpjerlkIti5fyV
 JseYRjEy/MWIah6Rr+q0c2KVkMJYIcFty3mD0exE/eW09mleZTU1zCxkZBI0G2nxdYQZUxP
 wtGPJB0nqpLBBxJRwOEQUp7GffL7W1vo1LMw0S9g/PES+0kOFKwqEovejXepOhKGLP3l8pE
 lHB8bnO93rXv50MdhjOIg==
UI-OutboundReport: notjunk:1;M01:P0:/vmGSP9xOTk=;/CqUqyiIWG9rM+4yfC8ec3/dz2n
 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
 K428=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_072722_651704_845FDEA9 
X-CRM114-Status: UNSURE (   8.52  )
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

Add Fan and cooling maps for Bananpi-R4 board.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/a=
rch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 23b267cd47ac..c6f84de82a4d 100644
=2D-- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -12,6 +12,15 @@ chosen {
 		stdout-path =3D "serial0:115200n8";
 	};
=20
+	fan: pwm-fan {
+		compatible =3D "pwm-fan";
+		/* cooling level (0, 1, 2, 3) : (0% duty, 30% duty, 50% duty, 100% duty=
) */
+		cooling-levels =3D <0 80 128 255>;
+		#cooling-cells =3D <2>;
+		pwms =3D <&pwm 0 50000>;
+		status =3D "okay";
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible =3D "regulator-fixed";
 		regulator-name =3D "fixed-1.8V";
@@ -73,6 +82,26 @@ cpu_trip_active_low: active-low {
 			type =3D "active";
 		};
 	};
+
+	cooling-maps {
+		map-cpu-active-high {
+			/* active: set fan to cooling level 2 */
+			cooling-device =3D <&fan 3 3>;
+			trip =3D <&cpu_trip_active_high>;
+		};
+
+		map-cpu-active-med {
+			/* active: set fan to cooling level 1 */
+			cooling-device =3D <&fan 2 2>;
+			trip =3D <&cpu_trip_active_med>;
+		};
+
+		map-cpu-active-low {
+			/* active: set fan to cooling level 0 */
+			cooling-device =3D <&fan 1 1>;
+			trip =3D <&cpu_trip_active_low>;
+		};
+	};
 };
=20
 &i2c0 {
=2D-=20
2.43.0


