Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF5B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I5wT1UGN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cAIHLwhJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZVAdkMAvn50gHozZX/KodN8m8JvreXpUXeN7urPtaNA=; b=I5wT1UGNCarubApsloAm4G36bb
	OauoIHajBl0U1MYIjSRgAqpsYMVd2gfxYngPG3zZcaHlAIvdl50EuOh8bunTdBTyCdbiJ77FD3Uvg
	LpME0UV/GsTql/+dXUWmiwlaXRS858EzXtS2ZGA8NscYVVurGFM7zUgsJlSbu1k+U6X4q+/9j8htP
	5Bj+wLxfDgd6u43ZMA8G6QUsFQ6OqcAhDqHEArlWmpROTgmN7pjph6G8Cbst89Rk2xpMm334vZU5g
	EP8vbf7pKYDjrCMoUK0GUmiFw4zOCgyWiWdWZtt782JEeDFgJgqRikOPx3DwxtUs7m7ll73HzT8ZA
	ia0iuSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkqf-0000000FbRl-1BH8;
	Mon, 02 Nov 2026 05:44:49 +0000
Received: from mail-oo2-x00.google.com ([2607:f8b0:4864:31::])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkqb-0000000FbQg-2rEi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:44:47 +0000
Received: by mail-oo2-x00.google.com with SMTP id 46e09a7af769-84e8a9fae57so1415536a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 21:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793598284; x=1794203084; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZVAdkMAvn50gHozZX/KodN8m8JvreXpUXeN7urPtaNA=;
        b=cAIHLwhJ0zPrSfrks7ESfGVKBzfDaq7xzQJAStexnZC8Vijc9zwntH00YhSJa7X6SV
         hmTUKzlJBCYIM0CZhw5614WROEzMrHORL7u167Fs9FC3Ijij0daHIRUS6pDJ1PXoagcC
         qQlftVGegPCwJWW2dEHsOh1mzg9wZysqMtLr0TysqgastJZmftcaFYjO4M9vAUNvpIuB
         AoOAs6yUGnNYytCU5Wf0eZh1D4RNCYz+mL3JvyHQZVUKtwHuvp4Ez1EBHlTO7YrpjxyH
         XOc/WJ+d6cpaUjchLDPWW+qS3nOr4WNBosXyXbyFduSY1wkDQ8MGYbA2EYePO/dY/iJY
         LrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793598284; x=1794203084;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZVAdkMAvn50gHozZX/KodN8m8JvreXpUXeN7urPtaNA=;
        b=iGgTUFowRX2scZU81BgR7A2vj0J/S5hPrbMGC6ZNdULbU/mEeofJ/3can0TmTHvTWX
         Htrhf9eMbQz5UCyT3nDxRmbP3BRpRnSnCLnnO8gwv8dFUK3ORf0zfUXibUYcHoTyqKG2
         ZO8hcEPoMqRHkU1iyFXhjmNZBlN8XQh0tFbs2NDcsXNxxuG+NsyN6Uz5Dcqa993N861j
         3DtMkeUoHGOzE+Ws4ls5evYvTUf7u0NyREfE+bHpEljbBYCyTOYLRbelfBs6jsAMjxCn
         d81QxqgdvSwM0Hil7kpVHj339wj3gtPEkFjXg15TSdC6PsFUR9dTTycgsruRsoOw0nNq
         MWhg==
X-Forwarded-Encrypted: i=1; AKwUvByfU1WsgAknAhvrchEdNKsawtBzlCtI0enOJqSJWw9vrTNgGyb8xnZzpGwNNWrLBhRSSncHZR/vFQKfu7IQs+vJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIn15qmVdkvsWjrdQVpJ+9IzASDIY6AVGo2WKxJx34bR5MYUW9F
	b+rQMa0WUjsN4bfhj3MTVYYXMAO8xZamSnO/mJAS+zaBr3D5LTz2HEl7
