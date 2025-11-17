Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192CACE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=99QhsqF+T9/CZ4DnaxJ/0/H6WI6U3vyHUVbRim7tqck=; b=EcDLK2QN7TYbzFOBEqK1jJyOBi
	4M6NSURD061t+yfv5cNgKJv/2OaHqwMvKOn4PdjChR+PhfHyjITH4Eey9bzKPOwZyt0wSje+rxY+5
	ifXh8h5uJMOongKjzZw9sm69vVIgHSQLnWpr5dFDLzk6bjANGmk4HGE6yrAfQknOO2Wftjzds+gIX
	WCfPVDzFO2vEUdpX1nByp/jQvJir9fYC5P42Z1Tgb5QmbWwxZhGURIajQj0TgBU1sdAYkDREgAE+K
	pA0+q1BwInH5e+XUgDskxE3FdxSQAsrzhS9v2h49+V1J1UrQ4YjdZulQ+JGY2W3IL7H5wnYh+qu1i
	EQbPLA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwID-0000000FrPv-2YW4;
	Mon, 17 Nov 2025 10:17:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwIB-0000000FrO8-28j7;
	Mon, 17 Nov 2025 10:17:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CCAF6013B;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05800C116B1;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763374622;
	bh=aukVyKf6SM/XsCjCWq9eeHkk+NbJxGlbfhudMeFmdm8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=C/P34vY25Zec2yxyNDdJ2clHsDuXoY4fvq/vUGSALJz7Z+3KQvlS/fvVgycwAVWLh
	 jUqPNP/MW1aJ8DQGwrR9f5WBkMoSREmtdrlZ/yzh7pXliF4T665kfhjx7VDtonqaJJ
	 5u/0nbdDcT97tt+dxtCKIVqvQMdSDC2rHJlKkHMq/GrgPI4QbGEaliSCv2FjFMUz3T
	 HG4LxJyArmfBdZmzn0jJTrC1S1ejLwkQQFkQ8oIKmQG0/1H29M5f96+Og09Zvm6BC5
	 Wm/dfyzGbwwyfGzbp5z7RDQEnksJGUgTO5MZaOTwuCAXozWYmQRNyntRXAm0pcNQ0n
	 ZsCb/avy59HgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51A0CEBF8D;
	Mon, 17 Nov 2025 10:17:01 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/5] soc: amlogic: Add new Amlogic SoCs info defines
Date: Mon, 17 Nov 2025 18:16:59 +0800
Message-Id: <20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABv2GmkC/x2MuwqAMAwAf6VkNmCK718RB2lTzdJKAyJI/90i3
 HLD3QvKWVhhMS9kvkUlxSrUGHDnHg9G8dXBtrYnIouaHEoMCXVAHSseW3LTMBM5281QwytzkOe
 frlspH9fFvoZkAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763374620; l=1049;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=aukVyKf6SM/XsCjCWq9eeHkk+NbJxGlbfhudMeFmdm8=;
 b=C0IuzYTEuNE9tlPGIHItE5TtHdWAF8MvDqs2pleu8u+sCdsjEmlnuf6CzmK2OdZvZVkegdu0X
 q7Gb0lwbF1LDbwiOzCNvRMtYZqqsLVGNccYgmYZgm65TmBnot+KP+1S
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add more Amlogic SoCs info defines, include S6, S7, S7D.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (5):
      dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
      soc: amlogic: meson-gx-socinfo: add new SoCs id
      arm64: dts: amlogic: s6: add ao secure node
      arm64: dts: amlogic: s7: add ao secure node
      arm64: dts: amlogic: s7d: add ao secure node

 .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml          | 3 +++
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi                       | 8 ++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi                       | 8 ++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi                      | 8 ++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c                            | 7 ++++++-
 5 files changed, 33 insertions(+), 1 deletion(-)
---
base-commit: cb718411c4c05a4a424c2b73790a1648be97a4af
change-id: 20251112-soc-info-s6-s7-s7d-01c86911c249

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



