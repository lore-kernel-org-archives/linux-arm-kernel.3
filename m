Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BAC606A7A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gi8jahWL;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SmBTXIbX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yGb/61y9dkyB9MrYGCIo/Wr1qP1fqSYSE3vu/mqfWqs=; b=Gi8jahWL81X9U9
	72mP1Tj2pJdSD+CHjcbEE9jv0r6VvO0LueRqaUViiQ05PIuE/pBkP1JF3A+Xko5/m6N5NG9MHrW8y
	dkUDM/eW2PyPiGMvFpe/eb3bukgyrG0Zt5Syc+lmcEPUBR2xsR1IOwxoWXRWxfK846Us3yYvqVvvx
	10/5c7rwpHvGkWSzc9Vz/Vut033PsxsYsrzNZP2WRalF9YmK7vg5ljhNsLOMVak/KtNRUzXTXxjZQ
	y2WaSfy/Z6+OobFTI/Rz2Be4HTh3u+SY4/URGfKI16JuYhYt3PpgsFoImVEVxiiiPP6/GBIxvFETJ
	v9fHjHmCzmXaOGk2CLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAf-00000002rvY-0O8J;
	Tue, 03 Nov 2026 15:11:33 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAc-00000002rtn-0rDv;
	Tue, 03 Nov 2026 15:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=yGb/61y9dkyB9MrYGCIo/Wr1qP1fqSYSE3vu/mqfWqs=;
	b=SmBTXIbXfYcCeT5yGNY1z/9RIOPcC8uK8E/yHxwP93vLcwq93tq32n9grdEBP2
	kYFSaH6VbZsBttNeV9Q9lIyzLhgZVt7OHRsd2EgiNep4bWbV90bhNmvsC9Ni8KIG
	wURycJNLGFUscMn/wFcYIAI5xQuvrbO48BO+4Opd2nUoM=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3NzWP+elqrXnHFA--.58335S3;
	Tue, 03 Nov 2026 23:11:14 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Tue, 03 Nov 2026 23:11:07 +0800
Subject: [PATCH v14 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-quarkpi-ca2-v14-1-290990440b67@163.com>
References: <20261103-quarkpi-ca2-v14-0-290990440b67@163.com>
In-Reply-To: <20261103-quarkpi-ca2-v14-0-290990440b67@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID: _____wD3NzWP+elqrXnHFA--.58335S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr43WF17Ww13tr1xKFykKrg_yoWDXFgEka
	4xZF15WFWrJFyFgw4rAa1xGFyqqw47Krn7A3WUAF1kA34qkws3ta95t342kFyI9r43urn3
	CFn5JryxXFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_pVbDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+RK3JWrp+ZImiwAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_071130_962834_F98209E1 
X-CRM114-Status: UNSURE (   7.18  )
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


