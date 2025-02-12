Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4531DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9mJBeQJc9XrbJbz/UPw2MShuHNEjyFKhfrVFDRUvK8=; b=riGK1InihESS+GV8choQoQBQUn
	6ihlwt/JtAG5sTQ/mV5oYJnlEROOqd9wSx2mOjiSKq7F1GqxJ2EFQ2ljr3Vvyv1IPQ+QE5fwHgE03
	+9yBWoHmIuzCDeWiJeEC2fPYnSN+I+zVmo/dNYVgxkaQ7WQfvfTFHXVEHCfuz2ru4byS2zBicCyi3
	Gy6DmVNgQ3doSbAqv/6AXi5zzAPtoa1ZVJSrvs0rVT1DF9iff5Xwf2toZBAUBh5Sp7XOM6rleaKo6
	EB8pZ4CTNPIzms9rcOptpU7eJwyFMEwnUzw9YYxEPosJze1j57cLg3w0EuBnfcg6/3C7HJyqw+ODv
	6kj/Ixsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFFv-00000008066-1elz;
	Wed, 12 Feb 2025 16:06:31 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEy0-00000007v1f-21BW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:48:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C692440FC;
	Wed, 12 Feb 2025 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739375279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p9mJBeQJc9XrbJbz/UPw2MShuHNEjyFKhfrVFDRUvK8=;
	b=M/Zjyda56Eh4V0dsM4qeR+/eslwZfJQPAYgKb1WzvTTfRW0i8U2TNFAM697MotdutEeiXS
	3xlhRpa+zc4gqJOl3N+yWbCuPQqt0mNQhCmyS4XZe5folQvFmsDQNBoD6EULajikDVFBsP
	HrOMnHdt/+LXGxmMKEWfW3Y1weQVEV/PiIXJiIFfSOdJp2BKbLcvpf8tTaxgoHuFPyiRMc
	wc+39CjNGKTgTNcbM6p5h510bNColfVX6zgHbV9YhjxA6u4Rt0lNl2f2eD+k9vr+yhe2sb
	bzTvNkDwqqOAYIGi3uAeV5NKiabl/obLsnlyLNiWkpE5+6SRQnCa8G/PiEtNiA==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 12 Feb 2025 16:46:30 +0100
Subject: [PATCH 11/12] ARM: dts: at91-sama5d27_wlsom1: update bluetooth
 chip description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-wilc3000_bt-v1-11-9609b784874e@bootlin.com>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
In-Reply-To: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Kalle Valo <kvalo@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074800_647733_8F321493 
X-CRM114-Status: GOOD (  12.22  )
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

The SAMA5D27 WLSOM1 plaftorm embeds a wilc3000 chip exposing 802.11b/g/n
and bluetooth 5. The current description for this chip does not expose
the bluetooth part: it only configures the relevant flexcom peripheral
to set it as uart, and relies on user to trigger the corresponding hci
device creation in kernel through hci_attach. Now that a bluetooth
driver is available and handles the device creation, replace the bare
uart description with a proper bluetooth node.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi   |  8 ++++++++
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts | 10 ----------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index ef11606a82b31c2f745141cdac1318805f473273..10d48a9ef92c9621a8885feebda6119d3f61af75 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -50,10 +50,18 @@ wifi_pwrseq: wifi_pwrseq {
 
 &flx1 {
 	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
+	status = "okay";
 
 	uart6: serial@200 {
 		pinctrl-0 = <&pinctrl_flx1_default>;
 		pinctrl-names = "default";
+		atmel,use-dma-rx;
+		atmel,use-dma-tx;
+		status = "okay";
+		bluetooth: bluetooth@0 {
+			compatible = "microchip,wilc3000-bt";
+			wlan = <&wilc>;
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
index 15239834d886edbf9e732ac461a92ac9eea42ae5..8b89ee0b47ccb6e60b67f3e4db6caa827ce9c0bc 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
@@ -85,16 +85,6 @@ uart5: serial@200 {
 	};
 };
 
-&flx1 {
-	status = "okay";
-
-	uart6: serial@200 {
-		atmel,use-dma-rx;
-		atmel,use-dma-tx;
-		status = "okay";
-	};
-};
-
 &macb0 {
 	status = "okay";
 };

-- 
2.48.0


