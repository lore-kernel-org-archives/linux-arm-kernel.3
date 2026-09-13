Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A3DC88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8PVs3cb0umUtKOfPewi7kgORw+jmpNj/krhUR5Z1jg=; b=jAX27SvjBdnyz/18QRdIDBBEP6
	EHcVLxEBKNtUmmq8+/Rs6mIq36sMnO/9BNDUWUqoc5rbUquo75zIsEW8vZ9rU6p67vsOjwpsNt8Ki
	bIOwgRbnqBV5TgsvL4rdz/pktl7NgHoJWTlXicPuqBsphkSnMrN+TeKJYcsmAchhd/MT0hNv08X1P
	dmWdApUSKhZndKCBXu6y1+48JPTYbtWiZAs5cdKkNiI8jnaHJDlrOT/6ckH50ZAlSInnBPebRTAnr
	ChScWkiuLJDUpEr3B0Pkk+k7eK1WXzPVgveFT87dcZl6i5LQRvxFRSu7nnbMGP2oiwjgpOUki0oaO
	iVNdJ1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jQn-00000001enr-0697;
	Sun, 13 Sep 2026 12:35:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jQh-00000001emS-18hv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 12:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CACD60E13;
	Sun, 13 Sep 2026 12:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0447EC2BCC7;
	Sun, 13 Sep 2026 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789302930;
	bh=n5QACkd1zv3PhqXE3MIany6DDgK40aeV4SQY8yeovjE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EZFMlb9BsotBM2NZSyDuFcHxDha7T18SFy+34QfzVOeKMMzwvXWIA4XV3nfVh1n+p
	 gG81BH5GxFlNkgkkFJhPLSIyYkUl0zyLUwFrPFQctKBeo7W03hZ53b9jLT3fgf+0bE
	 hrGDD6+G3qnA6GWjfT4FdCNWlOk3O5RB1q3uw0QvAGmzeG+DCutSqhkOjZQG3zL4QO
	 51yJV3Ky41ovTodW10QP4y/mrQy0TqRQ81WMRoHCnrqNyyN4XeeqaON9aR/cxSDZxI
	 DSEZEbhGZi6v04myRdTY4uzw9U5Xw1MUds9cYfy0LsjmxHK1QM7BHdnlRD9vSfD/Wl
	 P93/0qcMOTTUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA05AC88E65;
	Sun, 13 Sep 2026 12:35:29 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 13 Sep 2026 14:35:24 +0200
Subject: [PATCH v6 1/3] dt-bindings: vendor-prefixes: add Free Mobile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-for-upstream-nbxv3-dts-v6-1-058566b93ba1@free.fr>
References: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
In-Reply-To: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789302928; l=923;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=YJnL8SVSS5jtnm6LBYWZbK3h+dEb8nY2DV6ueCzz3OA=;
 b=fvl1lZCoI/UaTwNi3UoWOr5b4xel7K6tYWxSTqp3ywyhpruGjw6c2VjrVB3UP3l2vyQmCPJmI
 HyR1lcmT2CSAhy1ei9/3MRUKWgVTXfMrsHx+GOF1yD/O/ku3oSHfPzP
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
index ba2002969373..e467da45cd7a 100644
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



