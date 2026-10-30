Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD8F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 01:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=czQP+jDK;
	dkim=pass (2048-bit key, unprotected) header.d=goodkind.io header.i=@goodkind.io header.a=rsa-sha256 header.s=google header.b=kyyPxqQM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=61qcPN07t2TUNYnm91oL81Sx86wLZQKTzOl/nzNJeWE=; b=czQP+jDK9FN9yyA+ca7SL7TUT+
	kdz0SajhELTuRr/+bregjX7HIY1cBmuQiI/T+17Tp7m+yTCYTOItBCe4moYpZ/nMPd8lW8OAay8Z2
	hIl9EKePHUp0r/W392BTjy7iJLbNfUcrFXzRb8SUK1XNQLSPXMBpvtTqJcIPPwqP2xxk7ZK5wcxpK
	417OmlXwgNYZ4uYDYkM93n0cSdBtdOissm+99tL9tEXVDu9oDqvtZY1Z3BC4oRzv+pUjiVlApp5Mm
	YAML6adX8Czzk9L9Uu9WkFajo50SdL2FJXaZqJjhkm8u6BZoCFCweO/ZFTyfOXIyF6F8bI2oOi3hZ
	htGiGYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMb3d-0000000Aaxy-1wen;
	Fri, 30 Oct 2026 01:05:25 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMb3a-0000000AaxF-0M1H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 01:05:24 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so85169eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 18:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=goodkind.io; s=google; t=1793322319; x=1793927119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=61qcPN07t2TUNYnm91oL81Sx86wLZQKTzOl/nzNJeWE=;
        b=kyyPxqQMT38dFMIByVviY80jwq2uZhaeWp6S6NKiivkVXoG9lJzVu2CcOecZWXij7w
         AegIYXOGMCQrIGMt61LsRIEIyBWvktmdeCtyKjixOpQaPshzo9FVyiuAZ5C21bP1aNov
         HtdqOGBntOZ/FKuSZT4G5J8eCeJK8goaAc7xBv6ds7s4wxP8hGkFuC6zqQGvrsiQrqNl
         J8kOhHUaOTTxS5lJ8L38R9r0a4VflhsKwtXWsqbMBcsTlu04Glu9bNWv7zYVupINNJ98
         NNaSJ5zm/TUyWQ9wHNTw1134rR0LNraUUisQ4jfVY3oIpmPhCaj2mxQGHzaSAnnD8SWN
         gDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793322319; x=1793927119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61qcPN07t2TUNYnm91oL81Sx86wLZQKTzOl/nzNJeWE=;
        b=jStgxMKeFlUpbeQ68q5S3s1wFCncgzQymevBA5ITS8ShZy4Xx6su3PSawvRnfbHqNj
         8OmPpG+/pHZ88yMol6/MdmNP7V853gceUVCgOEiCl7QRzOLeCmJkCHFh7+o3Xcu7OfWE
         QckQSoL1vT8r3OA/RMl+tOsDVjgdwhadP1cb5EqnIomxaFAkdRw/HjSZLjgSs67Kzw/R
         krXMZKg8LkgLM8/xTB8L3A1I+x65E2qj+RtEzK7EiChIcjkyUvngP05lwiZ7z/IzNWYQ
         96OD0DUbZx05o54H64LUyZIDwYc6rmSA0pQGeXp2XRsqPFE6imsfTyRtz73hhnvN2G5+
         DD6A==
X-Forwarded-Encrypted: i=1; AKwUvBzg9hd5BI+ZD0Eok6cNZDG/qiRpJPOOl1DkfU9vHR7obKeXn9OsY3HgRNitVBb0ddoR7BhUxZk2XNtMf+cMkJ73@lists.infradead.org
X-Gm-Message-State: AFq9FYJM9W9SDGswQIjfkpaWtPArJ3jsn4TSgBHm9mS13Z9nMZk8PY9k
	EgHXVNMY2JxTeDgTKooEuUOttukxa+p+SL6IbJJhI7PH/lJYil+jJ8a/97CjiplvzUJB0dAOWmN
	37qmoFT4buvoSRNI=
