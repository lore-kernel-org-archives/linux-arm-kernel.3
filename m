Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A021E95A8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 13:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bzWnrkrlR5q++h42uLlncPmWAMWNl0rJ9nbD7WUwTfQ=; b=HeK0gThjFQtXS/1p4ybK83wkr4
	Cd2ek1y/x5AOgt7GvMY7wnCxk7DovFvAwgP7cyNWhgPKe7RFctkzsC+xxcmVjPYsazl1YmYlA9Un2
	YbqExpRp+SHh0PgwVLucZdeYgrYGOFE/GNlilnnyk4LlicwePr7iKE8PCBIZYappk9cMLXlkKl3Mw
	qQpwDb4DI27ss8XUqHVYtTqqJ/FKypy5vcwrNEs6gbGv58uktS/2d8qKfrIAdkyB1mvZQTsZ9JiH1
	mVNGRAX08ZoBcwuB3yQ/H413LbvT2b8Yk84E79p1+6T37GQupq3voDha180fEYzUlIabNjyAbiyfd
	s8OgZU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZhW-00000004raH-0naD;
	Tue, 30 Dec 2025 13:23:50 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZhT-00000004rZa-2cmn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 13:23:49 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so5871548f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 05:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767101025; x=1767705825; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bzWnrkrlR5q++h42uLlncPmWAMWNl0rJ9nbD7WUwTfQ=;
        b=INyKMsqHmBilv9QcyzyxGc3cgIGgT/+FBhiBaFGKpC0PDVKtAO0sL3ImwyHBPp9pq8
         nzFzzJI2taYBjgdKgMHKOB20U5Xmkc8oEwJEKYbPZFkTh1WAS9afJobbfOXDYzkNS32S
         KAW7AkAyN6kvvJjWfsO5LoU5u75Wk/eouQeH/+XJheED8CT5NqKIq5lyDouz1jozOuAy
         prunlUnZjE8O14lqs/+kyu+SjriLFbDRJQEIRyEz3VU3EmSyP+27M6amm46yydXROiUT
         dP6mM7jXinTRBPGgaVOc5nKwwdZA1hnVMLMyDP8w4w5XfgFe3/VZTZoEfY/mlS+0szAg
         vFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767101025; x=1767705825;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzWnrkrlR5q++h42uLlncPmWAMWNl0rJ9nbD7WUwTfQ=;
        b=LDiUzM1pvkxIdGoIstbo2abNwNVmS0JfgmqFXeJwJ5CGCncYkkJw+tzmv/z9Bf7DyJ
         b1+iZNAfNJ8naleCh0fq3VwnDZ7GNA/lFtmeBtxVaCV129geF30ekj5LkECHHr6TbKXJ
         Uwh7vdB1wdf7VeFTbPbGqlAuVxNHGHZV5KndJJBAO0FFV25JIQvZxbObRSvfyycXDwmR
         yeuV182RlNlBKGAwPcTvSvrcVPVe0ms2ztA2KIGMop4RH2YOvbOMifY2PFpztqDeTkJA
         0duXJ0vOdVsIanIkvR2fFReTBf49YvTIosG0Zu/HPT8o41rJBqCJIlqOgIDphTDeTl4t
         AFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyAPevegoXukV1roDp9JoSOzXuxJsMRjPqqk1ZRR5tOZDOq5S2KQ07dH088E/WB/YwgpqpDqx8Cr7CEcMBaQPz@lists.infradead.org
X-Gm-Message-State: AOJu0YzZPbx2T18L7qp6N7V9++REo+TYol9hgskkLoJ+BlH8Y//BTzRX
	A15qNhNfV4rjaXUIa0i/dHIP/aLN+JusxJtv8tJVuQGMdd8miiGBY+HKn+zNIA==
X-Gm-Gg: AY/fxX6tmheDbC5mLrFq87Vkw/pIBXzwhTV4XvS0xayDaiPloXzZE/S9XeYeI2d3PEP
	y8w54399lSbtBx710cz/b9Y08KVIFDCDky/8SpZTTFfbLs7j1NAGq8VWNyYyBsQ7407ZpcuRy3T
	tawuQxODyE9bXIarmDgAHxJco7FrTZx4RcOPa3Oxz+RODLR8Vup5+LCmdSr2k4tCJt0uc+rHqg6
	Yv85go+sK8mk+VNGpKMB0pO3WT8+Igetz6FT8AzIWqb1c2WYmvUK0dQXQVHpSmJRa9VZrIiLhLF
	N8UQZ/EkO4lZH4220AweyPYBUu8RzLry4Ie2aW+TQukl5XXTv7XNDEpr57xx3zBMN2ewAEWe2Q+
	wKxtPZ7eWfAcn1htpJukJIFYXQJGbl4PyBbEcdupBSd8hk1Lh7WOlzTDufDY1pY2v/614l8guzH
	Dp30T38vxueiuuBb7epCmVGpaRtYn332iy64V+kSqH+39o7WQzToc2Twy18/3/LdViLRWaMnA=
