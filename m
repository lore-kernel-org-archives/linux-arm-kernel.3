Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74463CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi/8adN9TdR0oUR/hsRlFBiThItLlG36dm/4R472kYw=; b=jmWOZoZ2Izvh5lFM8xJAgPPuMD
	4yy4AbYwIjughuTtDZmEwBvfRPnD0FwnrEymw2xPawO1HNUeGfxgT/PNINZHp10kCpdNg0j0ZNWCx
	opUxxtK/TtYGkWGmOE0QqUCrJonbEF+rgD3aadaL6z4M+P9mUTuhFPPJoQwu9f+M26IBTqY7IpK3p
	uRsnQBgs/P8JlskqhyVdcZPpW6hn5Cil2sFT9eceRlLDgZ1DSK4wLZSLawTSKpRNgZQP75KZJbDdn
	DG0aAsn13TfJblg6Ztc2aPDBnptBG1s0NfU0TofkHRdFi732Kggoglhu/c2E/Nhvy0LlXaFS2m4eV
	FoIjQvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRU-00000007pAU-0cWI;
	Fri, 15 May 2026 09:02:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRN-00000007p35-1Av4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 09:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gi/8adN9TdR0oUR/hsRlFBiThItLlG36dm/4R472kYw=; b=TyD74JbzHOFLMKDUFowXAkB3pT
	o9/z+tOLsvhOhOZr0zyt1dJeYjMuFRNKXYL7QrRXp5QYgaXUh3SSEKs+T1cb40rW4GC1GkgL6Bv97
	ohxyGjk/mOyaIwi+jpR0+Keuiidp60LtRP0ft9jRfZ6yJHAUN3B8rAILRcOoMU2YwNLI4Ekz0x1Sg
	ll+tMhUEgoxEcOCC8hao8pX8NKk7qiy8qZdYLk9z6gj8/CJeuGuBuQW3fvs7PzPm6V2GWquN0yGju
	BE2LiFXt0yMMuMxGr0nRQKFCAbjJ1v1Sq6BxllTmV2npi6rGEjvjTqqLllXHCdmJXF2hWbL2ihl8r
	pd1bojEg==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRJ-00000004hBR-1RQy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:02:40 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so4935550a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835755; x=1779440555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi/8adN9TdR0oUR/hsRlFBiThItLlG36dm/4R472kYw=;
        b=UFDdCvOeFozRkUlSJhk4MUM0dS7hgnCA2UtfRETBFJDLayGD8g19DFRgwDS//BmTBt
         9q+GFpurfC1DISypqfO939MPW1nY4I9E1Voa0wwzpkjTUADRkipo8xaTwYipPpKsGVA6
         AMx4jTbNaewR6yaLJNRp4KIOLME43Z4eTt8gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835755; x=1779440555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gi/8adN9TdR0oUR/hsRlFBiThItLlG36dm/4R472kYw=;
        b=kxqPbFHzMqZYGAI9p4mpYvATQP7U3QdqzT+A/1ilNTDBeD8Fb6wwl5KM2dvBsW9+Er
         LkESqHzOng41wWoCdzJWwBuI0WlGlg+uCBS21UV4kzB/wGzzS3xAyPUZaPa1uV+d4aqY
         nfZEnjROseVkbdixOINUanRv0IOvXpbELTiCdFCj5RcEoLrm+KpVqbj5NkkGopGE6hc0
         11MLt4aU66VMMSfn+bQQlPKN5SzIHiTLwyyHIBepJ+CaYXr7+friYYUEHCRrvZj3qDjQ
         wNzgNIJ/3F5v2lsM5S7HpmvoWZ9Li3zerQ8KdjXAafdO51hMq8WHGtzsqMTr5fnwrRyy
         020Q==
X-Forwarded-Encrypted: i=1; AFNElJ+iM1rOjTzkdOD3Jz9ZhFs5DhGWTU7cmvoD390VeVSUoOalgJqA7TjxXnb5zI6Aof+WaMcxLILAOdGqt4B2Ex1R@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1hItglCvjB1YKMEXSgC8eE4fBwSWUXIl+HZ+o3F6ywPgi63WD
	m8SsVy1q/4MTLmqHQt3oanZ6sdtpOjhCvWENCSSjJLiy1cCAXig52/+ppcbWBmUbhA==
X-Gm-Gg: Acq92OGiFTwd7c8kBVwrThAB+SCbGa+3mDEn7WLN7zSREypvvvgDKPtM9x/4UllrDM5
	lolZQUo4bw/IxXpEptUZg0TMaucPafjEqQ97hx9cfMqdo7CSu96MRCLcYydR7mBNdT1pJxrmKcU
	0oAi3z0lIwo7aiqdfEcgkEOYbfyyUMUJKlFdeqNWoqORvrKi5SZ/7WiSqBUmEVWK3fvbqrjCtgA
	g8Mhq/H+i3+LK09ACNhK3S7G6vdmFr3ruoP00DPz+w8oZayOryP07uMjUSRpx90pwqpOnd5p4k9
	uLlMm7j2LNy/L3pfjG30ggq4XL6D6fPsJi5VosUuYjjO6KxsP+ky8ETWBPpW22IbDLNf/tPaek8
	Vt0UyXE3h6wKf5JbhvyNqMa8+KBOXYLt785fiYL2ohmpdLEHi8JPGDNa6fGbctH7GmCqQqWrDGj
	QMwGYCY+8RytYVuOreJAIm8cIMn8jKaVBHmEWgXq7yggkg1H0EjnaiXUM3f1EG+VXykrfNL7kmD
	WioOKrhJ1raTfnlDTk=
X-Received: by 2002:a17:90b:5790:b0:368:98c0:8836 with SMTP id 98e67ed59e1d1-36951a667c3mr3003689a91.18.1778835755183;
        Fri, 15 May 2026 02:02:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 08/12] arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
Date: Fri, 15 May 2026 17:01:44 +0800
Message-ID: <20260515090149.3169406-9-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_100237_805311_556B081E 
X-CRM114-Status: GOOD (  12.05  )
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

The MT8192 Asurada design features a USB type-A connector for external
devices.

Add a proper representation for it with a node for the connector and
OF graph connection to the USB hub behind it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 74 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index b7387075cb87..fb4d92750770 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -292,6 +292,32 @@ sound: sound {
 		pinctrl-24 = <&aud_gpio_tdm_off_pins>;
 		pinctrl-25 = <&aud_gpio_tdm_on_pins>;
 	};
+
+	usb-a-connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&pp5000_a>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_u2_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p3_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_u3_ep: endpoint {
+					remote-endpoint = <&usb3_hub_p3_ep>;
+				};
+			};
+		};
+	};
 };
 
 &afe {
@@ -1702,11 +1728,53 @@ &uart0 {
 };
 
 &xhci {
-	status = "okay";
-
 	wakeup-source;
 	vusb33-supply = <&pp3300_g>;
-	vbus-supply = <&pp5000_a>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	usb3_hub: usb-hub@1 {
+		compatible = "usb5e3,620";
+		reg = <1>;
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
+		peer-hub = <&usb2_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb3_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u3_ep>;
+				};
+			};
+		};
+	};
+
+	usb2_hub: usb-hub@2 {
+		compatible = "usb5e3,610";
+		reg = <2>;
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
+		peer-hub = <&usb3_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb2_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u2_ep>;
+				};
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.563.g4f69b47b94-goog


