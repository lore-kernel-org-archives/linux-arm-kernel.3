Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE658E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIlPcnH7ebANMNhSm6ayEtbRBV91jgb3GNIkVPKx9Eo=; b=d/h5wlTFGc5AfL0GV98+SYPpcF
	dm1zgUWkWkyU6OARov7y5nsZ5yrpSFF56inZ4dFqhBY2R1FNv/SqyJzSQPkcZ/U46P1AH3tzuoAD4
	QVAI3aFbIZa8U0v+0ZrYPXGs8YYaKzeLjX4JRz24HTiy2DRLX/F9uj1ojv/65QH+t82cvxcPUFLtZ
	wNXSmYkw8OA9lkCAeVeAv0W9RcPJSX5K/LfTrFFKLBHYsQfbjWxWbnO6iekGXhk9toA9G2XX1XymG
	aMDDvQFJBBJTEKP98NxnsOSB2nSyz4oyeDC6n0MHXlHTwGMfiRGzjGtvdGQlVW2IpYfgzbr+W7UsZ
	Q8WltkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPRs-0000000B308-3luT;
	Thu, 02 Jan 2025 17:57:32 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPOS-0000000B2Io-2yju
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 17:54:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=mIlPcnH7ebANMNhSm6ayEtbRBV91jgb3GNIkVPKx9Eo=;
	b=oUfhOdQJFfh+NdQBj3asUTt3vO+gk+ANv3N2taJXCF9C1KScXf6ERzqvCbjG3xTCRATbWgp8tqVgTeAU3Jj0w6d6dhLYuZSIDEAe8EtqLmzo8Vf6+xds4XqGbEfwboXzd5Y/JqNU69XjLp0jAEo+K4SClQs9Gi8hFec71QSMUgU=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Thu, 2 Jan 2025 18:53:46 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
Date: Thu,  2 Jan 2025 17:49:59 +0000
Message-Id: <20250102175006.3675-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102175006.3675-1-lukas.schmid@netcube.li>
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
 <20250102175006.3675-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_095401_064235_34653377 
X-CRM114-Status: UNSURE (   8.71  )
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

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c7..a30ed9547098 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1027,6 +1027,8 @@ patternProperties:
     description: Neofidelity Inc.
   "^neonode,.*":
     description: Neonode Inc.
+  "^netcube,.*":
+    description: NetCube Systems Austria
   "^netgear,.*":
     description: NETGEAR
   "^netlogic,.*":
-- 
2.47.1