X-Gm-Gg: AYBFou1+39HVGkflPs8r8qQmmgQokZazer9vxT+C0C3VCS1VKdbUuTso/TSBhunBUDe
	EedVOMcYrQO7+c/TDQBMR9z42i1vPAlad/4+bViD3HcsBev7rwQVT0RcB6B9qG7IFFlN8xh47sq
	iT8Ll5JI+tkrx3NHyWRAUzTpE6HaDP8khft3nk+/0+CKCBl0kJ1VY9RezBdRuFdlnTNxYh5rSAj
	GgYkY2+5B7j6gXYBVdKokFtTOLxLFW7oeZNAr8Y9y/HeET/GR3POzZD6hZPCpzMYolohx/LV3ii
	HPnFe07mcLKscTzEDI17569CpHoAoBZpAfhrD/XiI7/o6vgUKnsgFpJ0bJiAXgkc26Vm0d5uEk9
	6vs8yh2jNQrjX3R3mjAUEWqLqaLbsve6HUKciCRaQjT88O7dSuGFnMgwQiyKhm4IBbWYVTNk+9F
	Oxj17xFgTbY68DpwZNIl/l6OsP3M3rIpdvn8j39vYIohoiCRgSmukO18B480TqKzIZBoYZ80RpR
	pWIcsvN2cGjFNvCwtXYYK5l7fIp1dAqgdYZmgiy70KjuXK4valSsj384Hz0236FRcWNyEdqVd6N
	x8lNp0pV6TkxaNkMrcZDUDfV
X-Received: by 2002:a05:6808:2396:b0:53f:3c0e:c74b with SMTP id 5614622812f47-5640d91a298mr6523131b6e.9.1793598284521;
        Sun, 01 Nov 2026 21:44:44 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd9888bsm7654306b6e.5.2026.11.01.21.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:44:43 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 01 Nov 2026 23:44:37 -0600
Subject: [PATCH] pmdomain: mediatek: Don't power cycle domains on probe
 deferral
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-rbrue-suez-upstreaming-mtk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQqDMAwA0KuUfBuIZWyuVxn7qG10YbSW1MpQv
 Luwd4F3QGUVruDMAcqbVFkyONN3BsLH55lRIjgDluy9J3qijtoYa+MdW6mrsk+SZ0zrF0uKS/K
 SMfLEihTC8OBxsDci6AwU5Ul+/+v1Ps8LIGoGRnsAAAA=
X-Change-ID: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb82400
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793598281; l=7479;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SyPRYlUtZR7GNv/iXFv7JY2/OPcFvWdXR3T7DquKY1o=;
 b=61ytKL+JiPa+o5Cgw1Ggsx/eDe98G0g2mX78NMn5H5CLIGN8igwq2krqaLz8yNzcuMLdY2AZP
 AbzI3lK2g87DnRE0jTuxcZYkOcRVjUMRUh9A47PY36oC7KtHlSEuB4c
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_214445_741579_050D6A48 
X-CRM114-Status: GOOD (  28.36  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

scpsys_add_one_domain() powers each domain on as soon as it is added,
before the probe has looked up the supplies and clocks of the domains
after it. When one of those is not available yet the probe defers, and
the cleanup powers off every domain added so far, whatever state it was
found in. The retry then powers them all on again.

A bootloader that leaves the display scanning out does not survive
that. On the Amazon Fire HD 10 (MT8173), mfg_async's domain-supply comes
from the MT6397 PMIC, which registers after the power controller first
probes, and power cycling the MM domain under the running display hangs
the SoC on almost every boot.

Power the domains on only once all of them have been added, so that a
deferral leaves the hardware as it was found, and on cleanup power off
only the domains this probe has turned on.

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found on an Amazon Fire HD 10 (2017), an MT8173 tablet whose board DTS
is not upstream yet. Its bootloader (LK) leaves DISP_OVL0 scanning out
when it starts the kernel, and the MT6397 regulators register about 50 ms
after the power controller first probes, so the probe often defers.

The deferral was forced for the A/B with a local test knob that returns
-EPROBE_DEFER at the first domain with a domain-supply. Each boot attempt
was counted from the host's USB log, since a hung board is reset by the
watchdog into the same kernel. The hang does not happen when the
display is stopped before the power controller probes, which is what
our downstream kernel does today.

elm, hana and the MT8173 EVB also give mfg_async a domain-supply, from a
DA9211 on I2C, so they probably take the same deferral path. Whether
their firmware leaves anything running across it, I don't know.

Only MT8173 (direct control) was tested. The HW-voter cleanup changes
the same way, powering off only what this probe powered on, but there is
no such hardware here.

This patch was developed with the help of an LLM.
---
With the deferral forced at mfg_async on every boot and the bootloader's
display left running, 61 of 63 boot attempts hung before userspace
without this patch, and none of 5 with it. With the patch, the cleanup
left MM on as the bootloader had left it on every boot; without it, it
powered off all seven domains the probe had turned on, MM included.
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 60 ++++++++++++++++++------------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index f0fa79e01f9c..6a81aadc18f3 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -982,12 +982,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		pd->genpd.flags |= GENPD_FLAG_IRQ_SAFE;
 	}
 
