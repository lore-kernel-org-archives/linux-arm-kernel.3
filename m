Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9227C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vIitDjHV;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=AuN1mweB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sjUVdGPpRThFzw+FQF/UnfYCE/2vePJvLFuHafbyQjw=; b=vIitDjHVd1L7jv
	md+g08d28rWZ8me7mikHVjKn6IyLRVA3bNFVQJt58Ts6QtLnX1yruqGkV9n/iaKJ0vWuYDd4wSjyu
	tK9i7J7pr6/Lry71Gv9U1CUZpQvTTfrGe9udTGCyPZBI9wnhAiHiZjwIoYjv0YnUEFfHJXK3G7qLC
	L4mAnF+6L37rK9evXNdivwPA2VLpL0scVaE1k+rHQsLDikwpBI16r7Av1D6GrGCIowAe5ScPAqEWn
	X3L4eggF5I42+jr2/XFOY2Q1fRP92P+I9mjRBrXVEQgNOV0WL7EwrrbQ7L6xGYWsPsz4ymkA4HEmw
	0/XnhQnazpgILTEDorAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLCe-00000003cvz-0nLx;
	Tue, 03 Nov 2026 20:33:56 +0000
Received: from mail.rnplus.nl ([178.251.25.70])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLCZ-00000003cs9-36nB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:33:53 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 1EFDA379788
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 20:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIoZp8YvhIOB for <linux-arm-kernel@lists.infradead.org>;
	Tue,  3 Nov 2026 21:33:44 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 39F5D379778;
	Tue,  3 Nov 2026 21:33:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738021; bh=wpaK3xlqbSy7BwAovXZxHl0KmlkJ7DTAtEtWwvx+axY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AuN1mweBZv9JootaBzdqVRAZ/Om8mJXHR958XTAd+PULHJt+HCJeSpSt1YajYhV2h
	 VAflSQKXHqyu6Ycur0aJVXHSLmoSw/hGACXo05pMP3QHJNzX9E22lrU0mCcEbc9gFR
	 z1BYcz6rIdWCMgSDe4Wg0lLYoHYFLQ0aKMO0bFhM=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: aspeed: x570d4u: Remove w83773g temperature sensor
Date: Tue,  3 Nov 2026 21:33:02 +0100
Message-ID: <20261103203308.54789-2-renze@rnplus.nl>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103203308.54789-1-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_123351_943142_B001D30D 
X-CRM114-Status: GOOD (  10.28  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The w83773g temperature sensor is only available on variants
of the X570D4U with 10GBit ethernet and should only be loaded
after checking the board variant information in the FRU EEPROM.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index e61a6cb43438..7d27833b761d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -164,11 +164,6 @@ &i2c0 {
 &i2c1 {
 	/* Hardware monitoring SMBus */
 	status = "okay";
-
-	w83773g@4c {
-		compatible = "nuvoton,w83773g";
-		reg = <0x4c>;
-	};
 };
 
 &i2c2 {
-- 
2.56.0


