Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F01DCA1001
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJwQjaeE93qyQOSenr3zanPFc1womAA6Vk4p8VoV7Yc=; b=SGV7HvFPN8LBHSc1ZTkStsMyn4
	EBIj941QyetE+i7QopwBEiUmQpsWtn2cF+nABfxEoeIMHA+T7/7N5k6flgGkh3FnCIBlPXpkjyxjL
	3iHRt/xGhn7IZJ/B375u4041MGF1JCbUqmsaaJlP5SzgzCCeL3L2g2d+tryYgkyizueSrdSMXurXm
	Oeja7ss19+YQTSqXViCSfryWbwXFQUBsnkkdhazkP0k+Czloup6Uz8h1qHZXxmkuKU0vRS4xBgsrq
	joNJUgjgJl0t4mkRGNMlT4wHXcP0hnaoTYbN0GrTZvWLBPwYfGYWHlCd6vj1Fhv/QZbQoO79Otius
	Upf5gUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usg3A-0000000A5uD-2fWC;
	Sun, 31 Aug 2025 11:16:44 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfk9-0000000A4T7-2fPl;
	Sun, 31 Aug 2025 10:57:06 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7722f2f2aa4so2360717b3a.1;
        Sun, 31 Aug 2025 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637825; x=1757242625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJwQjaeE93qyQOSenr3zanPFc1womAA6Vk4p8VoV7Yc=;
        b=CBd+4WA+phAFLIahD7JWtNXO2jeaDLz4dy4JQLhMUdg8Y9cj7opWZUIRU4fPkAZufS
         RnGB9M7WTEtKO+eLckgKC9BhOd700X49pif03x1JgEfEw1LqFDSfAsZy8AIFfj+o5AnN
         Hd3//CQ/Wn4cU9R9q11a3PEhTg66GWZOT7LgHEyXLRURz4u78zJfszSSeTOMm2IjQbW5
         vi4JXWya7D5et7mb1efaGoS73UUHMEyDvLF+/tWBaZ+PAuzhvi3K8y3fNClqAc3fOT5U
         UrFZ0kE57yeYiX0sni5hlgA9ktP3AIxqAFn80M1G2S7tUkvkEk2fZTSNirOTU8+DOQfm
         Vmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637825; x=1757242625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJwQjaeE93qyQOSenr3zanPFc1womAA6Vk4p8VoV7Yc=;
        b=NHqgApBbaRrZ5K+FQzZkbQhwwwyh3UMetjBmPD/3T1MWbwyw+sOM2MIZF5LUj05hkL
         sR9EQuG9kPex30IZonSUHLoqy3ggUvowsc8W7pYgNagoMCzX+HUCVarIybuKAcE5aKRA
         FaNM9nsMDeJ06Vmi3KHVRkw5Sdy0jRnU4gIr9a2DfZmHij8JdlCEl/CPQYgMNgrDL9J5
         E/dGtm2kd8up6upirzZSSXwFeUiP2NLQr4udk30Wv81CTWPzGLJ9xR/2niW0k/iC1O1Q
         843tc6Gwdc1BYXC+dCKQXo9i7zbvibW0Ra7peRJgEqqpX96fABoNye6z1Fsr40wOwOC1
         eQHg==
X-Forwarded-Encrypted: i=1; AJvYcCW3tw1JLjZl3oX/dNKw5dHZDQz5wMDeTexLDeGq7vmj1cnwvbgoTy7M/qpDJkKPFx042etRqZIIWHAV9bB2yxQ=@lists.infradead.org, AJvYcCX8dV9+kv5h5x/MhgeYNGtZXmeSFxPLKmBqDP9GCXvAtEhv3Q5zey5b87elSMbNhoVQTfQ1Mop/8GNofGrF7zfh@lists.infradead.org
X-Gm-Message-State: AOJu0YxO2GQg+eF/rnCzcsTS7g5hvGD6wdN5UgkmCRkUuOrkAl2OE+/y
	1ISOG5P5W3Fl3Ssj4beRa5cFQhdyCsmeH1wvvSuyYCNTO6AzXn34+pMd
X-Gm-Gg: ASbGnct70QU84AmE6cq5pRM1HPmgMtyjwuUZ47uYHhUmJuEcZ3CWr8NHHp+Ss5YlW4E
	x8KRhn/9dF165VxC6paZ1qnqnk0Goi6pXeQzlMHZnimvUsMiIiqFarOnd7E6riZN5rYyhOS8Xd0
	U0zBka0zkfsbvNaZLhPTyxE/+SXRYVLO0MMjBQCMms2YKB5oRsBvA9AHKnWDGLj6OCLqlMh8eU9
	ENLtxH6s1ncUxiJ8nkNxNmhdZ2r2cDVnuN2BLSSNaXTkajuZjQcacdKr+xQsvHBDMqR939b6Une
	OTWWu2iBrvhvGAme4sdYeMv34dVJuCVDS7HmGW36Ze9qSuLmBdOnWZPgy9rDVq9pIaPLq+toR4Q
	Uum2atZBiR2wBoBeiEWzx/MKXxkrwPKd4KCrIE5c=
X-Google-Smtp-Source: AGHT+IE8Bmh1kmOPzle18/zGZBPiVjKeOm+kyr6BD8Lxwfgl78Oa6KVB17LD/Katn4sZOo5Iv9GxLQ==
X-Received: by 2002:a05:6a20:914c:b0:243:bf79:b121 with SMTP id adf61e73a8af0-243d6f7e67bmr6316571637.52.1756637824875;
        Sun, 31 Aug 2025 03:57:04 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:57:04 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 5/7] ARM: dts: rockchip: Add display subsystem for RK3368
Date: Sun, 31 Aug 2025 18:48:53 +0800
Message-ID: <20250831104855.45883-6-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_035705_671014_39EC4700 
X-CRM114-Status: UNSURE (   9.99  )
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

Add vop and display-subsystem nodes to RK3368's device tree.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 73618df7a..0e47bf59a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -858,6 +858,32 @@ vop_mmu: iommu@ff930300 {
 		status = "disabled";
 	};
 
+	vop: vop@ff930000 {
+		compatible = "rockchip,rk3368-vop";
+		reg = <0x0 0xff930000 0x0 0x2fc>, <0x0 0xff931000 0x0 0x400>;
+		reg-names = "regs", "gamma_lut";
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_VOP>;
+		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		assigned-clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
+		assigned-clock-rates = <400000000>, <200000000>;
+		resets = <&cru SRST_LCDC0_AXI>, <&cru SRST_LCDC0_AHB>, <&cru SRST_LCDC0_DCLK>;
+		reset-names = "axi", "ahb", "dclk";
+		iommus = <&vop_mmu>;
+		status = "disabled";
+
+		vop_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	display_subsystem: display-subsystem {
+		compatible = "rockchip,display-subsystem";
+		ports = <&vop_out>;
+		status = "disabled";
+	};
+
 	hevc_mmu: iommu@ff9a0440 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff9a0440 0x0 0x40>,
-- 
2.47.2


