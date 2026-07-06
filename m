Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23E5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1ASJD5fqsAwFFcUNYkquGQJiBfSwiDNs8HIU4aL3mY=; b=wjSrC9uj5W5ivu07bbcpNP9p80
	AGmrbtMIeCfOmqowpOG1Ss+TcqL2XYW+FIJOPCQpxdsrA1lMmLaklJ+oc/+cgvBJTcDK4cOU4QRqs
	1whY4Wk4Q8KtdHlNpBvI7SEsOC4iMRdzgD+scPbqDnvhdHALA0J3RMfrWGWyuFIBYCszr5iekYSiP
	xexW3fqTiPgYao/XewRg+ZPQzshVeGMhK6r43w0QfA/uJj7XKtrXbOoBpnmS9JcHVbyhPmdWcstaw
	1cV14GNvRF/4C1bDPRNpBZBr8632HHwZucS1yqcgThPPGRlsoL0H1/oOuq3xI9jhdhHlZoCvxmntK
	fxW/m3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkZ4-0000000Cmvh-2t8Y;
	Mon, 06 Jul 2026 14:44:54 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkYy-0000000CmtF-0vhM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=j1ASJD5fqsAwFFcUNYkquGQJiBfSwiDNs8HIU4aL3mY=; b=qMKxiTzDxT45/y2B52wZlFx2pB
	Ny1/wun9aae6xoqGdZy0DDB6cmfye4eAQu0zDMlYYJjuBTL+bSKWq00Bi7FlDmuuDlP3FehcG2O4J
	64dupi/y9rRVQDFIo4lfiT583f46AWVv1eq3tPjRPOPRRLSCvj0i1x9d7mNG9JBQOIcr/j6qziypE
	I6ZhXdyixzjUbu6QZAFR3tMY4jEZcSlVkuIaALUGdCOGJfzsWktaGcPDVHPIUm/CAiVu64nAHjI1R
	E46n2GEeCYN0AA9VlcA3wSOPzAq9BodL1KBGTgo6qQxcMEHq5ZwoEbTRW+3UHhBbTaS8nrT9Lyz0O
	uPHtVO0w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wgkYu-000K6q-2c;
	Mon, 06 Jul 2026 16:44:44 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wgkYu-0006Gb-1W;
	Mon, 06 Jul 2026 16:44:44 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-am642-tqma64xxl-mbax4xxl: add icssg1 ti,pa-stats
Date: Mon,  6 Jul 2026 16:43:59 +0200
Message-ID: <a03189aa138f74955a03b9fe6018a17bf7e2ce8c.1783348781.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aaec2ddf7cecb58ca0af37d4f03afec571804757.1783348781.git.nora.schiffer@ew.tq-group.com>
References: <aaec2ddf7cecb58ca0af37d4f03afec571804757.1783348781.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28052/Mon Jul  6 08:24:35 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_074448_370502_81450E14 
X-CRM114-Status: UNSURE (   8.36  )
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

From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>

Add missing ti,pa-stats syscon phandle. In addition to providing
additional ethtool stats, this avoids a "icssg-prueth icssg1-eth:
couldn't get ti,pa-stats syscon regmap" error message.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
[Nora Schiffer: edited commit description]
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: update commit message to correctly describe the error message this
avoids.

 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
index 46be6824dd163..b9e52d8bc8524 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
@@ -110,6 +110,7 @@ icssg1_eth: icssg1-eth {
 		ti,mii-g-rt = <&icssg1_mii_g_rt>;
 		ti,mii-rt = <&icssg1_mii_rt>;
 		ti,iep = <&icssg1_iep0>,  <&icssg1_iep1>;
+		ti,pa-stats = <&icssg1_pa_stats>;
 
 		ethernet-ports {
 			#address-cells = <1>;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


