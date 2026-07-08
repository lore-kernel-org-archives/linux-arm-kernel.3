Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B5AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AsxOcajZ7gYxW17W0Pj55YOWQAyg0/24La7iNV21scc=; b=wEMoUEz43kglHziCSW0YzJNWSE
	NfR1ZesB174LnLdf4ByU06IY5X304CnrMLi7XHWb0seNCTGGw+BURDPH70Dn4LUB/XSDhGhGu71EU
	6F/KqTUCc+Eow19MV+So3/oI6LW/Grq+LnOH0Z1Am/OcZjg0ps8M5jH/14MIDonarHyvoOBa5/dRN
	i5lKhR/UJVVZheEQZTEwmDdF31B1/E25/kGwy1/ED2mn7ZCqwIhdYLFWKdV1Xp+MxczMpUVgMRxVg
	F5UvWDYGQc97EeaIdip+WFXSK06XEtMKsVeKseGlD0ZmLfEXPe9S++FfoS2czMi8Erfi+1XwgK8KP
	dO6Kk0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQU7-0000000H15u-1Cxj;
	Wed, 08 Jul 2026 11:30:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQU4-0000000H14L-0Qi5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:30:34 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so7938745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 04:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510231; x=1784115031; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AsxOcajZ7gYxW17W0Pj55YOWQAyg0/24La7iNV21scc=;
        b=FX7PMMKXGJ5id5aL0OOmd53Y3I3xcFrJJDBeY3avVLiOH0xWTf9u2hE6j34cQLkrsd
         2wYkPUT3XyfHERJjc2jbYKITeByluFlMWqZmZaDHJ+ta/0CMZo/BrvylKQWzdwjvx4XR
         uw7Tt0rYj0Qh/B0wNZtdoACq3jtkxtI72ZgaH/JvOhqj13mBiuJMZ+skO39AuNIfOPTi
         ey+PqXAOBzYT4r6HuWfO+JeMfquJm4h4hlgrA1k3ORn+q23pZ0M3WHlyILpz+Qibdk5k
         RVQHPPC+BcNYxLHwd/fAjoE2lhiUk/Yk1wTI7m+vRjZgXYepEe/ebw1cgI4CSseM6afP
         qYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510231; x=1784115031;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsxOcajZ7gYxW17W0Pj55YOWQAyg0/24La7iNV21scc=;
        b=Mdgf1CMxBzqWjJ/Svwnuu72eCrHzz6BUeKC+23Z/QFyZix5nf/8HX9t+IqNGRAx8ma
         6XtpPRFA197mUQZdhWYuhhgdk95+/kUYrLgwvlC0AHf9FDC74+hE0GcT7x/lqOd15AkC
         jwIGFOOxbOUSWcdvPeXtxEnW9ixJoRKHFl8W0qpIqDVnCTGIOFaddUlT5RbotLMIvfFu
         iw5PqJtyF27ir4+zMmbZB48M7AFxvUo13+DkUf+6SPPelSnUsTzvdCw/M7Y22Jo3xCsT
         0IE99jImmQ/03mNMF4SI0K3enb63ZR69332LQ5nhdDggT2kYUk/GdlXVY1WG7pwTDCeF
         XyPA==
X-Forwarded-Encrypted: i=1; AHgh+RqmNLbOeZF9SgvpIN3gUaTopv6ooavcIRqu8mD6YdOUvPkvZ14S8VHAYp0zLrspvkHYqvWq1JuH2SdngRa/u/HY@lists.infradead.org
X-Gm-Message-State: AOJu0YzouaRagTGf5JRGPIkJlZ02hjTDEnpZzINNEB1QRp84xoMIF7hm
	LnTYpu/29TwctgrQxXsDIMPgiezK2GGxZ+VFJJQ0YH+xxwku4MeiB7vv
X-Gm-Gg: AfdE7cn0EX8/PkO9ce/pSQU5KTsYNHgwH+55Zm1/d3eZl+ZnraZS1pA4Fr1csvdXt9/
	FJc+EGQdUaOGXERF2ze0pY3AwjeP9GyJffjNhT6/0+kVEHCJ+yWDjHx/fRKfshyH90HKgy7PGfb
	B1daW0hT6TdZuObnHu81oB4+GoiC9Ca0n76sD0r6q6lp7zp7ALOh2EeMv4oR9YYiZGD696AIySB
	iJNIC/33XvlYRXMP/fPV+1Yp+Ziwf9O5jkivLzHYigK3PcBkj1d7ZOtyxP/5l/lRb2JiKNnABzt
	iRBoVt8T7VtskQoHwTEYfnxC1mm3ZPzOk2zH3OitkzKpV6cTGuP/heKcALOjDBB0H88NkPDo2Wn
	Q5bI/1hIvKHSR8nX1JcTN9eXWTwRLZsTO0huXZBDUVldSAor5LXkmg8T+k8n9GSQ9Y9EPwRbkK+
	6OLx8hvg==
X-Received: by 2002:a17:903:1aae:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2ccea396a45mr22556175ad.20.1783510230507;
        Wed, 08 Jul 2026 04:30:30 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb877sm26691105ad.14.2026.07.08.04.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:30:30 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: airoha: Fix potential use-after-free in airoha_ppe_deinit()
Date: Wed, 8 Jul 2026 19:16:16 +0800
Message-ID: <178351022574.97989.6880403520276841703@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043032_158589_26F02019 
X-CRM114-Status: GOOD (  10.57  )
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

airoha_ppe_deinit() replaces the NPU pointer with NULL via
rcu_replace_pointer() but does not wait for existing RCU readers
to exit before calling ppe_deinit() and airoha_npu_put(). This can
cause a use-after-free if a reader in an RCU read-side critical
section still holds a reference to the NPU when it is freed.

The init path (airoha_ppe_init) already calls synchronize_rcu()
after rcu_assign_pointer(), but the deinit path introduced in
commit 6abcf751bc08 ("net: airoha: Fix schedule while atomic in
airoha_ppe_deinit()") omitted the matching barrier when switching
from rcu_read_lock()/rcu_dereference() to rcu_replace_pointer().

Add synchronize_rcu() before ppe_deinit() to ensure all existing
RCU readers have completed before the NPU resources are released.

Fixes: 6abcf751bc084804a9e5b3051442e8a2ce67f48a ("net: airoha: Fix schedule while atomic in airoha_ppe_deinit()")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index e7c78293002a..f6396925722d 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1659,6 +1659,7 @@ void airoha_ppe_deinit(struct airoha_eth *eth)
 	npu = rcu_replace_pointer(eth->npu, NULL,
 				  lockdep_is_held(&flow_offload_mutex));
 	if (npu) {
+		synchronize_rcu();
 		npu->ops.ppe_deinit(npu);
 		airoha_npu_put(npu);
 	}
-- 
2.51.0



