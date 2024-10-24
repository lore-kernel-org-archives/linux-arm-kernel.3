Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF06D0BB66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZCQu8PNGzbUydOutittbytVy0ecwKj8suiZ8x5X5G4=; b=y3jdZVp4eaXJp+DwOqAteGBqSQ
	fosXWiik1Zm+WzjI8RF8PylY+ctXP/Jpa/BPg7dkP6AOcX3EngZM221Y6eNh4WusZvJPfhs+ljC/m
	8OH1vndp64hQ4SZMeX70wXhjj2iQT06iqjPRkhA6OXQO9Ke+xul8Dco7F+Ppb8/7xWQJi7jroAVLp
	kJZqKpRIU/L371Kqrlc9IYseT9zLz5fMOKRJ0IhsdtvEdHfgMFHD02NpFqeGSOHZSJ90I2G5TauF2
	Yq86qx+H7UAaF9XK1RzxgnJy4kbCido8MQw1M/G0AWyMb7NQzjD1+6BmgsY7JDuDuPXM1l7EpGpKx
	Fakv+YTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rux-0000000H1Ss-1qZ8;
	Thu, 24 Oct 2024 07:05:59 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rgc-0000000Gyb7-06y2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:51:12 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 8934BA0788;
	Thu, 24 Oct 2024 08:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ZZCQu8PNGzbUydOutitt
	bytVy0ecwKj8suiZ8x5X5G4=; b=dRBOhPkQTu1djvy/yrhNzLQWBqV/jd5h2LG2
	dzm0A23jLLM11u1Ra1N0AI06GeV+6Wp5b+E9wlyH+nhlIKyFJdZDw/exhGfWI6+7
	/F0MJfAuXnjSM/piKkoZH4SJn42SSxAv7p6mRssukclPN7VCUihMgYRPeFieTeVY
	+7/Ng4bEHffUsulHWIa4ZkMO8SgdMr4Wr/PaHIAMGWeFHFz7W331Z8PMR7TzY9mJ
	s1H5/QN8m06a5swK4/CsT67VyaSwcFy4YUMH9hDBXcViHWkqo/V3fGZvLSMG055V
	PNlbnxluHqRdFDrYhd9jQVwUluTIL5CyMSRDQX2xUwyp5eVZUH9OUTIHlwCv/r2q
	1Lt25ENnZh7qzMmqIfSa79UYcy6DJ84yPHGeBRHfRhKAAsVoBvCTAtcr78y/df0d
	DiN4a7jJ6b5hAs67g7Ux1eGOjMFOYc3gawiWjzBoeazKMnBL4PprJn8xZwt8KK6S
	krSAsQb13C9Rv/o9fzWaYx7A3xGsh2LnDWVgEBwuPEo88f6pRhtO2H9cr2WKCfVp
	oBy45SBmfrJmsGxvXK9Kj3EwXm1K78EII+gwqcBmPYnAXe012UbuYjLiTZsLvG/b
	anlvkt4hVvvNrfR7zaDvhBk1FtJH8Ukmh4WEPdN+JMQTIx6RY/cG1MSxY0LbGAkY
	xCu+LfE=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 10/10] ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano
Date: Thu, 24 Oct 2024 08:49:31 +0200
Message-ID: <20241024064931.1144605-11-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <13ab5cec-25e5-4e82-b956-5c154641d7ab@prolan.hu>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1729752656;VERSION=7978;MC=3474792951;ID=153598;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855677065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_235110_250756_36E563B3 
X-CRM114-Status: UNSURE (   6.79  )
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



