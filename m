Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D15D10DCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KdRw+3yRhHiEf7cq+avjlIDTXlKe07P6ezlIISrm9AA=; b=UytSKC84uAKBp49s/QhtDGOY8O
	4pIvFJPeZDAl8FguEmhHkuk6gNoXjjNPLe1O3SnS9BgeuJJKT/K176PkCUoMWzr7ACIOy+0NblP7m
	HNc7+Os5MXCTFjGcVtFMjeBeaW1v/yE1EI2NvMnK9s5K0lP1RKJsC8Pi5MVn+gV9rY4oJY8GtcNxP
	ZOvUOFk4Rij0VIpidl/KU8WRgqfvIibmoT+gAz0y00VDmB0ynJKufuMzUDljRP4REgtxv8nmZr5v9
	CtZU4HRDiBNBGQCSmZHCp81Yy7AN6WG9XbsT7b2q0x/9OQMg/HPXrAqAwf8MZMkwIvl8T/ATd4P1q
	B//5heQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2NS-00000005VOc-1ZLL;
	Mon, 02 Dec 2024 09:05:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2MO-00000005VFe-0D48;
	Mon, 02 Dec 2024 09:04:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434a95095efso28439225e9.0;
        Mon, 02 Dec 2024 01:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733130290; x=1733735090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KdRw+3yRhHiEf7cq+avjlIDTXlKe07P6ezlIISrm9AA=;
        b=fAv9iY4lFcJ7F21cv1Ho1Q0J795JsUJJ9wwZNaneW0RPQfkCSsTgYsiosHK8qRfQR1
         f1fqYuXFxV0BdYoty8+5+eRL3+jnvzdRZsLiXtwzRW0tMtGOF6QRLAGwBMyWO/FyRdsx
         G3Xx3bSoouf8dou0FQNSz0CqCX22hUGFQ6XmlEBRjRN5IcAwmN4Fa546VN7XvJrSyKpd
         MI9203p+joq66IPNMWN5S/awB76oRTmCF5K7+QUGzVDTUjUbvuxnbkoyuAxW0IhU57Tk
         O6npxRA4K4miUWE+wlWXnfe6KhSKW2aqVNS0HhMDvNE5NOdTX9Gk8qxXyRxWYh1m1wdg
         PZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733130290; x=1733735090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdRw+3yRhHiEf7cq+avjlIDTXlKe07P6ezlIISrm9AA=;
        b=latdOAl+69ZsWuJciECUo2nm6OL0GlMsWv3DQmj1ztkHxfJrKPpCgWV9pcl5l4bcuO
         osYfE0WixIpfNXMK7iyl/YZqRuBhVX+cDsQ7yTeX61XWtDyGc6B/50hWYV5h/on8pB10
         6F0zjqjeufDD4sDih5RVcN+hGyUeAUQWzUYevVCzeuVEwb0uAJBbhIrnkz/Q84RSe1LV
         KkfUq5Ci7l4mfbkXGcEcbWM5F3FRBQPjalQRZ98FVv3ItKTIOh5n0tXJwo+6TsSNnqZX
         ySBiXmgA+YiB+8tNvuzBhDPLj8/TTKQosPbKpLlePJ0WPCdPrYT17m6TtmboybrrpUsq
         zKtA==
X-Forwarded-Encrypted: i=1; AJvYcCW6RWzjyvfNGF1DidnIlx2wZQDPNiJnDxhqPrd/+G/ScGZh2sJf/59LJby8XhmNFRyM3ZVztePXky7WIl2YZZ6H@lists.infradead.org, AJvYcCXFoz7S6NBXOlDMEZutxP35WfeHMIvMfkkxD+5jsxocae0TpKMKTL/aZ0og3c7Y81N3kk5dX453X+/sUps3lHc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxwImfqITMMhCXkvWBHaw3EYPz43KYbPwjlh5Grdr8GS1niWxq
	DKDkDKf0DuSc8VtRsAseNeoY46fOyMa7MZrrHh82OZHS26iYSOMi
X-Gm-Gg: ASbGncsvZ/NKqD+8r3AC8sl2ggS/m6Sa4rO8y4M/E0ZI8Fc4IGH+FAcfbyCPfnnusPX
	noOpaYWlDY3NA3i3parGg9vK+cyhn2VsKfPZRRs4ja78Y4IZWWXQ1Vl9P4nI274cN7PpVpu9yVc
	6nr3xcJzCofnLbpawXA3My7vVNgPu3QNlgySmgfkroSXalrrEqBLB1ho4bsSuAgqDxM61OuBfHp
	IE++GQfUPWNSLAab61/BZXR+1KHYSuT+P5n3VYKPK+5ljeyb00hKeu1680dQbSm5tMIXhl6FmLb
	whdx+pEgHtUVUrCP+Go=
X-Google-Smtp-Source: AGHT+IE5ej83vkEuAN7FUm2IFCFK29g4LXe0Xrj2GfYHRf/oTcVWykXSn2MRlBnJgbYj4lmc+7P9Ww==
X-Received: by 2002:a05:6000:18a5:b0:385:df84:849b with SMTP id ffacd0b85a97d-385df8486eemr10060974f8f.11.1733130289614;
        Mon, 02 Dec 2024 01:04:49 -0800 (PST)
Received: from opti3050-1.lan (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ee4d932asm3658161f8f.26.2024.12.02.01.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:04:49 -0800 (PST)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
X-Google-Original-From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Sasha Levin <sashal@kernel.org>,
	Iskander Amara <iskander.amara@theobroma-systems.com>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	Vahe Grigoryan <vahe.grigoryan@theobroma-systems.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: increase gmac rx_delay to 0x11 on rk3399-puma
Date: Mon,  2 Dec 2024 10:04:07 +0100
Message-Id: <20241202090408.201662-1-jakob.unterwurzacher@cherry.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_010452_086173_AD6B9182 
X-CRM114-Status: GOOD (  13.03  )
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

Cycling through the rx_delay range on two boards shows that is a large
"good" region from 0x11 to 0x35 (see below for details).

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

Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
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


