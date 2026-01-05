Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C56C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4FjM/HGADyunZKsQ5wlCWc9WRstz1PXBATyIEm2nhGs=; b=Mbc1VmwGUI6Z7MJdr7MjELAMLb
	Ppt1aOaURW4vkMWZFNCIvIbNa+XKAfHxlOktih3+HrYa4sE6emgAIKjcabb4NH5SDhn84kgOFtkYE
	uxFnboxdDGdfx+cfZScWtCAo/bEW/69nR/NyrfwCcnhhBBvd8uPuRxOnCKWCt+fsoPwzBnjDcawHL
	TvxO20c/ZhJ1agRi3tyZInQg/SZCcTf2x4NKqDku5+TjxXQdBgZr+LKYWYwY4ODW155hJiaD+Fvid
	awh0oVZ+tj9ZV+itoz2IRzu3We+pMPEXu3BI62aABgjocnUXlN8Yeq9tEmmloMhxJPv8KV2oAO1d+
	WlJUp4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqXT-0000000Bzve-34IZ;
	Mon, 05 Jan 2026 19:46:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqXT-0000000Bzv0-0nh1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 19:46:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49A626013C;
	Mon,  5 Jan 2026 19:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D011FC19422;
	Mon,  5 Jan 2026 19:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767642410;
	bh=4d4Kz6wZLKZJMC8dluV+ZOL4eRSU5mD/Cf1EU5faObM=;
	h=From:To:Cc:Subject:Date:From;
	b=Wg7l7fbqsWe80PFqqn4VUq0vZtdUwGnvQS9QbiP7DUTk94SKY1E+fwVG4gnrz6AEH
	 ro5ezLrCNnlEsQhHiZ8I14DukAC4Sl6azVsGb+v+umGYRyAO0Pjmfm1ki5TuvV45DO
	 yp+4pMb3uKr/JgLJ5nMINwaCx7Isvi4/tlhD5agaTqg7sU7NGR1cl6y9jndMdLwHbO
	 Qh3Z78IF6c+pH4ROlNvoy9WwXumBesesDKO37xux6429RQJ4B8UtTkAadoD70EN3Bg
	 /+u4mHTAiszhyI3NoCZiVN5UEvRFujop5QGGbxsIWWVl9Km0fYBgdnQhxWc2qBWy1l
	 ro+orBsttd94A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: marvell: cn9131-cf-solidwan: Add missing GPIO properties on "nxp,pca9536"
Date: Mon,  5 Jan 2026 13:46:46 -0600
Message-ID: <20260105194647.3189303-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The PCA9536 is always a GPIO provider, so add the missing properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
index 338853d3b179..b6aeba7d0a61 100644
--- a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
+++ b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
@@ -202,6 +202,8 @@ fan-controller@18 {
 	expander0: gpio@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
 
 		usb-a-vbus0-ilimit-hog {
 			gpio-hog;
-- 
2.51.0


