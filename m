Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE998C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g7KYYLVYAzSjQ+OOEOBYCeT9uSdwa/8OaOS+anJ2pbk=; b=wD2f7I4wO7tn5eaSsoOskuP5Kg
	Jgy3yhubrlo9ntIlXFHrvd2tNmcnLldPxdjOUuxGLh2MF7mvdfaaIdLSmKwTfBQ/i2Jfd05uQEF92
	UL2EA/Imz5I3Ohj5NGHRa58RtlNtdOS9bpTFwNI3rRTADzwYInA/PjfruTjaB7Bpf9JbyTUmEwgaJ
	RCA+23RDnMVS1EzbiYkKs6S6kZrth7UgTJLHS4VcAQE9y3DK6BSFrmIbRBHmq9woGlRnHvasvDp6y
	VBUEnx/yqE8ffWdIqai3VRtRO00kcI73Iodsqx20wn4mthzZMDX32mZBP4BuxWAvs0uzhx2lOfxOK
	HbRUU2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5zW-00000002BIZ-2Qhl;
	Sat, 18 Jan 2025 10:23:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5yF-00000002B2G-21YZ;
	Sat, 18 Jan 2025 10:22:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso19450865e9.0;
        Sat, 18 Jan 2025 02:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737195745; x=1737800545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7KYYLVYAzSjQ+OOEOBYCeT9uSdwa/8OaOS+anJ2pbk=;
        b=XrAR79iG2V6nkQYCiarSmznvkLE72SaPFg3lrNyoF0fpsJw4F2RsEKBOtrJUjU4Rzz
         0zVVUZk9JWBZO28nIxREcJqQinK/yhxkDONrPEd6xihPR5atX2qNGJACSU8u+T5ALqrD
         kmiGWIbHlp6Bfv3AGT2f8vLW6DoeAaL2Ky1wFiL8Zi1on+GwRIPJoyAJtOyPYZAZpd9d
         h1UGIz4n+kq2iRg4XwDwXvcUel9K7fseBBCrfN1hhfZuPZacsqiTVSDKeeagCE4UNQRy
         gmi0BscpHY47Dxhq4tTQmnH3xdq+0b5TGKqxClHr94/Otf6r2QCO3QDCP6XhMJHzdeKR
         fQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737195745; x=1737800545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7KYYLVYAzSjQ+OOEOBYCeT9uSdwa/8OaOS+anJ2pbk=;
        b=dUGYkaoieYtibOVqDQYKec5DsITbIK8nh+BtNSVjGNWtVW9zlWGLaNAsElP1oRDL+D
         lzYmRbhyYtm+pu0T5lNXkhB8Hll8pfMQS9vWi2FejYKDUywDXze/rK1i/ZHddlWknlIs
         gIJjIDgX0tUOXDkQG4DYM6W0dRmdtG07ITAShBdHSHly+LeHbO9DYhkVKR2KpJNXd3fX
         ajKX2KvIOBcci+5DVhpOxcTVmGaanCnPMgMuHuMnDiHJ8GfH6cQ7K1FQBtRnHVk49fXw
         COsAKRiuVm/ark0d2oXWR+UjEfzFCJDFpjIZkF6oz18lzTZIyef+L3cwdL4g4u0Rtr9/
         IliQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAQcUyucieoXzBK316KBecz6xpcVJ8zw9CGPXmu5IulqcGF1y4gzPSEhoTA1KCC85B6CHNbuW+fV0q@lists.infradead.org, AJvYcCWztO1IXPaZsmNyhzO/PK+IDnBVyR3PjiK0HBiynNgcKRXj36SZOYydsy7/NKyLau7A29mCZSjwzkWgoxCWCKGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzPJOkUDuGHny4i05e6/RdzpOXM/NcnkeV09kVJhIRW+5gnvZ5e
	6BYD3+EeyzA2GMR019OU8CFVj7q1UsMWAuuRmlfP/8RxvtOoK0ke
