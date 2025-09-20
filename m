Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53860CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ra9y4q2EFN89c65T8guYtTeREK25syWCt+2DUaQWtEk=; b=hpCuSz0Ts0Fvg0ihe95zpjMarK
	ZWJox6i2kT95xdSbruQkseQK1vzEaUSNgmdoOEl9bkm8pgh/ObrEQ2ieNJgLX5LptzzUHZxsJ8tpe
	Ga+AolCLL9v15aCIfna3dOsmgW8KZ1WLZu46ZlZ9UJuxDmMFrizhU0FkIznPvIhdQhvGO9QudQU/e
	7wvaXB8BOoS5zwhjYMwXlIpW0SQzEALRDNJfh2TAflnicbfXAN3HKTRwqHjppBb/AAb8O6NZVEhGB
	+HcKmPS1243WizlaV8oysIjwd4/DtFfPvcNuVHBCvft6ZWRs0e89urUn3kxq2mEZor34nf7/Wm3sg
	8aZTzY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OV-00000005bl8-1F26;
	Sat, 20 Sep 2025 16:25:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OM-00000005bdf-1CWr;
	Sat, 20 Sep 2025 16:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 851A144CE0;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57939C116B1;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=Yw21Bj4O1CcXJALjZystKMv5JLsbgLxSaC0YPKbfZUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XUrBZQkDTUcos1EmYXcH+Gg5TepAB6pxcKoAuBd07gLLrxWGxMDxQnFrmHnTkH6YJ
	 n2ObM5LqX7E5sO2iYH6IUD4Mlt0eqWl1pO2zjSiwacIuMBACouqRWwV74tKKIyyJsc
	 Wa76qkKuk+5NzMkJCDswxtfhQfVqhvWLNnUVHWqZ5MbMTguvNe9pQj3uYLkXccfEQ/
	 rW14Ukl5d9m9kAoT6DSXN/riwls4ncNS/h/+vTJ6+MMWS95nwFLp077dMnCXme1H15
	 HDGNa8M/Gswgy5rtSZNlY9hE8SHmI7n3czOaxrroSXd2noKVLvB9jg1XpyWxw3C51f
	 OY7cKPz2lU1Ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F804CAC5A9;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 20 Sep 2025 20:23:30 +0200
Subject: [PATCH 05/10] ARM: dts: mediatek: mt6582: remove compatible
 property from root node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6582-v1-5-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=662;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=LHxW1zi0DUMWIe5Lj8+bFJxdSQEdq66WG8h16b3dP4E=;
 b=TMvWA8WAGPT44mYP1vueAUHoVtdz+gB18NfVa5rTYKl9Nvrdu+N4bkMVEM0O20iu9Q/hAADvR
 nyg/7JLiZh/BjIexjLpZYiTP2vBK9Ll6QgIwFucLxYSOOgRikBzNpzI
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_092454_356547_C4B8927F 
X-CRM114-Status: UNSURE (   9.30  )
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
Reply-To: cristian_ci@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Cristian Cozzolino <cristian_ci@protonmail.com>

SoC's DTSI does not require compatible property. Drop that.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6582.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt6582.dtsi b/arch/arm/boot/dts/mediatek/mt6582.dtsi
index 8ada8c6518661509ebee647367064187f4376ab9..8a14dc1759d6f65fa75accddab83c1b6424d1632 100644
--- a/arch/arm/boot/dts/mediatek/mt6582.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6582.dtsi
@@ -9,7 +9,6 @@
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
-	compatible = "mediatek,mt6582";
 	interrupt-parent = <&sysirq>;
 
 	cpus {

-- 
2.49.0



