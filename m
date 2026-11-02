Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BEE606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IO6zAchO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0+V5tx9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9phe7MlXkSnZVQUiDyR0zs3nO2Cl4SD2MdS4tZqpTVc=; b=IO6zAchOAQZWg+
	tfspJs7mKrZpJvYGTReuHXWuToTG2PA8t/dKVo0Q72VfsJzWmRLTNwFomJMc2omYdp9bYWFsYAF4v
	iscacQC5sqUMlCHexs6R2D4wY68zTXgO8fN/u0xatmxkcxLJ/sUyDLcyhxFXmkF1tanCSMJyztQuM
	i/xgMPv9egWb1d7/WDtdSqdB6bB9GmDhPRfWN+DRvLxlCQ6tdHBKj7Rap7tEhcsVPXXwelghmT7yn
	bTYKwM0kc4Qhm1y/ogqVqtq1tY/KK1XYhjI9y/uXwYI9yL5N/WRwFUv0SLjfPJBWCzUoLUpyiPTw5
	rB6WRVxkvz1/JeqAUanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpGQ-0000000GATP-0DHO;
	Mon, 02 Nov 2026 10:27:42 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpGN-0000000GASP-2evN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:27:40 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1760860c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 02:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615259; x=1794220059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9phe7MlXkSnZVQUiDyR0zs3nO2Cl4SD2MdS4tZqpTVc=;
        b=J0+V5tx9zPuX4pZDws7BcPszakyxQOTPqlbPdify10XA5PjxgThORcefE36udkrtbp
         eHVoiXCyzTXQt2JpQR3aDew+gWLRiEPMpd5mZIV5j1euXPze5brvXAquVdNjgZHif8pq
         r2rvxLDYNnJDYiosRKVM88OaHJdG02xDUsWwkIf4blxPZ074JVvBv4Rg4zs3fUutN4V/
         Yig4IKmtGBzLLIWOoaBf3FtCrC3MBR8vcMe7WQEyWevDVTv+X4SkfDSPuisPbxLB3gPq
         iXcwsZIKC52TdDLWrRAl3l2hF/oDDazZBOCK45+cMaYkLpS2E0X3BPSiBuzBUAeKdkKi
         hmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615259; x=1794220059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9phe7MlXkSnZVQUiDyR0zs3nO2Cl4SD2MdS4tZqpTVc=;
        b=vKl4Y2HMIp8+CHUHb73Oca5CdQFCh2KSkr+pNJb0TluuBqJS0Dc1skg3kML3PzmKmF
         xSVbNzAUMLBXIYzbU3hg8aYyn34Cw/u1afLKWXPWmdTB1CQVqREbtW6gHUn3rvTVNVXH
         3UFxfH8Le86sE469Ab+9k3D7v64FesGtqCA+jEMT9NoCjwL+NQi2zDUQ6UU21RuBoNLI
         EIZRxkRK/C/LRE2p/fkWWR6ajygesXj7IP3ChjnXuqrNl4RAC2y3h0SzMDyCJ8jYeWqI
         koAS0+Jy0PQYbkCFo1Kq+VDetiR/8wf9Y8yzyOIE8neultaCYqh+I93Q+f1ba3LvRSei
         9csg==
X-Forwarded-Encrypted: i=1; AKwUvBzLix6YiXWUoTirzS5v82D2Zfk4pHDRWAF+WTw3rZh0B8djzSR9clFfLPZBpEcczU2RAeA3KxA0RSP5Be5XEMoG@lists.infradead.org
X-Gm-Message-State: AFq9FYLdjclfPA/t9oTwGvsjs+0pXdashduBYCQVO7y98hxzL4PjIls5
	EbHtXjveoHcbGJ+ambeIxkMrEuGn0n6SUhhMZwhvpMnLfuSloXIb2lRF
X-Gm-Gg: AYBFou2P29QTjHOLN4/iQp3dqxgvZrNd9xY2tzjxoK/FHdVZxItH8COLdL54Fn543Y9
	rTDmelEpWj2npjNyNAB8SBBn8NhDQbfpw1tWhRF66MQ7gOf/KsAv1dHi4/vDr0NDfIGpEGfnjau
	/DbjBz/CdFc1BjVyz0wsgSkBky4aad6khUGrqdpCVppxggrG68z4FzS1ntyCcrfYHe14oeDim6q
	quQP45SVqHvySxj0u5tX43vOfWGqtB2XTOhtMpvmEPuiKdi2bAF24ZUOd7UPFYWmmmafTUKnsU6
	2gkiOpqVF7Sr4Vkl6/oJRkA1E0JHFyy2oDrDZ+ZxN1nlQV33FcgHU11mrjATZoavdYEwQOMWvqM
	u/hnNqu9ABN8ipPYWrIobdITEgtSmyaElbd3qbv5Mwp9XkwCSj9MT3KmOP11uHLMg/gj2/XHewU
	Y8rduG3/2DZXPkcVfBBfEqRsY0QClL41gvI233mRpI2avN5AoCqNPLmjN6GiA7y3RIlPhNKGcmX
	/d3fzAEVscbWGyrn41DTgYdqwERtWcGiyDc3w+QhOleeuqm+wGnnC3VZ4gPWy+417/JMzaGGThx
	PRxmNMDdaJhAN3ikpFKLecJKtOXmLk0SCx/XXzFIaFw=
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr16458033c88.3.1793615258433;
        Mon, 02 Nov 2026 02:27:38 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm56946724c88.7.2026.11.02.02.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:37 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Mon,  2 Nov 2026 15:56:51 +0530
Message-Id: <20261102102653.272056-2-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102102653.272056-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-1-dinesh.v@adlinktech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_022739_674822_EBB6FD1F 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

Add the ADLINK Technology Inc. vendor prefix for device tree
compatible strings used by ADLINK hardware.

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..6bbfa5619ee4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -70,6 +70,8 @@ patternProperties:
     description: ADI Engineering, Inc.
   "^admatec,.*":
     description: admatec GmbH
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^advantech,.*":
     description: Advantech Corporation
   "^aeroflexgaisler,.*":
-- 
2.25.1