X-Gm-Gg: ASbGncudmuhOEQk1oZNGF4xDcwjqTmtK75PQIoAuguwfqQWu1pSRGFNJxp9rLf1I9Fh
	bOz8eAA1jYv2uh+JQyRcVt2PkGAjdZKGRLf9y/BHRRGGMrqFZkGj/0VTZh5IYQEYg1jbGEslaUD
	Ml19k2p9Zkk9KMncFRErziX/9LsZeUvFnI8a6SsCb3u5kvJ1lvVOodaC4FL0b37taGwDjhnGrVB
	8Gfbn73W2tsP4uW5RmN+i1KwbWw9L6ROZIDx1cy2iaAmZuXj1hnOa4ObKIqGgrBU9Ny83UkgAgT
	IPM56XscoR8EK3l4P5UxnY5uJguHS4YNpD4eSqBaKbm1Clf5Lj72gIdY
X-Google-Smtp-Source: AGHT+IEC8wg+03HMOeCQYRjaEL4hVw0Oam/RePsv5fuRPjO3sBxgUEwi9m+wMgy/eMHl2a2vGkenKA==
X-Received: by 2002:a7b:c8c9:0:b0:436:fb02:e68 with SMTP id 5b1f17b1804b1-438913bdd6cmr55694025e9.2.1737195744926;
        Sat, 18 Jan 2025 02:22:24 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625f5sm64954515e9.28.2025.01.18.02.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:22:24 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH 1/3] phy: don't let controllers change vbus reg
Date: Sat, 18 Jan 2025 11:22:04 +0100
Message-ID: <20250118102207.9339-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_022227_541357_20A9012A 
X-CRM114-Status: GOOD (  13.32  )
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

Allwinners SoCs share phy0 between the MUSB controller and HCI controller.
If we let these controllers independently power on the vbus on that phy,
peripheral mode is dangerous because HCI never power down the phy, resulting
in 5v being applied against the host 5v.

Override power_on/off for phy0 in that case, and let regulator be enabled/disabled
based on id_det only.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index b0f19e950..24fbabe7a 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -465,6 +465,10 @@ static int sun4i_usb_phy_power_on(struct phy *_phy)
 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
 	int ret;
 
+	/* phy0 power is controlled by sun4i_usb_phy0_reroute and id_det state */
+	if (phy->index == 0 && data->cfg->phy0_dual_route)
+		return 0;
+
 	if (!phy->vbus || phy->regulator_on)
 		return 0;
 
@@ -493,6 +497,10 @@ static int sun4i_usb_phy_power_off(struct phy *_phy)
 	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
 
+	/* phy0 power is controlled by sun4i_usb_phy0_reroute and id_det state */
+	if (phy->index == 0 && data->cfg->phy0_dual_route)
+		return 0;
+
 	if (!phy->vbus || !phy->regulator_on)
 		return 0;
 
@@ -573,9 +581,21 @@ static void sun4i_usb_phy0_reroute(struct sun4i_usb_phy_data *data, int id_det)
 	if (id_det == 0) {
 		/* Host mode. Route phy0 to EHCI/OHCI */
 		regval &= ~OTGCTL_ROUTE_MUSB;
+
+		/* Enable VBUS reg */
+		if (phy->vbus && !phy->regulator_on) {
+			regulator_enable(phy->vbus);
+			phy->regulator_on = true;
+		}
 	} else {
 		/* Peripheral mode. Route phy0 to MUSB */
 		regval |= OTGCTL_ROUTE_MUSB;
+		
+		/* Disable VBUS reg */
+		if (phy->vbus && phy->regulator_on) {
+			regulator_disable(phy->vbus);
+			phy->regulator_on = false;
+		}
 	}
 	writel(regval, data->base + REG_PHY_OTGCTL);
 }
@@ -603,6 +623,12 @@ static void sun4i_usb_phy0_id_vbus_det_scan(struct work_struct *work)
 		return;
 	}
 
+	/* Disable internal VBUS reg if there is an external VBUS */
+	if (vbus_det != 0 && phy->vbus && phy->regulator_on) {
+		regulator_disable(phy->vbus);
+		phy->regulator_on = false;
+	}
+
 	force_session_end = data->force_session_end;
 	data->force_session_end = false;
 
-- 
2.47.1


