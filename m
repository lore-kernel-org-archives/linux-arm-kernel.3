Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBBACAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3/vNO0y7ZvfBYbA6q8Xew1TMw4aI4q8qx+4g80bgv70=; b=4zOryB1pLZ2jCK
	x9mO8wNqW6KBsLfP+aW9T4AjKNXGTYg/C2cy/U40urOatBIgqSTNJKhtkSx+F41v8+hNIAk6PhFLj
	oTXoMIBMn0o9+WmiyPimOOGRCl0hEd0hHowbZ4MHv2dVdVtLxQicpYjRizA9PiY6oLM2a2z806X/Y
	8oy81Y93cMbu4Mqbwm+iAPZ0TvjpLn1rSZ5zXgBJs6eUFYPM98+nDWoC2rTihgLzhTPbl82S3E0ee
	q0Xeu2llbYUNuehCClbxuvb2GTcIgxaR3/r9tdy58RH3mxLuRRWGdQgFErqmjEdPBNCiateFgtRkO
	ajZjEW0CFmKtooJVN89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvssE-00000005BwA-3ynI;
	Tue, 09 Sep 2025 07:34:42 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvrRk-00000004Zsa-3xLn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 06:03:18 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5DD76A09C2;
	Tue,  9 Sep 2025 08:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=3/vNO0y7ZvfBYbA6q8Xew1TMw4aI4q8qx+4g80bgv70=; b=
	F2pFR8lnY+T6sNQFVZxa0iieNlFwIryh9wfckzXZXTY3HxTmQeqlL1zAWUXQMZAA
	jk7GbckDS98hyVI6BOgRa4xcwpqaG14KFVsJS0P/KIudNdqdEddFgUOMown/ar02
	9Fw7qkAJ6C35nLt25vV8rTF3KhrBI0Tnu235L7j6Q74AuQbitbvwob7r7k/RVvTv
	tJMcVf5bxDvg/YqLmUteF5JYIqVIy6sh09Xv2ovJYPyuK7Y7FIE27IWQZ5BrKyTp
	nh76rycXnZ/R+huXIsQVFpTuQzvY33AdZLBfEsuf/hDLZbrecJjvSXjY81knhysC
	kqoThezm6VNWPRePGSYQ6tEKmiFKruF8Uieb65SXp+BtlVHCyEEq41jaLPcEcCA5
	e+2qaGTAzA+2fLjMElit/BniupYPGN+5e0GjQnZ+2KKjVVslJXS39Th1jtveEjs/
	EhzuOLlUzW0+YRK1EyJewhx4UKk7cu5GopAI7HpohPb9LI+SO7r6p2mzELu36qhW
	m8Qn/6Fjm/OMnm2NRLOOyPSpzidkSK9OlTw+FlPpQb2kWkTO2nHVIcrmldjE8qjd
	Dyz+pYjk0Lp49TdPtHSmd/BZ1L9RJpTYwt74a/dhYWCb8yiyOeHd2wgjGW5ifYvb
	Gs7WuBi51H+h8VGOYF/eIz6EzgPg8DVxa1SrWoU5T9Q=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Subject: [PATCH v4 0/3] Replace verbatim license text with a
 `SPDX-License-Identifier`.
Date: Tue, 9 Sep 2025 08:03:09 +0200
Message-ID: <20250909-sr-som-dts-lic-v4-0-02f4e0e440fb@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB7Dv2gC/3XNzQ6CMBAE4FcxPbumP7YFT76H8dCWRZookC4Sj
 eHdLZyIxOMk8818GGGKSOy0+7CEY6TYtTkc9zsWGtfeEGKVM5Ncam65BEpA3QOqgeAeA3hh6mA
 N18FLllGfsI6vZfByzdk7QvDJtaGZZx6OBkxzsYk0dOm9HI9irv/9GAUIkFjo4ogmFMqe+9TdX
 Xtonmz+GOWaqw2XmXNV6lB6a01V/nK15uWGK+CgRR18ZYTDWqz5NE1f2zDk+0MBAAA=
X-Change-ID: 20250702-sr-som-dts-lic-b16fc7605cb2
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Rabeeh Khoury <rabeeh@solid-run.com>, =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?=
	<csokas.bence@prolan.hu>
X-Mailer: b4 0.14.2
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1757397794;VERSION=7998;MC=2887821443;ID=61058;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E627462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_230317_140242_5AE66F15 
X-CRM114-Status: UNSURE (   5.79  )
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
Changes in v4:
- Merge HummingBoard changes into this series
  - Link: https://lore.kernel.org/r/20250709-hb-dts-lic-v2-1-a168bd9d24bd@prolan.hu
- Fix typos in msg
- Link to v3: https://lore.kernel.org/r/20250709-sr-som-dts-lic-v3-0-51fcbd61aef1@prolan.hu

Changes in v3:
- Also patch imx6q-h100.dts
- Link to v2: https://lore.kernel.org/r/20250703-sr-som-dts-lic-v2-1-0395c9b776d9@prolan.hu

Changes in v2:
- Fix message tags
- Also patch solidsense files
- Link to v1: https://lore.kernel.org/r/20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu

---
Bence Csókás (3):
      ARM: dts: imx6-sr-som: Replace license text comment with SPDX identifier
      ARM: dts: imx6-hummingboard: Replace license text comment with SPDX identifier
      ARM: dts: imx6q-h100: Replace license text comment with SPDX identifier

 .../nxp/imx/imx6dl-hummingboard-emmc-som-v15.dts   | 38 +--------------------
 .../dts/nxp/imx/imx6dl-hummingboard-som-v15.dts    | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard.dts  | 38 +--------------------
 .../nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts  | 39 +---------------------
 .../dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts   | 39 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts    | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts           | 38 +--------------------
 .../nxp/imx/imx6q-hummingboard-emmc-som-v15.dts    | 38 +--------------------
 .../dts/nxp/imx/imx6q-hummingboard-som-v15.dts     | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6q-hummingboard.dts   | 38 +--------------------
 .../nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts   | 39 +---------------------
 .../dts/nxp/imx/imx6q-hummingboard2-som-v15.dts    | 39 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts  | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts     | 38 +--------------------
 .../arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi | 38 +--------------------
 .../dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi    | 39 +---------------------
 .../boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi    | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi  | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi   | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi      | 38 +--------------------
 23 files changed, 23 insertions(+), 856 deletions(-)
---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250702-sr-som-dts-lic-b16fc7605cb2

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



