Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114C6606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 01:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4tcK9gYe;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dbM4oESD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rgRd2KV6kD1NlWNz1iQZ1uAx06L1PCjsN94PDtPnamo=; b=4tcK9gYegcdoW5qoYEOXVVUpAp
	ltDMwpBdxnMej43HCj7xaB63tO2IH84mYhhb9ef/HOnkGL1drfaj9zrEIUybUP3gbM9oe60gDS0JX
	mrhysTtNXtML5ht3bKKEVHozPL1HRUkfbq+WcXELXV4xpOPbAKvGKZql+qt+BAKisEizeIaicg2Kr
	OvFFBnrPei8LICVbj4ZZCOGikKasKDBhzgrR4mP293/8bxVfJC5Mf88rgDuMHft3s85ZvdiQJI69c
	PIH+GZ3sa4B8zXZi5ZwZ6yfgRkEFmxZnp6tNDNwvKqKSM7XQrk2vtgwINx9V4CW6l7Y8N0HdrfOZE
	GXpUKd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2zw-00000000muF-3D9J;
	Tue, 03 Nov 2026 01:07:36 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2zu-00000000mto-12Ld
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 01:07:35 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-843cf077f10so4316392a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 17:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668053; x=1794272853; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rgRd2KV6kD1NlWNz1iQZ1uAx06L1PCjsN94PDtPnamo=;
        b=dbM4oESDUTcEhp1rj9l72KMg57I2B/D9Q8ZLhl+VDR5BqcwMiysHGhatgWoX2NHY5y
         kuIvjeyI1+B1aHLIgcKq8v7wnJslcsNEKspDImLVCcLjmsK6XuiIYpDgaq1zO51nf/5A
         wBvIi+wmUgWAsMXHVkC23WqWH6FBxuEOjvYUqhwJJRsbd3huJsF+BNpRqWFO5r7aFrAL
         yx2tQaTCy6gjoHEg/mPqUoE3B0keOk3q+QvgXIxBug5xsCeZXDeF0FTC/xu1QrybddPi
         EzfaSn3JfFX6pVVHxGAxa7Fw6kk/2zx/ThBiRme+L96ZJHr3viCeo4fA+MUZZ1TP5tVZ
         Sv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668053; x=1794272853;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rgRd2KV6kD1NlWNz1iQZ1uAx06L1PCjsN94PDtPnamo=;
        b=ZGlJ0EOESrgg/Ca/MdxGVcjB778aF3d5dkRebbAg81YVh4Qk7q1ZXkYPcaPRKTh+Lb
         a9O9rOPNa+jH2gSp2mnex/dly0aAvR0BuRk2d5WPNCm5khyE1jFBLNOKDYOR496QLXwV
         n/t2a+LT5tLy/4DqfuqKQoah8Kv0nnE3kmriHssY42BzqMts0CwPZE2CZsglOxAOkPCi
         qx+4R0NO+8Yvf+TEJ+0gwgRte8kqPVeMuCi40zIzFB1OgC7lOO7OrXb+5/lYpF0bjHxv
         tKBDypQ98baRZ/kcN38E+0wu/2duPhYbj0Qg7Aps23BT10OFqmBU5w/tc5VTCJgkfgwl
         xg6w==
X-Forwarded-Encrypted: i=1; AKwUvBxrh3GN4Oe0bX/LhIkqllI1U+X2ZyD6HEe2bzzKvYhiAlXW0VSMSe43HEM55t10H2N+bUGqhOQ9K0IWabDVFM0L@lists.infradead.org
X-Gm-Message-State: AFq9FYIQr56X4U3uoqaJioJz95Dybe7fMrTnUCFY61Bgko8yJT+AUT2R
	56kz/tjxBET7sn4MZCaK6CI0/Ai/SGPZQ37YsAOomDGkzchWmxMLRE/Q
