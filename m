Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0242E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 00:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L2KHCQFf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=HdAPSFov
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fAbg06ow8H9QMQrvOxRXn8nTU+O0wuTG8Qx02cu++Jk=; b=L2KHCQFfrAwSH0
	cnqWMabR3C3anfDgEuridU0ctYUQnh97P946rXFyi1aIDZ6+i57SWlkf47HkpheYVlzhUaUHlBqhF
	zjT5DPR/2PI4b/eH10wDpHLDekaYZQl3NZj9/3JyDTXAIdiv8ByX+hvzwN5NUcjDLqMTop7Slutit
	ovaZzZF4igTko/0MKe1vwkxLfvZRr7sG+s8DZBysqJBXpX1/fKBUTvLhUaD+N2Y3x66oXvLrDR2UK
	CDPCPj+q6KRDzc0AVEWUnmz4lDFXuHHeaRoWIWpQ6SwlYjio8e0AHYyOzDf58exSCzcR3Mxz0QoW5
	k9EkqC1aVDp4jQv2dcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOl6d-00000007KZ3-28g5;
	Thu, 05 Nov 2026 00:13:27 +0000
Received: from sender5-pp-e107.zoho.com ([165.173.182.107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOl6a-00000007KXz-3s1e;
	Thu, 05 Nov 2026 00:13:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793837597; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DQ622xsHScW3Ad6bz6fv1d2xPqZQGJ/Dhm/Jc/AFkapPbUBCXsgj/iUJdXQMMk1eKXTMFbNS7Iai9ungUwuWB0KmGK+npgwQNdTTVrtqJC1cjh+qL90OFys6JhYCri0DY8kkt691dZ2ROsCOLuJqh2RajL2i8PGpZUSnF2g78j4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793837597; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fAbg06ow8H9QMQrvOxRXn8nTU+O0wuTG8Qx02cu++Jk=; 
	b=nOpJnWVMboje3xbWS3M5AHr1Wl698euBo1vIPQq/aHlsoJ1ajMMPZILp4S/yVrVRVAWQPCa2Bdyvgu0caA3MRpygUFXXnAMXegeTeGdCYVl+HoRlb/iajt/LnBahi0ix3DNSrC4jkQu43zXzwmPEjHNezWNmJPziglMDWRPGJjQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=HdAPSFovFwWtdTHK9ZmbCLVhAWpZPO0UWDZDjv2cWXNfcniGfG9oIixlWS6MgBRlUwPbvqR/HBUPfXzg4FT9OYynKNw7Ryyw7ivutwYO7jFMND8c1W/0z/rdhBVoyBLpA7H+F+EftEOn6QJEYM/0G98h6QE6TEhy0qZPI8X+kLM=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=fAbg06ow8H9QMQrvOxRXn8nTU+O0wuTG8Qx02cu++Jk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793837597451328.75738105930157;
	Wed, 4 Nov 2026 16:13:17 -0800 (PST)
From: Yao Zi <me@ziyao.cc>
To: Ulf Hansson <ulfh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Yao Zi <me@ziyao.cc>,
	Sergey Shtylyov <s.shtylyov@auroraos.dev>,
	Midgy BALON <midgy971@gmail.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Frank Zhang <rmxpzlb@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Kevin Hilman <khilman@linaro.org>,
	Caesar Wang <wxt@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] pmdomain: rockchip: Don't log when of_clk_get() fails with -EPROBE_DEFER
Date: Thu,  5 Nov 2026 00:12:57 +0000
Message-ID: <20261105001257.1368266-3-me@ziyao.cc>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105001257.1368266-1-me@ziyao.cc>
References: <20261105001257.1368266-1-me@ziyao.cc>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_161325_184004_1C5A81A8 
X-CRM114-Status: GOOD (  11.60  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Current error handling code considers -EPROBE_DEFER as hard errors,
logs misleading dmesg like,

rockchip-pm-domain ff600000.power-management:power-controller: power-domain: failed to get clk at index 0: -517
rockchip-pm-domain ff600000.power-management:power-controller: failed to handle node power-domain: -517

Use dev_err_probe() at the callsite of of_clk_get(), and check for
-EPROBE_DEFER in places where its return value could propagate to.

Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
Fixes: 6be05b5ec161 ("soc: rockchip: power-domain: add support for sub-power domains")
Signed-off-by: Yao Zi <me@ziyao.cc>
Cc: stable@vger.kernel.org
---
 drivers/pmdomain/rockchip/pm-domains.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 34c862e56aad..c147cc88edb1 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -851,9 +851,9 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 		pd->clks[i].clk = of_clk_get(node, i);
 		if (IS_ERR(pd->clks[i].clk)) {
 			error = PTR_ERR(pd->clks[i].clk);
-			dev_err(pmu->dev,
-				"%pOFn: failed to get clk at index %d: %d\n",
-				node, i, error);
+			dev_err_probe(pmu->dev, error,
+				      "%pOFn: failed to get clk at index %d: %d\n",
+				      node, i, error);
 			goto err_put_clocks;
 		}
 	}
@@ -1006,8 +1006,10 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 
 		error = rockchip_pm_add_one_domain(pmu, np);
 		if (error) {
-			dev_err(pmu->dev, "failed to handle node %pOFn: %d\n",
-				np, error);
+			if (error != -EPROBE_DEFER)
+				dev_err(pmu->dev,
+					"failed to handle node %pOFn: %d\n",
+					np, error);
 			return error;
 		}
 
@@ -1102,15 +1104,17 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 	for_each_available_child_of_node_scoped(np, node) {
 		error = rockchip_pm_add_one_domain(pmu, node);
 		if (error) {
-			dev_err(dev, "failed to handle node %pOFn: %d\n",
-				node, error);
+			if (error != -EPROBE_DEFER)
+				dev_err(dev, "failed to handle node %pOFn: %d\n",
+					node, error);
 			goto err_out;
 		}
 
 		error = rockchip_pm_add_subdomain(pmu, node);
 		if (error < 0) {
-			dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
-				node, error);
+			if (error != -EPROBE_DEFER)
+				dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
+					node, error);
 			goto err_out;
 		}
 	}
-- 
2.56.0


