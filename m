Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09E1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3GO5be2u;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjnRb23U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0W+v9PJYl7SX+fCzm/LD8ucD6kmU8nLYTAcfnRV/Egk=; b=3GO5be2uq2HVdB
	sgNJg4YhtFrnGVDvs+ch27DNPKESqZ/Oyh2dTZGjpAaR9ofkQsUlCB+h7WxquNJGtUh26q3Dk8kSL
	iU3mwzFNDmWMIy+H/4lLEMihpoq0RPByOWfe/1yXkODU2+DqwqLMnB1eb36/ypqxGvxNxukE8GLdS
	lrde4PyBguJGPHQv+w7bheou1sd1jl49Uj2UnMVLC4IBoobcm6bQG5jM5Bq3qlNlNfxbrGlT1TQT3
	NFr6q6CQDXez0iBWzjsui9zMf+yj5u39HceyuPKfa4pthdC/lVjJ2vH/bjvFdbhx8wD7HKmOSmUmw
	YFd9ltbMzUKquG1y7YMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzXI-00000000TJN-3GZC;
	Mon, 02 Nov 2026 21:25:48 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzXE-00000000TGD-3Qi2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:25:45 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-33e48934fa8so1138816eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793654744; x=1794259544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W+v9PJYl7SX+fCzm/LD8ucD6kmU8nLYTAcfnRV/Egk=;
        b=EjnRb23UyzJ7EQgLlJ4DdsrqiDGZJv96o74vDSs4gxO4qmP/ZqZ3YI5n0svD2qje9l
         ahf2y/C24MoFoY2ld4KYrHB1fl9N66WjrxGuxyOhcLPsHSs8GlvwrMW519M1FcdQ4/+1
         dJ9kIIr1npJe3OmZxVQDaVvJWwtvnbxZ5OGGj0BEuhkb9fDqzd1COPTs/E4eZZNVfRtg
         XVIXOpgDtWIXWRdmszli4rduJMWWKHsBtaeAL/0qdwigVmyjmoUoGMobFGJbAgdETTUM
         WqOnfckSgKRwTtUkbV8JxKM46ZezL2nlEoPa3CIDxy6bKL/m+2xnkEdOHUiXBWbwj3M8
         XqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654744; x=1794259544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0W+v9PJYl7SX+fCzm/LD8ucD6kmU8nLYTAcfnRV/Egk=;
        b=2kfQ149X5Hidxi2xTMCnj0Ywsf8MYsXb9Wr3xn1H8bsDxUDfo5t7CWNEVvmTdXh9pI
         h/hIti9j3twK074VC+twiQFerWMxOMha3CDmczhFBhTpnuMPlG0PZGHGJFYttOuLrTzf
         TfB6x5B0UB19SrsWsm3mxp8xSuwDeJXpx3tBlyrkNW1OIcQDdjqDcBbjvYA8pH0jDWhf
         TOrs10Rssk/mOPcRf06M8y40YKnFQuM5o98U6E4ErXnc+eFYHXHA0tzWWUbhJXeDgiku
         f1Il1HGK2kywSgcWCZWtU2AB9cbvmBR9KjxnWtx4ERbVzhEVgytj0qqtT1XfR++3Bu9E
         tqNg==
X-Forwarded-Encrypted: i=1; AKwUvBy6Nc7sjDuxS44Jwug8rM+h1mgX+bT/WEMHgrwROa4n6hdZZgvibDhkHoyXsEzBHzYzHUX5CC97BEp+a0IP3OTC@lists.infradead.org
X-Gm-Message-State: APuU4Z9Si+uHzlx41SGjTht8aB90jn69oZenpTlm1rR1w3/3dj51uaj6
	icvTcpIfdq1QgNcmf4JRf/a+BhTnMZozz2O7HtiLvh30jSL2fiTkVFqH