X-Gm-Gg: AYBFou365cg0Yvs/khAdWvrd7IYMkfS+mJcZGOpFmjiEEF13Zb2aFuuldpI0toWmnDN
	2jiBsUFogcQnUG8vlNhWLHmn/JHo27XqCHRUzKm65hirkGv+vpEf+8cGk1b64+NBqM2FUvt5BWk
	yJVJyCg8UTH2XzUynY4ccobaeoeuzrnE65rQvxH+pKLFsbxtwEeFQgUVDsORKhejielwOipCGTl
	5AO7HWCIe/q+znemOMyLaE+CUiRMY4BbzeCSUMno1mhPyQ2fIfsRAV5EF12Venw1HePoxBhewCl
	oj4GodV1vyZorCYxWPg792r+irP3DpCbjHF55TB2lDvUE3fbxP3GU0yV8oOir1rRwY0qDh0O+vV
	Tybhd0ZPQsA9CaTbgdiq4AKRLABgp/trtXMOKXpnpdoePIMHCvB8y6tWlCuq6jmqH4RWc/x04+k
	9ZmeQwY+kEBhJpQSVq+am7k28oxeu3NdlC78RjcIiDeOsd6Lf+JOQq5bj6U91WZLt+JN5iZXpkK
	9pANbzlGNd2R28OfWnjzUvmnTd2HKwbzQPY/4GXhJHylrgF5W/uaQZ+7UzEM3XIe+ebGyY/CJfX
	wTgd479RPhrVTDrveq35eKxlx0Ehfhep1KXcFZcRxADcQn2j3BTi8SPqLybt4RvktFoIVtDFi2l
	etQlHJFUV5oD2IuFllncdfNB0Q/vPDNfQ6MsXGXjFJysBChlURbfCN1uId9cQOpdLM0J5kcM3Bc
	2J8F7k1IIXRoZ6czQSUbQhP5+auW10OwBoy7cwdRCTgRVLlBh3P3Z9
X-Received: by 2002:a05:6808:f0d:b0:54c:d3dc:b544 with SMTP id 5614622812f47-5640de7a69cmr7834429b6e.32.1793668052739;
        Mon, 02 Nov 2026 17:07:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56523cdd0ffsm430286b6e.8.2026.11.02.17.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:07:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 18:07:30 -0700
Subject: [PATCH net] net: stmmac: rebuild VLAN priority steering when
 filters change
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-stmmac-vlan-prio-v1-v1-1-2b37767e4e08@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTuQCbWKVxEXMU50xKQlE0Oh9
 O7Gdvn/4i2gnIUVLt0CmauojKkFHTrwL5eejPJoDdbYgchY1O89SkEtMTqP9eMSTllGrIRnPob
 h1AeyhqABU+Yg84ZfIXGB2z4b8WZf/iys6w+XZMbbgwAAAA==
X-Change-ID: 20261102-submit-stmmac-vlan-prio-v1-8e5f674f1201
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Piotr Wejman <piotrwejman90@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_170734_312824_7A4D98F8 
X-CRM114-Status: GOOD (  23.78  )
X-Spam-Score: -1.9 (-)
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

The RX queue priority callbacks preserve previously assigned priorities.
Passing zero from tc_del_vlan_flow() therefore leaves the deleted rule's
priority mapped to its RX queue. Clearing the whole queue instead would
also remove priorities belonging to other installed rules.

Save each VLAN rule's priority and rebuild the complete per-queue masks
after insertion and deletion, starting from the platform assignments.
Resolve overlapping platform masks with the same last-queue-wins ordering
used during initialization.

Make the GMAC4 and XGMAC callbacks replace the target queue's mask while
retaining their exclusion of its priorities from other queues. Program a
priority's new destination before clearing its previous assignment.

Keep VLAN rules in programming order. Flower installs a replacement under
a new cookie before deleting the old one, so the newer assignment must
remain effective while both are present, including when an earlier array
slot is reused. Removing a rejected replacement restores the older rule,
and removing the last override restores the platform assignment.

