Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EC2C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbTH+huWAS3NLB9vrD3QLANDbQWeqs9ZZSfZlT3yGAw=; b=pQ4lkzJpZlx6YIARkrnC6Dbr3L
	yDxV+cEZRq+j6eCMjDI/pQZp4YtH7pHJxavK81LMrwTTtxya/fTPVwEHnr6CDo77HXdBtTTZcq3Re
	WVlUA2hFit90tEp4qHGw16pgsd3xpwEW1rby0eW29JNmw8En2DS09htHuPPqLnNHEl4ZqWjZbzWQ3
	yYr0nzUjcd3iJxqVTC8bDhQtkBEEjCEMQSzJgh/dVoEGlUXZZlV+YTdJXMucRzNFAaz+3XeTH7cor
	VtUjOvRUXjqeK3uOKIfid0WBp/MDDEV04WI8hzXMccgHd1J/HpkF2lUpIEb12EJshYu6HkJOXcMBd
	fxY9tXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vCL-0000000FyQ9-3pel;
	Fri, 11 Sep 2026 06:57:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vCK-0000000FyPC-10nd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC042414D5;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90CB7C2BCFA;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789109839;
	bh=5rcMbUAdobuAGakJIjIneARVnmyrfS5TkQFUk1rbGpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WIoAsF0IYxSKmWNSLOa71196St34gBmQhVoLXdfc2z0CqXs+68afjmEHbjflvM/sl
	 5kd7Bdlh74r94ju8YW7Qfp0M9S6HDEBHpek790LC3A51citrlFMM0peyoCHyKI6r5D
	 iyIgbLqSYKS7Oa8r9uSQdoZoIELr3fSHcW27Dgkfr8egN+PSqpIFSW9Iy8HivQUu/R
	 2dE1z/QD4akO2ee2u/dlyYNgWQ77BB8DUSutrrwubrcI5uD716WMs0NOA3lcWAyIFx
	 5veRT/MHPFyFYcBVlhkqeLvywLlL65VTGZPOW0cOq8IwtJshdWiIMPI6F0f71mvTOD
	 LjH6FK7uPLDAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C3FC79FA1;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Fri, 11 Sep 2026 02:08:33 +0200
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Free Mobile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-for-upstream-nbxv3-dts-v4-1-2fd07d5575ab@free.fr>
References: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
In-Reply-To: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789085313; l=925;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=x762//eHMd5qaHdbwwprESV14msPmnNZ0HZ/Q3vEj5Y=;
 b=T5P2Hdy3EeWJxJPxzR376NinjCJus2xiL0qrZAYOf1cWVBWICLtWbe7ZMggOHKPsAz0rElFph
 swd7k/zygEqBwO1o9uHDJm1MT8ponwwRdtqZTtf2Nu5xSdfMInzcVmI
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

Free Mobile is a French mobile network operator. Add its vendor
prefix, used by the Nodebox v3 CPU Module (freemobile,nbxv3).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693734..e467da45cd7ac 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -626,6 +626,8 @@ patternProperties:
     description: Freebox SAS
   "^freecom,.*":
     description: Freecom Gmbh
+  "^freemobile,.*":
+    description: Free Mobile
   "^frida,.*":
     description: Shenzhen Frida LCD Co., Ltd.
   "^friendlyarm,.*":

-- 
2.43.0



