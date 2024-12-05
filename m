Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE1E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QQ8MZsLY5xEMudemo8XsKwc/XtXn0HgWnIckzCi3q4Q=; b=ITI8U0nVzsXO6npKug8jw/OUzD
	JNI4CRhIGQClNYbAYy34otg7UtzhMVof5JA5xjSXW0610HQgf0e4g5LBaQiU355Esjyjvx7ppPP5H
	ktSX9ZtOjyzNu4U9LnGvpxXJYq8/a6QWA4PYCxuP+uLlBxDSMpUedpD2mS5Yn63BB47jWzFDS3HHS
	s/Bth1T9jDfySlE+quXVQJXHftatE8WSPOrgK3vDOkRzBTLnC25cB4p0oouMis5jj10ofS0NZQufP
	mWouXjci6erCkfL73W35ZMRmPcOTuf1ZYIIz5u2xI4IovGScrqcq2KavKUjHBQEc5Og091BvmHIby
	BfDUyz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDfD-0000000GViZ-3wmL;
	Thu, 05 Dec 2024 15:21:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDeB-0000000GVW1-44co;
	Thu, 05 Dec 2024 15:20:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so798804f8f.1;
        Thu, 05 Dec 2024 07:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733412006; x=1734016806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ8MZsLY5xEMudemo8XsKwc/XtXn0HgWnIckzCi3q4Q=;
        b=gQqgb5eGZ5cdKR5aq95koW/R0a119ZGGIACPEZoT/ytyOxHgzK3YHbzzablg3QsMsw
         KOvh80tc/NSBYiX3yUkfo/hRAc7fNvCA7NpzAWOEMTQb6SsVOgaE3raoVoLGafBxZFBu
         aSNk5y4OZzbMdXRkoUfy8CAw9qcvpsKiIUYoZSnrFvaMn/PG+RSxTOJQmteToaI9DfmT
         k67XNiI+C/GlC0IVYesl+kK58oYPM6w0wufFaxhOZ9A7maq89Bw8zUa2ePSa/WRldEOD
         sratHYt7mAjgoDolgJNeF1k0TQDY/RZSl8ccitXp9RQivxns5kpd9tUQ7BtMCUE90jgz
         fxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733412006; x=1734016806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQ8MZsLY5xEMudemo8XsKwc/XtXn0HgWnIckzCi3q4Q=;
        b=UjhnSdyxAwrNsA3vifT6ptomVnbBwtjZ02UEFl0uoV7+sGn0Uu7+h9/5OgWnivDzE5
         eOHEBTZtdBxOzQDKJ8vk5wI+1sybqoZyslrcNgRQ6cc6dXuXC5Y2BsWxJRCkIFhEQvmU
         OYZ8IjYAUKGY8CyqmN5/p1JHRSeTBLn7zkafsBgJyqo1R7p7q6I21n67qZi8ViSecQMS
         FHRqHllx+WKLz4v+wP6ubeQG0WIpKO+cTrcfEEwQ36CcnH871JjAxsVmV6kPLf0LQjze
         5ovDRAFlk0l/GCFyKqOxvU2lBU8jy/ekOFhdW+MdhbjF7+s5EROqtdoROxmvk9ZY0ySR
         D21Q==
X-Forwarded-Encrypted: i=1; AJvYcCWn483K/BZLK8NUptfyGVxuL0RzTjOtZid6uwEsjEkeb/yhhvcT83JZRZ4qgguJlcPuNkYsClG8qVcibSosP7U=@lists.infradead.org, AJvYcCXYEBkkrZ0WhSf9XluLxE4hw8tjIDqJxVaRAAIR8HwvL1c/yHcpoUjkc8mxIBWTk2bRnXHSi1Xo4J6IKpHfMsNo@lists.infradead.org
X-Gm-Message-State: AOJu0YwZNvSBImzEVoILsNopATKJczbAmGpzt2jHNvoJZNlwylUWypki
	jZJriIw3VB0h8nAe987qWyxozUm88gIEg8qZIE9fO8s82LoDoqPK