Reoffloading an existing cookie reuses its entry without incrementing the
rule count. Validate the selected RX queue before indexing the masks:
tc_classid_to_hwtc() checks the number of traffic classes, which can exceed
the number of RX queues.

Found by code inspection while working on STMMAC reset/recovery fixes.
Host-side tests exercising the driver's VLAN rule handlers and priority
callbacks with mocked MMIO reproduce the stale mapping after deletion
and pass with this fix. No hardware testing was performed.

Fixes: b3da86d432b7 ("net: stmmac: fix rx queue priority assignment")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  2 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  4 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    | 54 +++++++++++++++++++---
 4 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 259e2ebed8c1..efbe2ec4c213 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -126,6 +126,7 @@ static void dwmac4_rx_queue_priority(struct mac_device_info *hw,
 	 * clear them from others queues
 	 */
 	if (queue < 4) {
+		ctrl2 &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
 		ctrl2 |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
 						GMAC_RXQCTRL_PSRQX_MASK(queue);
 
@@ -134,6 +135,7 @@ static void dwmac4_rx_queue_priority(struct mac_device_info *hw,
 	} else {
 		queue -= 4;
 
+		ctrl3 &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
 		ctrl3 |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
 						GMAC_RXQCTRL_PSRQX_MASK(queue);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1a88cbaed70c..7ad08651675e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -119,6 +119,7 @@ static void dwxgmac2_rx_queue_prio(struct mac_device_info *hw, u32 prio,
 	 * clear them from others queues
 	 */
 	if (queue < 4) {
+		ctrl2 &= ~XGMAC_PSRQ(queue);
 		ctrl2 |= (prio << XGMAC_PSRQ_SHIFT(queue)) &
 						XGMAC_PSRQ(queue);
 
@@ -127,6 +128,7 @@ static void dwxgmac2_rx_queue_prio(struct mac_device_info *hw, u32 prio,
 	} else {
 		queue -= 4;
 
+		ctrl3 &= ~XGMAC_PSRQ(queue);
 		ctrl3 |= (prio << XGMAC_PSRQ_SHIFT(queue)) &
 						XGMAC_PSRQ(queue);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b76acfe0d958..fcc395321816 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/hrtimer.h>
 #include <linux/if_vlan.h>
+#include <linux/list.h>
 #include <linux/stmmac.h>
 #include <linux/phylink.h>
 #include <linux/pci.h>
@@ -210,6 +211,8 @@ enum stmmac_rfs_type {
 struct stmmac_rfs_entry {
 	unsigned long cookie;
 	u16 etype;
+	u8 vlan_prio;
+	struct list_head vlan_node;
 	int in_use;
 	int type;
 	int tc;
@@ -382,6 +385,7 @@ struct stmmac_priv {
 	unsigned int rfs_entries_cnt[STMMAC_RFS_T_MAX];
 	unsigned int rfs_entries_total;
 	struct stmmac_rfs_entry *rfs_entries;
+	struct list_head vlan_prio;
 
 	/* Pulse Per Second output */
 	struct stmmac_pps_cfg pps[STMMAC_PPS_MAX];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 10b61fa2c27c..6707f7621f3b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -250,6 +250,8 @@ static int tc_rfs_init(struct stmmac_priv *priv)
 	if (!priv->rfs_entries)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&priv->vlan_prio);
+
 	dev_info(priv->device, "Enabled RFS Flow TC (entries=%d)\n",
 		 priv->rfs_entries_total);
 
@@ -685,6 +687,41 @@ static struct stmmac_rfs_entry *tc_find_rfs(struct stmmac_priv *priv,
 
 #define VLAN_PRIO_FULL_MASK (0x07)
 
+static void tc_update_vlan_prio(struct stmmac_priv *priv, u8 prio)
+{
+	u8 prios[MTL_MAX_RX_QUEUES] = {};
+	struct stmmac_rfs_entry *entry;
+	unsigned int queue, i;
+
+	/* Restore platform assignments with the same precedence as setup. */
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
+		if (!priv->plat->rx_queues_cfg[queue].use_prio)
+			continue;
+
+		prios[queue] = priv->plat->rx_queues_cfg[queue].prio;
+		for (i = 0; i < queue; i++)
+			prios[i] &= ~prios[queue];
+	}
+
+	/*
+	 * Flower installs a replacement before destroying the old cookie.
+	 * Preserve the latest assignment while both rules are present.
+	 */
+	list_for_each_entry(entry, &priv->vlan_prio, vlan_node) {
+		for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++)
+			prios[queue] &= ~entry->vlan_prio;
+		prios[entry->tc] |= entry->vlan_prio;
+	}
+
+	/* Install the new assignment before clearing the previous queue. */
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++)
+		if (prios[queue] & prio)
+			stmmac_rx_queue_prio(priv, priv->hw, prios[queue], queue);
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++)
+		if (!(prios[queue] & prio))
+			stmmac_rx_queue_prio(priv, priv->hw, prios[queue], queue);
+}
+
 static int tc_add_vlan_flow(struct stmmac_priv *priv,
 			    struct flow_cls_offload *cls)
 {
@@ -700,7 +737,7 @@ static int tc_add_vlan_flow(struct stmmac_priv *priv,
 			return -ENOENT;
 	}
 
-	if (priv->rfs_entries_cnt[STMMAC_RFS_T_VLAN] >=
+	if (!entry->in_use && priv->rfs_entries_cnt[STMMAC_RFS_T_VLAN] >=
 	    priv->rfs_entries_max[STMMAC_RFS_T_VLAN])
 		return -ENOENT;
 
@@ -708,7 +745,7 @@ static int tc_add_vlan_flow(struct stmmac_priv *priv,
 	if (!dissector_uses_key(dissector, FLOW_DISSECTOR_KEY_VLAN))
 		return -EINVAL;
 
-	if (tc < 0) {
+	if (tc < 0 || tc >= priv->plat->rx_queues_to_use) {
 		netdev_err(priv->dev, "Invalid traffic class\n");
 		return -EINVAL;
 	}
@@ -724,13 +761,18 @@ static int tc_add_vlan_flow(struct stmmac_priv *priv,
 		}
 
 		prio = BIT(match.key->vlan_priority);
-		stmmac_rx_queue_prio(priv, priv->hw, prio, tc);
+		if (entry->in_use)
+			list_del(&entry->vlan_node);
+		else
+			priv->rfs_entries_cnt[STMMAC_RFS_T_VLAN]++;
 
 		entry->in_use = true;
 		entry->cookie = cls->cookie;
 		entry->tc = tc;
 		entry->type = STMMAC_RFS_T_VLAN;
-		priv->rfs_entries_cnt[STMMAC_RFS_T_VLAN]++;
+		entry->vlan_prio = prio;
+		list_add_tail(&entry->vlan_node, &priv->vlan_prio);
+		tc_update_vlan_prio(priv, entry->vlan_prio);
 	}
 
 	return 0;
@@ -744,14 +786,14 @@ static int tc_del_vlan_flow(struct stmmac_priv *priv,
 	if (!entry || !entry->in_use || entry->type != STMMAC_RFS_T_VLAN)
 		return -ENOENT;
 
-	stmmac_rx_queue_prio(priv, priv->hw, 0, entry->tc);
-
+	list_del(&entry->vlan_node);
 	entry->in_use = false;
 	entry->cookie = 0;
 	entry->tc = 0;
 	entry->type = 0;
 
 	priv->rfs_entries_cnt[STMMAC_RFS_T_VLAN]--;
+	tc_update_vlan_prio(priv, entry->vlan_prio);
 
 	return 0;
 }

---
base-commit: c3e67bd82b9b9b1a5118f09a429ccefe2aab0741
change-id: 20261102-submit-stmmac-vlan-prio-v1-8e5f674f1201

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


