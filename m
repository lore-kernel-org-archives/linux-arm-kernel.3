Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8D0C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 10:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mejOF2mYhTEXxWVOimbjN00Vr4yLk+E8aCpQ2xV2aM=; b=wh5szLKPCS4WzALWvtnrvaQLan
	gDgyvo/2PFId1vuCslrB3XYdo0mHf8gi/BWGEM+6wK8F2miHwhDzG0cTEHbOmt0VyTt4n4YY1Clde
	G9mee4C06oTTwbyMvVj22yIcXw/dAL2BFJNaWDMIQlTlu3w9sTq2TgzFZ+7VGwa4kx30PczD+nmL+
	+PbP5M4FSk0QaqSK5i8+CLtMwly4Upo5qcF8Bow874g7RY/GVveCHhURFkWlYXhPACbc405YZgeDv
	dYlkJXcAihSpItPvvtV0M6sK6nGdJWi807sQGhfFt7FWUrupxD/cflSXi5FyWAYgsgq8hhrsWingS
	ZJHsD5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhXr-00000005owY-3feH;
	Sat, 10 May 2025 10:35:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhNg-00000005ngU-0Dl6;
	Sat, 10 May 2025 10:24:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so21058765e9.0;
        Sat, 10 May 2025 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872671; x=1747477471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mejOF2mYhTEXxWVOimbjN00Vr4yLk+E8aCpQ2xV2aM=;
        b=R955htbVmyV8hTwPolIcTow7XbkYMe3UZBspxh9CWMS7TeUHrqyz/bZJ41MavN1pXV
         KJGiFgxEZecUlyBjPqFecH3aT+54CYe0FQQgR9BSAEKM/+UnFfvlvP9HZXA5K4Z4fXlb
         K63yAIQNjFJTX6i7T0GAidpR+KEuVjyWs+CQmYYZOvP45kvzRjmG6IYxtzYShUxf6MC4
         GFDAzWdM4hyA5bO6LxcF4xykfY/EGmivH0vDjXsUS4PpKoZUF+rB9iIfAmOHDlfb8Afo
         TXJc1WrFyTLa2hLWAT+BeUIqyBOvdZqd2ehOQXWFrC9c84h/7q7VVq6P/f7HBZoNrmEe
         2DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872671; x=1747477471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mejOF2mYhTEXxWVOimbjN00Vr4yLk+E8aCpQ2xV2aM=;
        b=RLE8ErUtgG9WYz/ZYt1lDdH7ecXLesaybTMCfSBlQoFgLCREkFUTOmzdpOFfoFJza1
         Ls7P9gRVYiIJAwnr/792j4PaQ64F4eTm0QUqsHU2OZvxgzNQNQCAzCSKO6eeaecAocw3
         kyibe6+fzeHKXq2FsIwroSckh/lnm3H89ERC5naTvYeKuJUA4yaAl4XdTyLwSqjNRxSn
         kbz+jGg8XVbDKiFCZg2oFJcXZYRalNgEZrcbxgrSfV5FDwkF6nTGekG+MGubbKtFsc8O
         uXVUAsiyycfpWY/NZ906ceq8ryjW3kpmJbGpdhUdDmuCmZ6SmBykqdw+OqDOuUHiBEyZ
         jtRA==
X-Forwarded-Encrypted: i=1; AJvYcCUcJm5AeSmLv5WySehBUA/f51VSqRp3sK6739co2fsq17tM7iQJy+4+CPAB0n2zWli+H1wNS3ooLhfGcvtdc+wX@lists.infradead.org, AJvYcCWxnqowSXnoj2JsMxsC/hWU8CjuZCgY06xKr0Wo1CYzttD1YMN4dEWf2lm2ME+Etpn4H6IOSaR9k/MdUUAnKTI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4OESeljE5U95gRKE92T+AsmF2anftAfe+IOgVjJ5ZdP8Iw5gE
	rPPNRxEDIlIlFnY4nbPOjNKwwjR5Qjeb2tsFI65uLGAcoABY4YHy
