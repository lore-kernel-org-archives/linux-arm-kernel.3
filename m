Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08D2FF8877
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61BEams5E7QCnHBwvE74qrohoXpk2OyXMR9XakZUfC4=; b=lhLgxnYkRl4o9v84Y+5mk/vaGN
	hrMM0lCBH+vahwsWjegwKHENcU8rHp8TxOgz+xbVZJOQRXgTwMmWnN/4X9RuT89D9SlBxQ62DHnwU
	nv21IB/SDvah0C/oRp3k/SUHEzH488o4WQzWy1EWihd6p/LoSTt+YOOQu/L3rDoUmid8uq/lbvnhk
	f5WkGcWixvfAaLKMxjZ20QKuwF1HMlLkBzlxodEfCCxWuAZ0wNWa8EIRK6EU1McoDg8uIM1WvXrxc
	NuDJAS/KDJ0J7HnA3aoWmdenfqAG3LUD+3lzMl+ercpoDy8XsfmD7Na3NKmyIIA2iYPEfL4imotCM
	LSCec3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4z-00000001tS1-1vYK;
	Tue, 28 Apr 2026 16:14:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4j-00000001sva-3fVH;
	Tue, 28 Apr 2026 16:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=61BEams5E7QCnHBwvE74qrohoXpk2OyXMR9XakZUfC4=; b=nx0SuJq9dYcRI+yJrD7kacvAGX
	57ohVTTKy/0Okge8ag4UmhWPKK777n6dQVRqeq+w37VjVs+q3M2B8FKVH1D97hlqOkuNNBLwoDvI4
	gUvJ7rq3kRogU/Ax4CW6Ee08Yd7fHwPbt1k9GPwXcs38jWIktFffIZwocLGuI8vBLc0whMYLIlib5
	lDR1RyeeRqSIpw3nv65Ah8dPhmqkTFf03ErU24KBqety3jDuLW4RmxbodRo7nFTQVfhk+AKvFP8ZW
	wA3H9KGi0tbyo7kzJjKrNPmsFOqbJWSmiXgDXVS9aLf+bw75a3+0lplR2qLw/HwDEI2nxpQSru0xI
	MZ8NxrnQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4e-00000003ZMt-0ZTM;
	Tue, 28 Apr 2026 16:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=qFPX/4eUGg2atGILKlG0XCijsAsacnxtqfiBlRM0ujg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lhGM6XmkAS/XN9aac2Mtff66apwaHIF74CI/QMbV7FfYu/Ob3D/H0l1TDkYxpG+rg
	 yQJPS6X8SoDaiFfW+GEDDCRzCwB9/cNwZohWKTF+PdXzgwSetBn3nJrLAERflpq676
	 xlVgKFl3lTBFv7aImbRpiuVtQELupHgHIzRrZ9I+wl3aOiL8SbU51eDK67b0V3Cx8t
	 CL9lHbI8+dHKcKTR0bfoW6DDMERsJEpq1/W3RhDJ40neTjWDQbVSjtzYDpHKkw+yMd
	 4uv+io22OM/fxKY8nTgY3rfwocbcvu4fSjkRqf4MApsITYTZVNYX7A2pARab35qVhs
	 v/pAIWbjsPlyQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 59EA017E15A7;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 94DED480062; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:53 +0200
Subject: [PATCH v4 14/16] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-14-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qFPX/4eUGg2atGILKlG0XCijsAsacnxtqfiBlRM0ujg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MmBkCuKWKXdwR9zUCQ9nXzhCA/OgTvUO
 D5O00vL6gEYpYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qa7nwQAI+Jwg6MSk5g3e70+TJtqWEdnCjKxIRL8rM6TRLLbms9APa4F25/iivCQNq4CRKm+af
 0bazVVRcb8QNDd5l3/6q5y5P6cEXFUmdMS2rAGazqdQgmZ5Qk9YOx060fCo2meLZ347Q7oFKYGI
 KfAMACMAoWbL/Y60ObYk71xYGWTF9U7Zv8YrlfqZHEdSPqWHnGlYEkav8Zq+fiKnxnoD/N+hKDA
 MEgX4u6pe8YwQwtVhONomXchiCRBoCxa+L1KjxdTfm39eKH0AePTGeN+SrNPgZXrhtcTnAQSttQ
 m3qdRtGEEGV9hsG/erk+hiIZZdNCsLpmh5tlXTNwUQzIUhaGoTHiCzOXEhJqeN07sFMyyfLQwqU
 O0g336YGifTLAYcpO8abgv4TftUNNYq44hWuZNa+o/1QwNdz+JgqneYMiry4B+hlMd8Aiorw7D1
 tBcXfvOQiIadT1Xr80NcAo/FhJxpsiRu2jSe8oN9Witc9dCZvYi4sxqA3Gi7tOR4zYJDli7w6Lm
 vg+JaNhpPejXbLxtTL0j7FJQKDNdE/mmnIHut07tK8vzR7Ch8c3oAcdzNXTAqziEIfX5OgzYNzZ
 ls93Q8rt2LcuDVOnj2rBHRbKVl25abMvjm7RjsfpelvzW5LHGEefWoeyEg4Bkd3Fypx+uGgcOi8
 vBkAT9uP7zpwCA0mnRQ4vaQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_171412_414747_0BDF57BD 
X-CRM114-Status: GOOD (  10.38  )
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

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 694832cc161e..80fe5993c6c7 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -624,6 +624,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -635,7 +636,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0