X-Gm-Gg: AYBFou0DLDZcqTkAK5NIbsjn6VT22STfIv9JgQ43Srjiec8RTu+5sJJu70aNrnRzcY0
	uWDM0CLdYATidiEvxsXoCYKdavRdaYWVIsRilwKtcC3uZc1D0lAz0fQMfUX/QLhnmq2vE7UrNdH
	Cp1HS2Cj8k1bGRruY3cQJV4e4NhM39vJAB617Rze61gMkq98wFpLl8apSCIexmAxIUp5V8Mof1O
	PraMuG4qnD8e/FiIDD3buq9NK0Rs/87dPTNAfV1KQpt+KGnXmG7dznKiO1eIbYfU9ag2ql/pCXT
	Ksmo761y+vEya+p/QbnjtjIggltT01HYQ/hV6ceE0+TPAkhtRccLCdCoZThzOWFGt8KJcWPSvfQ
	M8lRvcSEIi7FXxwzmCgHxk3Yaic9s9Yt7pM56ewTCTU2k6rZm/WIgeqEXPLuh1A1Y3EzNKoQD+z
	yNF4zIp7VpgggDk4HPl9/ykhQncffQXNw3YpaczplSALgfFRxcg1NnoG0xP6dd6yR2AiosTQ8k/
	UxSvQcb0k7zo6M7Gb9lGnXTxIwewviXK8pTmGghnJpw9hRZ8tI2BlfqrLmURa5FX4Ad614bt7KK
	6FP4/PiH9m4KSoc95Euy3lwnGZkXrHeB/eMyYM3/VFIKOcM=
X-Received: by 2002:a05:7300:3b0c:b0:36a:238:1485 with SMTP id 5a478bee46e88-36a4244276cmr1870508eec.37.1793322319336;
        Thu, 29 Oct 2026 18:05:19 -0700 (PDT)
Received: from localhost ([2001:5a8:4296:4f00:50b8:8e86:d398:7911])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36a42a77c0dsm2458500eec.26.2026.10.29.18.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 18:05:18 -0700 (PDT)
From: Alexander Goodkind <alex@goodkind.io>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	Alexander Goodkind <alex@goodkind.io>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tarick Bedeir <tarick@bedeir.com>
Subject: [PATCH net v2] net: ethernet: mediatek: preserve sibling PPE bindings
Date: Thu, 29 Oct 2026 18:05:17 -0700
Message-ID: <20261030010517.45639-1-alex@goodkind.io>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_180522_474885_17C155A1 
X-CRM114-Status: GOOD (  14.19  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__mtk_ppe_check_skb() clears entry->hash for flows bound to other
hardware slots in the same software hash bucket. mtk_flow_offload_stats()
then skips their hardware counter updates. L2 cleanup also frees sibling
subflows without invalidating their hardware rules.

Restrict both cleanup paths to entries assigned to the inspected slot.

Two UDP trials reproduced the counter failure on a GL-MT3000/MT7981
running unmodified OpenWrt 25.12.5 with Linux 6.12.94:

1. Start a UDP connection.
2. Add a control connection in a different hash bucket.
3. Add a connection in the first connection's hash bucket.

AI code review of the original patch identified the cleanup problem
in L2 subflows.

Full ARM64 builds with allmodconfig and allyesconfig passed before
and after the patch using GCC 14.2.0 and W=1, without new warnings.
The builds used CONFIG_WERROR=n because the unmodified ARM64 kernel
already emits warnings. Hardware testing has not run for this revision.

Fixes: c4f033d9e03e ("net: ethernet: mtk_eth_soc: rework hardware flow table management")
Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
Link: https://github.com/openwrt/openwrt/pull/26107
Assisted-by: LLM
Signed-off-by: Alexander Goodkind <alex@goodkind.io>
---
Changes in v2:
- Apply the slot check to L2 subflow cleanup as well.
- Add the Fixes tag for L2 offload support.

V1: https://lore.kernel.org/netdev/20261023012529.5994-1-alex@goodkind.io/

Codex assisted with investigating the counters and preparing the patch.

 drivers/net/ethernet/mediatek/mtk_ppe.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -754,18 +754,17 @@ void __mtk_ppe_check_skb(struct mtk_ppe *ppe, struct sk_buff *skb, u16 hash)
 
 	hlist_for_each_entry_safe(entry, n, head, list) {
 		if (entry->type == MTK_FLOW_TYPE_L2_SUBFLOW) {
-			if (unlikely(FIELD_GET(MTK_FOE_IB1_STATE, hwe->ib1) ==
-				     MTK_FOE_STATE_BIND))
+			if (entry->hash != hash)
 				continue;
 
 			entry->hash = 0xffff;
 			__mtk_foe_entry_clear(ppe, entry);
 			continue;
 		}
 
 		if (found || !mtk_flow_entry_match(ppe->eth, entry, hwe)) {
-			if (entry->hash != 0xffff)
+			if (entry->hash == hash)
 				entry->hash = 0xffff;
 			continue;
 		}
 

base-commit: ffdf678dd16610e3f006dac904bd37c09684673c

