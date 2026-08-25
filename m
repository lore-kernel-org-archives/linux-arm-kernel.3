Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5C8C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+tRyTnlpLmJp3+Wgs2dMuwtgQimEwJVqYrZ9xUm0L0=; b=0eNjDUjwNmDGntM6WqvZ6TPfKL
	zacFQRsIXHwsC2KKqFVd+Lo2Rwtfav1U4JSF1831m+OMhslUCt6d3MXL4czmY4Ev4ebvHKRQ4tooX
	4sbJK1PE5y24tfyDUpD8KYJnnPSJZS49CZOPzemblojyZvYxu1yTBLRm4WT044tk/FbeoE6w9ONjG
	p5cWOei2dHtY4171fV5WdIPlZ5OJ4zv+VxL7oezxCvh27FnP2EObeSLYaXVYBIWMct9wLDiMcH77I
	xI9wAbdB1q8yDvLZszwzsQMUZWExSrFauDN9dum/peRYgG5Ymyc0aTqY+eeW+D9edEYSEy3ynjYXd
	QB+IQkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypIZ-00000000giQ-1E0I;
	Tue, 25 Aug 2026 11:26:35 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypIW-00000000gh9-2WZd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 11:26:34 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3701929a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787657191; x=1788261991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+tRyTnlpLmJp3+Wgs2dMuwtgQimEwJVqYrZ9xUm0L0=;
        b=dknCLuFYoto48GCxwiCAVeaNHO6sAVJTI+MWy7Q7qzk3WEd7jCOLWZprwqCfkIdfZE
         4irZ+h96PIBaxiNODI6GIbEk3GPShbNei7sB5dzEz9XGYdv6YePbWsdyGK+z043x2hgg
         jh9bvmNskaQbcG0pPORmoBQ9AKiQtR70OHzJjIHb/Esdpho2zphc/lp9tskoTNm/yCqA
         VjvZAiGQruw3WX3W1b1SMX8RNfBBBLHGdkEx00uNkOklyl9Y6qTN7/joi/LM3hW5VrRD
         svIVhtXui7ZiMeDx9lb+N4Z4xDsYIu7ihBb9iZ3cF6Pklj9HBnP9TABMRAIpAPXX6AZa
         8bZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787657191; x=1788261991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+tRyTnlpLmJp3+Wgs2dMuwtgQimEwJVqYrZ9xUm0L0=;
        b=GIsRPeJ9dhjyCwe1vlQHEmgwVY+rQFrmgkwLpgL30kfD8tONQ1QIy5E+MiiPU2Zwjv
         +sxcsODQO0G1zIGmhdK7iO4hz5egdhsNmRummJubIvCJ7j2L65I+RjzGvctp5RtSsmm+
         HS6IpgWEGAza9Yikzo9B/HasEHLiuTixz6eAJo/SHzy3ItQEtBonQj8iwhmGcUeIw+i/
         /nLnmi8/QaQJDLjmD7TpYozgZjpdo0Q2AiSNovYOrdiBvEje9dOrO4hI18bpa7VuZzBR
         F2lslqZEEAiH0r/PvcFCcUGp4h/HqGrbYNqmh3N8Kg80RaWyrkUh40VygdPWnOdPmFBR
         t6sg==
X-Forwarded-Encrypted: i=1; AHgh+RqnbECXKSmN81/3K4z61w9/9VI3CS1CMX1ZWoXfMr1/z+OuslTNTlKbenvD+vwOlClKqNK5xhHOmqbQhsq+U9Vi@lists.infradead.org
X-Gm-Message-State: AFuF++kB1NmfAbxdILmc2iX9jDogpHHooPxjyJ2PHq0tvRw5bBJwlCRv
	m+WFXZ7Lfv/uVWjYS1NkVYfH+b+PA0KOMvY9Z+E0shKP5gMxIVSXoFBJ
