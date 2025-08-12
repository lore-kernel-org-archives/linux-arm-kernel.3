Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2597CCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wiTgx5FswFd9UU0aL3t0f1YHFTB6TqQdKLInT1tRewQ=; b=X8keKOSgF+VwgF
	aUICTplJxz58ochqFBi+QyDFfxwhKvk5xGmes1HXSaE2lVXSfqw9ijQYRahyXvSBcLWkqHXXAb1AH
	g1kcm3qRfPrSrmUVgrRybmgNb8GB/HUrmI2ZKlKV0ZIlkHTCTEw5EKD3Is6SEh7tMvp8vkxRXf0JA
	wc4sWf6FyXd4kA4nSAvFetCpHA/djv7yVxLd98sOwHN9uMcQofzx4I6Br9UMNunzXkQERBb4VKBOj
	Ypuzghefvj44JOwUSxcH6D1ODiNDvk8HTivtqA3L8xOAG+tv34qL624cM842lHGnYHDLcyak0YOr1
	l5GwxK0MZN/6x1DoE/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvj2-0000000ByzA-1AYe;
	Tue, 12 Aug 2025 20:36:04 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulu9J-0000000BkZf-1oTU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 18:55:06 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E6C60A0A91;
	Tue, 12 Aug 2025 20:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=wiTgx5FswFd9UU0aL3t0f1YHFTB6TqQdKLInT1tRewQ=; b=
	XS2iR68wZPkJIKeuFZCHlUoAwlNFb4zVBr1oD2ktQ5QTBmtY7lwavvnNoHR1w8ch
	MDZV84lD44r6Z9TRITKBUl2GSWeSa949u38AkZ7KarW5dC8HQv9YHLYDjUhAsPFL
	qAmZAAsv/CD58rOwQI+WOH+HaJAX8pbn30KwwNLrKYUBey2ir6GRGNMt8pu3XPJa
	VVeKk1XU7pkPdv0AYjxS0Y5mOtHeZt0/+cC1hfkvvAXUizkQ4MPsYezPCGs6kCKk
	He4/03UcLv03pECuYvl3TNSoVyDvVMfC4WTZvP7hmwsN/xf+oqb8yfJFduBTRAJf
	LQTGugD1jzZfqIm/eZMIPTSVIuuF2pBhinGzzlyCOwrzI+6OmI1hI+QvyMkPi7gw
	EiftcHtpeZYxeWgrdrMI2MYOguc+Lo9EFdtueCwbLEuG/Xw9iSy2RYnh8FUUo2Oi
	E09NuZfgegaMxibyI22tPyCx4yNRjGkmQJUMWV70sFrSPvw3U08dt2Ep4fBeEyG5
	aKEyz7iz7wQkznGwiRSTFUc5/ZyJVp3yYA7uY1+CQFn8kSJ/Imdg9Pzz9GlEb0Ci
	H1S2sADyhII8VPggSkixjvyKBxRb0ust9+L5iCkAzj/8oMTYv8AUbh5oixofTlt+
	yH/W9KVNFuthA6fWYR5Oj6UCsvGepADT4HIR8XUoGj0=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Subject: [PATCH v3 0/2] Replace verbatim license text with a
 `SPDX-License-Identifier`.
Date: Tue, 12 Aug 2025 20:54:42 +0200
Message-ID: <20250812-clab-dts-lic-v3-0-bf7aa5462766@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPONm2gC/3WNwQ6CMBAFf4X07Jq2KAVP/ofxsG23tgkW0iLRE
 P5d4ERMPE7y5s3EMqVAmV2KiSUaQw5dXKA8FMx4jA+CYBdmksszV7wE06IGO2Rog4GmVE44Vxl
 CzRalT+TCe7u73RfWmAl0wmj8evLEPFBahz7koUufLTuKdf6nMAoQoKraOK1qQxavfepajEf/Y
 mthlHu5+ZElcEASJ+LOcu3KvTzP8xenHIN//gAAAA==
X-Change-ID: 20250703-clab-dts-lic-937f1ff6ceab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Igor Grinberg
	<grinberg@compulab.co.il>, Ilya Ledvich <ilya@compulab.co.il>, "Valentin
 Raevsky" <valentin@compulab.co.il>, Christopher Spinrath
	<christopher.spinrath@rwth-aachen.de>
X-Mailer: b4 0.14.2
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1755024903;VERSION=7995;MC=1796943816;ID=1014991;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2998FD515E617465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_115505_623208_CBDCF37B 
X-CRM114-Status: UNSURE (   5.74  )
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
Changes in v3:
- Fix one missing SPDX line
- Link to v2: https://lore.kernel.org/r/20250709-clab-dts-lic-v2-0-ae14e0fd0bf3@prolan.hu

Changes in v2:
- Also patch imx6q-utilite-pro.dts (in separate commit)
- Link to v1: https://lore.kernel.org/r/20250703-clab-dts-lic-v1-1-768cfb78ceda@prolan.hu

---
Bence Csókás (2):
      ARM: dts: imx6-compulab: Replace license text comment with SPDX identifier
      ARM: dts: imx6-utilite: Replace license text comment with SPDX identifier

 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts      | 38 +-----------------------
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts | 39 +------------------------
 arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts |  6 +---
 arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts    |  6 +---
 4 files changed, 4 insertions(+), 85 deletions(-)
---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250703-clab-dts-lic-937f1ff6ceab

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