X-Gm-Gg: ASbGnctSSEcpb42+SECTki8VIbo53rfmi4hKUZlyrMS5tFWXV3NaD6yb8FIvOVtjLxu
	AKhxgxaDQhYbk1BEJJTxR4m3VVw+gX2LF4rkl4o3t9TXhP5yU/9+7GyqTWxmKFwMkEYBHzcJluE
	tNOZ39FRt1QzeeBOirwCiO/1QMCvcO+dFQhfaSUU1bMhP5+dFy5DXIrj5gcdHsvQtPZjtfMcvBv
	HotSSMDQ7VK2bEiBfXqSx0phoQQ0lib80MVr+O5i2L/ii5FgdfGX6n0AJvuM+MSCrHPKjYuTUXX
	FIyAgFgq6onGm/N71nw=
X-Google-Smtp-Source: AGHT+IEi/F8PB/gDGTEq0wQol98PXt8a8NO1gCgLug2J7Sm2o/F9d6Q2zB2V/7/hscb2BGWUKu7/5g==
X-Received: by 2002:a05:6000:1547:b0:382:3754:38fa with SMTP id ffacd0b85a97d-385fd436128mr9664529f8f.51.1733412005553;
        Thu, 05 Dec 2024 07:20:05 -0800 (PST)
Received: from opti3050-1.lan (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621fbbdd8sm2167304f8f.95.2024.12.05.07.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:20:05 -0800 (PST)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
X-Google-Original-From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Iskander Amara <iskander.amara@theobroma-systems.com>,
	Sasha Levin <sashal@kernel.org>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	Vahe Grigoryan <vahe.grigoryan@theobroma-systems.com>,
	Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: rockchip: increase gmac rx_delay on rk3399-puma
Date: Thu,  5 Dec 2024 16:18:27 +0100
Message-Id: <20241205151827.282130-1-jakob.unterwurzacher@cherry.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_072008_007368_3D4729DD 
X-CRM114-Status: GOOD (  14.37  )
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
as reported by "ethtool -S eth0 | grep mmc_rx_crc_error", to increase
above zero during nuttcp speedtests. Most of the time, this did not
affect the achieved speed, but it prompted this investigation.

Cycling through the rx_delay range on six boards (see table below) of
various ages shows that there is a large good region from 0x12 to 0x35
where we see zero crc errors on all tested boards.

The old rx_delay value (0x10) seems to have always been on the edge for
the KSZ9031RNX that is usually placed on Puma.

Choose "rx_delay = 0x23" to put us smack in the middle of the good
region. This works fine as well with the KSZ9131RNX PHY that was used
for a small number of boards during the COVID chip shortages.

	Board S/N        PHY        rx_delay good region
	---------        ---        --------------------
	Puma TT0069903   KSZ9031RNX 0x11 0x35
	Puma TT0157733   KSZ9031RNX 0x11 0x35
	Puma TT0681551   KSZ9031RNX 0x12 0x37
	Puma TT0681156   KSZ9031RNX 0x10 0x38
	Puma 17496030079 KSZ9031RNX 0x10 0x37 (Puma v1.2 from 2017)
	Puma TT0681720   KSZ9131RNX 0x02 0x39 (alternative PHY used in very few boards)

	Intersection of good regions = 0x12 0x35
	Middle of good region = 0x23

Relates-to: PUMA-111
Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Cc: <stable@vger.kernel.org>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
v3: use rx_delay = 0x23 instead of 0x11, which was not enough.
v2: cc stable, add "Fixes:", add omitted "there" to commit msg,
    add Reviewed-by.

 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 9efcdce0f593..f9b4cd2d7daa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -181,7 +181,7 @@ &gmac {
 	snps,reset-active-low;
 	snps,reset-delays-us = <0 10000 50000>;
 	tx_delay = <0x10>;
-	rx_delay = <0x10>;
+	rx_delay = <0x23>;
 	status = "okay";
 };
 
-- 
2.39.5


