Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDBBC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L/XcuxQLLZLXrKN2g2/0ioV+GT9Ym5AO4xWn00BwKE=; b=jjAo3HlMEAslUBZ/ncdEdrtRAv
	A1g3lKCnLgkmpUpl5RLF4eL0N7GWVgaBd/GsIXThds+/wMUxVYCKFpldIkwhmfRnsJVYC8QhROTV0
	hivSnW/DXRUJ4bzeR5yQouvSYv6zEZ75XVKCnSIwicmtUWmS9i+SoOXwUAW4JsMb6W5SZMt0vWZ6o
	ESvf8r8vKd6+Nx+yg4qZVQZLiLhq5RVhw698RtMSDfR2VxEnj1GB7/4Dt9zwnWgm+LKsRY+LTvOug
	HSQv2abYuSZaTKTjF1+Pp+FkdPbHCt3cVHJBMqG5rmIoMtkJYJtk6Z4sKnC9U2qt8MQzLphORXcb8
	ExE2eowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671a-00000003q7J-3dQl;
	Mon, 14 Sep 2026 13:47:10 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671Q-00000003pzi-3DxP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:47:02 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5L/XcuxQLLZLXrKN2g2/0ioV+GT9Ym5AO4xWn00BwKE=;
	b=oU00nPDT8pygQUeitTPc/oOUjztd4RRiMrYBU1E9NgaMH86ZSQQujE9qg8N+lpXn63sRHi
	hr8Qrw8fMkl1UboquDjythkKKmdml12yVpupkQ6ICa5mQYP7Z7uUz6UznsZVBcBj/pLCMn
	NRaTFGvwEBlkMixC7cEp+24eMGt61DOByjZa8nAP8M5STQ+wGy1zPuLoJFfTldPFHC0A+I
	bhk5g65oNeqVqz1EpPTk/hTcrlufnBYUfa9IGI+GP0rnLI7rKZY6w3styiUAjBfjmP0mtl
	DbeepTKxl2QROnLeZctJwPqQsutYnemPGRO/3lcN7gWgk2SBYMW+fjERuKI2Mg==
Date: Mon, 14 Sep 2026 15:46:13 +0200
Subject: [PATCH v2 5/9] arm64: dts: imx93-kontron: Make USB-C connector
 "device-only"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-5-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=nBXNsn5j9wvYH8NLcZ6PDt1KYldwEPOzwtDvyon9Z9k=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1PbEpX7H7CnrDz6fPVMy2V2x87Z8V9eZ/HA9bvoL
 8UrhlmvOkpZGMS4GGTFFFmk+C1e25rF+sgfq46CmcPKBDKEgYtTACZyM4Hhf+TsrCD9LfOra9Yo
 LWZtTCi2bDgyU37PlEt1330ubTixyIeR4bDf6Z9sHBsKneacj7B1Ob5nQbIsW0nmUguv8xvX5O5
 Zzg8A
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064701_011175_D0472450 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

The dual-role support was broken on early prototypes and has been
removed in later hardware revisions. Reflect that by setting dr_mode
to "peripheral" and removing properties related to dual-role usage.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
index 4620c070f4d7..0277640d7c4c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
@@ -158,12 +158,8 @@ &tpm6 {
 };
 
 &usbotg1 {
-	adp-disable;
-	hnp-disable;
-	srp-disable;
 	disable-over-current;
-	dr_mode = "otg";
-	usb-role-switch;
+	dr_mode = "peripheral";
 	status = "okay";
 };
 

-- 
2.55.0


