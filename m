Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42879CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxRTK280eRaJSscUvQGV3b3Nu054guVEz+hXl2jXrLc=; b=ohSKFnCr93U63uT1GXFGry8v9h
	MMeBLO7MptOLa7wOS6D7a3qLOZTHJSk9YGoz9bYorHOGxM8ONBFmOFEylXfSkvPgypyWBY2RfP5XK
	9ZxRGuT/pHSBanr4iuJqF9JXlTFd7+uwSK3lO3ZEeR4K2HhbVsvSjigUsN3w2G8ZBbLKF+rDYgbn/
	l1QvoY1wPLv8yJ1JyA6KAufTZ25jbzbbTiIv5yWqUOQxbb3Zlq1mrThFe+lYdwEkhwLJWwBMl4pzh
	3EsHxtCdAeY1hlYlyq6znVPBOd680ZS/8pFDheIuOsd7VG3FeoydMac1azpIKKrn1/Z+BV1aVQzUn
	VC09JS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5h1-0000000Dxxu-31xr;
	Sat, 03 Oct 2026 19:46:47 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5gv-0000000DxtS-35dO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 19:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791056795; bh=ZxRTK280eRaJSscUvQGV3b3Nu054guVEz+hXl2jXrLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZlwXJR5lSuWLhR9rn8DnUDDk+O4P7gqtnwMVCx6yVMFUOSqxxUzSWzTlG+h//PXbl
	 QAJJZX9M/DvxnfgiFcsQO6VcLtaDiAd6TMeWBXDW3gPMMPCMtZsqFIn7SYzXF10VP0
	 EwowSMItzkPxx6UM+Ke0f3oH37NViX875EJLIiW8=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id B9D93CB0; Sun, 04 Oct 2026 03:46:29 +0800
X-QQ-mid: xmsmtpt1791056791t1v47z577
Message-ID: <tencent_E21E2A584AF8EE0505C2C0809838621C8209@qq.com>
X-QQ-XMAILINFO: MMh0UbolYUoWrwNkUdw303N3AeqAfUAua9/UDfJxCA7lu/Rza2p9g002F8QBul
	 RXGmBJ1YAKYX3+/6K+lWMhpjoinANsNSnUYYmJlXzRHPzl9wpzlaGKXCulMhQC4DMUrmegmjmqTv
	 C2JCbi4MG3fEqQoRAB7lnD2w4cn0womBiFlaA0/aknzpLp2aoWb40Le1nhPhUcm2XBCDVCSqNr+D
	 Odq7B5V/XmrBRx3wtnhBOR+W46OMsKdOFOemXEXJ65Tg3r8V7XM1mWCTIFTwyLiVSfaXugoeSczP
	 G4PTZC/SRq6nzROY4YF+mppkP+p3x4tF801CDDPRt1UixNfkWqai8opNYUfH+sA1EH0IQjvT4ysh
	 DjNhEQ5QfUNKp+smTv+A4wgOWzT8DG7wEO7bOSZ5ORc5tU02e3xUCMo7dTc22WF4awe9HasK8jM6
	 tP3xh1aaL+3o2c3+kR2ERzStzhGHM2n2VHN91/QXZHFOQyyZ5x1p76VvEbPT/21MGwv/kyNAfBq6
	 J5lMi9PjBfFf3XOmU4YT4WxgIEUAab8yi8JofWlaX8NMj+Zgu0hSSfhfLVz+ExNUbvyJADxlTMQQ
	 UtmEvqj6oRxSP8tt0wKJLGClvHUv/AUFqVEBDCkJB4gDXSB1xsdOfC2raN7+E3X2X6uRB3VfK+LZ
	 C5pJOZJZMHfb2ALkToUZHEJeGKTQdWHtfGPljdkD+yjVTj6ibC3d2qZQiCCISRi/2kUIhVCPXmP0
	 nCTD7jB+TjPFJrtuAbh1q/vqX4zDftvHk5EHys2oDKBGvNz/9ZDbIiH4A0I2dFpvSK6Gz/a0nGte
	 2l/3WcOcrk2iPkORVFrp6GgkfzkABARTCc3OKEl5dQnJio8dtsn77LJalFVayWZLHWAjPVz39v/f
	 vDIAgj3LHrMCd/dvKB1LYHPQwbPmQA518aJ2WRlP1gyfwVHqLuJLVGYObfQkrRIX2zbbj1tyoy2x
	 mzU6B26/Wueg2PhGCMFj/XhuGD3z5431BqmFeK/jFj66qY0aq5KeQtLWLQwwPKJrOx9Vpq7ttrsP
	 A5+6ko4jhDew0vYBC6v8s7jeqrva/JmomEPiaT9A==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: Add EBDEE vendor prefix
Date: Sun,  4 Oct 2026 03:46:23 +0800
X-OQ-MSGID: <20261003194625.936288-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003194625.936288-1-2254650260@qq.com>
References: <20261003194625.936288-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_124642_310151_B378F61E 
X-CRM114-Status: UNSURE (   8.31  )
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

Shanghai Xin'yI Electronics Technology Co., Ltd. (EBDEE) manufactures
the EdgeBoard series of embedded compute cards, including Zynq
UltraScale+ based designs.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..9c7375d4f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -483,6 +483,8 @@ patternProperties:
     description: Zhejiang Ebang Communication Co., Ltd
   "^ebbg,.*":
     description: EBBG
+  "^ebdee,.*":
+    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (EBDEE)
   "^ebs-systart,.*":
     description: EBS-SYSTART GmbH
   "^ebv,.*":
-- 
2.55.0


