Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1478C624D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bFwMN34t/laBcuJvUM/XSHQIvcTBfIZ9zeEVi8dxW8=; b=IIDZ8PPPtU1hQCzBJXABk9bjiI
	VFQeelUQnotj3lvXFZG6aU8Vc6sMAFBC7J3pOPeqBnbrqfAJ7yLu6zQBE/vPIB9yW5NQWP4AAXQlI
	SO4th2SvjQuhBu0kquxtQAAYo9vYlZ1dziKwc0beY6qPzhEfugRUyB6SrxSfX1t7uE1XLaDz4Dzo1
	478+MpCnL8jKhjWjZY5bfgFCyJxReQSaH7EgjJh6zC6An7Pk+H50uJCvPS78+YR45TN1u2LcCkAxY
	zLxk9MhED0a0ilmBakddwxDIWjsHS2FxW5NMSbEDF96t15CGOwUiPZOrATGa+WKSsqQcXEAceAlrs
	xaRn+NPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JtC-0000000BH3S-3jNT;
	Tue, 01 Sep 2026 08:30:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jt8-0000000BGtr-3Ryo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:30:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so6663135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251437; x=1788856237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1bFwMN34t/laBcuJvUM/XSHQIvcTBfIZ9zeEVi8dxW8=;
        b=VKnd0wxlvuMV8K9aEJ6hoyGBnl7ddtp5a2JZdq8mTSSJ6uF6lzOuefcWiofkw8czVy
         H/bQ7UumCtslfHkWbX27POShiJPZghIA+e9Yc0bcvH0vNuzBA51xVvB4xNLlHiRWGSQi
         m0DUD+FqP2jOIXS/TJHpPdZf9VKEeVr8cb5k3O+u13h+IDmtxGuJDL9n1ARyBgp0yUr3
         m/dCxIpwhzV1OFozmwv6VWHbEu5oR7Q8B+O7pv9Dujm4bJYyZHDerm17zk02XAviofPA
         /TGgk7KbgSIJXG3sMqFfYnA6qUFV85SM9cG5uDm4KYzwSE0yh2EfMs+kNjcU/wipZ9id
         /Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251437; x=1788856237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1bFwMN34t/laBcuJvUM/XSHQIvcTBfIZ9zeEVi8dxW8=;
        b=Qihx9JWS4sq8eXsk595IlI0GrH0ITPK7s3vMBcfX3yDSYWxUZsjwYFOtXdc7aUYk9Y
         1Z3yNn+gLjYY9TLT3X6hu7dGFWg4vkUDyf1BoeEplZkuOJo+HtZyhX+ZGj31L9svejdT
         FCW1dfhj8DVlkUU0a3TtQjs1QUgvI0ur8LIW5xKKdKBnJ66SgTuwX0d8doPulwJy4b12
         fWyGK25rQBK67BYsH+HV1VQcrViC2sDLoREppY7+wqK5vCw8a6LL7iWRE2wmNMhoITkQ
         /L7B6hp174sjxlIc7TqhFNQIMzSPT7xaOQKeypWjYz5RezqxCGJWu3v38DMXaVDVVIpD
         pUyg==
X-Forwarded-Encrypted: i=1; AHgh+RrtVDEP7TUerN5324lbLZz61oWjEinOVlzIyRrSMrypwGg7/gDaAvAtJncrMGgc6MLPT9ljO3HiflTaVfwEBoF9@lists.infradead.org
X-Gm-Message-State: AFuF++mTTAnzl2smTUgQQijLI2+0w+4AHVWcO6e6/yn93m0z1MKUQvDh
	2G7npYWEZCXA2JJg1kmWHKroEI1Hm0hy3p4VTYuGgytiTUiVwiy8fsvO
X-Gm-Gg: AR+sD11eoTwaB4KDDzYtuh+sNEUKyAH62fOYs+ZlO291P8pCGe133Bc56PUK34U8Rq8
	A0q2U1QVgEu1MNM6bibLrHbVk7Zjet50f9UcJbBUykUwFI0eYx+IwPb0IQpwELc3QN1AWwNe80L
	IFfomPn64T17AgPw9+co8/d8t0V3PxoR/FG8+MthX0guvMchUcxgPmP34GJPqoDmk0k1dU/dEt8
	OUxg5+mkaXFPUl6Vdp6VakcemJRjmO/azGkPs++khsc3hGGHnJcPC/j/a6udEhK65zb0IesNpwx
	qR7oJdhgeT6fiK3KmT8ykIbghlQGRNTxZP+gGPmHeWuEJCimh6+XV+Gw2waKBpWwZOBrp/p1049
	PbaOroRVt1E5Tp7oWnXpqb1yjHt9+NGFKWT7BBcEebfL8L2flVMGRjR6VjkUdhqwsaxqUD3vRzW
	CXeYvsUhzf5QhtMuaQeYncGiB4vjwrd4uP4W2Bh93ltQHMD2rCCrSiYxz9m/qh4bEXc29MTNkY8
	zCR/3ZMHfGDfOY0wzzm/6Rr3PxjdvnEfXX9i9poH/AkHKVOxynN
X-Received: by 2002:a05:600c:529a:b0:49c:cedc:3c36 with SMTP id 5b1f17b1804b1-49ccedc3cafmr333314475e9.16.1788251437016;
        Tue, 01 Sep 2026 01:30:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v15 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Tue,  1 Sep 2026 10:29:24 +0200
Message-ID: <20260901083001.8044-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013038_923410_65CD32F2 
X-CRM114-Status: GOOD (  16.57  )
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a68d77ba5728..e5706b008b39 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -989,6 +989,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1701,6 +1707,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 2c647238c7ce..87dc0f27dfc0 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.53.0