X-Google-Smtp-Source: AGHT+IFUxDCYOfLilQ6lfBDnwhOcL2E6VOHW1djgaGHT1hjypUZN67hw/Qlj7b7P8zYClnV8NZsXzg==
X-Received: by 2002:a05:6000:1844:b0:430:fa58:a03d with SMTP id ffacd0b85a97d-4324e70ef05mr36872432f8f.63.1767101025060;
        Tue, 30 Dec 2025 05:23:45 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-45-246.alshamil.net.ae. [94.59.45.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm69332312f8f.20.2025.12.30.05.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 05:23:44 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 30 Dec 2025 17:23:34 +0400
Subject: [PATCH v3] arm64: dts: rockchip: enable UFS controller on
 FriendlyElec NanoPi M5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-nanopi-m5-ufs-v3-1-ed188ae34fdb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFXSU2kC/3XMQQrCMBCF4atI1o5kRmPUlfcQFyWdtgM2KYkGp
 fTupt0ogsv34PtHlTgKJ3VajSpyliTBl7Fdr5TrKt8ySF22Ik0GkSz4yodBoDfwaBIYasgZbTX
 urSpmiNzIc+ldrmV3ku4hvpZ8xvn9V8oICLqmQ43GWiR3bvtKbhsXejWXMn00afzVVDQ7PjrNj
 NbtvvU0TW9ja/Pf6AAAAA==
X-Change-ID: 20251127-nanopi-m5-ufs-52f2c5070167
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=alchark@gmail.com;
 h=from:subject:message-id; bh=UQ5DWsXFkrEb/TWPrQyCX2bixd/4Ob5s+086Cxhqs8I=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQGX4o7EtZ/bd/e2hyd6JaNJy59lZ/Wbv6rJ3NDHmfK/
 N6LE5/N75jIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCqL1sw/A9aqLEx9z6DTEq9eoCSQcfu/7Z/dS9uFT0Y5dVywlFes4Lhn21rzdx
 1P7fMDpo+M6TPeeYdefaco9pvbG7Jn/m16mCVOQsA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_052347_704476_2EDF3FE6 
X-CRM114-Status: GOOD (  10.82  )
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

The NanoPi M5 board supports pluggable UFS modules using the UFSHC
inside its Rockchip RK3576 SoC.

Enable the respective devicetree node and add its supply regulators.

Link: https://wiki.friendlyelec.com/wiki/images/9/97/NanoPi_M5_LP5_2411_SCH.pdf
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v3:
- Dropped 'en-supply' from fixed regulators, as it's not envisaged by the
  fixed regulator driver and seems like more trouble than its worth
- Link to v2: https://lore.kernel.org/r/20251201-nanopi-m5-ufs-v2-1-ece9c0ee17c4@gmail.com

Changes in v2:
- Describe UFS supply regulators
- Add link to schematic
- Link to v1: https://lore.kernel.org/r/20251127-nanopi-m5-ufs-v1-1-0d28d157712c@gmail.com
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index cce34c541f7c..c5b34069a443 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -110,6 +110,22 @@ vcc12v_dcin: regulator-vcc12v-dcin {
 		regulator-name = "vcc12v_dcin";
 	};
 
+	vcc1v2_ufs_vccq: regulator-vcc1v2-ufs-vccq {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-name = "vcc1v2_ufs_vccq";
+		vin-supply = <&vcc5v0_sys_s5>;
+	};
+
+	vcc1v8_ufs_vccq2: regulator-vcc1v8-ufs-vccq2 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "vcc1v8_ufs_vccq2";
+		vin-supply = <&vcc_1v8_s3>;
+	};
+
 	vcc3v3_m2_keym: regulator-vcc3v3-m2-keym {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -906,6 +922,15 @@ &uart0 {
 	status = "okay";
 };
 
+&ufshc {
+	vcc-supply = <&vcc_3v3_s3>;
+	vccq-supply = <&vcc1v2_ufs_vccq>;
+	vccq2-supply = <&vcc1v8_ufs_vccq2>;
+	vdd-hba-supply = <&vdda_1v2_s0>;
+
+	status = "okay";
+};
+
 &usbdp_phy {
 	status = "okay";
 };

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251127-nanopi-m5-ufs-52f2c5070167

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


