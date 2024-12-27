Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FA8E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbcHXTdEmafcZ26pOm95idNdvsDgKQdu1LnTvG4534s=; b=fXbSi12DV+iKnESxnZa7mBersd
	+s+IUi2kOF5IQkaxpIrFVkvlQzLQv5dOOWq7sWPqBVeHh530WAog8XdzBH4L1v1csFkyet0Mq5oio
	Nb+53ps5fBs//TXF//4LJhADfyrh1F/o8aY8Y4MdblVjyPWMJFoq8vQfTpUEmJH82tgeXAj/0Ykix
	QyXAhyhPL3vcZYSfEs7iL7Qca9DAoMRVNAT+TtpNmAgMA1dsQXy5qDzzGsve/Uqn6KzyIOyj3OPXD
	o0BrvnnBPzmIrQqPrXq9jEgZcru4yV7c0j1arxqMywHWvsJyxb0S8/gKOFscrSJTsJ1Lbcpwk7zXn
	VOV6+JOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRA0L-00000000EIg-0aLX;
	Fri, 27 Dec 2024 13:03:49 +0000
Received: from omta36.uswest2.a.cloudfilter.net ([35.89.44.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9y5-00000000DPT-05xC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:01:30 +0000
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id R3OHtd28gqvuoR9y3tyHYu; Fri, 27 Dec 2024 13:01:27 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9y0tYEIwaFTVR9y2tKd50; Fri, 27 Dec 2024 13:01:27 +0000
X-Authority-Analysis: v=2.4 cv=POkJ++qC c=1 sm=1 tr=0 ts=676ea527
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=mFyXD75C-Rjc5bRUbP4A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VbcHXTdEmafcZ26pOm95idNdvsDgKQdu1LnTvG4534s=; b=aSbFR/JiTZx4U+c9H2c1A/0/pi
	D2/yBDDH3m3UxtCAPnT7fnDFsf3vU7U+0M2Uihxz/QFCzyQrvRVSzUHFTHTclSIFiWsOSR9nOU/od
	I2ySP8OQi/JtJA9cOC8chkNi0g0vdqiBiFUX8RQ8oCTBDOC1oB+KPKgwjTJHSVR4o7gfbU28yA/3I
	AB0IKTEZM1+2/jUIg/bnQCOhP2A4xnWbi2Wy/FGIgfjK9Dw/GuqhaSX9KLJEKsdRMHrnquAgVvLKt
	D0mAuULRz5hGvk9ErXyQuZ60RN1ZAfI0VgUAaKcMxAkVK/VWJCpm/dN4jTr/OMVuKraOmNjFyTvXt
	UTABAwcg==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9xv-002EaQ-1L;
	Fri, 27 Dec 2024 18:31:19 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:30:50 +0530
Subject: [PATCH RESEND 01/22] dt-bindings: iommu: sun50i: remove resets
 from required property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-1-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304468; l=774;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=qHYIlw5q2Ro5I852QrjEef3P3GktuZk2GSnSTYiauwE=;
 b=/2ePddOT/OpNwvShyS69Rsku811DGFkZL/le6QeJ8Ke+qincL08cWsrrfZynXU4sdnlo+0I23
 k9hLapYXlntBNe9JFjiKeJfqR7k6lT7gKV2AVbWsnnSOD5yX2NP+aK+
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR9xv-002EaQ-1L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 58
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFHDVn18gdjz/XVAfdY94BCeYZ2tEzLx4NjbPgqYNkePoylxKm3AsUDcGCYOwD+542CQDtEAaXIguZKE1XPuTPCPI6cPrmvDrTdujr/aOHt5u9tujSxf
 Lr2rH8lcnYq58i3YuPw7eF+8cWU/TSmfdE//cskqtcXBfCytBCDo8XplOP+RHXcN4DFkjB3sRHswQngLteXwSTrNOid8tBIC/7fslY3amAgbNCU5u10zC/FL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_050129_084828_63617D32 
X-CRM114-Status: UNSURE (   6.14  )
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

iommu in a133/a100 does not have reset control. remove it
from required property to make it optional.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
index a8409db4a3e3..03176f68485b 100644
--- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
@@ -42,7 +42,6 @@ required:
   - reg
   - interrupts
   - clocks
-  - resets
 
 additionalProperties: false
 

-- 
2.39.5


