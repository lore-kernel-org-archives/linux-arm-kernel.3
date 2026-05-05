Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65ACFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jHQUJgJrR8DY8rxB52JHUO786dUwTkd935pxJWft/8=; b=nTfkB0c2PJkrDUWj6pbhju5S3F
	m6+Z05ibATs0riTWp5QDz3HLdZk0tD7Ta/PedoeSVMvqaKZRmb4NxHntTymG5/byjG9NSo8aaygxA
	B5W/+9nseIJ+NhZaKXDnQFdpizaNCB0wZXT/BpNjCBp7Vu6ePukl0MYQSxC0N+EZBowD2jK2BFfgb
	CEr26jPgDYzS5LFkitOFLCA7fYB8RoeEfqxmokF+Jk98iYqUFLTT+23CA8i/8+hBLB9ZTLXKgAEfX
	OVIuLhe5rujK/FnJ+NnIMVuL1kXYBrBZAtMAm6j2OXHsn2e52OmDKUVS6x0kr5D+D+9d39l0Db1Qy
	s5SxhUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnM-0000000Fqk0-3b5r;
	Tue, 05 May 2026 10:14:28 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnK-0000000Fqha-3uDR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:27 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so1312662a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976066; x=1778580866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jHQUJgJrR8DY8rxB52JHUO786dUwTkd935pxJWft/8=;
        b=VeCRwSHHfnJ7Rx832gzOFaSTaN5X8MYM7hKmNXCkXgEZ5HQGeP5UQmNJ7HSlWIy8iB
         Mt4UZD8hrWPLvG9f6VY9IbyVpdePpjtkH49cWK5+kfb3JU5wOJTb4BeDtgyb0KQG4hpc
         UEaxQ7n2Ty2jtPnsfSpv6IptvnhkfR2O2IZt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976066; x=1778580866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jHQUJgJrR8DY8rxB52JHUO786dUwTkd935pxJWft/8=;
        b=MQW6LmAQ1DWexzoeYwGnJKiAlKZn0rA/wvYbMbg3jxzl/P4EapnIW7WLCWwzUSxeo5
         AhlkPzz7g2/y+Huhcrhx9b1c+8Q7UpupA4Vlt6jldb8vq9AQfCsftuTJTrqjNc64n1v2
         5YncXCu3sBzxHN4OdgazgcDCp/g3Fxmv8fLcVFfQz6vv+KcR09P7irb4gCwgoq2ZWH1V
         uBu4oAlqRJhSHECy7LdhC6CMlsD5fTNmVduTl0jTZYhwT0dh9MOgBzf5RlA1WCMRq1//
         +P7dWulSDHNvALV57+wzz2vebVd+sgWiy7z2bvIUtPebjtib0Tayz1JXVSyjzVRMyQX8
         Rujw==
X-Forwarded-Encrypted: i=1; AFNElJ/52uOmEemyQB0jQEfSwZiRl08yfz85FRXBs6CuMlsCP4IYTrREXu4i9BJK+eU6/Rf2zIT9Q50wXx9ukSBCEMEE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ddSAqSzRAuV+/6gapwKQ3xMjlDE6dWpGIOYSFajjPD9BNWwr
	L0DCLxft+a4+/Z9zALgtasHKuTQTDmZbiA1Q/8B2+FEkl31m1xXzVTFshRIYUu1aQA==
X-Gm-Gg: AeBDieuXooRjiZUJTqat8JQR42CriZI/R28gGmFSsqkLYZlPb2rSH02hB4rPuZkohJQ
	BEWPkvNlD5lSD6uuBNu26hUO+VphJHGq6NQuSM3OF6hsTUUV87KfGUYryzZrPJjdIvkrp/RGfJn
	PFz9dhLhScIRm9+0woGJNMGS0fogmASJGcMyb2n8p1S5e95nDJ/q2G7q9BZbKI0u4KCHp5QajUR
	SztMdYkDQ+a+GsVN80hELAqn2X48JZZnbX4f03m7PYTDTw7nxjMYkATvgRSIV8hrt7H/kDvTz6Y
	wn33Fexvi2xlugPGvxxHfogMXPlpeiK/PanU0EdqeWk7uy2z/WoFdVObPIWDIJQXnLdakqBUVRk
	6Oa2NwXbh3iyfd3AOCQyJ0q2j7bROFzqeCtYlFy8QiZpegyYgL3PvV1lYZhGmaMwInGQ1kx9GiE
	qW6GEYt2VohnfCOq4rMvv8uNwbtrpnW8JUaD2ZRHvNSyDghHwbQFM8XItVTE007OxZtrDfhdfcQ
	Ol4n220CLZ5GdUKG2I=
X-Received: by 2002:a05:6a20:918f:b0:3a2:d79c:415d with SMTP id adf61e73a8af0-3a7f1bc3679mr13967471637.30.1777976066051;
        Tue, 05 May 2026 03:14:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/16] arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
Date: Tue,  5 May 2026 18:13:53 +0800
Message-ID: <20260505101408.1796563-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_031426_971852_F099503B 
X-CRM114-Status: GOOD (  11.13  )
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

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to top level PMIC node
---
 .../arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 2e53c1bacf38..8054e2d20bf1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1440,6 +1440,23 @@ pins-miso-on {
 
 &pmic {
 	interrupts-extended = <&pio 214 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&pp4200_g>;
+	vsys-vcore-supply = <&pp4200_g>;
+	vsys-vgpu11-supply = <&pp4200_g>;
+	vsys-vgpu12-supply = <&pp4200_g>;
+	vsys-vpa-supply = <&pp4200_g>;
+	vsys-vproc1-supply = <&pp4200_g>;
+	vsys-vproc2-supply = <&pp4200_g>;
+	vsys-vpu-supply = <&pp4200_g>;
+	vsys-vs1-supply = <&pp4200_g>;
+	vsys-vs2-supply = <&pp4200_g>;
+	vsys-vmodem-supply = <&pp4200_g>;
+	vsys-ldo1-supply = <&pp4200_g>;
+	vsys-ldo2-supply = <&pp4200_g>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 };
 
 &pwm0 {
-- 
2.54.0.545.g6539524ca2-goog


