Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5772DD78302
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QALA3vJFqR8NKYOn5MTUFDxKO0FcS0aiXq3k1iQUdts=; b=xC4MpsA9E/YMo6aPJSQQBz4HVN
	5SSZCz2VLH6BnEDj4PYaSiUKkQLxMQi/q5qHs4+xrR4VVoK5Xos3IH3SKmiSqxSgi6qlKL51gOItp
	MEIQTmGZiXnJpJtgur3zMuZ4H1nkj/iufNKeyJYG3JAGL+GJckNvimQscdF/xX5tJmr5pjyvool7Z
	tDLWU3Fkq1BhR4HFBM2u1qDZLqIkZu9EwRLOV2tz6/clbtcq72X2djCwWqUlKLhhgUO/1X0kn8nTo
	IEq3xotSRBGu0ElrOzwYcSA5rPlDH0cQ8FRq9bm83z3NkC7ockY9rWIMz9Z1J2K1s6kDJAjceao5h
	pZhDaMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3fy-00000005jOe-31d4;
	Mon, 02 Dec 2024 10:29:10 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3en-00000005j84-3ZcR;
	Mon, 02 Dec 2024 10:27:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385f4a4093eso455456f8f.1;
        Mon, 02 Dec 2024 02:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733135276; x=1733740076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QALA3vJFqR8NKYOn5MTUFDxKO0FcS0aiXq3k1iQUdts=;
        b=YNErOJZ7LcxPZBdHlJN9g6GYn6jMSvsVTl/sRV/E20RU555elNc2dRUmZGMaxpnNDc
         1CvPYGWeg0GITEDd2nfEnYhAuBanrodJtC0YwRdIxppR7Ohi6qbXLTHr8rs6IWxWsPXx
         CxDpz/qNODrHx1R4R9e0dk/5veuDOtgxQTH/F6qnwFXpZt/Qfnq+UbLBTdnn73tGa0ST
         Xr0rCE0tQnPhUsKn+2tkHgEACja99GyS1pjwR2scNfBdFOeoia3ON1yMyRd4H1fDsFA3
         4727yVpJ5egb0cUfpofmV3DJrDT3Cuh+sbp2F18SlwMUo436nAm02rX8CiNG1qxSah3N
         HVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733135276; x=1733740076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QALA3vJFqR8NKYOn5MTUFDxKO0FcS0aiXq3k1iQUdts=;
        b=Q9XzOLCyrxFEyYJF4mAR5gz5A/8dHrG6CJ86UQxUzLSlYAtqLmbRjP9RN3z1GUZJY+
         fhGHteZI9UNRgtM+cg9T4yZQa/YKWXQnBx6DgKHohxsnBbT7Nj6U8qR4xajODCbn5Ny/
         Tnb0KZPIdmFaAObavaVC9zCeMVr5BcC5X0jBby/QW+GXWwAdPgZvFP8raxqGWa59c6kD
         iFlC8az7e7AurZqUqdDFq8LJ6JNSKukp3gJcE4mzzZzdm8TNMP+SJkoPey65mcX9yLNn
         vCggVWzfU+UWTB/5DUY4gN4jOn/K3ElQl0tmlN6b9ZHzhDBOeNoy47/GUZ0jqzbXXRxd
         9Tpw==
X-Forwarded-Encrypted: i=1; AJvYcCUcoY8/wWvDPJeVG0Wt7Bt7rnZPDfB/fLvCdhD4ugixqWj22noAOZqrtpJdmrb812jE4CZxhZIbHHA9ZFebAkt/@lists.infradead.org, AJvYcCXUIZgDc+OXQy+HXAXAaFSHEJj9z5YiGWHTjoC1WGFjPXx3gxE234KbHcn5ZoDIwQ9zkcYQsnxEJ7uDQhjHIWM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNniofyAU1sZIvrvy61XNUP2wVmdfq50UQC5RLkOmAF9hjqXWV
	B4vgUO14TzwNEyszpCfOURdZiFg3Vt/hTmcFJHSJXAvQB0fn9MgW
X-Gm-Gg: ASbGncvY0UXPRGXJf/l9FdoqvTMwRbnfU9cN56AChPavyanxbhoFr8HwM6kg7uOmH/Q
	3XfCpE7zCAEoKFW/iSSXCCVLBa/F8jlU0fZIkZRQ5XFEopmfJXzNafxbGfVmv5Jiqey7zlvhiOE
	Lc0Nt3kBh7wkrV285GzYlTxqLd0FukHyvVl7SjUVksax9cjJDxWX/sIKwzgR8VO0tGesGlb9T9o
	sUrid2U7r5OapiinCv3uhi3/yisrLLHxsaTBEhjuVXFn/HOraat8vXQq/SVAe20SwJK99fldllB
	gowiW86pRdFB7MmNZNk=
X-Google-Smtp-Source: AGHT+IEtcv376POJl9E2bAxspbhqve3Y2tJ7pgMGWk2qvbJcgbnauunS2AuXTdMYxck6zEO85ZI3Tg==
X-Received: by 2002:a05:6000:4610:b0:385:df43:2179 with SMTP id ffacd0b85a97d-385df432337mr10679245f8f.17.1733135275802;
        Mon, 02 Dec 2024 02:27:55 -0800 (PST)
Received: from opti3050-1.lan (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eeb999f4sm3781643f8f.109.2024.12.02.02.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:27:55 -0800 (PST)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
X-Google-Original-From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Iskander Amara <iskander.amara@theobroma-systems.com>,
	Sasha Levin <sashal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	Vahe Grigoryan <vahe.grigoryan@theobroma-systems.com>,
	Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: increase gmac rx_delay to 0x11 on rk3399-puma
Date: Mon,  2 Dec 2024 11:25:44 +0100
Message-Id: <20241202102543.204154-1-jakob.unterwurzacher@cherry.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_022757_887799_B7EB42B8 
X-CRM114-Status: GOOD (  12.79  )
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

During mass manufacturing, we noticed the mmc_rx_crc_error counter,
as reported by "ethtool -S eth0 | grep mmc_rx_crc_error" to increase
above zero during nuttcp speedtests.

Cycling through the rx_delay range on two boards shows that there is a
large "good" region from 0x11 to 0x35 (see below for details).

This commit increases rx_delay to 0x11, which is the smallest
possible change that fixes the issue we are seeing on the KSZ9031 PHY.
This also matches what most other rk3399 boards do.

Tests for Puma PCBA S/N TT0069903:

	rx_delay mmc_rx_crc_error
	-------- ----------------
	0x09 (dhcp broken)
	0x10 897
	0x11 0
	0x20 0
	0x30 0
	0x35 0
	0x3a 745
	0x3b 11375
	0x3c 36680
	0x40 (dhcp broken)
	0x7f (dhcp broken)

Tests for Puma PCBA S/N TT0157733:

	rx_delay mmc_rx_crc_error
	-------- ----------------
	0x10 59
	0x11 0
	0x35 0

Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Cc: <stable@vger.kernel.org>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
v2: cc stable, add "Fixes:", add omitted "there" to commit msg,
    add Reviewed-by.

 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 9efcdce0f593..13d0c511046b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -181,7 +181,7 @@ &gmac {
 	snps,reset-active-low;
 	snps,reset-delays-us = <0 10000 50000>;
 	tx_delay = <0x10>;
-	rx_delay = <0x10>;
+	rx_delay = <0x11>;
 	status = "okay";
 };
 
-- 
2.39.5


