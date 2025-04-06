Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C9C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 22:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayn/+ArG131gi18wLCzFlJOt7i4mpT3rXpgfAV6sJtQ=; b=UZtVulmjwex1GNMhfinPP//Cn7
	mPlTmc/CRH9wopWF7A3PM4EyLLGPAJ8RNkm+6sJeBrp/y+sdFE5R69ZuJX8dYMTlclRCDEvu+epHT
	I0pi/p+/A7161dgXVZSwjI8CZ3eqsyMuR/oND/8xwfIW1p24l4o+YBtiMyFIUVwHTfx5QaAOdYQ5Y
	teZIm+SouKANIJXC2sioFoPoTQvTaOLwzoKn5Gcq/BTM+jjn9ySYIlayWbFN329xyWihJJYcwbDsv
	KLIUnR9UTXK0MaDYpf53FCV4J0d3Ch3Yij7gFw0iSJbkFGRUrDcCiRHIVmr1U0aznaaZYniXAfV1F
	yMasTaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YNn-0000000FuMU-3uVz;
	Sun, 06 Apr 2025 22:22:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YGf-0000000Fsv8-125R;
	Sun, 06 Apr 2025 22:15:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so37474775e9.3;
        Sun, 06 Apr 2025 15:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743977703; x=1744582503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayn/+ArG131gi18wLCzFlJOt7i4mpT3rXpgfAV6sJtQ=;
        b=F2YMpcfpvww/9ICKMYexWe0TnbJ8Kbw0SRZSJpGAPxJvuEie7P6dUdz8Jk1DLOE2MB
         JVxhtDHQFrDrW3oanCgDiMrnEkUdgWh4//1ugt1PBtKRdPoYH6A5Xe4tX4zsxd9MFXUx
         3qvudQQN31Of69dStMchnxd1Mw+AIeU9VhZ30acAMHDex08XxpmeGjG/bN48JGu+q8iv
         k4RLNJ3UZJtOoOCCobOSrfKFT4Y7JreKmAtQxxW2WX+A87N058nmCbNTtBr2cqQiu7MR
         gHltFp0SZJ/vj/M7KbQemaO6/9OYfT7JqqqqpxFaT3Jaz4MEb4Kv056ZINSCvk0kR9gO
         yLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743977703; x=1744582503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayn/+ArG131gi18wLCzFlJOt7i4mpT3rXpgfAV6sJtQ=;
        b=Qwe4dmgZmrPDkdAc1KjfW93zhUQ2JDYrYgW+5Tcvv18S6gnBh6tXm/+f1m/TgeXxVg
         WSIvnjufE38nSGLsuo4vgy7fpCYZ/8tBNYaHmyW/agnqiq2NH9WE7VMX32C1WhnE6wjn
         bYVzaSHZx0cFJLQScEXkEHG7iwGCrnPXbuR6q6v3I5rgzQFq5IgfxoLvUalAkgusLHTf
         N9HTWeFfd+FT0UfVXaKv9kdzv8126h/FOQn2VGzAINUOaBm/9v2oiwBw4dNsUBy9Tly7
         wX4HPz57Vnifch3Wtja3rsOMGu0qRckpoyqJ/SRMps57YFWawhGJSMruwtV44UmU0Acu
         9yXA==
X-Forwarded-Encrypted: i=1; AJvYcCUrJoAJ13jQ7dMSi9qCCfWFVWK7UHzcnkNf8NH1PKKg7s05DI5R+8UPr3lo0mNVQwZ8D58TkjDGaTyUN7jcsLdT@lists.infradead.org, AJvYcCWApF+lLEKG3dziCE1mR2rZwdCBYwDnfXEnDbFSXOX3/yH2STzEWaVPEpXgwNAkCpKtmOI3hJoEnKWrOTzoi14=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaitglYUgI4X59O4ClzIYG/BMPq8uiJZ6K6mLfFRcFgpZ5cXZR
	Jr3cNUQqd6QjPaBCNIRlHsvHsCk+IDv0+BsMAiu7RRUUC/r9OpJv
X-Gm-Gg: ASbGnctFj18oLlyG4x3ELrN59hUVQEquSaTxrTRExsvE5r597sILB9/+2iN4dhTeyFo
	EeLho9vAXAaAOmOIKpcmUYE+OAOjwrNzWpDeB0qgp+rmD/qMm7VroVqLHAN1JAZTnuuMSteKaQx
	fo1fOTfopm3rg431nFnayqrk033MYJBFYTpoAII+T8h00J1D7ipGyEKIXFaI1/FheX0Y3Y2MVRA
	2DPMdf4FfM3mUsz0sjDYLN9fVI/XY3gyeh0RQpteCd3bX8FcemO12DbYTmMGjW4Ct+WDXMZ6fTy
	BKNn57M7TxuEHXBSJap/HUrVbUXSnCwCzs4PugXIAJbBfDAZvgLi+l75oM3+17vebmuxAgKI8VB
	TszxMczn67Aeldw==
X-Google-Smtp-Source: AGHT+IENfMJTLXOWwcQUAP+VYmlM77Qj1I7980ItCU7kcoUNHVy1gAOdc18HDYP2esin/LYBB6Ur7g==
X-Received: by 2002:a05:600c:1c07:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-43ecf84287dmr98127335e9.4.1743977703199;
        Sun, 06 Apr 2025 15:15:03 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm111517055e9.39.2025.04.06.15.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 15:15:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: [RFC PATCH net-next v2 03/11] net: phy: introduce phy_interface_copy helper
Date: Mon,  7 Apr 2025 00:13:56 +0200
Message-ID: <20250406221423.9723-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250406221423.9723-1-ansuelsmth@gmail.com>
References: <20250406221423.9723-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_151505_284758_98EF2B2B 
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

Introduce phy_interface_copy helper as a shorthand to copy the PHY
interface bitmap to a different location.

This is useful if a PHY interface bitmap needs to be stored in a
different variable and needs to be reset to an original value saved in a
different bitmap.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/linux/phy.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index a2bfae80c449..65c520e556aa 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -173,6 +173,11 @@ static inline void phy_interface_or(unsigned long *dst, const unsigned long *a,
 	bitmap_or(dst, a, b, PHY_INTERFACE_MODE_MAX);
 }
 
+static inline void phy_interface_copy(unsigned long *dst, const unsigned long *src)
+{
+	bitmap_copy(dst, src, PHY_INTERFACE_MODE_MAX);
+}
+
 static inline void phy_interface_set_rgmii(unsigned long *intf)
 {
 	__set_bit(PHY_INTERFACE_MODE_RGMII, intf);
-- 
2.48.1


