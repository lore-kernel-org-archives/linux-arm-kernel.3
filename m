Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5001BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/PgpZFPlATlaMC5VfqXMLfLIa0Lf3oB7k4UtRnC01pw=; b=xs4h7mEJcwyJjw
	BHJOPSsF8PnxIJbgRqo5FjGSTs3J0Mo1VFfpoS0ceFIuAyEHyDtckEkW4xT+L91hgsHUq3TKBlXzX
	v0j7S3tfnRmi6xUlCD9KJuXTz/dP9VP0LOhJWVEjK3L6bWzhxdoh2CtobdR+l9bomAjhOeH8Segzf
	7lvAQxHZ5JLZwlPumv6WlfUjFw3FlWk38OhWYBe9cUeEa9aSyx+GKMiEnw2gyya6W+bnooLcuNwUH
	jTjH5z3my0Jh+qPApxA7wQhx+GGsbsLOWh8yQ6zK9ZUHtAWkKLDrUJFeM6XQB/SXRzSWCMUVAQMHl
	UJDqKlPmaQBaLn0NihNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSsx-0000000GB9b-29hg;
	Thu, 14 Aug 2025 08:00:31 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSgq-0000000G8j0-2spS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 07:48:02 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0646CA01D2;
	Thu, 14 Aug 2025 09:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=/PgpZFPlATlaMC5VfqXMLfLIa0Lf3oB7k4UtRnC01pw=; b=
	tU9jSxhtFHdpfUAzU2X92LRvFj0LyycV9ceTrA+S/LkT1TunDlVk1W+qUtsTaxpV
	/HgocVSCLJ22ytp4Iij9TRIDNYLzRWVv+d+zTIy2SDcllWKq51V6Q/gYd/TKhino
	8Ob9MUN1N4NhhIrl6JvrDA5i5hJq41iuAx6p247kPJVtBvnQSyFF2+mu2HEuVZx9
	9uHWHJGbltG43F1oVNetX8tLPAwwjDR97sAZiKojKI0McvFfHZPYaok0gtLvMfPH
	0g/2/VeSHbimmZfTpbNxfvRQwQL0rJ4n+/htPuOGYJGkXnW/0gE7NfGYIQmKinZa
	OrHXblIifgC0KHfvOF3SymyIHpFiEYv0P2VBmdnAeAkJziSnVymnnSP5j3gpDEnP
	KiT5aRBO0iGlsdg6Ogjva04yV8Hn40XyN5IHylUJVynqkEZN77YY3LhYSc1jaKyG
	nix5ZzQ9fIgsFgT7bTZZ2vCaDm1N/rDMGBurQt4WNdNYWnvPz++fRXbPcJbhO32T
	LZ9XcAoJ4NlVbd7U3ioob2jnm7vsl7b0IO8cOTd2J2Fbbt/L2dzYkLjU/GxFhvl4
	Cx54N9sEsMqe7snT7BH0uSEnOndd6+QbJYltaW80Lu+OpiLrcOAscrCkCuivF4Cg
	ILBepz4raTqx+2nljqJ+YngIfWkSEIkkD/HilhZonSs=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Subject: [PATCH v2 0/8] Replace verbatim license text with a
 `SPDX-License-Identifier`.
Date: Thu, 14 Aug 2025 09:47:42 +0200
Message-ID: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ6UnWgC/2WNwQqDMBBEf0Vy7pYkpY321P8oHmKMzYJG2U3FI
 v57o9BTLwMPZuatgj2hZ3EvVkF+RsYxZtCnQrhg48sDtpmFlvoqjSwBhwUGZAdtYujRQall50z
 b3HKKPJvId7gcl886c2PZQ0M2urAfDZaTp70YkNNIn0M9q73+s1T/llmBBGOVVlUnL8ZWj4nG3
 sZzeIt627YvMwIOXskAAAA=
X-Change-ID: 20250708-imx-misc-dts-lic-820fc7db6fc7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Fabien Lahoudere
	<fabienlahoudere.pro@gmail.com>, Andrej Rosano <andrej@inversepath.com>,
	"Troy Kisky" <troykiskyboundary@gmail.com>, Gary Bisson
	<gary.bisson@ezurio.com>, Joshua Clayton <stillcompiling@gmail.com>, Sergio
 Prado <sergio.prado@e-labworks.com>, Wig Cheng <onlywig@gmail.com>, Sean
 Cross <xobs@kosagi.com>, Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: b4 0.14.2
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1755157668;VERSION=7995;MC=3327119661;ID=1088340;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2998FD515E617667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_004801_194848_505228F5 
X-CRM114-Status: UNSURE (   4.52  )
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

Fix up Device Tree files by replacing the license text in comment blocks
by a `SPDX-License-Identifier`.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
Changes in v2:
- Replace bounced mail addresses
- Link to v1: https://lore.kernel.org/r/20250709-imx-misc-dts-lic-v1-0-7a1219f037a9@prolan.hu

---
Bence Csókás (8):
      ARM: dts: imx53-ppd: Replace license text comment with SPDX identifier
      ARM: dts: imx53-usbarmory: Replace license text comment with SPDX identifier
      ARM: dts: imx6-sabrelite: Replace license text comment with SPDX identifier
      ARM: dts: imx6-evi: Replace license text comment with SPDX identifier
      ARM: dts: imx6-marsboard: Replace license text comment with SPDX identifier
      ARM: dts: imx6-pistachio: Replace license text comment with SPDX identifier
      ARM: dts: imx6-novena: Replace license text comment with SPDX identifier
      ARM: dts: imx6-warp: Replace license text comment with SPDX identifier

 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts        | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dts  | 39 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dts | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6q-evi.dts        | 40 +----------------------
 arch/arm/boot/dts/nxp/imx/imx6q-marsboard.dts  | 38 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts     | 45 +-------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts  | 39 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6sl-warp.dts      | 44 +------------------------
 8 files changed, 8 insertions(+), 313 deletions(-)
---
base-commit: c435a4f487e8c6a3b23dafbda87d971d4fd14e0b
change-id: 20250708-imx-misc-dts-lic-820fc7db6fc7

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



