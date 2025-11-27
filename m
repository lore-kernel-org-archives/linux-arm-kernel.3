Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E3FD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bbDeeML+5/PqsYJ+tyaJ3n3d7uxwNPB/ux5rFNomCWA=; b=SFzOYC8kkpCobN43+xlce+iVyS
	8SpJukWzEIHPN0bQ8qA+2QFkkoEhrIps99ZBsoViWu0LPpcz9w/Ogt/sZ43ROf1SAPI/CVQK3T/Jx
	e7qmdhvsBublhXvBdJnrO9Po2NRXjMIjUKANl1fBSajhEHVTbXZPYeSU7WfTm9zhhS35jOMpoWHya
	pqFssWNGHY08CgQyV1nk+lQbdBs3vLcwOtF++qI+lpLdYGR9vdZlXw5q1HSHaMiZmPetDCrIikyIt
	sRqyNYeLcejsmze3drqm9jpCPPcad0018kOQi/nRcbmGqhzo6Vazi4doCwB2qjGiHTXxTXbkchkJV
	JSCplk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhGv-0000000H63s-3qwJ;
	Thu, 27 Nov 2025 19:03:17 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhGo-0000000H61g-3fWW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 19:03:13 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560+5C/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1764270174; x=1765570174;
	bh=bbDeeML+5/PqsYJ+tyaJ3n3d7uxwNPB/ux5rFNomCWA=; h=From;
	b=h/ey+QDyOMcWQcdbkE8ek4GGzy1XZshTm5L0n32Yl3nI/SmWo7NrnIYNYNzqOlN+h
	 zuT4nzBeYjCaZTrZ5EYPLqr74Yi1ViAODeVDK6LV55/BCS9lPG3zbqXMT2HZPi5ZvO
	 WrBglNjewAq4elAGQQ6XecpIK/IwEABTiMAEtc+0g9+eNrteL5w6+kwd0hdkyis61r
	 mYSAzyNOPAybpJtVIbHoMVzbs0xCtUAv7BtDZ5w1HwYDRYzzG3M6QKC4mOQyy7tIA4
	 Tn9ZIKGLR+9ydOKGCTL0agcr/gUHoTnAOWsT0DrkiJXh9NXdNKn73bpv8AVE2TFy62
	 h3WMxBNXLw1IA==
Received: from localhost (nat2.prg.suse.com [195.250.132.146])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.18.1/8.18.1) with ESMTPS id 5ARJ2rYV008156
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 27 Nov 2025 20:02:54 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>
Subject: [PATCH 1/2] dt-bindings: power: define ID for Marvell PXA1908 audio domain
Date: Thu, 27 Nov 2025 20:02:02 +0100
Message-ID: <20251127190237.745-1-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_110311_202438_A58991C4 
X-CRM114-Status: UNSURE (   7.15  )
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

Define an identifier for the SoC's audio power island so that it can be
referenced through device tree.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 include/dt-bindings/power/marvell,pxa1908-power.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/marvell,pxa1908-power.h b/include/dt-bindings/power/marvell,pxa1908-power.h
index 19b088351af1..173f47e0e69d 100644
--- a/include/dt-bindings/power/marvell,pxa1908-power.h
+++ b/include/dt-bindings/power/marvell,pxa1908-power.h
@@ -13,5 +13,6 @@
 #define PXA1908_POWER_DOMAIN_GPU2D	2
 #define PXA1908_POWER_DOMAIN_DSI	3
 #define PXA1908_POWER_DOMAIN_ISP	4
+#define PXA1908_POWER_DOMAIN_AUDIO	5
 
 #endif
-- 
2.51.2


