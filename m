Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483F9C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 19:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XKm4PVj+czGp4hCifDA5lQ3vDbIHqtFE7/O+PtT1NE=; b=lfkvyWJhcjGc1eY6vHQ/icgpsB
	hSikU2vXc8nIGvwNyWNPLmEkUjADgTThQlT1McS6+UtZAjHN3abu7loK44oha6BxifIdXw3QoOxkE
	Cu0Okfhh+WJuM6Fm8zc9LTXcoQzF9GOv92uUNLgSig2LZ5kefxppiq/KC01AQe6rMBb2X8M78cWuq
	qBz2y+szK7TCVMUf27JVvWr+bm/glBCohbAqpn2NTlKfuQsMKjlsEOK40bLfHFgpA+nTvvcLjam2r
	fkNIYHjgf0KHgWsJZQWnbVbpPv52FeaOofaewli0b0y4JcHoPlDABNKmyYXmC0ErLZU/ZfTECWwzQ
	/4QnuGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x80yy-0000000Gbbm-3Fj4;
	Sat, 19 Sep 2026 19:44:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x80yy-0000000GbbK-05wI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 19:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DDF560258;
	Sat, 19 Sep 2026 19:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADA25C2BCF6;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789847058;
	bh=m3esp8qIvL5KMF6ISMGW/BY5E1YSXXPNADpk4JRXN+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RrVBsGYgzEYeUqMBtWU08Rkh3WOBSDqeNE7qeMj6zAE+3CSWjyYTjQVSpsZDoU5Nn
	 GXbPuGQmURw8EepAhH4mKjZgJKnuOM/8lGVGf4vyb6/D4nYzgIk/QW+f1e5pBYYEvj
	 MfUL4OAPkX9yCSXrAM3UrUAdugBFft7SYxnSX6jGXyY6j5RZsiE2XXLs5+TpAKAHno
	 O8+0kQLFI4wcBt//KM8Otb/DksfHHfxZlRaH2xCMDtef80P/oRVkL6/v2yxHIYpPZx
	 TdvUVfPgFkUmEyW1Sloy89w/chPVp62UTCTtAGc1aQjjj1R3GxjUsMVEgenTEo/TuA
	 e+h40nWyFBAng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1F4C982D8;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Date: Sat, 19 Sep 2026 21:44:17 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Sophos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-send-dt-v1-1-365615a74ef3@studio.unibo.it>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
In-Reply-To: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789847056; l=951;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=P6WprlGl9p4BGd2SEJ2f0lzIH3aESc5ZjrcnEQEX7U0=;
 b=uaqsp1Pmm4v68ng2YFLr+O9LDI/RnSSD6CvL/r7i9mabCCNOJmeMskDvDFa1iQNgW6v7CMk3z
 qwdh+uzq7AxC9YAM2nXxq7W8Q7a+guR8MqJPilI099nTHadhidS95GR
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
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
Reply-To: nicolo.giuliani6@studio.unibo.it
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

Add the "sophos" vendor prefix for Sophos Ltd., a vendor of network
security appliances. It is used by the compatible string of the XGS 87/107
firewalls, documented in a following patch.

Assisted-by: LLM
Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693..3dd9d9b8ab 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1595,6 +1595,8 @@ patternProperties:
     description: Sony Corporation
   "^sophgo,.*":
     description: Sophgo Technology Inc.
+  "^sophos,.*":
+    description: Sophos Ltd.
   "^sourceparts,.*":
     description: Source Parts Inc.
   "^spacemit,.*":

-- 
2.48.1



