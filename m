Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20563CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eb9ay5AnW2fV1awDzKz+XVDk1B94fKrdAZOJUHjUL10=; b=xfnOfNfxCthiKBnOJomO50LoUB
	6J8L2UHW53tELaYFoH+KLlMwWEmWJxaDxjAiHrFnYDO0JO+eDls295uGXLr/enImEzfr4/3Le2zjg
	8aXEOn1zlvEwcWuVVZT3EB51qG8omvYBGrUzJZcHAcYRZ5XHijDVdAUtG3ECDe04QhCH3vxApgtz4
	OrOEsyuLQ2aLEG/kK3kisdLfZ4ysnpqe7XjTiCvnzq+KYo2NnFeSFliAPayagGIjZ4UAnb5+PS0Fu
	i5B2USZViJvJ8XeIEWf5TTO75560oefQ0pXp1vax9/nAAofLRo4715cHhZGlY0ZKZO2yEGhIFhhBt
	6AsHi2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM10-0000000FyFP-1yZz;
	Fri, 05 Sep 2025 02:17:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEzj-0000000Dip0-1XN9
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Sep 2025 18:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Eb9ay5AnW2fV1awDzKz+XVDk1B94fKrdAZOJUHjUL10=; b=AB14jcI5qAXAeBdCo1EXPxDHLn
	bzkYYKZAAXV/feJUmz+NcGmGXVeuZhtawi10qPJ+Ogz5XL0rqLXm3t9XwsGmXcnAIOyUrnyJjWqir
	SSaG+je0y1jWD+6rNqg1Q5gHgZfs4VjyaBsaEyKXoTNaDQS18Z7cU9DpolFg3jScpy4Dg+b0DIpby
	NiWyopM1q6yZQoepYyw5WwRFr4KrM8b2J8seqtD9PlBhmLxJGs1xH1AxogcnJodYgj8L5VXvCk7ci
	+Q7veIaSmyXQjTxtix/JnE8gIy8+v/8QOG2foJYMzcD7HQXfmKnR2LB1/WXs4jTqPSdaa3T8btcIy
	tzVvZoBQ==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEze-00000004P8b-0NXk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011621; bh=pjc3OCcYZHxirYKLuK+PjKnhBVAQkE69siUvNNMSLrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RC29yujcH3tFikq4zqkeet21fS40JkSaMh9c/qcC1Y3DpLA3Ut5+As+kmDdZqJEMx
	 RmiOzzTSsgbnoYoayLJTsBKJ+yn15EexlZoTw5tAsnf9iWUiqvnZOs1M4tfVmQMche
	 4pQipC/UD/svMTX0Mlj5ZjKN2hnRlSxq22M/BNmCVgRB+D1wSdc9CBIm19I2h1FF6K
	 +maKwoYp/M0kYy0JOZopsF8NUSMWML6+FTS4eQ4eOKh6wrBqzufgpghJCgBmDMcjoZ
	 JD2WdB7RCCy7wRalnUadLg9ZQ4U8XNyWlVSFhQmOlM9VVraklXA27fWPx5l9illyBO
	 fhlGb7S1eYP5g==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 660573D1F52;
	Thu,  4 Sep 2025 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011621; bh=pjc3OCcYZHxirYKLuK+PjKnhBVAQkE69siUvNNMSLrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RC29yujcH3tFikq4zqkeet21fS40JkSaMh9c/qcC1Y3DpLA3Ut5+As+kmDdZqJEMx
	 RmiOzzTSsgbnoYoayLJTsBKJ+yn15EexlZoTw5tAsnf9iWUiqvnZOs1M4tfVmQMche
	 4pQipC/UD/svMTX0Mlj5ZjKN2hnRlSxq22M/BNmCVgRB+D1wSdc9CBIm19I2h1FF6K
	 +maKwoYp/M0kYy0JOZopsF8NUSMWML6+FTS4eQ4eOKh6wrBqzufgpghJCgBmDMcjoZ
	 JD2WdB7RCCy7wRalnUadLg9ZQ4U8XNyWlVSFhQmOlM9VVraklXA27fWPx5l9illyBO
	 fhlGb7S1eYP5g==
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Roland Stigge <stigge@antcom.de>
Subject: [PATCH 1/7] dt-bindings: arm: nxp: lpc: Assign myself as maintainer of NXP LPC32xx platforms
Date: Thu,  4 Sep 2025 21:46:41 +0300
Message-ID: <20250904184647.397104-2-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904184647.397104-1-vz@mleia.com>
References: <20250904184647.397104-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250904_184701_433284_645BCB2B 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20250904_184701_433284_645BCB2B': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_184701_433284_645BCB2B 
X-CRM114-Status: GOOD (  10.28  )
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

Make a formal change to reflect the actual NXP LPC32xx maintainership
for the last years.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
Cc: Roland Stigge <stigge@antcom.de>
---
 Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
index f1bd6f50e726..6b7f5e6f99cf 100644
--- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
+++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP LPC32xx Platforms
 
 maintainers:
-  - Roland Stigge <stigge@antcom.de>
+  - Vladimir Zapolskiy <vz@mleia.com>
 
 properties:
   compatible:
-- 
2.49.0


