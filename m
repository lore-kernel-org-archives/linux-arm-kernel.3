Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B016DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P7U4X0KPBulQ0DpD2xAjgadmrQdluk8a2M4T6QIt81I=; b=ao66Q/WMurO/Ed007ShDH/zQfo
	jw3o58EMtvGk8C1uKXPvbA0w37ilv07gPeKSbs9TQBz0fHyMw5SES0rh7f8D+sDyCgpfKUuNDADKo
	GrDPOYS6XQx3akNUplz5HYRdtJufDT8hSEakgtoJluGYzLeRiatd7yb3N0gIcmvr2eYIBzKQFsZU+
	H6KxpP7ZgXDjr5fCIllhafmY7+4VwkVXNpMQSk3I8vR5cLKZ5lGq9BL76Lvi3Bxx3R0KEEDX4tQNK
	4DUWn9iXh5f/UheOw7FVZJB4VSR9PjAgCT6MjpSX3sJaDIC6W6K0UaqbiT0T+3snDsxBYKNGLZ5GL
	nJ7xnGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiy5z-0000000FQUP-2AlO;
	Fri, 14 Feb 2025 15:59:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiy4X-0000000FQCq-1Vfq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:57:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D20705C0702;
	Fri, 14 Feb 2025 15:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0137AC4CED1;
	Fri, 14 Feb 2025 15:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739548664;
	bh=v1WR08AE5CQqOnR8ISmiWg8KMk9RyvrCOO0/gEgkyDE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NB8GSzH+ONAH5lFdkG1Ty1rF+1xLzpdbZUXs78tiM1qvGHUrbRAA8h+ZdZtaI8hJ6
	 XSyAU2C2N06dYYPm/mnw1nbqHQWqqGTTom0Dd1Ox+GCDBafkygI84lCT0wraJKVH8v
	 1JtB/PFflu6Zn4YNyRkxR9eyXKQUyX2gZ53ZUDF6ogSQZEuYml7Frneeq8FaUTZ8Ux
	 CIO8WH8TaCZGR69BavP9rEFizRof3wrP7ciNpBE/nHOKETvJA1MVOGvoMBVIO4GvLv
	 WXb102YnjK33qcWnkyJI2ZoTEzy21RI7gxjMaZvZUaUutHC1AqqEc729FWUwlUzGWL
	 v3fgYZFW1c3Rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0EFC02198;
	Fri, 14 Feb 2025 15:57:43 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH 0/2] arm64: dts: imx8m: Add pinctrl config definitions
Date: Fri, 14 Feb 2025 16:57:41 +0100
Message-Id: <20250214-pinctrl_defines-v1-0-fbc86a42ef3c@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVnr2cC/x2MQQqAIBAAvyJ7TlArhb4SEaZbLYSJRgTS35OOw
 zBTIGMizDCwAglvynSGCrJh4HYbNuTkK4MSqhdKdjxScFc6Zo8rBcxctQaNX7R02kKtYqri+Y/
 j9L4fbhIcqWEAAAA=
X-Change-ID: 20250214-pinctrl_defines-237e7db61c6a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739548663; l=1365;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=v1WR08AE5CQqOnR8ISmiWg8KMk9RyvrCOO0/gEgkyDE=;
 b=PZmKXcESL9UNqXoct8RAJHd6TdzLVVn9O/CXE6fXNCm6ETGyIGhid8rlHWVZWigHGukjbfOXY
 +PilzN3VEcgBrxiR62CJ0Eyuhw8Tfr9yqxoFvcT8Oz7GPn6WhgMpQD9
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_075745_513654_CB78A15A 
X-CRM114-Status: GOOD (  11.79  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Up untill now the extra function mux (pull resistor, etc) has been
defined as a raw hex value, this is difficult to interpret. Add
definitions for these parts of the pinctrl registers to allow for more
readable pinctrl definitions in devictree files.

At this point the patch is not complete, some pinctrl definitions set
bit 30 (0x40000000) but according to the reference manual this is a
reserved field, I currently have no way to identify what the meaning of
this bit is, I hope someone in this CC may be able to provide an answer
to this. It will then be fixed in the v2 of this patch.

It should also be done for the mn/mq but I currently do not have the
reference manuals for these to verify these fields, though I can only
assume that they would be the same.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Maud Spierings (2):
      arm64: dts: imx8mm: Add pinctrl config definitions
      arm64: dts: imx8mp: Add pinctrl config definitions

 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 27 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
---
base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
change-id: 20250214-pinctrl_defines-237e7db61c6a

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



