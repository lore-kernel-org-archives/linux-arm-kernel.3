Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39352D4899A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9JqLdOMZ6NZDy2yQcDqX1Cghjb6LFxT47x3f2odxpE8=; b=q6SRiS5DdT/kJP
	jywCTA03rP1XcxclCk+N6BgSHy+PC2whjMRQeD2dm9NjlyCp0F/TxIut63ty6Y0OVwNyBklJhfK1y
	WBFQKcB5nloyOvhhSWm/Sq6ZRbOYEd/AUtz/FC/fERMrrkD7Arqq6Ge4bYlfOgbbB37xc6suX7oqa
	YLJ8ebAHqGOXMcUF89vSQbHSKNY+kTKPrasU/6VyfCoFhQUXTuHMNPCc7K7jboyZFV4Aws3u0JyEj
	DC1jUP+KrQicQJa0LVZ+N1AZ8AwyuUx12W7+6+T5c9/AyNE7VRk3kvUMb7tHYYd9wAKIh1ZdfZqGk
	Z8ItSHbB4NhOK4WGNt/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgivr-0000000E6vL-2gea;
	Fri, 16 Jan 2026 12:28:03 +0000
Received: from out203-205-221-190.mail.qq.com ([203.205.221.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgivn-0000000E6ul-2BEh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 12:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768566470; bh=9JqLdOMZ6NZDy2yQcDqX1Cghjb6LFxT47x3f2odxpE8=;
	h=From:Date:Subject:To:Cc;
	b=RvakPG1SjKnDHGfxyvLRJ7LrB0UgJ6zSZXgsrGgEkerf+flfDv3wzXqT6vEgYV23t
	 gj2IOn4M3hwWpx/VoMhQx2j/y5PoiX+PNYQZ8bg9L3sZUFYQy7g7NR1OpQftCzYB83
	 Teqfyq+2itWQ2m5dmTHnUsdzworoiMwYGdhZt9AE=
Received: from junjungu-PC.localdomain ([223.166.246.160])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 6F003E91; Fri, 16 Jan 2026 20:27:48 +0800
X-QQ-mid: xmsmtpt1768566468tccz403jx
Message-ID: <tencent_E20B88FB4461F8F299301AE67009CF1E8708@qq.com>
X-QQ-XMAILINFO: NAuAIaytDrXpCJJ5wMPpp00qsHUhboUXzyZi+3PHYECRgaowJjRC7dnOiQ2qFc
	 ut2jKA2kCI4Kw1LFGJQ7NFSpV9EjSKKUtmCHW/dGzTO8/8haG699rTnqSfpfRo0ulYmqrhp7V+uY
	 c6Lfy94Wqmw+/Ti1VqswSzv4Kmkjr9Zo+nOoFB1AiXI6gC3F+a2d1f/wENiZj85eygbfKB1GqXfd
	 14OWp9id//65l8GwEFaCVNSGY+XXkbxcZjOwXB0ErF/Y0T3F7mlCzoJu3eIIKJz0mTzpD2QFQep5
	 HGe/UOkc2XfYgCMk+wDLl5K9jxeAMrMO3r2T8C3F4y+F1BcNjG9ZqkWp4Sgyy/3NUbaen0/MvIig
	 9LFDiQmwbkJgLBsVFbSxodM6GcXgVwPVYVKiKGmbMh37UNgNXO1SWiXm1ttKkbNGDmuFydRUQT/5
	 iKPg3DrA02i9htRbrCI19PxLpb/zYq+1myTfpC8cDJKHTnwAwmJ7hLKksoZSGwCG+HvJfG3FkdSA
	 9pVICZq+low9ZN2d1tTEiQEbUi6meVYYIOkSB22j1HoV2QfPyr+NWWs8H91AD380pOp23DRI3N+F
	 Fqr+gpHzpBRQubKNSHSE297Vogzxhq69ttpOv0K/IObD47zpI+TJxdzPQi6NAvTywqjXEGgNCavb
	 fA68V6bJuevBYGa64BE1wX869jUdTZZBic5vs0kPvlup44eFJuq5l1+Y2/Ag8QZYD0g2xlycGqoB
	 PuWYA9BUdb6HJ89+HBG2cTqIRPYPbHvR6grxy6ztYSLgGRgYo+NMySAw7lT10jN/cHL8cn4ZiARj
	 VxNU4Dz3DKGxo44Y8gbFPfCJg4UE2cFL1fH7PlU42Kkvux7z5LzaOGT+Yv9kmY8On5vWSgFtPMc4
	 whES3ayBrdlxAfmHdjoEyzXI+3Js5kNloEWlafKusjucINK4W9XsTxuc20jO8NBp9BfEWN6UF7Ia
	 7IAWgjOuqwh+165X4Rdd+emr7jwlzsO19u6oI2Wut6M6EgM5bVzK1nCmqbbqmfSOXwC3SOFth+10
	 fs/xeLOpFKWBpB/x7IpBMfCr7KsRLUU1wrmmtscOi42xfJAfeTrNGAk40tMbD0Qlpl/Ig1h3a7nY
	 HsprrXs+L/foqHbSnjmzJ2dAaSDRGza4tpfK3aCHNa777c3YfF+WfxbpJRjumrscOryQ0GVHQ23v
	 jFMXY=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Felix Gu <gu_0233@qq.com>
Date: Fri, 16 Jan 2026 20:27:47 +0800
Subject: [PATCH] pmdomain: ti: omap_prm: Fix a reference leak on device
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260116-omap_prm-v1-1-e87c02f296ff@qq.com>
X-B4-Tracking: v=1; b=H4sIAMIuamkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Mz3fzcxIL4gqJc3WTzpJQUS3Mjs8SkZCWg8oKi1LTMCrBR0bG1tQC
 V57H4WgAAAA==
X-Change-ID: 20260116-omap_prm-c7bdd9726abc
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, Felix Gu <gu_0233@qq.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768566468; l=1073;
 i=gu_0233@qq.com; h=from:subject:message-id;
 bh=31Dg6exoE+spJrdeoYTv5xJGLaB7oDZ0LxPNxr4UNik=;
 b=uSKrSDWvEB2en/PdP1yunwZ+vmz6v73/vtXrQZrbJkruhwSkJjosRhMmEUSUa9WSfcnMTMx8e
 TYAkCzDV6tbB38pBuTvGaK6Y7tG64seYZ9I8YrsPdygrjPX/IoLnt5n
X-Developer-Key: i=gu_0233@qq.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_042759_876857_1C277954 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In omap_prm_domain_attach_dev, it does not release the reference.

Fixes: 58cbff023bfa ("soc: ti: omap-prm: Add basic power domain support")
Signed-off-by: Felix Gu <gu_0233@qq.com>
---
 drivers/pmdomain/ti/omap_prm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
index 5142f064bf5c..64a187f79a1a 100644
--- a/drivers/pmdomain/ti/omap_prm.c
+++ b/drivers/pmdomain/ti/omap_prm.c
@@ -655,6 +655,7 @@ static int omap_prm_domain_attach_dev(struct generic_pm_domain *domain,
 	if (pd_args.args_count != 0)
 		dev_warn(dev, "%s: unusupported #power-domain-cells: %i\n",
 			 prmd->pd.name, pd_args.args_count);
+	of_node_put(pd_args.np);
 
 	genpd_data = dev_gpd_data(dev);
 	genpd_data->data = NULL;

---
base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
change-id: 20260116-omap_prm-c7bdd9726abc

Best regards,
-- 
Felix Gu <gu_0233@qq.com>


