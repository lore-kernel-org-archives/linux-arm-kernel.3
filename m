Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18963C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z9IYpVErjOOZlKr0XRFOH+gDcIyJW1n1QWZ546iSBgw=; b=TXltNp97bzTOu9uPY8ptfdncYt
	cZ9cYZpEGV+D9Viaxyke9vx8EnkBidHOv5QRG/kPMMUFfmaLQLgJI9hGrEd/F4Z5DS0zWbQrL2PBL
	b4pEMwGbS2u+q6yH4nUe6yWQoPzfCum7CImdvsEmvNfA4tGoL/vTq7h3PeMI2ota1pCe6w3XGR54U
	N0w2SNFAElv/FK6Wi4rcipQiJ8sidoarIUbB4gG7vkS+DseEnFrRlOHXHbgRY0udL6Jaevs+asVGc
	2tUksa8pe3D1m7b4b1cQvkUae9UR0MeP+r+cOL6Cxe3s9hkJU0G/W+zZZAjpTqOerSfwyjLL1+cvo
	QIpgNdkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSi9-00000006mkq-1SgU;
	Mon, 13 Jan 2025 22:15:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSgH-00000006mVW-3q3p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 22:13:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSgC-0005dH-7V; Mon, 13 Jan 2025 23:13:04 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSgB-000KYE-0x;
	Mon, 13 Jan 2025 23:13:03 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSgC-008nKU-1W;
	Mon, 13 Jan 2025 23:13:03 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 23:13:01 +0100
Subject: [PATCH] MAINTAINERS: match mxc in file names by IMX / MXC entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-b4-mxc-imx-maintainers-v1-1-7605d3d8e35f@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAOyPhWcC/x2MywqAIBAAfyX23IL2oOhXooPpWnvQQiME8d+TD
 nOYw0yGSIEpwtJkCPRy5MtXkW0D+lT+IGRTHTrRjULKHvcBXdLILqFT7J8KhYiztVJPRpmZDNT
 4DmQ5/eN1K+UDMAyDFmgAAAA=
X-Change-ID: 20250113-b4-mxc-imx-maintainers-8ff1c7dad8ed
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_141309_958973_5F0E1C38 
X-CRM114-Status: GOOD (  10.74  )
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

There is a number of i.MX-related drivers that have mxc in their name,
but are not matched by the i.MX MAINTAINERS entry, most notably the GPIO
driver, which is still being used on current SoCs.

Looking at current files containing mxc in their name, all of them are
related to i.MX, except for:

  drivers/iio/accel/mxc4005.c
  drivers/iio/accel/mxc6255.c
  tools/testing/selftests/powerpc/tm/tm-vmxcopy.c

Therefore adapt the regex to match all mxc files, except those above.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 520612b3d26da0a7ef9767faf02e846711a339e7..4aba97eac41758ae27c8fed61bd406241f69809f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2475,6 +2475,7 @@ X:	arch/arm64/boot/dts/freescale/qoriq-*
 X:	drivers/media/i2c/
 N:	imx
 N:	mxs
+N:	\bmxc[^\d]
 
 ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
 M:	Shawn Guo <shawnguo@kernel.org>

---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250113-b4-mxc-imx-maintainers-8ff1c7dad8ed

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


