Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CC4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H18pQDHS+Wl2oDmqnqQEEktAI+D+5x6GJFUdazxf2qo=; b=MMC6iePKYV0n+y0DnhL+KZbaCy
	ittQiWWBVW+Q2ZH1F5OHShXhyYTYIGAS9UcM/v3CHw+MMqK/rauRnD7U8ojGNCAr2y7oVMELP2Y/y
	jgcZjlF+M83qG7445s43mbwnwbCw3k7afjqkrDUack8UagzwYDKt5wvLzTwL+nbEyfTghUEAH9oxp
	/4PuTWRjimXdFEBjCckHKn0Yl6wd29Lg0MSjRixnHx79pXsyaUtadkQWA0kPCqhpxUe0YxSBangAv
	jvVGKtEZMfSsWk/CBDvUNcC3GL0iTHItAUYKydQhXUP1XNmGIhsXOfyYkvAP996MGNqULwktRcvGT
	4IMONHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdW1-0000000EfTb-38cg;
	Tue, 17 Dec 2024 19:45:57 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdUv-0000000EfL9-2bOz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:44:50 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A4C52C00280F;
	Tue, 17 Dec 2024 11:44:48 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A4C52C00280F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1734464688;
	bh=Xjzhl5Kl2fzJFUBGzDTEeE5m/z/iii2XRHFZlX7lMGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rITcCvWymgfI0li4BabB6Yog0Sn35TreNeOf0c3DqQwDXPQ3eWK8xqSU3RqMwvuGt
	 vFXnTNNjmAGTT3nikc+WfV04OAjvZQc9uu0NpqJv1Milnk0/Z+pPQJ1zvL0PSVvguH
	 jeBsyey6u9f6575J24Fp9iMmxFcOOoZdUU2r2OXM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 4E3D018041CACA;
	Tue, 17 Dec 2024 11:44:48 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 1/2] dt-bindings: memory-controller: Document rev c.1.5 compatible
Date: Tue, 17 Dec 2024 11:44:38 -0800
Message-ID: <20241217194439.929040-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217194439.929040-1-florian.fainelli@broadcom.com>
References: <20241217194439.929040-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_114449_736310_8430B8C9 
X-CRM114-Status: GOOD (  10.34  )
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

Document the revision c.1.5 compatible string that is present on newer
Broadcom STB memory controllers (74165 and onwards).

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
index 4b072c879b02..99d79ccd1036 100644
--- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
@@ -29,6 +29,7 @@ properties:
           - brcm,brcmstb-memc-ddr-rev-c.1.2
           - brcm,brcmstb-memc-ddr-rev-c.1.3
           - brcm,brcmstb-memc-ddr-rev-c.1.4
+          - brcm,brcmstb-memc-ddr-rev-c.1.5
       - const: brcm,brcmstb-memc-ddr
 
   reg:
-- 
2.43.0


