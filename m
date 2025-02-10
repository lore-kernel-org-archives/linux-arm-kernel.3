Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BE2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7LZo2mymbyoxBQ+HVYCFE4IwziNlomr+D3mfbsPVcQ=; b=kQ+t/8+i5eFRx6
	zlD/QlOMGjT+dyC7NyazTYFxcdNHxCRT+JXcG7HpJGjWhkDIF6AUx7xuQG7BIpHX44IvExXN1g4yO
	ddZojiIjLEn1fil77UuUgXXzhqZLVLyXixrUNYYeeUIGAOe3nmPeiCg+ZbRlUulUqe4pwmtqD81D+
	Nu+Fx/dZJXZ3exLtih1ZwM6jku8DRWdxcS8jwJO2sipkNRWI4K8ivECYqx2P4pVY3qHWqd/nGogof
	iBYsenXkqrCe99KCPc2/9UYYAPtMnBBTzW1913VM9NZ+dfMGbxe5KqUGUJIS/Ve5yCJYbSfqwjvek
	odq83kPtuGbdtKnhMagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thX5d-00000000cI9-2IG3;
	Mon, 10 Feb 2025 16:56:57 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWuq-00000000ZU0-0BX5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:45:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 160D2148026A;
	Mon, 10 Feb 2025 17:45:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7LZo2mymbyoxBQ+HVYCFE4IwziNlomr+D3mfbsPVcQ=;
	b=ZwlPk/EEHCFUY+znTldtIjO5fYWORis2QIZRHWBwqye73x6TlDNAIqmxTV02KONZ7hIlNL
	BbTXgOxSYjYl6FkT4ruIcukZk6T9rMXUK7joxvXKDc4XqlsxYFd7HFhdeL94l+yFMUyWDo
	XqMh1DnERQMtiX+h6T51jhwHgyt/0iNMjkn9Hl1wboli+b8RY/IQ+5GWV316kukApfpK60
	mIhpfwESXhoSI2Pq2A51zbxVbdrLD374bkMtPXPmzsbFmE5fVYj0VSWscfRNKQmy+ffnWP
	v7XI85fOimcPRYzaZxmN+SgKvcLMV88zniERCYZwAH3zHdHErjPk24gUf1n0MA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 07/16] dt-bindings: nvmem: microchip-otpc: Add compatible for SAM9X60
Date: Mon, 10 Feb 2025 17:44:57 +0100
Message-Id: <20250210164506.495747-8-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_084548_274446_32051A63 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The SAM9X60 SoC family has a similar, but slightly different OTPC to the
SAMA7G5 family.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - Fix dt_binding_check warnings

 .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index cc25f2927682e..9a7aaf64eef32 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -21,7 +21,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: microchip,sama7g5-otpc
+      - enum:
+          - microchip,sam9x60-otpc
+          - microchip,sama7g5-otpc
       - const: syscon
 
   reg:
-- 
2.39.5


