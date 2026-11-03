Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456BA606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g+TJVbVe;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=Jsn76HXz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IpTAQdRgdhCJhb1hvxDKWghah7aGv6NZyMkxYCZ92Rs=; b=g+TJVbVe9OiQ8U
	aoGQa3epyILYJBGS2b89Pz6rIzCv2YN7S7kgy5kDXTYaclUVrJz8riSoJSPvVNtEIV2V9g0lZv/GB
	1tRDqYLAS3A8ODc6cAqjeehO4P1U7YLmtlXGeDxdHA069rMVvnaaq3Gk2ilOquJrszeAtYD1Bi4S7
	Fwd/UubFTpOBivqVxB68ydmP/1zlevM+uMItzGEb27QuFJ8aDAGj5d1U7kMWX6X2QgChiwuSVmJjD
	P8VRbxl1lbXW4ymQTobEk4Kn0ERPZ45jB8SCvBP7vQqQF8lO7xGY3Ae+BjzRVv1WzIeVvqK29lMj+
	HRwJHxdgbZJ3tUQLc+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLCd-00000003cv0-3dLH;
	Tue, 03 Nov 2026 20:33:55 +0000
Received: from mail.rnplus.nl ([178.251.25.70])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLCY-00000003csD-40p0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:33:52 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 9745C379793
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 20:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w05HoLeerQNK for <linux-arm-kernel@lists.infradead.org>;
	Tue,  3 Nov 2026 21:33:47 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id A6BC737977F;
	Tue,  3 Nov 2026 21:33:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738024; bh=a4vWSx9rLNvabRu3vIDBn7/4YymkwBrYWvlKnKwfxas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jsn76HXzv4eFOOwgUbSQIOLIMAQKaYgXoVJs1tbb10Zi16awRA0nzypxAAuD7oPf5
	 ErykmkbQDhlSf/z/v3DVS7gRqu0J7U3IRopvcx7d9Rmlkm3cXH5s5Of3IlzeiAKXBS
	 LxB5ravxMejTgXwNveef187G1bdaVUpEVvS2l94Y=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: aspeed: x570d4u: Add some GPIO line names
Date: Tue,  3 Nov 2026 21:33:05 +0100
Message-ID: <20261103203308.54789-5-renze@rnplus.nl>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103203308.54789-1-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_123351_133820_74DA0B47 
X-CRM114-Status: GOOD (  10.92  )
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

Several GPIO lines used on the board had no gpio-line-names entry.
Name the NMI button and control lines (GPIOA2/A3), the BIOS flash
chip-select and LPC reset outputs (GPIOJ1/J3), and the hard
power-off control line (GPIOAB3).

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index fca14320829e..0089845a6f0b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -79,7 +79,7 @@ iio-hwmon {
 &gpio {
 	status = "okay";
 	gpio-line-names =
-	/*  A */ "input-locatorled-n", "", "", "", "", "", "", "",
+	/*  A */ "input-locatorled-n", "", "button-nmi-n", "control-nmi-n", "", "", "", "",
 	/*  B */ "input-bios-post-cmplt-n", "", "", "", "", "", "", "",
 	/*  C */ "", "", "", "", "", "", "control-locatorbutton-n", "",
 	/*  D */ "button-power-n", "control-power-n", "button-reset-n",
@@ -92,7 +92,7 @@ &gpio {
 	/*  H */ "", "", "", "", "input-mfg-mode-n", "",
 		 "led-heartbeat-n", "input-case-open-n",
 	/*  I */ "", "", "", "", "", "", "", "",
-	/*  J */ "output-bmc-ready-n", "", "", "", "", "", "", "",
+	/*  J */ "output-bmc-ready-n", "output-bios-cs-n", "", "output-lpc-reset", "", "", "", "",
 	/*  K */ "", "", "", "", "", "", "", "",
 	/*  L */ "", "", "", "", "", "", "", "",
 	/*  M */ "", "", "", "", "", "", "", "",
@@ -114,7 +114,7 @@ &gpio {
 		 "", "",
 	/* AA */ "input-cpu1-thermtrip-latch-n", "",
 		 "input-cpu1-prochot-n", "", "", "", "", "",
-	/* AB */ "", "input-power-good", "", "", "", "", "", "",
+	/* AB */ "", "input-power-good", "", "control-hard-power-off", "", "", "", "",
 	/* AC */ "", "", "", "", "", "", "", "";
 };
 
-- 
2.56.0


