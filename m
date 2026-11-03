Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2977D606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xv+pd9lL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aarESbK+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1brqBxo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=; b=Xv+pd9lLBdYJL1
	f+b8SzCQupc/10YQuoZIk/3zEPB6N3sI8Fvp+LrkqkIW0oSPcxj5y1x1w48+XeHPPZxKp6JC2NgZ9
	uWrYNL+KEl31RkW1zMQgguqjTQSXVI6BTt3lF4TO8y+vXIlKsdVn9An2hQboP7OlBt1EvalPJrzEe
	0o8TPwJXU+Y8McpfKFWUL6svgzgXilc57eAO9UWoxuMsRT7VQliPe2If3wtY55S895OWYTrrx4ahL
	UnrflR/pScCqmCSandKXN35M7kFPG7ZUx40jxXcNpxpPa7xaBIjssdZtwJxVJSaL52lPkVju0qzAB
	8QKZbb2/r6vep1TxvhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Ae-00000001Ocy-0Q3p;
	Tue, 03 Nov 2026 07:43:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9A2-00000001Nqm-2vJg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=; b=aarESbK+ZkVFulHyKg67s5Gly3
	mxu1lpLyMWCceJFygtCA3bbNW4cePCL8PNjBhVBRWbd7LlgLM5shePb7+FlOhc5WmioPvDY2v0g0t
	jP6BQN5c7yLn0BMz1XklLLGdkWvxgcKn/tFBdlpvppSJ9xiMaZHPFVj6D5XAqjWePu9cZ+m2hw7EF
	RdIbXxbKStQzwQGFfBZk7RKINBAzNqAXfywlZQD3VyxrEGtjqVCUmWlV1abLcVhQmcdxAfZ2Rj0Bq
	434yPTGtKBCNgvmsEDX6vzI3Cj7QEMF6XyWUiaD4IujjJHn2yauc0hdL2oEhrclhzLUn2JXiCtDBv
	piBilJtg==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99z-000000007jI-0tVK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:42:25 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so996662a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691741; x=1794296541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=Q1brqBxoCqN4y7VUs+x+1d0MRPefsXSOSaPgwzKGbwUyFdyiIdIlVjgl86hZN+ER4S
         Fhyy+GuWm3nuw6BBCcr9qp1753+jR2gMBh8qN70Yz8pLIFd4Ni7wq3CMtIvDcSpriu+n
         UDsVZ9ilsNKwBuMDw1ScrZqpp0YhS9HmImZqSR6h6FFoqSzh43NWd5oNC1JA7G3Zapto
         v+DA+nVXKpSDLI6MQ8IyiCrU75x85GwENACvu486bcUVnqENhItoeUVJndZ8asijgWfE
         UIg0rMAR6wRvPQR3B7woXqNk+CmMY2HJaxdOksmmXg4fBnQvldv+Z6/zNITkCtUWUn70
         u0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691741; x=1794296541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=k2ZlorN55Btk8TGzZh7Hd6PL4JzRgZDKCfFqCYJMiXvuY07k++wF1zYHNalAN1yJge
         43wv7iBUNqunzqrBByLrbZZ6MBOIYtKthb/Yg3jYFJ31oSkFz6l9YOyrKb7pYkQcpegg
         Z0jm6eVP65hH67SveA+fVGG9f4t2M+VUkgFZ/6f3w/J0rk99xw7D8LWYnEa//X2DOzFj
         a3KSTJ6rQ8zD2l0/NZpPOt98ZoXGJhGgNLRCkj+Kfm5sRr6wlkyRIvyMxBNjBXtBMFYZ
         BvJaS5G3nUsmec0JrzL3jPGtAetk92SlQAF1vNgoGxyfLn1JI8HVuDxWkTompwrk2fwo
         UO3g==
X-Forwarded-Encrypted: i=1; AKwUvBwEYRKfOQfHb0QDuo7xjTg8ymclxtSGrenvVtHiSXktr7moZkWQPjeBGDqRMR8rD4l0oH6pk/rfFJvRjflaukFv@lists.infradead.org
X-Gm-Message-State: APuU4Z8h3xOJbqDhf10eDIf85sLEACiXjJiNvMMa8OuK58f98bV6rxCI
	Cs6c4BaKiRMNyZntPKrHtQWD6CsiNsc/xWrmHf5MmRJpFN+m7Gg2lrAC
X-Gm-Gg: AYBFou2KyQN+pEfeg/wqH4KzXDTIO7ivvFCP2gWL8mpDdoUVgSCF/WousBQq7bOuR4r
	0tVtp4xWk9bVvZmoR1VDisthBXOWYUBZPPB2Rv2cTl2Qk/KCTOtUBywPdtS1oJwTIxs/OCW7R3p
	0F50LXPfv0rMSYl5msx41crN7f2TVtJeJVMHiVPV5kBoGMAeyINLGySJBxRpe3BdZ1ZHn1dSqg1
	N3uU/X2T+CL5tA7my2YfN0AwXNUJ23RLR6ByPa1jlmdiI6A2++Z6uqj8I2qFnYRw00m9oMo6MKU
	xT2uPzLT73+Xo7N7SdntZLma00QYzL/dbQZvdjCvv4CtoU9jmoAt3GTIPCkMq15DldrMNQq6zrl
	2qLeLIGnHXKg7huOUhPDlTbElJq3mFekohnT1gV/ZxpuGqqRRfDIcpgdS2GlOAVDG4PbJYxsr/X
	BVnS6t6F/jyod04D2mWyFHgQ+N3cOHIlI1i59zKLpTKbJuKkKUpJuV2IBuHlqdyX9F1vu7C7zbR
	leNt6f2u4dQ2aNfNJgzZSQetmfO7lXVGPGbYotuTTa6YAp3/4togqpftKevLJpnEGeSmEJj4vBV
	J61IVNsc4VHbMJ3L20oFrEfJOWAVIHEy5wTMLPv2bJW0FtSsPAPjj9QrKe8OPzei9x4gLSRb3aR
	GtwpSSa93bjggZxfCMANSw3UWxzRYK5jEEi+nb2EfgdxiUAu43F+WOJCmGComQlWw7+fon5F0Ai
	vsOdg=
X-Received: by 2002:a17:90b:3d4b:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ae8977640fmr7907935a91.18.1793691740953;
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:03 +1000
Subject: [PATCH v4 15/22] arm64: dts: apple: t8112-j413: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-15-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5tHHgqd9nLG6wvk38A1iPKU89o+NzJ9eWA6n+JZ0CHs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/Pa69X5b1ifPf+kakJCX7iN8Vffb5ssE2q83HJ0
 4tNhRcfdkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZa7hUjw/urKYw7es/HfhY599g8qmftTo4Td0T+bLPsjPq249yxI52MDCeFOBU
 D4tbsWsB3Wb7g7/biiTveJS1QmXeMk/2J6nxWLlYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074223_522476_FD16AE0D 
X-CRM114-Status: GOOD (  12.06  )
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

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..62aba7a4d3c6 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,108 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
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
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0


