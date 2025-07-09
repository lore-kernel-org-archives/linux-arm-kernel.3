Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A31CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I10eUqTaVNFpuSOwlVJzBv/KnrXqakY/X6KD3vhHpq0=; b=FCMUGD5BNfkyFq
	Z4NI5Zh4GzYCjoH5Zd1CrahxYZDhR4w4x0eZyPP3Fr92u9Xbgn9BDv96EO3vHW9sOWdaomr/El0hO
	M1HAE/sJE7VBFoVg5pq3RybVU80u4CgDb+WMoSOPoBl5jQaT2b6btImwb5PNWNKwwyBSwI/DTHv4Z
	GMNGjZKfyAGtHHRtkBguJWl4CM72hiFgBP+O1vChnngyjKQh5Z9e0S7PG7Wg2K7vxbwIU/rbcwLK4
	cSIHBihf6Cg45VvEVuoPvie2dhgb1Z5EuQ8wi/YoX8UgG8Rk+Rn3v/db30iQ7CbQvOLXVDNlqAfhl
	2TxIy1G+4v/Xgb4Mqivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQxj-000000086cL-3ZAo;
	Wed, 09 Jul 2025 09:19:35 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPLa-00000007pSH-2qv2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:36:08 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 598A1A00D7;
	Wed,  9 Jul 2025 09:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=I10eUqTaVNFpuSOwlVJzBv/KnrXqakY/X6KD3vhHpq0=; b=
	bHeETC5YbdMCs8lgL5/nWyKVHYlPBBp1YhVUX+VHI8w9xMAA1o3MuWbt9HVH2LqY
	+9rP9eBedCfljrwbJ00lzeXSx/dSWzI1J4GgxXxjckyR6DDn6Jd8w067Pd/89IOq
	g5DMhn193sDZlHF5JfVX7sfpM/GiVqs9xrrc4vE+EOIkWeTmFa3gyJqEEta0P1iU
	F2PMfbJ0UcA/mr2TP9ICQ8c6ZLwMx6PwnmS0uYJXDWZqrBOJ+u6Zf7poXwTnSHA0
	VYUTA4NsLqctf2ODsLQbC6t8mjC4/eA2ZiGPgh5I2lU/CgKVNtC05xGpHL2GrAz7
	6xdbEVfZ+jx7lPnF2jm2gLgAgppkkY56HshvHDwWPBaclqdEQO7LPcWZpJLHqgCZ
	iK5XCa0u/fmewt4RvZ/H0kMoGQ40NbVu2owIGuiTZmAd0Ag81+/F1th0P2/lsqgk
	EebmPV1+A/q9FbzzjebtbuR+F0eFaryHZIblj/su1F6dTtznZse8stpDRk9iw8gV
	Fw7qEOL7eEOpo9LWzjvMxhIYLnvW767lsQrMzBF7RUY3BOIWxpAbwe7tiNUkZ5mw
	GsIeoAiBo4CEV95r9izJHaaZjX/8MQPUF7wJSJCb93lowjfD67GiqM56v0PLFBWh
	ZtkJoZHgjOad8ROdsKpbxDGhenRHI7ZrZaHczsApl2I=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Subject: [PATCH v2 0/2] Replace verbatim license text with a
 `SPDX-License-Identifier`.
Date: Wed, 9 Jul 2025 09:35:41 +0200
Message-ID: <20250709-clab-dts-lic-v2-0-ae14e0fd0bf3@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM0bbmgC/3WNQQ6CMBBFr0Jm7RgKkaIr72FYTMvUToKFtEg0h
 Ltb2Lt8yfvvr5A4Cie4FStEXiTJGDJUpwKsp/BklD4zVGV1KXVZox3IYD8nHMTitdZOOddYJgN
 5MkV28jlyjy6zocRoIgXr98iL0sxxF72keYzf43ZRu/7nYVGoUDetdUa3lnu6T3EcKJz9G7pt2
 340QDfrwQAAAA==
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
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1752046564;VERSION=7994;MC=486602207;ID=156666;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E657160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003606_873591_DCBB4B11 
X-CRM114-Status: UNSURE (   5.06  )
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
- Also patch imx6q-utilite-pro.dts (in separate commit)
- Link to v1: https://lore.kernel.org/r/20250703-clab-dts-lic-v1-1-768cfb78ceda@prolan.hu

---
Bence Csókás (2):
      ARM: dts: imx6-compulab: Replace license text comment with SPDX identifier
      ARM: dts: imx6-utilite: Replace license text comment with SPDX identifier

 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts      | 38 +-----------------------
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts | 39 +------------------------
 arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts |  6 +---
 arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts    |  5 ----
 4 files changed, 3 insertions(+), 85 deletions(-)
---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250703-clab-dts-lic-937f1ff6ceab

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



