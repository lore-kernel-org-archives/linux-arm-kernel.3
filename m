Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C68EF506CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55aVh5zzvysKO2K9tzF58PzklumqwmTYgr4KvXL1AMU=; b=LkuP4GKFPl01yK60TsNpBnirn6
	4nzgtppCoxls6qk4NLLxxfnjep2/5TM0mfrKaH7XMi6VWQhJPPrd+Mgn8+zERQl87DY762Vi42WSb
	AtKCpskU/5mRThqgeZu8ZXyk/O1BVldsZRNyDp+sEsbvwB4rGznlVKG0rt6aLptiM7A7CoHLaWbis
	Q4BPbUYce0FezkNKk6+rN02rNtGLggm7aDxTF97FbYSg8TSaEClHxUZwE9w2t+p08DY73iteN8zM+
	TVEnBdGaTYpGj/9ke/z/IOI00sNuo6LeqP7oLHerZclnV+YtUwo73Yu3kKX27ClMVLP7o3YgXa965
	IaInIsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27g1-0000000403T-17rU;
	Mon, 16 Mar 2026 13:08:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27fz-0000000402v-40p0;
	Mon, 16 Mar 2026 13:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=55aVh5zzvysKO2K9tzF58PzklumqwmTYgr4KvXL1AMU=; b=PZdgxQhphRf6Xh7vSRKtGraVGw
	b7RRsKgVOtV1Y6WXj593pJa44iKn5Kuowk313U1/ScWi2A9eWIoeTgj6szJNarlVoomFwOPA+UFkh
	yMHWYzgxFKT/Fy43sZ55mMLEYrimAf/vRPdwplxEOCAhHshUhPTwGyeSn7F5Qg2T4R23qHCBvTmSh
	i/8tsWQiZyiFn+stUjAi7viA+YXwDPGSxr1FdD4/LXpdKG+FWZocto2LrxNvBDY6H6l3qozkaFIgw
	AycGzmmfcvPclYnD9VQJP2WywmIMKqwsiQ5MMLs+x5yRkg0EFDMK612ixJHbmWb3A22n/120GclRk
	+JvJExLA==;
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27fw-000000010lS-3j9X;
	Mon, 16 Mar 2026 13:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=55aVh5zzvysKO2K9tzF58PzklumqwmTYgr4KvXL1AMU=; b=H7NwRCY6gSaF/hEX5xAa1uMOQA
	GB57iDFAq2szDdlfPonj3pBkpV5FjyhtB7pnRN2NPMOB3OI6P/KBa5WAUbnxQO1PXQDY+J9xh2TmM
	986G1OZKxHIiSr+7GoJqPx1f9aDlBmBULvqacNCTyE3XhDJrw6t2W0+qk3smDbmTA8sMRpnuNAkCE
	YfQAtFlWE82qSozckVuiDQggb+RyDIQzAOYJkGvkwEKcPdpHZ8n+SQ8RTMa9AFZd7yMUfk3eUYEdf
	cwGFMWFIoFzyUew4YMzL+HUXTcuU59w5ggnsnd6cqq3B1rcyldSz7b5r1jfueaASZXw5I9QIyuI18
	/ha5rJpg==;
Received: from [185.94.132.237] (port=54871 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w27eX-0000000BDZB-3ZPN;
	Mon, 16 Mar 2026 14:06:37 +0100
From: Daniele Briguglio <hello@superkali.me>
Date: Mon, 16 Mar 2026 14:06:31 +0100
Subject: [PATCH 1/3] dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK
 output to IO clock IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rk3588-mclk-gate-grf-v1-1-66fb9a246718@superkali.me>
References: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
In-Reply-To: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773666394; l=1283;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=m6I+53NOmP/FBOxIqYA7/Pg65sLmXjAEQcj2H89XEVs=;
 b=xAes7lPb1gny0pILU/9Erd3+j4Q5USwAbUm9jmw8vsUJyLgpuRAnWHKMxnvBSHKyK3DQ6Xx1n
 tf9FDQsp2Y7AE8JiWH5tBF71qV134hxJEhMK0GHVYVyIDmukk6tmu8O
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_130805_035295_6F7F40B9 
X-CRM114-Status: UNSURE (   6.73  )
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

Add clock identifiers for the I2S MCLK output to IO gate clocks on
RK3588. These clocks control whether the internal I2S MCLK signals
reach the external IO pins through gates in the SYS_GRF register
(SOC_CON6, offset 0x318).

The following gate clocks are defined:
  - I2S0_8CH_MCLKOUT_TO_IO (bit 0)
  - I2S1_8CH_MCLKOUT_TO_IO (bit 1)
  - I2S2_2CH_MCLKOUT_TO_IO (bit 2)
  - I2S3_2CH_MCLKOUT_TO_IO (bit 7)

These are needed by board DTS files that connect external audio codecs
to I2S interfaces, where the codec requires MCLK from the SoC.

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 include/dt-bindings/clock/rockchip,rk3588-cru.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/include/dt-bindings/clock/rockchip,rk3588-cru.h
index 0c7d3ca2d5bc..7528034cff56 100644
--- a/include/dt-bindings/clock/rockchip,rk3588-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
@@ -734,6 +734,10 @@
 #define PCLK_AV1_PRE			719
 #define HCLK_SDIO_PRE			720
 #define PCLK_VO1GRF			721
+#define I2S0_8CH_MCLKOUT_TO_IO		722
+#define I2S1_8CH_MCLKOUT_TO_IO		723
+#define I2S2_2CH_MCLKOUT_TO_IO		724
+#define I2S3_2CH_MCLKOUT_TO_IO		725
 
 /* scmi-clocks indices */
 

-- 
2.53.0


