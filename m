Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057C1C88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crmm6JozHjgoM/1SjWi3Rq9SFKTz2sATCscmVYoA8Ho=; b=fEb+CrD0nsjXQYN7XYyWezz/k2
	ST3aWAhnjFeqL6kym63mCkLBNBBkD6lmGUzAy1+c9KSGjXsq0+LOpzIA/DCFeH+OHi1rqCMdTNuWs
	IVBhlDkU3rBEDgSNGwNk969cSYmVeonxqhosAGlnrovKT8ZTmLqyncSJHJlhS4h593VrgzRhruvXd
	XSHWUhfONddtX/Y1ziG5OiuYfHDhg8y7Ky1FjenXWh3KG9t4rZaxRhh9SwE/+PSMNZHbEGYVnRFhQ
	6Ie/UIAREBcGMaiMY7E89uoG7GlPcm3KrQn9ySVyxuCiNMpZ1catKsiMpI1yMeraphoW49JxhsgR/
	ltf2jTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Do4-00000004dxj-2jqA;
	Mon, 14 Sep 2026 21:01:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Do0-00000004dwf-3TEE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AD6643EC4;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2943CC2BCFD;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789419696;
	bh=Gt3QugH5YSeuFpR9N/CWqvm4OyVCPWupQ4FMz8kahjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uddjLK3B/Ph9P+dFjIXo0798VlyyUQ28oCGIZ/9w1JPRdTRh42GCzHFd6c4yMjr/c
	 JLhVsJJXj5YdDSJVCmFDDcyH+PM7jISDeSqK4d3JOOxlyJKRfTW29Kj3JEhcuzxjkt
	 19/hwWGTrhzUMHD0zJzpYJ5Gz4QJnS9vOZZ+PYdcNfp/W/giPu1aQPkaTfDNuEYsMi
	 lo+iq2QRUK4gD9I4Y8eMXFjG8z31lOcJQ80Oy1Ap6XBIuDQ8hVqM1okdGTWlrOhWv0
	 OPLvIFK2igYpCpn2c4KDEj0XfIGMyk4YdSjV/MijA5CPTUzqtYdYiJ2B8iZiuRTZdC
	 P9G1WryAArsPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC45C88E73;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 14 Sep 2026 23:01:35 +0200
Subject: [PATCH v7 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-for-upstream-nbxv3-dts-v7-2-373a142b08d5@free.fr>
References: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
In-Reply-To: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789419694; l=857;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=aN/KjzM3w/R03zSyqrxMJrkTwr6xMG2+UX7Pqb6dLaU=;
 b=xjO4NxMapAH9CrpO0SPfAn7eKAZpx4MSyDkJ2rWQKVty1WRC+RxcsnS0P9RuCwvYc5AX+NrPw
 FM6cXUzeCw9BPA4CvGgrx3DpCDwpfQ4kpHThdmwiHarb9ekgzjWatyE
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

Add DT compatible string for the Free Mobile Nodebox v3 CPU Module, an
NXP LX2160A based board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..f8ea8d51b8bc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1930,6 +1930,7 @@ properties:
       - description: LX2160A based Boards
         items:
           - enum:
+              - freemobile,nbxv3
               - fsl,lx2160a-bluebox3
               - fsl,lx2160a-bluebox3-rev-a
               - fsl,lx2160a-qds

-- 
2.43.0



