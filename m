Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E55C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vB8wLIz0WHvujVMHowKC0Q/8HNa8Qgp3eo7drb5rVz4=; b=osYJv2R+9v8Za90jdQOTfCQP/H
	QqYXwyeL8OHnU6OoqKLh4j7QcwmjP2RXH0ndAgMzNswhJGFb0AKWqb2ov17loUhDQrA2M2/bx/OAx
	lsT2QDfptvz3oS0/Fx+TvBqZfsKLqZaU5i29s4t0D1kqBAONVaPUgFSqYmU3X3w7N5tq7cgofwBpF
	0cGjiZNuZAfL6RxpamMVFDD/4KVME9jgULM7SVS8ODkRd+vD1xReuV8ChcLe1VSdCLZlHR4cQXfG1
	CwoJlvFmX5FOoAN2HHjUPSSARmj59HMBxKy30gt91mLNoBXAIZMg9/+8o+DN6aJz0/NEt0hJeILHO
	vwGBRdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS92H-0000000CCMB-1f7N;
	Thu, 19 Jun 2025 06:46:09 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8w3-0000000CAuf-44qu;
	Thu, 19 Jun 2025 06:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vB
	8wLIz0WHvujVMHowKC0Q/8HNa8Qgp3eo7drb5rVz4=; b=C4s0OJO+Ikm4wxq+uu
	gehZUv4bdqSAzq4O3CqCynf8NYH7oW785lT+r/Zd9W3ay2Y+bJzquv6/Vp98APQE
	T56iue+3JgqqQ5yx8neUaafRN9YArz5blAqVkQ8OhQUqogFJiePKHHGU+XaLHdTS
	jeTFTo1c4NN09r0ruRBN2qJlU=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD312OGsFNoUtqyAQ--.3973S6;
	Thu, 19 Jun 2025 14:39:13 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/9] dt-bindings: display: simple-bridge: Add ra620 compatible
Date: Thu, 19 Jun 2025 14:38:50 +0800
Message-ID: <20250619063900.700491-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619063900.700491-1-andyshrk@163.com>
References: <20250619063900.700491-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD312OGsFNoUtqyAQ--.3973S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1UZrWxKw4DCw4kKF18Grg_yoWDAFc_X3
	Z7Aw1UJr1FqasYgFs8ZFs7Gry3Xw48KrWrCr10yrs7Ar4S934DKa97J34rGr1rAF1I9Fn7
	ur1fW39rCwsrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8N_-PUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBVxXmhTsFgHLwAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_233944_342880_91CEFCC9 
X-CRM114-Status: UNSURE (   7.76  )
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

From: Andy Yan <andy.yan@rock-chips.com>

RA620 is a DP to HDMI bridge converter from RADXA, which first
found be used on ROCK 5 ITX.

This chip can be used without involving software.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v3)

Changes in v3:
- First introduced in this version.

 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 43cf4df9811a5..421f99ca42d9b 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - adi,adv7123
           - dumb-vga-dac
+          - radxa,ra620
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
-- 
2.43.0


