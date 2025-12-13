Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F19D59F7A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MsJ/bbje7wscSwZPWlgEMlKtiOAlEmU0N4goIajw7B8=; b=N03q5JY38OayHeg6BSrav9ljoa
	UP4JTCZvHHJYAHHnKkI+hKe54Tq3W4TYUro0br4Tqm6vvdIYsBjM2hHeRfJQuERQh/QGnWHrgmwB5
	TohN/CT0imlYyc4XW7hgqZ+tB1eoyE+D0HXh0YJ7KY0pOOfTHKqc2bAmEhznOoqBtOrKtSg1tkYi8
	Z3RssZ3fWFAclqfpvJx9+9bdYHmam9r8EAZ0NN0+Pt8QA01UKk9PA4bd7Scgs6ofLZG/jqbvpi25l
	mwozmEUiubYakVF0pEgAQjI28mqUkZBiNpkhDl79UEHetLJkUIaJVQ5NAGiiiE6FDKVm9PBVEvWv5
	8dqevh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vULJq-00000001Xcn-3OS7;
	Sat, 13 Dec 2025 08:49:38 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vULJm-00000001Xc0-3A2p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 08:49:37 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560+5C/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1765615742; x=1766915742;
	bh=MsJ/bbje7wscSwZPWlgEMlKtiOAlEmU0N4goIajw7B8=; h=From;
	b=W4plroK2aGc8coBxZGC4nza2c3SitcVOSLEzgydCidHCuBrNBvMdJusVb6S0JkMZW
	 f9znjwQmGI8xG32cViAoN53pCDhdLse5wWjjBOz2jwFsp1vZEHAKXakXCTJt/e4Lqe
	 mUMZ7cA4KPmmvsQkNfPlJmkuZSNFZIHKwde8GM9veZEgkn/vlmfqEFxHvYrwroKiGL
	 RWtKVRG5KUtgapKmHrAnrJ9OjST1PhDT9t6Z7cXujlO++l7h/wu9gs/d06qmG1VUPO
	 WxBn+pfWI2RmGIOMfa9IZ8OB1KejQtQ3l+wgolCuZvggNAIVtj4Bz40J/d7wJ2uaQ+
	 S9sR/aobENiJA==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.18.1/8.18.1) with ESMTPS id 5BD8n1tx051949
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 13 Dec 2025 09:49:02 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: power: define ID for Marvell PXA1908 audio domain
Date: Sat, 13 Dec 2025 09:48:12 +0100
Message-ID: <20251213084843.7491-1-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_004935_355785_1B35E188 
X-CRM114-Status: UNSURE (   6.52  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Duje Mihanović <duje@dujemihanovic.xyz>
Signed-off-by: Karel Balej <balejk@matfyz.cz>
---

Notes:
    v2:
    - Add received trailers (thanks!).
    - v1: https://lore.kernel.org/r/20251127190237.745-1-balejk@matfyz.cz/

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