X-Gm-Gg: AR+sD111wMbPCELUOTflDPH4rEiiT+TAA41K4x0FbMWzkkhC+IXrSDn3IFPdfAzRaGW
	ykSfjg1U70PlgmhyjvMYenhcHC+/qb/5QvmA1fcwKOt488f2g1T3QwFIFZX1au55aUUyeVBub0B
	Ax0P31jla7VYwCuBoxrkh4pHxvCD5q6XtocmUwfTj7zrprfeDPgUF1ArXCN87MAuHf7PavpF8jf
	GKA8CsuNxXWQb4yrwuqcW9ZgeqUHNbC6lDpaxYtwXhXHcdOz165R5DslReoADL85r5PL4mTbQnq
	vlI1mPwTypHiQu/ReSDrzXR0EJf9iw+2/vDLQh9AUAteutG4H5lAJ6SFsZNfxts4wNInCdYNRq1
	j/c6HJZ8ZtvZfkJAMZdMHyxxEmM5/6T9T7hCXbD9ialiC8vqTOHBCA+rO3qEDczj8jdHlI7mHkk
	56YNAjwEEqnw1gnN4pw2bDLqehByJRClBc/741lNWEUHz/RqDcDqWsks3Jtduvsmha8j+W1u4xR
	Y/Y3JRnwgPHIrvpUCzcifUDCzI=
X-Received: by 2002:a17:90b:2ecb:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-396462b886dmr13579385a91.2.1787657191098;
        Tue, 25 Aug 2026 04:26:31 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909a51fsm32952386eec.4.2026.08.25.04.26.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Aug 2026 04:26:30 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex Lu <rex.lu@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Chad Monroe <chad@monroe.io>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v2] wifi: mt76: mt7996: unlink TWT flow if the MCU rejects the agreement
Date: Tue, 25 Aug 2026 19:26:20 +0800
Message-ID: <20260825112620.97568-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260729173632.14387-3-enderaoelyther@gmail.com>
References: <20260729173632.14387-1-enderaoelyther@gmail.com> <20260729173632.14387-3-enderaoelyther@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_042632_667364_8E15587A 
X-CRM114-Status: GOOD (  14.49  )
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

mt7996_mac_add_twt_setup() links a new flow into dev->twt_list before
asking the MCU to add the agreement, but exits without unlinking the flow
if the request fails. The flow-ID and table masks are only committed
after MCU success, so the still-linked flow is invisible to the
mask-gated teardown paths.

If the station retries the setup, the same slot is cleared and its
embedded list node reinitialized while it is still linked, corrupting
dev->twt_list. If the station disassociates instead, teardown skips the
flow and station storage can be freed while the node remains linked. A
later scheduling or debugfs twt_stats walk can then dereference the
freed flow, resulting in a use-after-free.

Unlink the flow when the MCU rejects the agreement. This restores the
list to its pre-request state while leaving the unchanged mask and
agreement accounting untouched.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260729173632.14387-3-enderaoelyther@gmail.com/
Assisted-by: Codex:gpt-5.6-sol
Assisted-by: Kimi:K3
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v2:
- Rebase onto wireless/main commit 2812e64e1575.
- Send mt7996 as a standalone patch; mt7915 is fixed by commit
  16a04441eab0 ("wifi: mt76: mt7915: unlink TWT flow if the MCU rejects
  the agreement").
- Use list_del() to match the accepted mt7915 fix.
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 0eebc8182ca9..4d3829e4220d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -3207,8 +3207,10 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 	flow->tsf = le64_to_cpu(twt_agrt->twt);
 
 	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
-				       MCU_TWT_AGRT_ADD))
+				       MCU_TWT_AGRT_ADD)) {
+		list_del(&flow->list);
 		goto unlock;
+	}
 
 	setup_cmd = TWT_SETUP_CMD_ACCEPT;
 	dev->twt.table_mask |= BIT(table_id);
-- 
2.50.1 (Apple Git-155)

