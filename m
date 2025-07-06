Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B61C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7lYY0b3ha+2ODAbf4u63bM2sHOeiLQc/hx6AC30VlM=; b=wzB2kYIxS6oDGqg1ikV+vmZT+t
	Gx7FQ1AhCV19WUlBnBoiK4FZENxR0/HsUhHkV4VIA4rt0cxzz3k9VQIONpJ7Y/hGl+yUqQ8ebzx1h
	h4yEQbRqp1FdS9pUJXsMnzo71+k4VjXmPjy3umreMUuFoglNt6H39wiH/PklfYfGa34RrGJ4s1CTR
	4cZcH3wnkC/LcZw+XatlNghRMJhYyWmojh+X99wkoa/cCj9ki7UmGEZu51AqLDEFw32tIY/0zF+gG
	Qc54/zpzNLDM0Brdt0SophR3QDZRSi2Ofpoo84KME6iUgToEsYwC23CICEpSA01vwZFFL7FkTN+qz
	48ksPRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUxV-00000000igx-0o4Q;
	Sun, 06 Jul 2025 19:23:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUON-00000000fFq-0I9I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7EA745E7D;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 231E6C116B1;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=EN4lHThYxhCk5VD08Uuv8dfUg5fUXUvUoPNAOkv20oU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C5dPbnbioOFxcnD8l/bx7wdEL9qFWuz+cUpeZIlHiQdZvJb/lfrDiZ65CcnZXbPgh
	 hbWopNauAac3EF7Z/skHlFUMZNDhwyucgn7mBBE/Of5G5E00FLBQn+6pBlTBAf/hXD
	 RKbvDv70ilnt4uhQCQ8/2XflsmCzdqN66uhF9ydlOO+qtAwVqOAURwO+pRFD9hTcf9
	 4EJlhCbddrZiTysxrIUUl6k2knwpwe6U0JN9CAU/HowsC21gDLMEoMDhLHnTMGsZCW
	 /fTaff1aaujyush0nUp9f1Nbk2DPr+vRtrm0F7lJZBnEBa2nm/Qtv7JYGhhHX9u07c
	 GWsLJDUaN4/yQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DD5C83F09;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:03 -0400
Subject: [PATCH 07/11] ARM: dts: lpc4357-myd-lpc4357: add power-supply for
 innolux,at070tn92
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-7-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=832;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Mj33KBqJ8qYPhYbxScfAHy2wCR1k2Cd/+ykWat59/P0=;
 b=4Oj/Af4XMkSutzkLenURHXGc8DMsWE7llQckfUU1wwfdGDUarn6oCy17H3FQKmVuIweGR9BDU
 8eJZtjwEViFAf12UnwD1ycbElA7uadkpJJB1DWYoAXOSkmgKkfCu9wV
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_114711_139306_B16D371F 
X-CRM114-Status: UNSURE (   8.87  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Add power-supply for innolux,at070tn92 to fix below CHECK_DTB warning:
  arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: panel (innolux,at070tn92): 'power-supply' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
index 22f7dd671c90d56cc4295151583fd4135c8b707b..ca91bb8f6ada6c4c3e74d4d76a2382f667bd2649 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
@@ -63,6 +63,7 @@ led6 {
 
 	panel: panel {
 		compatible = "innolux,at070tn92";
+		power-supply = <&vcc>;
 
 		port {
 			panel_input: endpoint {

-- 
2.34.1



