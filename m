Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FB1CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=puKIa6gq41MuuFUv7F0TBXGg6p/QotAOOyBKeGipZeI=; b=quMar0VjQDU6lH9iYUCcbHkpyE
	oSGszJFPBjmIHCeqSWPmsbMKThy9kDShitmxh1/Cug8YFInEwfuNV+E8/ApupY99PPHOMUZK3LhSp
	/77lWDrst/rzZywZiLAnWBEe+ZM8376jDOogZ/m+dRs1mht3aexNHXa18WiOHp69YVt0IeaYwrmlj
	5zmldFBFPYRaQNo7MdA9ByV667FDr75WlZ4aTQL/jqPdBXIEWb8PRrblgCluPPp5e6D+DPqz6MVO6
	Ne7rATw3u1SccEFJMOSpQh56Gwi4pjZOVTuVo9nTJVPUhOgXJ9IsSBBKkVhqyxOh4ebCeNiPxMmg2
	3qzyoRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oc6-00000005vtc-3oWG;
	Thu, 09 Oct 2025 11:15:14 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oc4-00000005vsp-0PT6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 11:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=puKIa6gq41MuuF
	Uv7F0TBXGg6p/QotAOOyBKeGipZeI=; b=FkLFTp77mkvSYo4RqC7Mfc129w78VD
	gbvI6LJWwMjwLtBLBa0daDQ6VFe8ywwZpA68njjeqAktFHJunsk9pbcFnWzpaGyv
	qo93t21LVqQaejjdR35U9wD8EsASkA2F/f8nGStV5pv6RnWpLRvbQpzhTJ20sqi8
	FPT0w62R9z1o9R1aOi43hoLJ2EYfonqgz7Lrh9y+gH1fnT+BgbFZh/Uuce+PIaUp
	poCAM1m0TIAXrp35ptlo0+Ko5sZOOIzOT3GfPd3Kf13GKzscC+YMyUTFlvMEik3e
	Vyy3ewmsqZhPaMdx50d4S0ZR/tQZIndaFUVM4z8kj9nofXTwizu2ZAHA==
Received: (qmail 1052996 invoked from network); 9 Oct 2025 13:15:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 13:15:05 +0200
X-UD-Smtp-Session: l3s3148p1@ro286bdA5IggAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] dt-bindings: bus: allwinner,sun50i-a64-de2: don't check node names
Date: Thu,  9 Oct 2025 13:12:59 +0200
Message-ID: <20251009111500.75198-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_041512_434156_6453A573 
X-CRM114-Status: UNSURE (   9.65  )
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

Node names are already and properly checked by the core schema. No need
to do it again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Passes both DT checks. Please let me know if A-F in unit-addresses
should be fixed as well and if this is a seperate change.

 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..52447768e65c 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -44,7 +44,7 @@ properties:
 
 patternProperties:
   # All other properties should be child nodes with unit-address and 'reg'
-  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
+  "^.*@[0-9a-fA-F]+$":
     type: object
     additionalProperties: true
     properties:
-- 
2.47.2


