Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D1CE77198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgV3fyp9QtS77nooTd+FrX+WlOCv6xJXFUjdyHgxCR4=; b=c375UgV8hpcmeEqe6t8cjMRJzs
	NIrT3HFUxKRWuplfnytvP/2Ug/XJOLvxPkQqwS5AsuxrDkNz+dfd7nkEfVpV3cYPhuTOPiOYJP5FK
	IfJExelreSzRauHaSAFRfTediGwaEZlQoUcSKP1EV09Wy5MJQX1Qb4qwU2qIi3+HZpkdFMmKQKqDQ
	6Ub43HaVHYRJn4uTIi2dKjBl8TRhyUKw4JcmyvMS/aseSEXdn101B6opoEukurncljC1RvsurQF23
	BB6WZrzkKA6Kmj1HxdrzkqetaWrqdrydP3AESRYrHFi5EegRqMieQL4GIUwuFmGbh+0GiDvmKk4RS
	IZtryBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUSE5-0000000GxqC-1j2E;
	Sun, 05 Jan 2025 15:07:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUSAe-0000000GxRb-3Udu;
	Sun, 05 Jan 2025 15:04:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so4914443f8f.0;
        Sun, 05 Jan 2025 07:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736089443; x=1736694243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgV3fyp9QtS77nooTd+FrX+WlOCv6xJXFUjdyHgxCR4=;
        b=ZZhL5PlXpXFIRjVvE3K8PKu+j5wi40d64u9qkdkor6u7JAiAPop1qoDr7LqOf6VyiU
         eMT6z0PVWzMZUpEsvpKPZxO226PEj6UgN5bZ9XaQzSZuVZ3pk+k+sb1djdSYw/x9t08B
         rwDKUoZ28PTI3ml/ofmvAdbWe7I4wiaFp++viNpybqSa686br02GVk3aoa80FCgCJpuH
         kCNyutpzh3LTmn/FsYDuvdcl9OxCiZgIZBxTSI7KOL5hmFx550h91npOF5R4DBndjp78
         HbraEF5UN1b8wD2yuXdyqD2tlJHIO1CwfbdBUicJYEjghdVc99/tI2e6/zpI+sksjxk7
         jvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736089443; x=1736694243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgV3fyp9QtS77nooTd+FrX+WlOCv6xJXFUjdyHgxCR4=;
        b=ZLQskMu7hnU0cCSHFFoXQTmj+96R1fZtuziS0pMBVXn5/XrIKPx9V5b+xvp7100c6z
         AtWT8ZJp7RqIYp4K90x0yJ+Ll9GfTZ/TO8owZ9KYW/lQ5Qe4v0vO0gpn7w+ppGP0IO9E
         4T30/VQd6drHZTY43a3vYgl0J2jK8KB0KZTUw1rB4LdxDl9AzXSy8qtrAOF+h9xcx9yx
         pkTFqD5sm2gnVqW/Q28FHQpvffHt4/09objpiAYs4lam3BryA/WOWr/Gn+NkxyZ1G01K
         cXqmluZ1RPXrbRq9e8EIPQV1p2Zq1QQcfmZLg5s5F7BSOkeu1Xuva1nQVQzKZgiPZp2B
         pyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK53TdR792xPZKhV33hnhfk5gKrRL8F4ETDTjzHDF9/F8VdWMibp2XW7zXivV6ei0Rjvsr/AJNLDHhnKbz9Vs=@lists.infradead.org, AJvYcCXE+x/dFlEE6imckfOdmFE+YxFKEflCoxPEdjwhgleFXUgh7sH2frNntyl4VdxtOAkj32nbxf/TNrPtjJvoAJxN@lists.infradead.org
X-Gm-Message-State: AOJu0YxIv/fscJeHK3AGjHCiUm/qwMT3tfkbsBCc8bnqXVq/Kt1naIJW
	iluUIRSrhKmiOThnqMRT7Ty/+CJEglIlFFXUYJoEURKlhTByKG5m/DpVDQ==
X-Gm-Gg: ASbGncsw/3q/eMlzT5amldzidP0cn1jz/jnybAoPEJjVKklbwkoQo0fWmHC5fUSkUsW
	dpyV5bZZftQ4WjWrwWoil6xrxctXag+2VhP5QZjiOvjU3FH5era1vwX2HLQMhb4Q6uvT0yXtMbi
	d/wYRXBLEE0ovJfDqj9Fi/rTM4g+C//R5+XKUj0rgC77SnklCZovg59OaPUVkyrgKrs6EaV3ylO
	tKxB/xEk6TbjaqX+13VRo9VLpQo9W4J8Nn8EG3Ytt8O9FlPIapMOSYiKd0+5AcjqfFkTKn2/HZO
	1s+c6GjwIrJKiJFC/RhBOc+rJf3T1GDeQkzlM+55BQ==
X-Google-Smtp-Source: AGHT+IEAYRCYuZBs6aPItyM+728zSgzY+5DBza9P1rNuqmhIKpahYwEVfa1pvTPbfiMYlM0ImxNJeA==
X-Received: by 2002:a5d:5f88:0:b0:385:f69a:7e5f with SMTP id ffacd0b85a97d-38a223ff3cbmr41311266f8f.38.1736089443323;
        Sun, 05 Jan 2025 07:04:03 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366128a62asm536258685e9.44.2025.01.05.07.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:04:02 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Danzberger <dd@embedd.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 3/3] arm64: dts: airoha: en7581: Add default partition table for EVB board
Date: Sun,  5 Jan 2025 16:03:04 +0100
Message-ID: <20250105150328.15172-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105150328.15172-1-ansuelsmth@gmail.com>
References: <20250105150328.15172-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_070404_879438_C1DC5BEE 
X-CRM114-Status: UNSURE (   9.31  )
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

Add default partition table for EN7581 SoC EVB board.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index cf58e43dd5b2..a4cdcadd1ae5 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -24,3 +24,43 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x2 0x00000000>;
 	};
 };
+
+&spi_nand {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		bootloader@0 {
+			label = "bootloader";
+			reg = <0x00000000 0x00080000>;
+			read-only;
+		};
+
+		art@200000 {
+			label = "art";
+			reg = <0x00200000 0x00400000>;
+		};
+
+		tclinux@600000 {
+			label = "tclinux";
+			reg = <0x00600000 0x03200000>;
+		};
+
+		tclinux_slave@3800000 {
+			label = "tclinux_alt";
+			reg = <0x03800000 0x03200000>;
+		};
+
+		rootfs_data@6a00000 {
+			label = "rootfs_data";
+			reg = <0x06a00000 0x01400000>;
+		};
+
+		reserved_bmt@7e00000 {
+			label = "reserved_bmt";
+			reg = <0x07e00000 0x00200000>;
+			read-only;
+		};
+	};
+};
-- 
2.45.2


