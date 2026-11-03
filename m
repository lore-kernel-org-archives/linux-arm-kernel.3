Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11065606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nad++JlH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=m/uCbS3O;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ForU7Ac/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=; b=Nad++JlHUBJz5/
	8nK5bMXaDjAST7h9uOgdNR0+SjWHftT17exlBHZA7uFBpPgJatnHLc1doIatE7bAcHTX+N0/8YpMv
	jHEBXlD39H5pcUIfboimWXWndQ7mRr+G6awnuya67iYIz75jViCnE83KrM+b5WOAx/jkuXL20NlOe
	OLZw6bsQLbxP/TgI8IZUeYZUtrzlEj5mztuWPk3xN0qf5GPQW+3AidLFXJKxHd5IR5pAOId3t7Zi7
	ny9VgJ9wLKAXlD3ph5OVkQGD1pxiWuY7ok1NOUwyAdhWM4E5AnJkofwlShJdJ221o/RA2MPbcvI+O
	K97EmRH75dYXve8hXCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Ag-00000001OkF-2zOX;
	Tue, 03 Nov 2026 07:43:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AL-00000001ODW-1sjH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=; b=m/uCbS3Od6cQA4DeukZxEwC5kB
	EyoHRXXK8Zh1XbASiTKfjC6EOstD23kFTHmk5/UQR6hepFXmKHz28fv3IiwCX6jpbziPw2Ri8KwR4
	xfYAhK+LqSGrd/bJ+gaU4BYwgkHFWeEwlUWX83lvafopblnMwbAkTJhI0n+jn3h4Ao8Hd23qu/SQG
	f4hsZKvsTDdYnpuYK82AIxua1FBFsTmV/cBSEDMqKQqNF/aypISkfAjhAUM7PmdJ55n20r91vsWrp
	4dTf9iNAe3FOJW2IeqdpVRHmtCPoM3WtFyFYtRqdsyQw4ddjYMNPrhvucwnL02usETl/yxG4kvApX
	FqNFTMJw==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9AH-000000007lb-0hHo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:44 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1532994a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691758; x=1794296558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=ForU7Ac/mHYw8eHIj39ByECAb5/JUJz8xbkfYNoyh2OaIx0XjYVczYYFr3gcltaXI8
         iNqWKlHEXwVNBpznXpC/7Q6SzdFAChMyp1N9cTjLKEt3SjudSh1xj86ANzZ54xN/IsWV
         M4wXOvwVzyWDw7+4QfgAeImVDnF1YbxGNuFDdslVFS0MobC9x2WqA6tB/jlhOZc7K1fX
         C3IpxVF+H46AqKlFJyhDJt/cc+beklzsNnOrZlQBDW13TpokrTan0j2n0Yn8HCGKeCyd
         brdc4ET/KYMMw3kvMyChMLiSIzEsAQXUYVgzCauH/fefdurqN0bW5mY6CU07BkhoWwjG
         ZpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691758; x=1794296558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=CSdOr/yCYQSBx+HcDC61yuGGghgnyqUguzx4KQrGPxcqZwkT85ZsdzDFkTpZGv421x
         oyNXTBD98ehLM1LOSQRzI3BidbiGUHF9G5E3m38zDKKznvDGtCV4u8AuzMhb4OYAr2gR
         uQK909XcvJE9i7unA0S6NHUpgpm9t9d+8PkqozXSF54Ku6YuYJGQRX0j2gePLGk3gQ5h
         KFsdDeR5Ec3iy0uaM2kOD0n3rLPCHCHG1Xa82NRkAPw3rxFfs5OcHGootuwRn5S/MYqI
         0APcD8AksW/PV+6UXTsmGphJqGq9zTtwlTxWdI3oM06FZYvIAtlhlG5+4Fb62S9/H11O
         3AUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcatZ/b6GGg/y7mDMFRuQeR0i1jZETPlIv/08TiOYAOHdDxa4udvLn9L256rmMCzpiwWtVsJmgHkYzYJanV6U1@lists.infradead.org
X-Gm-Message-State: APuU4Z8RvbVdGPGALnwvV20IgyLx0TTMTbBw3KtpPrIzrylgwcmOhpw8
	HRl+VoSVd8dK4LNqpOfENy2SMrGpb/bIJfuwD5LUlJGTcdUblF6pH9vf
X-Gm-Gg: AYBFou1k8YlgeZ5Pr8ySBobw7b8BcjoZ8EtiGCLOUsF98RMHw68CJ4wZWgqYoPzYXDt
	6+SZkj9dT0thfz66qGU8BnROzNlgLAsduKSja8/j20FCcDH5KvbCZoy14GKZAtoMlaS6CU27g6H
	yLPqKvnYeo5r8hwBIk9Yq4TJK+wA6sKkx8NvOFD4ViO8Hwd4HJnv5KMYbuJhbewzHfDeE09px9J
	jlDIE16UEJgv5I6mzu9ovjF6FVf9ovcJi5MUYvESR9DSxg26/HBu2B7e+eoxUawV5TCyQPUywxz
	7yGQdcvOV+rOdaxOPy9Vr0oVgW2T9zUwQWkEpfFlyMp3OWHtwChx6v2y8OWAd6sbqaYAAyTn2AS
	uGNt98jvwJqMDZs8CnkYdA4utVhZsWo57mN/UPZqCW4YqISD+tivPfWgfDpzi3Oq0C3FB5QPW+7
	ZUGc+HFk+aF9tIKofE2KiT5kPh8hPudOVN/XdcJuyxFd+tziUSupG8xZmNvdcNomCPA2qqzaq+/
	pthN6Hzmcrx0hgLGkfCn+LWUwsqQP46tVL7dk+Y+/jgxu1PU58lrrnuWoiM4Wyhmq5odBiV6xyg
	Bc0DpK54JpLBSNvL8u290c4srNbQnWwy6QLFOfimQ6XZJVU9IfT3ekFsXOX/AxL6AczL0k57nGJ
	IpjDtZkPXlvi3r/M4HnDYQgHlZDC/IqNoPBFJC6J3OU67FRGGUIC3E8KVJqT3asFfCfL91AbW35
	2pE1I=
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr10104416a91.39.1793691758138;
        Mon, 02 Nov 2026 23:42:38 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:05 +1000
Subject: [PATCH v4 17/22] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-17-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KxdvsBHCHsOgUdKIYNQ3yP4bIh+4Vy0Oz8XtoAQOVeo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89Xx62O3jC1V+SyUKnljuUFkfUzbs2NS1jV+n2zh
 uF0wYv7OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO97DIjw47K7990qu8sXTpV40lwXnSeuuYVy6OzqzYf1q1SUq3je8Pwz9zvc/D
 7CTr8d4OP+Apqzq+on+4kU1LvfPuwfrGark0hHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074241_883175_B7C5FFAA 
X-CRM114-Status: GOOD (  12.35  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..6d79164cea89 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,62 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+
+		speaker-dai-link {
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0


