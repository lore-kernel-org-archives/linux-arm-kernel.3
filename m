Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D365AC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycCZr1DOHYK3NGuQlv96d4C4FusQTmPajbEtsuC5F6M=; b=lWSGTJflFsgOlTdzM+KOWDRiEx
	JCvlSDxqvwZVl+SPSGt0qNlrZJgvp5yNT9T4VQseRdQ+8Q/KM63v/jrj0/MW25jjo7yGd4v6SJjfv
	bONcqfzXVNSUo9CbV2RxVSdijYCp2F99/bBIhuNSL3VZT0YZs1VBu33JyBdVB8Rk+XT6wtn3C6icl
	HV4JQ25FFrTisw2e/1o5+GZQ/ihgyq3VLW7pl58fpzw9MqDj7wP3zzmypqqD17uhedrKCxLF77Ko7
	BSjtJBL9z2LalAEgYLmIlTNnOoGChQ0afG6Nt7AWvyO/jmcM6BoWK9tHmBa0msoYA/ipbeHZlxa/W
	9/gcERPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jQn-00000001eo9-2GRU;
	Sun, 13 Sep 2026 12:35:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jQh-00000001emT-18hQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 12:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CBEE60E19;
	Sun, 13 Sep 2026 12:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FEBEC2BCFC;
	Sun, 13 Sep 2026 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789302930;
	bh=tpXTrrpS2ClXOWqOB6t0u12IPPhcA6rQ10Hyj4Z9ol4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W/U0OA8zGRDE5m2v89XnSlvORGHG9y1A/RI9PYHw0sG2Ud6qpLy+UvTYUEzy4pDF+
	 HH2zEuNKomtBp7WJlNDCyQqvu6mIEzDMQaiX8DYCjEHxFOuYjd8XofWmwUUCE+MsCR
	 5184NRH/JpfE9i8eRYSUOENWxhJRwhR2gnqcY4JMx2iSm/gxz3XzeUElDQkXHEcjSE
	 m9qg9rXF5oMwIc5ov8zV0ZeyIId3fhgHH4yanZntts+b3HkUqihLyDW4oMjOT08+HN
	 cs2g/TWE6OlAYldU36I+QE/jTPXgCpX67Tlh3xjV9MOngYIpSr7505RE9CGHsgYLKB
	 svXOKc4mwGC2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F05C88E67;
	Sun, 13 Sep 2026 12:35:29 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 13 Sep 2026 14:35:25 +0200
Subject: [PATCH v6 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-for-upstream-nbxv3-dts-v6-2-058566b93ba1@free.fr>
References: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
In-Reply-To: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789302928; l=787;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=7+LCXEAC/QKsgFvm/oL05MEfz8uhqFfnGd3UM0Nw9co=;
 b=1oGd/d0ozcrFqT4OjRDcNgVf1Xl1q5HLGN3zuVQYhzfS+IvhVgh1h5VsfU03PzyZHtX+/QySr
 EBUclC7k4sRDnvlX+0o3pWdtPY1qKTR1CoQ4xgFio7uLUjsq/YyFikj
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



