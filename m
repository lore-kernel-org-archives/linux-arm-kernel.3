Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BDC6070D89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mOPZLgIp;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fY2vOzZo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7RB0aQ170QWbQt1olwfSEj/M8xmgDSopHSlP7JzynLU=; b=mOPZLgIpcfjqNp
	+Cn0KpvnAHSoacY40ZLjG2uF+RGMU1dbxyRgpiTHdUmyY42RlZ38AxIwv3kAdaInLOsV+gg9iJPgH
	R9orLOY4PKe+aG3l8KbgAUjJu0xOI4ZruGU405lHOXwEdAKxSszM1EbIgw9gon40RqIqHlF9iNKw1
	TiBTW3KFZUGPbF3cM7aMxu1sHjBYOedm/qaGKWRRpLGhyJNTTHNnckn3SS8951hX1UnjNJTDoTcOU
	IOEe4EIkNswkyaoJEnOr93LN8qEItHFXv9cX9OYSYhpDHGW7hAAqERIB9esxZZ//dwY7UddEKEtWh
	WOFYw0awoC1EY6fuAB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtWQ-0000000GwbQ-2y1C;
	Mon, 02 Nov 2026 15:00:30 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtWM-0000000GwYy-0Ktf;
	Mon, 02 Nov 2026 15:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=7RB0aQ170QWbQt1olwfSEj/M8xmgDSopHSlP7JzynLU=;
	b=fY2vOzZokSwjB+uPD0JTzcUdkjb5JgFH7E1Ftrg+qYS7rIMuxC9U7um3J897GE
	W8Z11MCwqPvjIwqbYmgHx346pU5igCnJJpE7z+7whJGZN5RunueVg6u+dqlw7r8G
	9xMmSUiu/u351VadXQJvt8wooYopNK1ZVBx4DQtTHtxzY=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_yh5pehq8uWTEg--.2912S3;
	Mon, 02 Nov 2026 23:00:12 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Mon, 02 Nov 2026 23:00:01 +0800
Subject: [PATCH v11 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-quarkpi-ca2-v11-1-eb246076a82f@163.com>
References: <20261102-quarkpi-ca2-v11-0-eb246076a82f@163.com>
In-Reply-To: <20261102-quarkpi-ca2-v11-0-eb246076a82f@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID: _____wD3_yh5pehq8uWTEg--.2912S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr4UAF45Ar47WrWrZFWDJwb_yoWDZrgEka
	4xZF15WFWrJFyFgw45Aa1xGFyqqw42kFs7AF1DAF1kA34qkws3Ka95t343Ca4Ikr43urn3
	CFn5JryxWFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_pVbDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+RxdymropXywwgAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_070026_588515_B6EF7EF5 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
computer.

Assisted-by: Hermes:deepseek-v4-flash
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74f..a3191bb909b28 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -182,6 +182,11 @@ properties:
           - const: alientek,clrv1126f
           - const: rockchip,rv1126
 
+      - description: Alientek QuarkPi-CA2 board
+        items:
+          - const: alientek,quarkpi-ca2
+          - const: rockchip,rk3588s
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board

-- 
2.34.1


