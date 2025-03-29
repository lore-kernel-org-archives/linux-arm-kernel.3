Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A494C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 16:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIKH4WUlJ2hDzsxspQuDetTzvwGz5UlzO/Wk79NuNXY=; b=iygP8Fz8R1PGGyQffNf7t6us9i
	i6pqnzAYZOfXlE0k7Tn0FcBFLvM8rhslXMlq9F6g8CYO5gvrxjBMbiLdg/obrZUd4+N8Ski6PnG67
	m5VDSLnZ1j/6FSdrdi9gm3JfDeEIDwdC+CD0KU7CqiGVeUIhuPXSzzlLL7eEExNsF/norBPyScHts
	WHZc9Y2JULbIQCfpCdVg+8WEs4UZuLPokM9Dux+hvDowgc1HwMDKI8H5M2uo1YoKrzdeiKP71X7Nr
	r/NSgEgw0qpalS8K76+rSJjTWXZySmjZpIG7QYzfzBFX0QbQq6zzhF4QpZFzYhpCdtSLruR808H1W
	e+SRy7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyZQM-0000000FKsm-3p3X;
	Sat, 29 Mar 2025 16:52:46 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyZOd-0000000FKjm-0L8v;
	Sat, 29 Mar 2025 16:51:00 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so5102459a91.0;
        Sat, 29 Mar 2025 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743267058; x=1743871858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIKH4WUlJ2hDzsxspQuDetTzvwGz5UlzO/Wk79NuNXY=;
        b=l5Ii/uG5Fky7AK1SwTmpNDtsrlQ3vc2Ift4YFpnzapEpgSBZzehJGR1J8p841YdbJ3
         tp3kGNBcM30qbtt0FrrvJhfN2DSc4NiYmiH07b8D3cbd66tS45eE4gsrJDknlTzlOsyJ
         JJtnP2iu5eZKg3Y7RgTuwj5g6KFPPoKvGxplImnBv9mDuRJcBQ/A5aNUo5RFh2VBsGJk
         VHFfYgTGSVhuyWYhvUJjChJ61FJoaCkygHq3Wrrookzc1QQHzwh6uPnOvgO7EUk09Kx7
         1usZOksX9NMPD7xEzITRTtKSqWBmZiS8eiuF3iBSonjglsrH2kIsQZW3r0Sf63cN+Jsn
         6sQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743267058; x=1743871858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIKH4WUlJ2hDzsxspQuDetTzvwGz5UlzO/Wk79NuNXY=;
        b=amhZXTxxjREk3ztt/SDqo/PBKPeAXT/kcJCY3f1MMWQc2v/CUEkEpgtu+TOEbB2fFH
         EAq3Scj1sFjgwXdMAVOfhES7mBmsbb4X+RVwrXjEulg4qp2HjG+4mowN8Upj5Etj6JTE
         j6nc4EocPVGjzB3lDqRmoch9F6Jn1aP5Dze4o5V7MlX+vOex8cjV0IsKSZpXTImsud2Y
         hNVzTd06yoo3Ufk19I5f2Fm/QJQ42Q49lgvSMQgLJVx49hVAosNEdyN32xXW1rNA0DXv
         u5IPwF25Q59sEmlhFcbgbCncNY0T+aePvnDzScfCg0cPZB/sxceaydcuZFF65rWFHqNd
         lG5A==
X-Forwarded-Encrypted: i=1; AJvYcCXcD3uQTqHvoAibc2Y5WVTdGLMsK5AFzHVW7ZuEyIUUOJqI9pbq08VJXznIsLlR1mt0gH+q3kAJ3Q8cCgLQCbAE@lists.infradead.org
X-Gm-Message-State: AOJu0YzUvrcmjPN15LjCzRePJznS8Wv06LVpkDcGr6YqFSc4D9664Bbj
	U4zcTX1EniyzcUPoXBj+Q1+KFyqNqU3I2czNr3dO2B/DfQ9OsF5K
X-Gm-Gg: ASbGncuZlZAmoqS/CjACbDElTBROj8GzlZTKmKYTjIDlq7tMr2yrGDtfGd716jrrFQ/
	fKyYyTBctXLLBDhBCYhGZTlR+Q5G+e+zCqrIBZSSatqHeDzpFhEliHBNMohtQuGe6P0sNpz9z5r
	dRb1YasyA0dp5pRQyooZaSsIXC76ZSswBg9Tk2x7h1tFjPAq6XL3PAzkx4lQCniclWepKP4kqdS
	AN9mFwI9/mURs63QVrAxxCL/GGO6onaW/mJLGgx1wd5juNqHR+1F/9hOHe6fgjuUMcU2CPd6igU
	v+83iiAUSGAn9RKqDKI+IR2zzz8znpBhz+xNyjt3UsOVOBvYv+IdZ61+
X-Google-Smtp-Source: AGHT+IFFncrZVAh/sPx6EADZxp/0OsWeFLdIoZEQns7C8v1PTlZYjizAdIK9G3wvfVyLXBmSrFN/sg==
X-Received: by 2002:a17:90b:2e8d:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-30531f7c03bmr6172874a91.4.1743267057709;
        Sat, 29 Mar 2025 09:50:57 -0700 (PDT)
Received: from celestia.turtle.lan ([2601:1c2:c184:dc00:fbd7:4326:6b6c:8c8d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedf98fsm38545535ad.57.2025.03.29.09.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 09:50:57 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Daniel=20Kukie=C5=82a?= <daniel@kukiela.pl>,
	Sven Rademakers <sven.rademakers@gmail.com>,
	Joshua Riek <jjriek@verizon.net>,
	Sam Edwards <CFSworks@gmail.com>,
	stable@kernel.org,
	Dragan Simic <dsimic@manjaro.org>
Subject: [PATCH v2] arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down
Date: Sat, 29 Mar 2025 09:50:17 -0700
Message-ID: <20250329165017.3885-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_095059_118900_EB65A5E0 
X-CRM114-Status: GOOD (  13.20  )
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

The RK3588 thermal sensor driver only receives interrupts when a
higher-temperature threshold is crossed; it cannot notify when the
sensor cools back off. As a result, the driver must poll for temperature
changes to detect when the conditions for a thermal trip are no longer
met. However, it only does so if the DT enables polling.

Before this patch, the RK1 DT did not enable polling, causing the fan to
continue running at the speed corresponding to the highest temperature
reached.

Follow suit with similar RK3588 boards by setting a polling-delay of
1000ms, enabling the driver to detect when the sensor cools back off,
allowing the fan speed to decrease as appropriate.

Fixes: 7c8ec5e6b9d6 ("arm64: dts: rockchip: Enable automatic fan control on Turing RK1")
Cc: <stable@kernel.org> # v6.13+
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
---

Changes v1->v2:
- Added `Cc: stable` per Dragan's suggestion
- Applied Dragan's Reviewed-by tag
- No changes to patch content or main body of commit message

---
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
index 6bc46734cc14..0270bffce195 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
@@ -214,6 +214,8 @@ rgmii_phy: ethernet-phy@1 {
 };
 
 &package_thermal {
+	polling-delay = <1000>;
+
 	trips {
 		package_active1: trip-active1 {
 			temperature = <45000>;
-- 
2.45.3


