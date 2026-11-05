Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527B2606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cHaqOpie;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=roikVhSe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1G50rBV01liY/Ser18phaysjoabEV3aBmHhAJ8LmX5w=; b=cHaqOpiedCMux1
	UPyMxEzHu8W0RFfI6lP2t857FqWiIeC0OAHsN5G2fOrFroCMqOcx/5xcgMlbTbRQMQdUlVojEHK+2
	ZTDMEupuiEuL4qG2jBLVby97rNtKPGE8NVAe/yq/OayaWllrGMdHsv4nxS29kL2V/aJz497BNJ278
	nZ9bkbAzpK2AAQgDHqmcVTQ589io7i0oH3mVv0Nctl+AeiPxLUl6fsI1v2SucIOYLRneyZuYAMPyb
	EFKBeB52/HIaHNvR993rxU9TpcsB7mZgsNr58DqtPlRag7KcbqsShPKnbLEWKVU4yT36NxLU2VNdk
	uQhJ4ijg82YlhtWdMMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyD3-00000009Dkm-3AKw;
	Thu, 05 Nov 2026 14:12:57 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyD0-00000009Dj0-3yqM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:12:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C42A1496743;
	Thu, 05 Nov 2026 15:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793888008; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1G50rBV01liY/Ser18phaysjoabEV3aBmHhAJ8LmX5w=;
	b=roikVhSeQbfcm1C6KuVfw8SvcxGxhWz1lmDJcJDSFAnjhrJbpMRpIDna/DyON5TvaT+18u
	D2GONEaZXc4ejdjAoHPGLBE8tiRnPwSilfbMTp8Ue6rtl03cNgTFQKOvqv2/6HwD9h4Yvw
	JsRcF6HnAdHkZbv4MUaSL8sPoqtyWX5Vqs0x7fx3Yd3gdflxanbxGpXvxYZgT+LU30s9j7
	rj4Fx4pneUeVONE06WFshlPUOMTA7XC7Q9wS/KDtP7nQBdkiaS4F+68t7NxdmzumxP8l3U
	9VR7xUYhM9i6+bFoFyvZbK9yJiq8sKdGeQ65DfKLw6pIwc4MypHGpi6s1abKaw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 16/16] dt-bindings: clock: at91: Remove old PMC definitions
Date: Thu,  5 Nov 2026 12:06:52 +0100
Message-ID: <20261105110715.2486432-17-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_061255_162420_E1EF83BC 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.5 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Those were split up per SoC and are not used anymore.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Added Acked-by tag (thanks Rob)
    
    v3:
    - new patch, not present in v2

 include/dt-bindings/clock/at91.h | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
index f2a7b7d39c0d0..ebc41cb4edb92 100644
--- a/include/dt-bindings/clock/at91.h
+++ b/include/dt-bindings/clock/at91.h
@@ -14,38 +14,6 @@
 #define PMC_TYPE_GCK		3
 #define PMC_TYPE_PROGRAMMABLE	4
 
-#define PMC_SLOW		0
-#define PMC_MCK			1
-#define PMC_UTMI		2
-#define PMC_MAIN		3
-#define PMC_MCK2		4
-#define PMC_I2S0_MUX		5
-#define PMC_I2S1_MUX		6
-#define PMC_PLLACK		7
-#define PMC_PLLBCK		8
-#define PMC_AUDIOPLLCK		9
-#define PMC_AUDIOPINCK		10
-
-/* SAMA7G5 */
-#define PMC_CPUPLL		(PMC_MAIN + 1)
-#define PMC_SYSPLL		(PMC_MAIN + 2)
-#define PMC_DDRPLL		(PMC_MAIN + 3)
-#define PMC_IMGPLL		(PMC_MAIN + 4)
-#define PMC_BAUDPLL		(PMC_MAIN + 5)
-#define PMC_AUDIOPMCPLL		(PMC_MAIN + 6)
-#define PMC_AUDIOIOPLL		(PMC_MAIN + 7)
-#define PMC_ETHPLL		(PMC_MAIN + 8)
-#define PMC_CPU			(PMC_MAIN + 9)
-#define PMC_MCK1		(PMC_MAIN + 10)
-
-/* SAM9X7 */
-#define PMC_PLLADIV2		(PMC_MAIN + 11)
-#define PMC_LVDSPLL		(PMC_MAIN + 12)
-
-/* SAMA7D65 */
-#define PMC_MCK3		(PMC_MAIN + 13)
-#define PMC_MCK5		(PMC_MAIN + 14)
-
 #ifndef AT91_PMC_MOSCS
 #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
 #define AT91_PMC_LOCKA		1		/* PLLA Lock */
-- 
2.47.3