-	/*
-	 * Initially turn on all domains to make the domains usable
-	 * with !CONFIG_PM and to get the hardware in sync with the
-	 * software.  The unused domains will be switched off during
-	 * late_init time.
-	 */
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
 		bool domain_is_on;
 
@@ -999,15 +993,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		if (domain_is_on)
 			dev_warn(scpsys->dev,
 				 "%pOF: A default off power domain has been ON\n", node);
-	} else {
-		ret = pd->genpd.power_on(&pd->genpd);
-		if (ret < 0) {
-			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
-			goto err_put_subsys_clocks;
-		}
-
-		if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
-			pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
+	} else if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON)) {
+		pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
 	}
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
@@ -1085,7 +1072,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
 	return ret;
 }
 
-static void scpsys_remove_one_domain(struct scpsys_domain *pd)
+static void scpsys_remove_one_domain(struct scpsys_domain *pd, bool powered_on)
 {
 	struct scpsys *scpsys = pd->scpsys;
 	int ret;
@@ -1100,11 +1087,10 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 			"failed to remove domain '%s' : %d - state may be inconsistent\n",
 			pd->genpd.name, ret);
 
-	if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_HW_VOTER) {
-		if (scpsys_hwv_domain_is_enable_done(pd))
+	if (powered_on) {
+		if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_HW_VOTER)
 			scpsys_hwv_power_off_internal(pd);
-	} else {
-		if (scpsys_domain_is_on(pd) || MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
+		else
 			scpsys_power_off_internal(pd);
 	}
 
@@ -1112,7 +1098,8 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 }
 
-static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx, u8 num_probed)
+static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx,
+				  u8 num_probed, u8 num_powered)
 {
 	struct generic_pm_domain *genpd;
 	struct scpsys_domain *pd;
@@ -1124,7 +1111,8 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx, u8 num
 		genpd = scpsys->pd_data.domains[pd_idx];
 		if (genpd) {
 			pd = to_scpsys_domain(genpd);
-			scpsys_remove_one_domain(pd);
+			scpsys_remove_one_domain(pd, i < num_powered &&
+						 !MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF));
 		}
 	}
 }
@@ -1361,6 +1349,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	struct scpsys *scpsys;
 	int num_domains, ret;
 	u8 num_added_pds = 0;
+	u8 num_powered_pds = 0;
 	u8 *added_pds_idx;
 
 	soc = of_device_get_match_data(&pdev->dev);
@@ -1436,6 +1425,31 @@ static int scpsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/*
+	 * Initially turn on all domains to make the domains usable
+	 * with !CONFIG_PM and to get the hardware in sync with the
+	 * software.  The unused domains will be switched off during
+	 * late_init time.
+	 *
+	 * Do this only once every domain has got its supply and clocks,
+	 * so that a probe deferral leaves the hardware as it was found:
+	 * the bootloader may still be using a domain that is already on.
+	 */
+	for (; num_powered_pds < num_added_pds; num_powered_pds++) {
+		struct scpsys_domain *pd;
+
+		pd = to_scpsys_domain(scpsys->domains[added_pds_idx[num_powered_pds]]);
+		if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
+			continue;
+
+		ret = pd->genpd.power_on(&pd->genpd);
+		if (ret < 0) {
+			dev_err(dev, "%s: failed to power on domain: %d\n",
+				pd->genpd.name, ret);
+			goto err_cleanup_domains;
+		}
+	}
+
 	ret = of_genpd_add_provider_onecell(np, &scpsys->pd_data);
 	if (ret) {
 		dev_err(dev, "failed to add provider: %d\n", ret);
@@ -1446,7 +1460,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup_domains:
-	scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds);
+	scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds, num_powered_pds);
 	return ret;
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb82400

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


