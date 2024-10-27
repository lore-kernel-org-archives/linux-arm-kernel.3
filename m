Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1F9D10C16
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZCQu8PNGzbUydOutittbytVy0ecwKj8suiZ8x5X5G4=; b=k+Zgtfp0F+HiOvH75i/cBw9cS6
	ypyfir3ZO1p7h1xcvb/SW+xYsOknDMJ0b/IkxmC88FEyqaAfDuDWlm73+p8vhoZ7Qu7b/64Px+yVY
	GenpQDbsSBo7SukXeb5gRt6VQx/ZUdux9fPFV0tLbgfQk2I30PDJT2w/dCgRVBwDddUxzE09Mmcce
	tdgpCiI3pokMTbZtax0fmVUI6gBxvaxT4Sw5S1JovKvezqJq/fOWhyaemMP+lmT9xC97OFHnXuzRV
	xMb+ge1nexe/pjibOaWSZ/UHrdZFkTOGQxn9A2gsfiaha83qEIKxzX5rMeKacankyUDF+l34PZk2x
	+3IpFM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4zeB-00000007uN2-1eco;
	Sun, 27 Oct 2024 09:33:19 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4zSM-00000007swi-0qmp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 09:21:07 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id DF660A064A;
	Sun, 27 Oct 2024 10:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ZZCQu8PNGzbUydOutitt
	bytVy0ecwKj8suiZ8x5X5G4=; b=pTzbvm66ynymgrDhb5IeUDfKfrrFJeXacKhk
	He1xi1hVx8+QmcaybexD01sOUur9n3DKDwko39/PMgg48CyHNUf3r+IzXGB6f/NW
	rwdYtoROvxmBVtU1yqCjWJ2iHP6QsGdgGxDKxDAKPL0Gja7goG5rjY2dzX0iHDxj
	zXR2MT9w8RB8ov+w2vyNaYxXLUG33COW5Ms4u5Yb5ugZIPnNu3aOOQ2RriFmOy7P
	Xw2OavY7kGzLKSuqcFSvPzpG0MgKENp/qxkPbR26xGOb2HEVf5Udsd2f6A6a4qlR
	M119xCi1NhqEMswCpSyZZVaiFi+WhlnRtAea1zzdSzugBKbGYLSkH5u3uh92Zjhm
	EG1I6tZ/8SFfw+0lRBvSBixkQGuLn+iXxBNP/2dzeWMNA5b/M1gHwCxQ8A7wjobR
	j2XuHjaTCaBvBBRyXFw4YEAH/CUdplNzS8NtQ7T7MxXA9XvZN93M1+oqdsuKwxep
	GhUjInq3/CumHYpnzBdmsS1zLb+lAsEqgSGAquueIWh/r5ZJPBVIt+U+fQol8SjQ
	J4S6F6oZ9aD1yBMpxBlS5SBVCsLamUT0tDntvGKAd+h6K/oXSlgSHcZbDQyp5xF4
	J3+pwpvVwVRhMQznw12RE0A3r55kqpaMKQsHNpIRb6NOQP9Sm1X8mUhohet577iz
	DoJ8ezY=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 10/10] ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano
Date: Sun, 27 Oct 2024 10:14:41 +0100
Message-ID: <20241027091440.1913863-10-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027091440.1913863-1-csokas.bence@prolan.hu>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730020864;VERSION=7978;MC=1006103771;ID=156046;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855677D65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_022106_429314_DB871D3D 
X-CRM114-Status: UNSURE (   8.19  )
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



