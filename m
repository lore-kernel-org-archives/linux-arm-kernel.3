Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7009C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 01:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P8RslJAAyqdhFQpyr/sYYgRXhKwruiBZvG6osvNqKxk=; b=FxgFh1eGtO8zjuQFQ1DvjmY7bO
	t83EP38OpUYdP7CBdKE21V8Gb9lVFkYU/8fTdyzBVhxKdsQyoHd43YzcR+XybDkFMYXLObng2mv60
	HkgMonbMx/AzLTt7ur7DN28Q/Bp8pajHND9aPJqrJkjTt3uNG9KBfwVS7kmX01sF4wGjnjnUZeK0g
	wZCVeTwkOU+x68cnt76TmZSVl8FQ4+A11tIx7YP/0Tgx+zveAw6gywzFGhOdEfsTD1mgYS7wunH61
	zOielTnZSqGsNshTseigqxMvrdNoM8TkDiMbktUz6IXUgq9h+2LI0Mc8/eR4i33X9JohknUaa9IoD
	gMJeFGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzP2m-00000003H8o-1FiQ;
	Thu, 27 Aug 2026 01:36:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzP2j-00000003H8T-38Er
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 01:36:38 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1258467a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 18:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787794596; x=1788399396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8RslJAAyqdhFQpyr/sYYgRXhKwruiBZvG6osvNqKxk=;
        b=JLjEV7f91cAYx3l3mGJTV/KntUG+R9pookGpeJorWM0+BGUG/uRGRD+4PIClGkKjp6
         FzfSBdnwX3/ozBXb9Ou+wWgq2H0FU5hrpnOEXO7vx9XMBOoQHxhzVnydVRVA71FBrFUR
         eMhArUEmyZgPjz39g3+Lg/jDZtmmNVHZ3b0GJo4207o8iZfdY9EDyvj86SnjCgMHdhQh
         fjo0SPZboZm3BdttElNVDe4OyuFAYM3iv3Z96Go6ytFULpkX6VBOwO2Er3K4SF37tJjO
         EDJTe7LiB87el8IZoXRV3IB6/OTfps+DIksLD2OvoWQCOvpy08RnWka9VRMnFwxsG14i
         XiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787794596; x=1788399396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8RslJAAyqdhFQpyr/sYYgRXhKwruiBZvG6osvNqKxk=;
        b=sjak4crRZhIkDkeNDvQMKbP8yKGWcD7l8mHU4zwvTscO8baiLiExhmQ2OnRVucBibX
         iNWkwfQvtMyjkFcsJ4YXAm3/hIP1CAFGwxtddPabb76yaymFCmKNpRR38qanJR/3DnCU
         08ABAmD+qYmnVo2P5OXqAzsIkhT1mW2E18afwZ4TjyIc4DTDEQjUrFEZs6hQu25e0LdN
         HzCrUzdRHS52I41JiCP9JikS0DKx6p+l3suSO/8dB8Bqdf+Dl6KUOtLIXlDqfaaVLkEd
         nNHL9BEnY1dbjrxLc0frz62IzPMBPwAGvzbwKPtxGKW1T+ZaIXLc3q2Y/9QsRnNX7Eyt
         va9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpFRy685aZzZeyRJ9VZ5ApJ8/uBLgYOY5vu7bGS0NeU4PvXHXZm8sZLHFsS0HZ1yf8Xm4P6i4PDZoc+PXyQvb1G@lists.infradead.org
X-Gm-Message-State: AFuF++nJd2n+ZYeul49Kjm03MZtk9Az7RD5Ty6dX35Z70Tf9KCx3Zeps
	o7XgLOfS7oPgWeSpaP59oODGh3yWsPjKGSNK325TNkFluTshSHCjBmLh
