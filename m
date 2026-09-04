Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5966C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yGBXxJGrq9CpNREKuNgAMIWh4atD8OtcoEN+4Ih6cA=; b=NsTrCVNFxC/nx4qASMUhQPU6wE
	LIfLRfqTJKZu+B1Lre7Yko1CfHq8KpuBYT4O2eVxbV3mai+ry5/YOe2BqirXeY0tDbhD9mEidZ0Ai
	SblyZ2qm00XPui56xZXEP6yc7s++3m2iijZN9pDh53rZuTtPwHMIRt2BXRbf1xv9cpIqmu4nmkpX5
	Yz/io13r10qacs8CnGyL1ISlTmwrGg1LlLEPxDLB1/D14UbUVVb+OrJq3njzvshuOWa50Hj7mh5wc
	L6eSU/nDSQCgBbLUWrj8HbbVR8KJoX95w+E63ILK1jQUIemDt3ux7XUvLvok3RdVwLi/9VWN4BoC0
	jEFW22ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TZe-000000025kp-0ZGa;
	Fri, 04 Sep 2026 13:03:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TZY-000000025h8-3oyv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:03:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AD4F84E4150A;
	Fri,  4 Sep 2026 13:03:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 796906057F;
	Fri,  4 Sep 2026 13:03:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B80511C7AF0B;
	Fri,  4 Sep 2026 15:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788526987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/yGBXxJGrq9CpNREKuNgAMIWh4atD8OtcoEN+4Ih6cA=;
	b=uLSM5qOU/rSSfmjC4EZZrgeGTOKUf2TrMmwr89x8O/arV/ia7lxHbRzKi8bBVndXsyuXp+
	Qmf6gEiQ8YgYKZwf1rQ+KQXvw6+QmWg4N35Mv/6RwyrZ8e3MnKqAv4lLAktKmeLGrzz3pK
	Ho7fAjPuhehvTrgvfNMFEzSFjow/UdXAWqDq7jWGnVYXAKpDJzClUqMLfhNqvg2Dp7hHGd
	nftsnzCJWD+BgjhijTX6GHXVKKJvtQH9rg73H7nqxAzeBnvq5ZAEWfY1MK6vFF964+uAsZ
	x+uCnihHZZqVBnjyViFV58gXnvDWUlhZsmFEy7mbs1cT7ZjyltZ/grGg9Lp0CQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 15:02:36 +0200
Subject: [PATCH v2 1/3] dt-bindings: nuvoton: Add NuMaker compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-perso-ma35d1-upstream-dts-v2-1-30ce255a401f@bootlin.com>
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_060313_092133_4FCE63D4 
X-CRM114-Status: UNSURE (   8.53  )
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

The NuMaker board is a carrier board on which the MA35D1 SoM may be
connected. It has a lot of available peripherals.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml b/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml
index fb190db61525..972f71a7449c 100644
--- a/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml
+++ b/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml
@@ -18,7 +18,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-
+      - description: NuMaker carrier board with an MA35D1 SoM
+        items:
+          - const: nuvoton,ma35d1-numaker
+          - const: nuvoton,ma35d1-som
+          - const: nuvoton,ma35d1
       - description: MA35D1 based boards
         items:
           - enum:

-- 
2.54.0


