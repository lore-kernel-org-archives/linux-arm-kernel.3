Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AAEC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 21:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeBI1hiHxX3EY5hNbTVYMQnv6jTJMzI7qpXjSX73AkQ=; b=YddB+UCuxedsBhoE2GAzCKHDwP
	iAGkweJCgsC3xwkibRgOIe+qeOGH2yHDA8PWaZKASg/JwZoRb5NV/EnUeftmcwxyG9KUuLpAwVF+D
	X8/DtK07V6qlY1gjOx13Yr8+YHyn3Iin3+KAW13gBRlc1mvtIHlauw2Iep9SX5Fw34N4Tld7TggkF
	HP38bmQKEMx/H04I+ulpWuK/PFB8XnHyiZhzwdV2mDTtzrsCDYiF1HABViwo5X3eHkA5RvTGkkVGG
	uu4pVfivHR3vsvsrGbmGxKN1iU2jhk62odHIY6QghLHyWULKNAsXW9ZFQU5yxY+fuvkLahN6GZjZp
	6ufqlE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxVq-000000031Vx-01Lm;
	Fri, 02 May 2025 21:01:38 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxQ6-000000030bl-486X;
	Fri, 02 May 2025 20:55:44 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso47173696d6.2;
        Fri, 02 May 2025 13:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746219342; x=1746824142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeBI1hiHxX3EY5hNbTVYMQnv6jTJMzI7qpXjSX73AkQ=;
        b=hLpYoyetnakorGwLEuvuY2ECtCbp253isTcZ1DwtfQh8M1+dHBA2zHEzv0k18VpE95
         cjEuLvQaU4V5yDfKR1taKizo3AzthkvrG4Bh/utx84KlS14YsJfWbDZ3V+CTT/NmET+x
         gwxjH7KhzQhP85dihlYWleymEfrDXPD0H7yoRgqC/hLGofvgS0U0D2K5/GHClpzQH9Ex
         zLkvAFYdsb8i2blUZhzCQNp0YcSNpXOcTx2l7kFvvPmmxElou5j+ALaTZ99+4oBpVHTu
         mZ7xmuXHJYp+k8nIB5qfdwJSes88CjurPYBTpfCTS/u+NYwNkk/Sc5H9sxZiTL3Nanoj
         /gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746219342; x=1746824142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeBI1hiHxX3EY5hNbTVYMQnv6jTJMzI7qpXjSX73AkQ=;
        b=lr/u5Qlpklby8gcrsfDXkgbyzMjHdheIaKwdKuwVC35xT962Fs69mCzYfJpLuwt9fk
         FbppiDKw9xil4wskkxzyFVRHOqTiSdT62Yv0vaM6Irq70PsR+c5j01YyDrQkLQjlFanC
         TdUwWW1K36wKM2/UfivDrLgeGGwemZGiHZJD9oIudNDxkOkbrFlf8XI56jxDimQmNDzZ
         TOnfpLdfv+vGDMOfcyicEcK9HwXHvQLSJyT5/0C6KeWv9Cl8FHBGYikm2+OjlR/Knf0m
         f5slcTvQnFaNw7Va9bMcyHincXkgL4p/QVjDdk5nDKVMN25/3eGaBkRK/8CMSKDqDpTK
         zkzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzOxzdc+NHb77I7VYep8Gz4iRS6WtRhavtOMUV1BUUR4/606Mz/L0+Qcx2juDsJZ4dvr/AZt0GJeL0p6ez31I=@lists.infradead.org, AJvYcCXRx5FhoynK2rtZ5m292HC+JxRGnErOa3dN80DmDjox/UKd8RRbz8h9V2ocfZ3+iBsc+aDOwmwwaY92eVmJ1S6I@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3dMebdaaOiTGenJ43NhC5IWAMTPO/aLhVgnQN8td0hK0hSJVH
	/rexK0TjzKTcVxkOjzOC3w1gBtjVlnFX8XdZvdgj3pidWjHgK0r5InrqO2nhuGc=
X-Gm-Gg: ASbGncsSJvQql2ThcxBxM9+3BgN1Jbm5jfbtdQAutmyrAYSjuP0UTf5lKXuNmzMS6sO
	gtzsRNUSvJNVOTcflHWQKiLimYPZM9JHmpSIog6DeABymU/z0ELkU8Om9PEsRdacz+WxLeo8sV9
	5XktivZEkvJJWut3p7lFScNt6L/rfQNpb3OJEUzeBWGx4P3PEY8htYJ4OiEm2RpGNPg4D8O9RYk
	bxQkl+ogtF9Hp4biCLSW+T6oIRxlTL/0zkidT6gyPpcQjUGuoJ2JQhGl85/pwBx2yoihpRVAUnL
	EDhyjj448cW3e8f0ElTtXFG0Lt63BhGycXrvV8TANGjR1HiJDlLz
X-Google-Smtp-Source: AGHT+IFHthfJ3MLNCB25zeq1ZIPDkXFJ/gT/GleGPTEkTfIvObyY7a5raHnfm9C6X36wZpZbAZ4e+w==
X-Received: by 2002:a05:6214:1256:b0:6f2:b0a7:3982 with SMTP id 6a1803df08f44-6f5156184admr77433756d6.37.1746219341935;
        Fri, 02 May 2025 13:55:41 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3d2844sm23129936d6.56.2025.05.02.13.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:55:41 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v1 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 board
Date: Fri,  2 May 2025 16:55:32 -0400
Message-Id: <20250502205533.51744-3-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502205533.51744-1-inindev@gmail.com>
References: <20250502205533.51744-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_135543_019697_1436E5B2 
X-CRM114-Status: UNSURE (   9.28  )
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

Add device tree binding for the Luckfox Omni3576 Carrier Board with
Core3576 Module, based on the Rockchip RK3576 SoC.

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b77..225a2d9e4d94 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -715,6 +715,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: Luckfox Omni3576 Carrier Board with Core3576 Module
+        items:
+          - const: luckfox,omni3576
+          - const: rockchip,rk3576
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.39.5


