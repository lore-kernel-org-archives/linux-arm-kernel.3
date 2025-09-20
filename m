Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831B5CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJiE/4CapRnZQzWRrNJLki/wnAv92yzcBdDbMxjJmtg=; b=j4wGYRXGlAeZnpU0dro5hjKBho
	YLufVI6cLg6zI+coAIYtePjG3qI0z+IrPWY67XTUL07/YVVZVEBYrg7t65ntog3heVKjeuy2OaanI
	Ct/5olqa+rlKkmaG3bJvOlfNGUxojbci6mfqFDx45B63xlwA8mV6LPdWMbMEfSPiiwnwzSeyDqrEf
	aiPZXiffUM5gYMZ0Ss8iWksFpba7TjImxRijNNqkiSvzCLL2oCccAlpkDcUy3elT1qTjpmVpYtjkj
	Y3o7nfHqKZA00M6qNv/qv5c8UkGqg/q1DT61hBc/cFklC18uGX3/DvsWseCWRQam6fumghE7bYnq0
	xG9zUhzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00Ok-00000005bvu-10TI;
	Sat, 20 Sep 2025 16:25:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00ON-00000005ber-1IIO;
	Sat, 20 Sep 2025 16:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A01AF44CF1;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80F29C4CEFE;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=fCvgbj0xU9RJREVTvTFFOFxmYdZe1E50yvmeZHSzE7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sJH5cx9otbubyxaneivZevHNZ4sZj6eFeSInJoplaAZn3ZFLQV4wT9cGlth18H4oY
	 rH6Fp2JSWiJpxjWLGk2OiEkIUtxwX1QQvF+BhExY5dZNNV7HFQul1H7+mwfeDb/zZ6
	 iyPrLkDfiZNWZ+yOysDPSbPPioIh61jRV63869+btRi+Olh8pKZbjXZqdYL51BpLMQ
	 L8GDioJt9gcFdRxrHF/aPTOkxOO+DILUODuPww7nWJ1QwoUpjrwwsP0wKewznxvuCi
	 anIODcxJezJg8jNmAq0OH3uqn3RJdIAQiHuOwSvQh+25UGLqZDxPjAkW1or3ibJ9yq
	 qcMsLp+qeq26Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797EACAC5A5;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 20 Sep 2025 20:23:33 +0200
Subject: [PATCH 08/10] ARM: dts: mediatek: mt6582: add enable-method
 property to cpus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6582-v1-8-b887720f577d@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=648;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=1pkXsToukeBtOjKTSGrlOrfz/vD1cenGodZl+YEjRIg=;
 b=z8G1Vkbhc61fkJqS5KiuPXS7HZ+UuQuceW7BHFe45IGZoQV7xXDPyf6dSKwRq66glu1joNL+D
 /ifwN9UQ/65CiUM/A038MER63r8hCTnzshmjl56uPBozEqeSy64GDfc
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_092455_403510_F0FD689E 
X-CRM114-Status: UNSURE (   9.34  )
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

Add missing property for SMP.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6582.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6582.dtsi b/arch/arm/boot/dts/mediatek/mt6582.dtsi
index 82564c740c2182448f8f88bbc2b22c4fef1fdeef..f941ea44898a9f26d9742f31f4a667adcc77dfc8 100644
--- a/arch/arm/boot/dts/mediatek/mt6582.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6582.dtsi
@@ -14,6 +14,7 @@ / {
 	cpus {
 		#size-cells = <0>;
 		#address-cells = <1>;
+		enable-method = "mediatek,mt6589-smp";
 
 		cpu@0 {
 			device_type = "cpu";

-- 
2.49.0



