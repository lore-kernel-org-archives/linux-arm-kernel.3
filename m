Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47867E6C616
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nG8WRDsS3aQLEGs7GtSj1/lBtlITADxa8Usay8tA1ek=; b=NqJgYMMTsi4vDUchGgNvrRjsIs
	57NsBtCmQU0WZaXguAp6CdtFprJBPg47ERwfpINiMNvmHgbFil/462HWfeTxxUHA016VR0OGyMQAC
	+9dok5NE7uiLj6SXggh0VsyQMbc0x0Oqu3Oum9WSQ/KqGJbRrdWEAeeQbZ7eDjRB4J1j2TVMQPH1M
	z0uMbx98B8cC3QJjded4jPRX5LOfXQKT6UmSfuDhtTuieluBaVRAtaVKRJf3zAGiVypsWVy16t440
	R615it9Y1wifDLxxzqwRtRG9ss3uUBHVD+04YKxG0EqDwqwXzOSy1byvxLTgWRUlwU3t3iaH/7kpW
	vkZNZJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINvB-00000008dIl-1du5;
	Tue, 03 Dec 2024 08:06:13 +0000
Received: from [63.250.43.87] (helo=out-02.smtp.spacemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINst-00000008ciT-1ARU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 08:03:52 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y2Y7m6CV6z4wNK;
	Tue, 03 Dec 2024 08:03:48 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y2Y7d10qWz2x9B;
	Tue,  3 Dec 2024 08:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733213023;
	bh=bNG16fxeZRe7PkHUfBJcI8c38q4ij6t/20saRuOZksI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lt97fZXt2qpb9pbxaFECX8tJeWDp8RvPwR/gLyBP0gnF9EhaSvJMX7oNyIoY0yJJr
	 nq4MQuni6iPJazUnx9jJOFD1FRzDgyTjHEIkRvZqioiHnAwNK6QhCt7STMIE4gClEA
	 1oECxoEU8t3EPPdLjdzW7RDU4j553QV24mP9PboLKDPIWaJ/RThGUIR5LhI91JX1UB
	 /Mity2lWfS6dFkHQhc74FzqLt/5aSFQ/O+iocoJntgDoR2ClC3P7nXP3kTqzpBIh4r
	 5EfnSEYLCtmd1fv6Xhbshi+4Gfwj7VdV1WJr8Ia+ab9RwuQXe3z47REw5FW6QJ5nRi
	 lZJPwkljuxcvw==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v4 1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
Date: Tue,  3 Dec 2024 08:03:23 +0000
Message-ID: <20241203080327.4751-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>
References: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_000351_386788_121CD3CA 
X-CRM114-Status: UNSURE (   9.19  )
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

Add devicetree bindings for Samsung Galaxy S20 5G
and Samsung Galaxy S20 board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 168e77375..fab29f95d 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -241,6 +241,8 @@ properties:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
               - samsung,r8s                     # Samsung Galaxy S20 FE (SM-G780F)
+              - samsung,x1s                     # Samsung Galaxy S20 5G (SM-G981B)
+              - samsung,x1slte                  # Samsung Galaxy S20 (SM-G980F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.47.1


