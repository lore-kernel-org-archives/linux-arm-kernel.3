Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196D8F8E4B7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Os1dnyvYL2jpJMtSiA0rHB9vces/3fIbY0D06HvlXQE=; b=Mt4tjlAiDvQa5PHkbHKtcuto81
	XkWtugIxXF2+O3ItmMglWXiHdy4lQoMtDxhZDG5GO30mWduP9ajVY7CRyuPN79rzAUcDYqMk9xTn2
	P/dO4FWm29zoW4PPsnGjh/2qAjefQtnvsM+bH2HkTZuEOXn37VRlcdV5n1oYzoG4km+ipX0vqcvGv
	won6tsbRbVgnsF7SOoI9B2ul8PQEZ6CMI0t5JSB2rtEa/Z5IMm82oG5SFz7hiNk1W1lddqiWpEWDa
	nPuCKJNO/A4nNDyRcPu/Vi6JftJ1j6sAt0/IDwP6oMRY+qzMSH2Z2P3gS5sFlkkQmVTzoPcJ4NHJe
	PFaIx9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeEN-00000003eLD-2gjJ;
	Fri, 17 Apr 2026 08:07:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeEL-00000003eKN-126a;
	Fri, 17 Apr 2026 08:07:14 +0000
X-UUID: 6c7606a63a3411f19e7563141e833ce8-20260417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Os1dnyvYL2jpJMtSiA0rHB9vces/3fIbY0D06HvlXQE=;
	b=hCy5uFlQ+OU3J0JLu0vBYpeMJPAryroIdAPQ+nBji356LkrGcpNtDloYKdEAF3+OFLWzH/vEJo6SIbcSVcBJ6j/nbFOVJnAqpPlDp3IaDYyq9CEQBS64qV5N53mtabousned13/btNAT3jySODUOUEoS8NhMv6kNJS/Gg08M+Fw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f89b2444-ff9e-4f80-9d77-be1adf0f362a,IP:0,U
	RL:0,TC:0,Content:29,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:29
X-CID-META: VersionHash:e7bac3a,CLOUDID:59cdf924-cb5c-4236-a89a-9a7fb20c9bc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:4|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6c7606a63a3411f19e7563141e833ce8-20260417
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <binbin.shi@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 113432091; Fri, 17 Apr 2026 01:07:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Apr 2026 16:07:02 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Apr 2026 16:07:02 +0800
From: Binbin Shi <binbin.shi@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hector Yuan
	<hector.yuan@mediatek.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<vince-wl.liu@mediatek.com>, Binbin Shi <binbin.shi@mediatek.com>
Subject: [PATCH] dt-bindings: cpufreq: add mt8189 cpufreq hw dt-bindings
Date: Fri, 17 Apr 2026 16:06:17 +0800
Message-ID: <20260417080648.3692438-1-binbin.shi@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_010713_296984_6C06F222 
X-CRM114-Status: UNSURE (   8.12  )
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

Add mt8189 cpufreq hw compatible in dt-bindings.

Signed-off-by: Binbin Shi <binbin.shi@mediatek.com>
---
 .../devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
index d0aecde2b89b..cff52fffc6b8 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,cpufreq-hw
+    enum:
+      - mediatek,cpufreq-hw
+      - mediatek,mt8189-cpufreq-hw
 
   reg:
     minItems: 1
-- 
2.45.2


