Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D751CCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 03:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjOlLOxlY3+Npk8OAHvLo4jSrWHUgC4FwWU8lR7tJvM=; b=4alLpzmNJH1C2nMch2wA0AF5hM
	55P4ND84n+r85VpjlCR8viRmyL4Ie+XVGcEB33ZIWe+B3kZxMlZGsFKq6DYCYQZwPodQVXtCzmJ3O
	lS2bWhucrmIgDj9EivELdzSpPlL3gp3/3/+3BMBo4IYhzmiSrYYSympwtttJs8OTqQmY3PbuFouwG
	wlWBmuLC0kVsptPPyHIqfzOIxOZFFA21uRs4bE4L9Qe8q7HPwsQ8LbgEqE7R5x03XZoK+MxA0IHva
	gw5E4+Rri4sE5RPZf2DhdXaIxYFtiA4UU76XYg5ztoNbe5GWKD+mYUi1dvnxmYhW7qN2Dn7WJzp76
	ZfuyKKnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfK6-00000009fj9-3ceA;
	Tue, 12 Aug 2025 03:05:14 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfEg-00000009ek7-1Nri;
	Tue, 12 Aug 2025 02:59:39 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-301fb587dfeso2898269fac.3;
        Mon, 11 Aug 2025 19:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754967577; x=1755572377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjOlLOxlY3+Npk8OAHvLo4jSrWHUgC4FwWU8lR7tJvM=;
        b=cdb+5mImQLql6ujWF92VDJI7K5HGaBz7nVt/ijd3WCaCyiUP7J183AXB5y6coJ+GVK
         7Q1/WrpsiuVkv0bEl27hMtG8EUqok7djdSYJDxYOB+1I0oSeFA183MwrKhKrSp+3czk4
         BjODNJi/Y4nQ745iEk1zqZP1M6QtRZRHkYLEwlQXPmTpujObSQwlp8ra+YVfokin7svd
         jNb7smGN6tnbb1narUGnLSxVKQHdFvk9rcOGclqqnBSDWsD7IPPcKmjAnvltDbTZAUq8
         o2ZITnGNDQhBnqydoFlmTJCP0UB/u1Im4Fa4ze59rVlLO6zvwz178zTvcz48Ixo421pG
         dePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754967577; x=1755572377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjOlLOxlY3+Npk8OAHvLo4jSrWHUgC4FwWU8lR7tJvM=;
        b=hS9C3wVM0cbNkBBxa+0IVjf2KnX3VNe/0CirFQB+LuiIKgPl2bD8nFN3JCorcUTFoV
         tg3cUc/FAqXaVFZl6muR21ynahBBxgzZiH1A2PBeiZYxBglrFI2fJJebuLMn7g1RTwue
         9Vl2gNuNlciRwgKw8bITXGPxFn5r2EwqH1JkEgRVhzwBXde1WQfKABDbAnfmbUzazeoq
         QFj9BwTTNZlNbHhoUlC+u95Ahtr5Y9xh3oBm7k9+2JraBaqwqGGUKlNpJgdbAfxa3Yoh
         UaORYIZ5iCoAeTXg0EFvbjXs/sPIHsQkBVqxLbEhkanO08k0mj3ylWisDPc/NTPUzzMY
         /92Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXQipN9SFR0n4FdsLtb4t6wcUsQaICWemPb1+56XNrsLlba4KjYGTCg38mndrPDmn5m5OKJaq4N4Z2qcLjpzM=@lists.infradead.org, AJvYcCUpdliRCVaPiazHhDBfLI1TUPTlC7fycU13/xyl8CYYx6AiuA+qOJRcIV2G2KzU6TaBH+zmqgwfgxTAJo6AIZy+@lists.infradead.org
X-Gm-Message-State: AOJu0Yze3yxmO4Sp+dqdi9R5+3v9mofJ4eQCVv6I6c6zPVT2Gy1GkpXA
	FOg+ezb5OIjTRMsCdORnHzz7g2S2GVgsi2T77n5rE5P8Nf6Gr5YUVAGy
X-Gm-Gg: ASbGnctMZwj7LMY/aeFZEg6P4fbGRxCkQ22f4NC2y06aLsmf4OAMDktEwemT0d6r18r
	+OUBpTs1ngGteNuxy2s8VlGNsZJYC71RJW+9NYuvlCmWg1WTQCR0hKoRlAGpOsnsnHp+IiRnWIp
	iPAxO9Ev8nzXwMXwWFsvzLXQthcnnjtCKbIihRGtFM2zGJGiauMGfFbsUzPtfJLd6CMVsYLu6x6
	08oxRgrmFoSrA1YgH25lOye3+VOm+pf2BRg1tZeIp+nkRqPAoPUS0ib2R+ks+5PK/Akmef77XqF
	jfzHEV49LHysoZbG+U63gw2qMb9qlzDvSNM9PGBnscLZrDskiC5XxL7UGCKLJfnYiSihgVdZIai
	3BfjObH4YUDXMzGEOHd9xWQPeBJNlgg==
X-Google-Smtp-Source: AGHT+IEtpPZkA7KIS2X1ISDAp5IYizfkL4VVy+9hQb7FaniU1X+Gs7C747xRFcwg7CI7onQp8EyfPQ==
X-Received: by 2002:a05:6870:d111:b0:306:e3a8:a97b with SMTP id 586e51a60fabf-30c212bf761mr9418599fac.21.1754967576882;
        Mon, 11 Aug 2025 19:59:36 -0700 (PDT)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:36c5:be5:e9bb:c0f0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30c3a9d052asm2726690fac.14.2025.08.11.19.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 19:59:36 -0700 (PDT)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: enable NPU on OPI5/5B
Date: Mon, 11 Aug 2025 21:57:55 -0500
Message-ID: <20250812025755.2078-2-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812025755.2078-1-honyuenkwun@gmail.com>
References: <20250812025755.2078-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_195938_388615_AEEC40F6 
X-CRM114-Status: GOOD (  10.49  )
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

The NPU on the Orange Pi 5/5B uses the same regulator for both the
sram-supply and the npu's supply. Enable all the NPU bits. Also add
the regulator as a domain-supply to the pd_npu power domain.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index 4fedc50cce8c..65a06ce8c131 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -377,6 +377,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hym8563 {
 		hym8563_int: hym8563-int {
@@ -407,6 +411,36 @@ &pwm0 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";
-- 
2.50.1


