Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F286C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fPERxaZk//DZuEPNpiFjgKNT/DUDadeVVhSh+mz3yw=; b=EzdFeqgbB0q0MvD7TKBB25aaBR
	4uzBr6en/eME4xWseHnB2Iw8Oeo1aFh5jnzBlPPy8nvrf7eYHUfcMMwbOKqdSkkQVZf7naAz4E8F5
	eN9tnZowXEPBQxM7IaXVTfVlfl9fHU/BNOkBpbaIcyRyOfXPXwI1MDnwqrowuXRNodASCUe/O4PpV
	oD0k47M+zRO5g/VBBOi6fyp5Xh4gwbGrB6yh8CLIHY12FLpxNvdEVFaqvSF/gCbMQ98KO4qEH1fLi
	OOHCFP1ofLu1RZVQEeGVPhrUCCRxfPsC1vxbw8298mzF14NE4KMS/ofxTybMQMfWAk2YSxFleZ6jZ
	Ye2JyukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUsu-00000000iOf-2tSE;
	Sun, 06 Jul 2025 19:18:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUON-00000000fGN-2nHU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 079E861465;
	Sun,  6 Jul 2025 18:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47D17C19422;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=vw83PoT+fWGtrCfbewhOmufxkYsCLQpM0AWkoRPHWfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jGDDlPSP260CPLUVqu1OLB2Noj1oGigMpRcEMAeCiCwySStycpdO6Ic7PTOEQ+MNy
	 scXdguxKubBx830idf1E9XSArmbWtqHJV21Pv4g2FdwPGbaW9+1RzjrxgIQOmx3rnR
	 nxFMeLOfeIr3HroWFX0O/XyN9KhNf9ppmrGDJSmgxx3QcI7ptSxMM73D536lfR1TYf
	 XbcXfWi2WbQhjuPOXsBwMdoCsn50nQSbP2eFa+3cx0XmtMsegjGHQZZ5IUh/sIRBd1
	 RMtj5+eQXPLgzXbplCfWqmaCAyytGomCex8P1qJMyF7XA1feOI5bAaoLOsg3t70k3h
	 1VYED1Q7rtgtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415DBC83F09;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:07 -0400
Subject: [PATCH 11/11] ARM: dts: lpc18xx: add missed
 arm,num-irq-priority-bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-11-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=846;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=4fOjzjyuG5LcIby6pMbBo34EQluojfYnUqvpnhe6tYs=;
 b=U4ZGB18/725NcA20uH867GM0vXODJAffGPp5Nsh4hFcW7DdZ7HVPXiKDHemOdimHvz+joXaF6
 vg2989NPBcZBhuc5QIRBhHsEqCP/P1g+3r3TTeBkFmh4X/Zc7+NfgXX
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:
arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
index d212ca252b06dc97a0cdbe5ecff42780b51a02dd..152e98cf0c4e2a3eb4f2c989600698a93b3084a3 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
@@ -537,3 +537,7 @@ gpio: gpio@400f4000 {
 		};
 	};
 };
+
+&nvic {
+	arm,num-irq-priority-bits = <3>;
+};

-- 
2.34.1



