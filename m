Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131F3606EE88
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rZyMamNK;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=KOLG1A/V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cZO12q2rUYGTJsRBXXjfwgfWq9/ftofCaITTyvCFUto=; b=rZyMamNK6B55f3
	eAjdJsugrPxXNLHGx+Xehv7BJqZNoGSFPekHHKBxvv9VqWNe7o3avp5oqUWBHtAoxeNSFAttg8RTn
	UMArORhS0GpVi5ofDaTU4uh/VKlCm2O8o6i4lUphaugt9ZJkByEN3GK0bXKVJi0PeNhsL/cZ4sILS
	tCDl/YqO8KnxmVdo0UZyX4mbAh/PrgQuHdvo1wYEluFrzSP6y3IIS321CA2oLEUiTIB2GxKkWGNFa
	WGRqug6b80KR8qvWViSf13b40bgm8yvdvo5d0dxev1Gi2NysYrOkQSZmrs+87UGe/UWSr7A6H1WQ0
	sLMNLM8HNvwOprAeC54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdek-00000005uqs-37VK;
	Wed, 04 Nov 2026 16:16:10 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdeh-00000005uoY-1bKh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:16:09 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 79A50240029
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 17:16:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793808965;
	bh=cZO12q2rUYGTJsRBXXjfwgfWq9/ftofCaITTyvCFUto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=KOLG1A/VP/BYjsOCqYOiudOKWdcUDUf0h6xyndjEuoqPFAg7estkXYby474OLgno4
	 Rx5w1hYLvHknmBQlKmV9wk/PUNCKlI3chOwcUIpFcaRsSFTIyEAph6qS4Mzzft3Cha
	 Ui/Ysjvq9s8ytfuTBRZSCD72bNMDHixzERVhK/JBE6CcxTTHz66z/OiZ2Llg+0h8bi
	 fbc052edij+AoHTzX2i0I+cHtstnjO5Mx+jPW6KtY0gko9ACXYEbtXI8mtjQr9bpgZ
	 TdPD4LiuIryRTCvWQ91cH56P9zo7GbDeJEBUsg4iHelK24xDB97Zo1CM0A/kS55AxD
	 ya/yQ+y3luFLQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKVtB6Cxdz6tsg;
	Wed,  4 Nov 2026 17:16:02 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] dt-bindings: watchdog: arm-smc-wdt: allow a list of SMC ids
Date: Wed, 04 Nov 2026 16:16:04 +0000
Message-ID: <20261104161553.30115-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_081607_909422_49475655 
X-CRM114-Status: GOOD (  12.20  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SMC function id of the watchdog service is not discoverable and
differs between firmware versions for the same SoC. Let arm,smc-id hold
a list of ids that the driver tries in order, so a SoC dtsi can name
every id used by firmware for that SoC. A single id stays valid.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 .../devicetree/bindings/watchdog/arm-smc-wdt.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
index 8e9d0b7e8244..9844b23ef51c 100644
--- a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
@@ -18,9 +18,14 @@ properties:
       - arm,smc-wdt
 
   arm,smc-id:
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
     description: |
-      The ATF smc function id used by the firmware.
+      The ATF smc function id used by the firmware, or a list of ids for
+      firmware versions that use different ones. The ids are tried in order
+      until the firmware accepts the init call, so only ids that are known
+      to be this watchdog service on the platform belong in the list.
       Defaults to 0x82003D06 if unset.
 
 required:
-- 
2.56.0


