Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37FEE7716F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 00:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZCQu8PNGzbUydOutittbytVy0ecwKj8suiZ8x5X5G4=; b=x2GDdCfCxkEAwqclMukuNW0Ye7
	+2XCW1Z5EDKStJFYE+4v3V+uys1mkLHtnJlFbbn63AeMrHj8kvojScBVWkirXI3Ol3B+8auIsjXa4
	Rr1y/Yfwvk3UeBWcfzCrmNC111+21ZHjMGW3S3QsjqjTIsGWFO5g7akAlnDmMKHmaI9f7ARfIRsuY
	g0QJVkcT3gXTCVLP5Ddq2KnnaH7a4/1ECPMGlUlfVbJKEbIjxpkqoagKVZAKarEM5mcSLEotzi5Hl
	QZAwOFcpQ/ecL8Ylic8hoVWam+/ueivsUltlU3rhqrDcacVmoEtVmryb43jXV0NhMvRA+AacTwiHp
	fLA1g1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzOy-0000000EHgl-2FZI;
	Thu, 05 Dec 2024 00:07:28 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzL3-0000000EH02-12pU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 00:03:26 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id F00E3A0EF3;
	Thu,  5 Dec 2024 01:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ZZCQu8PNGzbUydOutitt
	bytVy0ecwKj8suiZ8x5X5G4=; b=Hg8o7GWSUJguKoIGhZzqH0h2rQ+BFrmb7szp
	2qdUmyk0Lju44v+ZBLP5M52a5BnKklhi3S5uEMhpmc8xUn82nXv4vIuZv9GI5oQ6
	XKMnLlISbfmr3m4XFDP5HDP9gw6FQfZfwLcCCAP+1rMtkSfSSI1OZUoNmXF6NiXI
	YiFFL7mhd0HeYCmkGa0+/BXdvuW6zwjTTqp+plE/f7Tk+tKRxLw4fBEpo8kV3ydP
	oo65XQSclw5gAExUbwWTtFPSBmL7Zle8EKz6vj7iLM4GzTe8yfKWUyxFnSEQQjp1
	MycRpklAlleP3jCvH6rmKRgn7ICDHVXQn1FoLCzRo4KdJJ2h4TuYIntasdu7HRee
	a5oaZH8Oc1jg7GSaQJeIajT7lUrjKHRgfeSYk28jOo9kYi0ym1qd89RlBLqaVZWk
	YV/Xc5LglZJlr21gzoSheOpqqD1MrJ+bzDMFhvR9jAqAQTwwggeOaVSvViYFV4Vp
	SV0/LGBeFPTlaKPbaShmrB9vyfvGpIZDp9J7GjMIGNaRLGU/Er12Oxg/E42xMmMQ
	DBhily29JlITUOJuJN78yGYk/dJtKmias7C1dvYY55jbi+qWm915qrfqsZhTuT3G
	h/BwRTHBMEOHvy7SmMd+mhbaLO3iyuRiBs/vxVTYg0p1dPA7muNPDkjRFn9btpI1
	+tycfYg=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 3/3] ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano
Date: Thu, 5 Dec 2024 01:01:38 +0100
Message-ID: <20241205000137.187450-4-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205000137.187450-1-csokas.bence@prolan.hu>
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1733357003;VERSION=7982;MC=1494516499;ID=169669;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855627561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_160325_444699_56FEECDB 
X-CRM114-Status: UNSURE (   7.89  )
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

From: Mesih Kilinc <mesihkilinc@gmail.com>

Allwinner suniv F1C100s now has basic audio codec support. Activate it
for Lichee Pi Nano board.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Moved and fixed conflict ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 .../boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dts    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dts b/arch/arm/boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dts
index 43896723a994..472ded0aafcf 100644
--- a/arch/arm/boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dts
+++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dts
@@ -62,6 +62,14 @@ &uart0 {
 	status = "okay";
 };
 
+&codec {
+	allwinner,audio-routing =
+		"Headphone", "HP",
+		"Headphone", "HPCOM",
+		"MIC", "Mic";
+	status = "okay";
+};
+
 &usb_otg {
 	dr_mode = "otg";
 	status = "okay";
-- 
2.34.1



