Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06890C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrjpVKFbSRrE6vHiGeiawaeS65c9c+jYODEjMxySj+o=; b=J6QGdDbWXAa8KP1XbmU8Kfje6N
	xi0j4hqz9pIUkrTHG0PLJe3Rw1bmSsFUpj4les46ibIIADieRJVVWi46L5U2Wu7qt4gSurf6BSYQJ
	mpkakCeCnbZ30oI2aY9D08fTqdtkhXJ/nw1xA9EORoji4bQUbnUGhazFGtsRdaaHLEifk9D2asDnG
	ISfUn0NzFdE6PPcC4iMcupK8Xq1VcDnNjlr2fKWBMg9td9olyG477i9wLEv9ycoGe0/YYU9ZGrEvv
	tQ6tDhXxti9uVkRde0J9k5XzJjb6MFuKKhWYVVZH8hCa1eGqh3M034Lo4UFTuQrRM8LVibDwq9dWT
	6+glqHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tff8R-00000003LHc-1h9r;
	Wed, 05 Feb 2025 13:08:07 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfetY-00000003HuN-1GTh;
	Wed, 05 Feb 2025 12:52:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5dca451f922so6549327a12.2;
        Wed, 05 Feb 2025 04:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759963; x=1739364763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrjpVKFbSRrE6vHiGeiawaeS65c9c+jYODEjMxySj+o=;
        b=inXdcmlsJfht5e7RNgWiN4uXAiV+U2ZUp6L/iUK0bTd5yxK+9i9q0aA16C5PbS3wzg
         WAtItpPvClN+57hobVi055JtTqzZpDPKCNJ1VYLDcR0S6140LuCHZhZHz3Zz0KMcr4Iz
         6ALhnZSP6PFv4fAeULJ9OBftUaSt6ELLYGL+Yv9LDx0pdFDSRYs+p2/Sgl1ONXCVLjFX
         TIVGR9t7/XDO9F2Jp/6BWZzHzwTQWEcNz9vwBupC5ioBCuD6eC+S9+VkjkIBUBshq/K7
         R+sb8Awi/piEagqNRhuS8oUVazYD822+LoEPZs4+y34ANqQ/WL0W0Ps2571xfDnq6MHI
         26Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759963; x=1739364763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrjpVKFbSRrE6vHiGeiawaeS65c9c+jYODEjMxySj+o=;
        b=rvL2janWS+y1mXKFUgxzJqUHpqgr7viuFVMUxmy0ijEK6z/1alCTnHKLaQGCv7UfeQ
         Li3FDTzMd+zTRziOspro9BRusvUWF5Bpst9spRGW1Lhl7HDB7uwE761RdekzPMnhnr9L
         y8omRTPERfz7/DDef8A/Q5qw+QA9kpoON+PF1Lg4MfBviObk8n0ToqYK3raNGrsn2QIT
         hHALuxIgMGEW+xFf+IUBhK5E5wh28Kn39xTufgllcOkfPsOIq2W0a64PsosPHXETkD3r
         myYTq0yczF5WQysxjDy37pILYdEWORP0RMdYI29kG0Deqq6YWFWLcAl/gy1CCkpDmM0W
         b0qA==
X-Forwarded-Encrypted: i=1; AJvYcCV5rmnwbRTjiiUU8V9wUXcoWdpSTxWE02UDyPFPCv1T44S+q0S+RE8/Y9bfM/BK8xseeSHI0Grj3JEqEdw=@lists.infradead.org, AJvYcCX89aTIqvoIe6Uhcx4vdHjoggNf385c3sDi98JWLIcAdgj4dikKG0d3AqGSzoSd74TQMtxzwo4wZN9K@lists.infradead.org, AJvYcCXzJh52x6oA2BRHjUxZDOuaeba+fzj2S1tzp9Ug3zBZCnNhgM1NA3+fSjEBSqi5wVAx4P71LTvBDfA1mAHiGpv6@lists.infradead.org
X-Gm-Message-State: AOJu0YzsBUjIFmIw0E5WLGFG6lAABOBIR97s5ZcXxjLGjmcu8IPzub/a
	U80ZUeynUUFtnC/n2jGOol3PWfw0yFUBeawjXc9DfGIU25SjuP9E
X-Gm-Gg: ASbGncsjSHni2vxmK+El57xnniBpe4bqAdBVCJq/VjHv6wPa9B9s9pTgxDA/3uFnG8O
	KkJM7PfX/dOvSY34juz3eCfz5QPqDev74WDEvexf+Rexi9nhgw14pbA4wV5xA1fLBxzewn+bkkm
	tdI4/dcqTTEqEbNI03j4IIHELpHOdlNmd5bAs4bmz36ttJ6n/ab3T50LBtEv3dIe/kNeueZEVcL
	Oi3KVta38h6goc0KS5qdBa1peGuEoYVi2b1Hw39R1Db/z58JedSPYieW2gybrLJfKKRCWxTIFLQ
	PcmXYJ4QK8CXm+incRgPgwDU0RraabqMd1sKfHd4FbDXcg==
X-Google-Smtp-Source: AGHT+IF6zoFHYoDLjXMYqUkNt9+F9g1qPDmsrM4f/DRoKSMpr0i16Ws07ZzIUfLBaqBzFn0iR+ySiQ==
X-Received: by 2002:a05:6402:5d5:b0:5dc:7464:2228 with SMTP id 4fb4d7f45d1cf-5dcdb6fff0bmr2892117a12.2.1738759962631;
        Wed, 05 Feb 2025 04:52:42 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:42 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 08/10] phy: allwinner: add v853 usb phy compatible
Date: Wed,  5 Feb 2025 13:52:23 +0100
Message-Id: <20250205125225.1152849-9-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_045244_348737_A943CC96 
X-CRM114-Status: GOOD (  11.38  )
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

V853 has a dual role USB phy, similar to other Allwinner devices, but with
only one phy. Add a compatible for it.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 29b8fd4b9351..1610501fb8bb 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -1005,6 +1005,15 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.phy0_dual_route = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun8i_v853_cfg = {
+	.num_phys = 1,
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.phy0_dual_route = true,
+	.siddq_in_base = true,
+};
+
 static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
 	.num_phys = 4,
 	.phyctl_offset = REG_PHYCTL_A33,
@@ -1041,6 +1050,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	  .data = &sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
+	{ .compatible = "allwinner,sun8i-v853-usb-phy", .data = &sun8i_v853_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
 	  .data = &suniv_f1c100s_cfg },
 	{ },
-- 
2.39.5