X-Gm-Gg: AR+sD109DAmtrm1RQxgK1Zk5Va0euS2sVplnDJ3FWNWGgnlE985nILxehdN7jfKIrhN
	sN/9pU/ZXtxKzQfQfMAOz89tC2U4vYriBC9tsigR2QfYidsW3NGUmlfd4tJLP9pqii+nHXwnnHD
	oQRV9Gg6kGcCfmWknWgyUOPPjfWlq0iP4RPmx3qkUYcYEueHAlvsQyIzbsEYK8Bk9bfYgzSBWKK
	dCMpBZvjP0+pAnvE6PRgqwovsaU5pqOq8gqh3l+SAjUh6/DqbbAArFqQ5Nv9zH8lcGlwKAyZooc
	PWSEYv8tWHB2KJNkJI4J2sGlwyc6WEbhuvNxVjC+piqW7naxa0fpDROe3ks3a8Jaq+Iee7jhur0
	bUzFl/OuCnKJhObHYe3EfkqNI+6tiEYukceBkvoR4JnsmGpUJFgEWtmxjOsMAWuBy3EFfGjLlMe
	KfuN3CC3BGXZgWDNEybcrCXjQxlCj0RewDjDS7Aw3z3FPtHCmQOvkI+BNemH2xI7B2jMvv4CV8S
	6VP+Jo6AfRe5sMyWveJJkgO2LKYi6IcPcHPcqI9mPZuzH6bbS10kzF9OdT2rOKbBXvarL3tdDNh
	3xYkplsj1HX94M1r8jOHJeNK35Qv/qFbDH9SDRpi4AzrtOV0
X-Received: by 2002:a17:90b:390a:b0:396:5785:843 with SMTP id 98e67ed59e1d1-3966d203a94mr20643518a91.8.1787794596431;
        Wed, 26 Aug 2026 18:36:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea7fa9sm551887a91.4.2026.08.26.18.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 18:36:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: ixp4xx_eth: handle probe deferral from of_get_mac_address()
Date: Wed, 26 Aug 2026 18:36:34 -0700
Message-ID: <20260827013634.167932-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_183637_800341_A8893724 
X-CRM114-Status: GOOD (  13.05  )
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

ixp4xx_of_get_platdata() returns NULL on failure, which the probe converts
to -ENODEV, discarding the real cause of the failure. Return ERR_PTR()
with the appropriate error so callers can distinguish cases such as
missing DT properties (-EINVAL) and, importantly, handle -EPROBE_DEFER
from of_get_mac_address().

Fixes: 95aafe911db6 ("net: ethernet: ixp4xx: Support device tree probing")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/xscale/ixp4xx_eth.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/xscale/ixp4xx_eth.c b/drivers/net/ethernet/xscale/ixp4xx_eth.c
index b0faa0f1780d..b8889f87ca03 100644
--- a/drivers/net/ethernet/xscale/ixp4xx_eth.c
+++ b/drivers/net/ethernet/xscale/ixp4xx_eth.c
@@ -1444,13 +1444,13 @@ static struct eth_plat_info *ixp4xx_of_get_platdata(struct device *dev)
 
 	plat = devm_kzalloc(dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ret = of_parse_phandle_with_fixed_args(np, "intel,npe-handle", 1, 0,
 					       &npe_spec);
 	if (ret) {
 		dev_err(dev, "no NPE engine specified\n");
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	}
 	/* NPE ID 0x00, 0x10, 0x20... */
 	plat->npe = (npe_spec.args[0] << 4);
@@ -1468,7 +1468,7 @@ static struct eth_plat_info *ixp4xx_of_get_platdata(struct device *dev)
 					       &queue_spec);
 	if (ret) {
 		dev_err(dev, "no rx queue phandle\n");
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	}
 	plat->rxq = queue_spec.args[0];
 
@@ -1477,11 +1477,13 @@ static struct eth_plat_info *ixp4xx_of_get_platdata(struct device *dev)
 					       &queue_spec);
 	if (ret) {
 		dev_err(dev, "no txready queue phandle\n");
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	}
 	plat->txreadyq = queue_spec.args[0];
 
 	ret = of_get_mac_address(np, mac);
+	if (ret == -EPROBE_DEFER)
+		return ERR_PTR(ret);
 	if (!ret) {
 		dev_info(dev, "Setting macaddr from DT %pM\n", mac);
 		memcpy(plat->hwaddr, mac, ETH_ALEN);
@@ -1501,8 +1503,8 @@ static int ixp4xx_eth_probe(struct platform_device *pdev)
 	int err;
 
 	plat = ixp4xx_of_get_platdata(dev);
-	if (!plat)
-		return -ENODEV;
+	if (IS_ERR(plat))
+		return PTR_ERR(plat);
 
 	if (!(ndev = devm_alloc_etherdev(dev, sizeof(struct port))))
 		return -ENOMEM;
-- 
2.55.0