X-Gm-Gg: ASbGncuF8OGHMP9epcW/g2Q+JRASl5vbceeYdAtDCdEalw6557tYvl/gdZTX1b0YUxi
	XKLq/QRb1C5qnyHArvP4AYkSKdt6N7TYvoeikxclq2fZfOYyH2gogEoZiYZaOks1QF/DirfvPQ9
	Bi/GW4/sCSRkDsMNSbmdyEKGPw0DXslsAql5r0uiPoEH6aCHYUZc/8kcDsxBgwSqSA10hK6Nk8e
	XrzF8ulzJAvbXM6A8hFn4nANrcUfEA0x2MUkTW3YgcTBLgWtTAFjnAPkVxQgE4CrkA1cJAfmk9b
	IpAe081JdM1nhVRQlnXZB04Q3EavtJA1On+LAZgV4gJ4JxezroRY4RETbQpyJEozBd3Ttkj5QuQ
	9t1U8znY4QwTTCSwvQ+Rz
X-Google-Smtp-Source: AGHT+IG1BA/TZdRhN9QniKUILc+FgTk1SRS0JYI4MxMh4fAfMKw4nxkmSrVAGEo5cnG6bVfg+l5B7w==
X-Received: by 2002:a05:600c:1f16:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-442d6ddef8cmr54327525e9.30.1746872670562;
        Sat, 10 May 2025 03:24:30 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm57981265e9.13.2025.05.10.03.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:24:30 -0700 (PDT)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v3 04/11] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Sat, 10 May 2025 12:23:24 +0200
Message-ID: <20250510102348.14134-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250510102348.14134-1-ansuelsmth@gmail.com>
References: <20250510102348.14134-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_032432_099028_F789E812 
X-CRM114-Status: GOOD (  25.92  )
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

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

A flag to make phylink resolve reconfigure the interface (even if it
didn't change) is also added. This is needed to handle the special
case when the current PCS used by phylink is removed and a major_config
is needed to propagae the configuration change. With this option
enabled we also force mac_config even if the PHY link is not up for
the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 58 ++++++++++++++++++++++++++++++++++++++-
 include/linux/phylink.h   |  2 ++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 95d7e06dee56..2f28c4c83062 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -84,6 +84,7 @@ struct phylink {
 	bool link_failed;
 	bool suspend_link_up;
 	bool major_config_failed;
+	bool reconfig_interface;
 	bool mac_supports_eee_ops;
 	bool mac_supports_eee;
 	bool phy_enable_tx_lpi;
@@ -895,6 +896,55 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
 	}
 }
 
+/**
+ * phylink_release_pcs - Removes a PCS from the phylink PCS available list
+ * @pcs: a pointer to the phylink_pcs struct to be released
+ *
+ * This function release a PCS from the phylink PCS available list if
+ * actually in use. It also refreshes the supported interfaces of the
+ * phylink instance by copying the supported interfaces from the phylink
+ * conf and merging the supported interfaces of the remaining available PCS
+ * in the list and trigger a resolve.
+ */
+void phylink_release_pcs(struct phylink_pcs *pcs)
+{
+	struct phylink *pl;
+
+	ASSERT_RTNL();
+
+	pl = pcs->phylink;
+	if (!pl)
+		return;
+
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/* Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case,
+	 * force phylink resolve to reconfigure the interface
+	 * mode and set the phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		mutex_lock(&pl->state_mutex);
+
+		pl->reconfig_interface = true;
+		pl->pcs = NULL;
+
+		mutex_unlock(&pl->state_mutex);
+	}
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	phylink_run_resolve(pl);
+}
+EXPORT_SYMBOL_GPL(phylink_release_pcs);
+
 static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
 				    phy_interface_t interface)
 {
@@ -1688,6 +1738,10 @@ static void phylink_resolve(struct work_struct *w)
 		if (pl->phydev)
 			link_state.link &= pl->phy_state.link;
 
+		/* Force mac_config if we need to reconfig the interface */
+		if (pl->reconfig_interface)
+			mac_config = true;
+
 		/* Only update if the PHY link is up */
 		if (pl->phydev && pl->phy_state.link) {
 			/* If the interface has changed, force a link down
@@ -1722,7 +1776,8 @@ static void phylink_resolve(struct work_struct *w)
 		phylink_apply_manual_flow(pl, &link_state);
 
 	if (mac_config) {
-		if (link_state.interface != pl->link_config.interface) {
+		if (link_state.interface != pl->link_config.interface ||
+		    pl->reconfig_interface) {
 			/* The interface has changed, force the link down and
 			 * then reconfigure.
 			 */
@@ -1732,6 +1787,7 @@ static void phylink_resolve(struct work_struct *w)
 			}
 			phylink_major_config(pl, false, &link_state);
 			pl->link_config.interface = link_state.interface;
+			pl->reconfig_interface = false;
 		}
 	}
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ef0b5a0729c8..c5496c063b6a 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -717,6 +717,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.48.1