X-Gm-Gg: AYBFou02pQPtn8gXnC+r3dn+7HJiKR6rrWwsIB6yiuqTTPdyBwa9uFx9/0e1fryR1d2
	eV6G7DsrgG0//n6reXWimnbsMWUqx5WiTNjCAKEXTb2zH72/h+SBbjGXjjKwhJBtuMuOwh73qCp
	EStLbaacZ89jrVeLKYd5z32mzVrUdoZP0D6mxgA8N0YbMs2+/OuOUe8hd8CNhcQgakpIgxLu/Od
	LBrk59jJbINbDD02YD02N5gEB5bqOGXWs1ekR+XUvzEWf+1DaugEnqjD//B8Xp63UDSsFFxFsSa
	OKQ+YBQG3WUGRDR7vcrwbikdL4a0eD9RHcD9+/hjpSPcVpVumbdbBhQHGd9KSTw8ZJZpT3kmwC4
	WFIQTLxSNJ33m9x9w+xVd9LibZhbEY4yyQEGEweOiXhRDzniRRXp8aBA+LswAY6zs4dmWAUAbZw
	V4JXKERaaOXt6pJwdUXoHotGUx1gUPRfqzpRZD7m0Mq92ao8rN1iOjcjcHgAZpbtW2c4Nwo+5rk
	X3B0+Ce9M8ExY75zQpDWyL76tvElUm81elDEndmfSrFOCNkLOSpeRHgmcVVTu01m2gdlQnZOUhP
	FHP8VvJnPGI86lnLHx/lO9uz0b0=
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr17269236eec.23.1793654743982;
        Mon, 02 Nov 2026 13:25:43 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm37195851eec.12.2026.11.02.13.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:25:43 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net v3 2/2] net: pcs: xpcs: make supported_interfaces authoritative
Date: Tue,  3 Nov 2026 05:25:07 +0800
Message-ID: <20261102212506.3348537-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102212506.3348537-1-coiaprant@gmail.com>
References: <20261102212506.3348537-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_132544_860805_B3449B39 
X-CRM114-Status: GOOD (  20.04  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pcs.supported_interfaces is the mask of interfaces a given xpcs
instance actually supports. The compat table describes what the
Synopsys IP can do in general, but a specific integration may support
a different subset: the RK3568 XPCS supports 1000BASE-X, SGMII and
QSGMII in hardware, but does not implement the C73, 10GBASE-R or 2500BASE-X
modes that the Synopsys compat table advertises.

However, xpcs_find_compat() only walks desc->compat[] and does not look
at pcs.supported_interfaces. If a caller ever passes an interface
outside the mask, the core would still find and configure a compat
entry for it, contradicting the mask the glue already set. This was a
known gap: the mask was written but never consulted by the core.

Fix both sides:

- In xpcs_find_compat(), return NULL when the interface is not in
  pcs.supported_interfaces, so the mask is authoritative for what the
  core will configure.
- In the Rockchip glue, build a platform mask with the three modes
  supported by RK3568 (1000BASE-X, SGMII, QSGMII) and intersect it
  with the core's supported_interfaces using phy_interface_and().
  This narrows the mask inherited from the generic compat table so it
  reflects the actual SoC capabilities.

This is a logical inconsistency rather than a user-visible bug in a
released kernel: the affected Rockchip platform is not present in any
released version, and the MAC side forces the phy mode, so phylink does
not normally pass an interface outside the mask. The patch makes the
mask the single source of truth for both the core and the glue.

Fixes: b9e7cb89aac8 ("net: pcs: xpcs: add Rockchip RK3568 platform glue driver")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-rk.c | 10 ++++++++++
 drivers/net/pcs/pcs-xpcs.c    |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index 6f0a110e32d2..25fdc9c6b72c 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -483,6 +483,7 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 	struct platform_device *pdev;
 	struct dw_xpcs_rk *pxpcs;
 	struct dw_xpcs *xpcs;
+	DECLARE_PHY_INTERFACE_MASK_ZERO(supported_interfaces);
 
 	if (!of_device_is_available(pcs))
 		return ERR_PTR(-ENODEV);
@@ -536,6 +537,15 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 		return xpcs;
 	}
 
+	/*
+	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
+	 */
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_QSGMII, supported_interfaces);
+	phy_interface_and(xpcs->pcs.supported_interfaces, xpcs->pcs.supported_interfaces,
+			  supported_interfaces);
+
 	xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
 	put_device(&pdev->dev);
 	return xpcs;
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6466e0ff2a98..46878a66064e 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -169,6 +169,9 @@ xpcs_find_compat(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct dw_xpcs_compat *compat;
 
+	if (!test_bit(interface, xpcs->pcs.supported_interfaces))
+		return NULL;
+
 	for (compat = xpcs->desc->compat; compat->supported; compat++)
 		if (compat->interface == interface)
 			return compat;
-- 
2.47.3


