Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540CEC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 08:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1xUKNCTRZOcUfegKTMuwnSkh5jIPQ1aseWbdQMJNrwg=; b=IH+A5rDmnHrNTa
	kzaC1XCMQIzTLDjv9NHjOax4Hn/jOfz4f5H7QlzpnH4bRK/sFpHvzQqXPU4LrTKWNB3DCT3q1uOvN
	luoyhGgrJVrLgIZwuca+MEnv+RNbONy7drv4+6xKJUB1TAXoYkEEN2zxe0lsN8pQNqEngzIFgRm9B
	IQ3Mus6kQM+GGX/KJeqqwXCCwBlUq/Ynf1EdSK2MYGibeYKdWumr5hWPBqQGdldh9rcI75CTnQMQP
	s1pokZX/vkNLSOl8z+B6pCInegPivl2C9G1uRflcuJBj7OElbvHkuco50ykeuf38ZIVvFY3QAsAwK
	BdJ7w0rM22+dKc9o8ZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQ91-00000007y0K-0z03;
	Wed, 09 Jul 2025 08:27:11 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP2T-00000007mlj-1qbJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:16:23 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 608B3A0AD0;
	Wed,  9 Jul 2025 09:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=1xUKNCTRZOcUfegKTMuwnSkh5jIPQ1aseWbdQMJNrwg=; b=
	TwbN+OZ4U/BdPZczAAkHzPpjwTAER/9yZw+vJpAJawdjnQLbJDtS2EdzyDmuL28k
	b8nnfFvhxZbu6LLHohFyf9wZdxL5soao2I85GWDy8evJ/gL20i8+LNU2yZQ9WkoR
	XxJYw+S2/qj+7F74hx3FxCRABpvWwHv4A6qQ5KSNUJ4nVU5IUOiNA3WS8Lkq9mI8
	pSr1Y6sPVNgcI0DgYU37BF5pE0CMjt8LQrDcabBIXoFdR93rAMG/JgKaVTUCWTS6
	TBOOk7A6xONDPYmeSlxODU43ubbH1OkZn2r9ce6ve9l63AqCY3o8uveQkqnh8h50
	vhESAqFrJoZq0puaMVhtMINdxr4RKuczM1SSsURrd709TKi2HD9XNGJYoskkhzBe
	Xz+iQ3mQFXfju9l1zKLatUupboWzbYlfKLofTBUsvekTRY2PC1kmgjAQuMGXKU6c
	yUw0UpWYEtI3d322vqNBR/EXGtGek+GwdwLehdoOcosjig7TShR2q6w1ZllU1OSN
	Y+kuF8uxIYmjSkoQmlA7HIrvGGGsNIQG4IjVdyIAnuTHZsOV7S8WPlGB+mvI5aex
	7ssEB/vCtNXAYIafXioBnZnrxiq8+X4wY+gv6qjKPAAMw9FvL8YqBAgP9iDGWfHv
	yOE4KXyJqjLVIM7MoMNnIap3EUh+ZR8TSYruqOso64I=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Subject: [PATCH v2 0/2] Replace verbatim license text with a
 `SPDX-License-Identifier`.
Date: Wed, 9 Jul 2025 09:16:06 +0200
Message-ID: <20250709-tsx9x0-dts-lic-v2-0-b9b7d056728b@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADYXbmgC/3WNywqDMBBFf0Vm3SkxJVi76n+IizzGJmCjZFKxi
 P/e6L7LA+eeuwFTCsTwqDZItAQOUywgLxVYr+OLMLjCIIVUohESM6/tKtBlxjFYtI7c3Vktb0M
 DZTQnGsJ6Bru+sNFMaJKO1h+Zt+ZM6RB94Dyl73m81If+92OpsUZhlFWGWqka95zTNOp49R/o9
 33/Adwls03FAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Lucile Quirion
	<lucile.quirion@savoirfairelinux.com>, Sebastien Bourdelin
	<sebastien.bourdelin@savoirfairelinux.com>, <contact@savoirfairelinux.com>,
	Damien Riegel <damien.riegel@savoirfairelinux.com>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1752045368;VERSION=7994;MC=1726887820;ID=156410;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E657160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_001621_949330_0B9C274C 
X-CRM114-Status: UNSURE (   5.21  )
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

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
Changes in v2:
- Fix msg
- Add patch to imx51-ts4800.dts
- Link to v1: https://lore.kernel.org/r/20250702-tsx9x0-dts-lic-v1-1-0b5c5be9257d@prolan.hu

---
Bence Csókás (2):
      ARM: dts: imx6-tsx9x0: Replace license text comment with SPDX identifier
      ARM: dts: imx51-ts4800: Replace license text comment with SPDX identifier

 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts    |  3 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dts   | 38 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-ts7970.dts   | 38 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dts    | 38 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-ts7970.dts    | 38 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi | 38 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi | 38 +--------------------------
 7 files changed, 7 insertions(+), 224 deletions(-)
---
base-commit: c435a4f487e8c6a3b23dafbda87d971d4fd14e0b
change-id: 20250702-tsx9x0-dts-lic-cded8dca23f7

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



