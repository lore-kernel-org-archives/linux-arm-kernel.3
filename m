Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z+/y7mCG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M3DbJ9pr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=V/foU+cSI6OMyqIz8ju5t4yslf2nKCeuPGIY1Tz0xSI=; b=z+/y7mCG/L8aOWnB6TjYhgqPSM
	eNBhAqsSv4dfQiyDMTsEvqokcw9Njo5EFvhdqmXtTR+keYNULTswnQ17Cd6pkns6EZTaRLB0Nxz3Q
	VtygZhHIKM+X76dXoyTXs52at6VdOmhXFJ08WaKu4+JAZ8HfphrpjzP+h3t06XLTnHipO6hgPudDf
	ZfaaW4BelBrP7bF0rGCgrWVOJzedHLgFRaB6rJV4s4J7PWO64xvMcz2ykRrR0idvt4WvtPVZr8eSP
	vsBPgLC1OAd0MmhOu9H8xjPlI5ED3/fEZZ7yNMSNEo/E2H31VHTV5bVSNYL9H/Efi6fl1red2g6rE
	BezWZALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4sw-00000001QCJ-2Qg5;
	Sun, 25 Oct 2026 20:32:06 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4sv-00000001QBt-0TpV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 20:32:06 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c4395d31228so352516566b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 13:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960322; x=1793565122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/foU+cSI6OMyqIz8ju5t4yslf2nKCeuPGIY1Tz0xSI=;
        b=M3DbJ9prJeFPpDCE8Q68sxKWuaujck6lxLN+hlqevBXi2IFo/ZGUmusuI2LmfKoJwg
         Ta4y8sMQOoYIhvNwecINM3G9ryCPpDu0pHypp/EBo+fZVuz21kpVwBgYGG6qYbCXNnkt
         Jt2oGLOpWtT8+zrU3KNq3yLduHQx4wdHuLSYmHvmwLO8rGgfVovoPpk+J5dykQ4OGLMp
         297MYKENd3KDh2Pen5r3PvhUz8ua1nXp/syW02AEhCdNmwpsXqq4gQ4GR9NDDu4l/Lq8
         zVGKT6zWNnXh7jjY8697tsl9Bb+70i1skeSyrjawqYzEIOsbVVSr2fnjDFOloIkDN8Bi
         xnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960322; x=1793565122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/foU+cSI6OMyqIz8ju5t4yslf2nKCeuPGIY1Tz0xSI=;
        b=ABYKDD9zgjn5/uVxIqJxdZfJJqNEuvwBhl764KNAEQWsF89vaApNhYxDCSbiPe+hwH
         j+mNY8gU7qXtuJnRiAB1B6n4eM7Chtm/gemvrAzl2cZUdgJMFhfAjPFggIacX9RdKqEX
         xbF94abrCc7cfrWGZy4wbmgQvpfJtSldfdAb/1O78jw4iAmjMwToeFVaCk7uvb0SgU5V
         fCL1KE7UD6B8AaS+nIbq+R0OVAeQbcjL4A2Ff12/mBUAX02s6s1zITX9pUO5q+jDG04M
         u6ORXSAwoWZtwR0q+7dWVeXtNQUUw0ryG0vDAiGSSSU+N3XrD/9p6s7Gh2MYxOG+QRE+
         Hcqg==
X-Gm-Message-State: AFq9FYJVI48uBcMeYniosV/u43gjEJPQK7U6Cwv0L6sLisLzuis7U3wx
	VbaZvD0vEjh+NTPMEWgsZ73a9sixwG6s0+KvCoAyQDdKUjrOJIrZj/gX
X-Gm-Gg: AYBFou0S5O84faXEJjjSsROn5v7zvgDtMPZAaP3093dgzHOiy7wR5223CpNWws5mLBx
	qgNWo8KGKOrf3GcGQcDMx+Uult1Ma4rDyt0CMOtbDewH5vX+8LzUGTy9lzztULFdcKWP/Nl3TIU
	u/FxlOXpmn2ug/eVZ/B5ipsN//hQOj1ekEUvfyO8Gr3sEY9Fc5XiVtnjxFUCi+WFyd0jrL5EH33
	Lu98FYjt3AtnfDPKLT70Xc3gdkCK/LMlalOa5oAy11/mVOWEvB84rUz5yYJgz0wN1sW/3Q53z39
	HXrZB2iPOHjYgznqUl69qPek6II67BA612edvOShuUMjaKVHQ+CAAUNMN3iav9IRJATM2sSm9j3
	vkXYYC38YzbslycjoakQTFmbTEm2TYUsukmWgmmwcBQtJXoi6ftcGsEvGJV/reUg9ygT1qHQ2w3
	h5A48X7rMBlEtM4BqoHvCLZvq+XaOzMQV7U17UMPjyDS7138iX2C97Kkix5QVQByvvn12HQQwxp
	p9e0eRTBLCmY5ize+0f/rdHobT3IjqR0xNeVqhtp+sTy/liDQzMT8XeRxt+zmQqhGfb48KumieC
	DB5fCn26uYhTjR7o9K30thzMazRlwwzlMa3KGg5lqtlxYivechL3CeM3h7ncBzcun1Q4z4ccrC/
	9FCT9/xS1qOLgkdCyztiYnAieKXXqxDXNZN9j3VmjnbSj
X-Received: by 2002:a17:907:968e:b0:c32:110d:682f with SMTP id a640c23a62f3a-c46bddf7a75mr615460166b.18.1792960322486;
        Sun, 25 Oct 2026 13:32:02 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79b884sm240272566b.75.2026.10.25.13.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:32:02 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] net: thunderx: fix fwnode_handle leak in bgx_init_of_phy()
Date: Sun, 25 Oct 2026 22:31:59 +0200
Message-ID: <20261025203159.455100-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_133205_172706_C15B4026 
X-CRM114-Status: GOOD (  12.11  )
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

In bgx_init_of_phy(), device_for_each_child_node(&bgx->pdev->dev, fwn)
breaks out of the loop without calling fwnode_handle_put(fwn) if
to_of_node(fwn) returns NULL.

Switch the loop to device_for_each_child_node_scoped() and remove the
manual of_node_put(node) calls so the child fwnode_handle reference is
automatically released on all loop exit paths.

Fixes: 9d28f9491258 ("net: thunder_bgx: add a missing of_node_put")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index b63039999..3fe3f80db 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1467,11 +1467,10 @@ static int bgx_init_acpi_phy(struct bgx *bgx)
 
 static int bgx_init_of_phy(struct bgx *bgx)
 {
-	struct fwnode_handle *fwn;
 	struct device_node *node = NULL;
 	u8 lmac = 0;
 
-	device_for_each_child_node(&bgx->pdev->dev, fwn) {
+	device_for_each_child_node_scoped(&bgx->pdev->dev, fwn) {
 		struct phy_device *pd;
 		struct device_node *phy_np;
 
@@ -1506,10 +1505,8 @@ static int bgx_init_of_phy(struct bgx *bgx)
 		}
 
 		lmac++;
-		if (lmac == bgx->max_lmac) {
-			of_node_put(node);
+		if (lmac == bgx->max_lmac)
 			break;
-		}
 	}
 	return 0;
 
@@ -1524,7 +1521,6 @@ static int bgx_init_of_phy(struct bgx *bgx)
 			bgx->lmac[lmac].phydev = NULL;
 		}
 	}
-	of_node_put(node);
 	return -EPROBE_DEFER;
 }
 
-- 
2.56.0

