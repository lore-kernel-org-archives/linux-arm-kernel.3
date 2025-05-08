Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5286C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cu38HV34lzCayHauI+Q4uY0+KLHG1UGBvE8v2I6e6Hk=; b=yhM0LGaBSzY4t2q7SpcrWdfMz3
	gOQfjtN9mqbb77JhWWt3fdQyNNEBJl3Sa09UKsfpOljJo141Cxd9orrbOqX9Xqun8VOFhZ+0QRQMN
	nnjedVT+hejfOgKHn3GrkGxK6YPXeietpIFu1aE2hRwUgX0pmgpvsPMRtiklHNlOJUPKDnkBPY1lb
	WaMjhTCyq+NnrWttmkuRC2NXBcUOBVXI+hqDUHM6waQmqLaz4Crgl3dF57HmNh8xC0csJePz9GOT1
	rCSHDqL9eDEHIG+dBvOP1PyYtPnnkasiQN/WjTrY1+k1fTl399Iv+vnQKcKtgcr3UXdzeyo3OzWjS
	ocxEZCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3rl-00000001FUX-2gwq;
	Thu, 08 May 2025 16:12:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2tK-000000014gV-2mif;
	Thu, 08 May 2025 15:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Cu38HV34lzCayHauI+Q4uY0+KLHG1UGBvE8v2I6e6Hk=; b=lEkUfCDLuQG1c0VtWzfKSviJcs
	fqRrp3zbDrc9ZncfptaV5Bu0poWsJzmTUCnWrtxOVWLpEduvARtxKMWZR3TALi8Mo5TnZsG4dSzb7
	1VhzufDRilg/XSV5J7bZGyBp5sQNSbnuJUN2S3sxoeGATBvJXwUejuUA/PGB58psdRxbwragKpFiz
	NHDjJS6C35LVfEHUkDxgGu5tPxGuNb4E8lRQDMfHArb7YqmCRLiF0HTyTlcFefYPw4xJyxuyLtbg7
	COMUtA3pYv0VD2Wlbatbeo3HJOg7HtiXefUYe6sGysjwbWDOh9OZUyKKaVBePdcqhZUY/+HATJ/Wu
	BOy9vSOg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD2tH-0000000G6Jc-2V5s;
	Thu, 08 May 2025 15:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Cu38HV34lzCayHauI+Q4uY0+KLHG1UGBvE8v2I6e6Hk=; b=Ul8fTSX0lo2g5HAsF6lFqWqsce
	aKX6PEsf+m/nK6Jf9h4vICEdkciVdubU4iE/9dqQ/lPIYvh+nHKbFchBixwuxsKZ8JSP645LeV9tJ
	O9WrahOBsI/5UN6Psh4jTiv+yK1wrCBWna/CIMuvWnM+ErEOo9Ot7LVFOn7dthuTyizOfAKLFnRrk
	q/phVXswFXIjOFm3q6Oic0+rLpohFVPNVye2T+aPcT8cUDvXHJq5dPOu1EnU+C7M33ciJS0aBNvnC
	wt5/iBRt/UIxT8s0sZNwc9d5+UgQ2akEyI0JdMO+tQ3cPA4GnD0ts42olj88/Wptt9CD8TkC0Qoxp
	Mf4q63EA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD2tF-0005fP-5U; Thu, 08 May 2025 17:10:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 3/6] dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma Systems
Date: Thu,  8 May 2025 17:09:52 +0200
Message-ID: <20250508150955.1897702-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508150955.1897702-1-heiko@sntech.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_161027_751385_24F9E9E9 
X-CRM114-Status: GOOD (  10.22  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Cobra are Touchscreen devices built around the PX30 SoC using
a variety of display options.

The devices feature an EMMC, network port, usb host + OTG ports and
a 720x1280 display with a touchscreen.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96e..6435c724e682 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,16 @@ properties:
               - rockchip,rv1126
               - rockchip,rv1109
 
+      - description: Theobroma Systems PX30-Cobra
+        items:
+          - enum:
+              - tsd,px30-cobra-ltk050h3146w
+              - tsd,px30-cobra-ltk050h3146w-a2
+              - tsd,px30-cobra-ltk050h3148w
+              - tsd,px30-cobra-ltk500hd1829
+          - const: tsd,px30-cobra
+          - const: rockchip,px30
+
       - description: Theobroma Systems PX30-uQ7 with Haikou baseboard
         items:
           - const: tsd,px30-ringneck-haikou
-- 
2.47.2


