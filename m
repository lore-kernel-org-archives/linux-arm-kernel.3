Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A1AE6ADF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 12:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZCQu8PNGzbUydOutittbytVy0ecwKj8suiZ8x5X5G4=; b=DrmF4jEhuJYh0v/Vqj/3JUNPaM
	qcgut5YH1vWBbxI2UnfNU2eJgejhNp/wZBU6Aj9KbVNDjKHUjwROHg6g6bLWGurbow30lAjYTAVMo
	MqWU2cOwqXdvsZpHoIAiHq0bHitt4VbqFNsB/qJqY/yfebY1RQ+y2p7Jv3VwRsg46VnycHl9sZYc/
	vfSOYOHcbmrgDsBCGzZtWUkObL8hgRqQBn8iuYnNQJA3jZlboTij5TaBlUr3G9nHGBU5NGwssP6MB
	gNnbWa4GvV9U/aDXIp0ts2Y6Dqrl/n1U4iiDdl5nq42g+X2ReS3jFTUq235aOA5xUgQmu0QdM0QO4
	El6ZSfZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEpYL-00000004KrH-42IQ;
	Sat, 23 Nov 2024 12:47:57 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEpTq-00000004KFG-085z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 12:43:19 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id AF4C7A0365;
	Sat, 23 Nov 2024 13:43:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ZZCQu8PNGzbUydOutitt
	bytVy0ecwKj8suiZ8x5X5G4=; b=dROvrBaHTGGG4MgsvrJAMJu1R4x5bs43t4uK
	JzMegSkUE8dpqLmVV6m4qFjRxBEOyU2qMdGA92gHytO0Ts/Pfq/el7jzTRXW3n8v
	7E6S+XJ8In98RN4FW8mcA1nojHNZqeqh9BtqTvzWe0oONkNL/Aomtf8HUBiuLnrz
	+9GVEodm/s3IKRsPPdvIq/tYPv8bH+FMQWhBizcligiBOEoHWYg2vHvz8/esxSkv
	LK0MKNci95AZsg/s82hf9kVbFj1KYbMwy7Ded7RrOnC/BriUo+3M3RLEHXJNO5kq
	lwS3y4lCPJ3R+2nN2C0qg45qMtyyPUD6X/NSX7Dxz5heIFa+cERtSWP4eCRPw1Xx
	AecrxG/b6Hg3volmGKpWDQImKJ1szml3gdyttkjibf66nnDlVbhnYJ9C6YzRJjaj
	rv0rG++imr1V3dHbEmm/w5lIkQXQ8PUFyR5fqmczhCHsM8XG7DySqHQ6zcfduOvB
	j4I7V1v6rnftGQ/nukkkcLJkWAibEpAqX9ViNb5lvR7onceoskoEvRAIglQP7ziz
	B1VooIFWE57OU1PFs93oHyRG5iEntuZPb1ZLTdk4EOm7KfH1JJ+JEFhHtR87/WVr
	altyh++C3uL1Zi+EyaAEdejbqF2J6bZMdrZf0brfZBFjIeKWhcqhzIgUR1WsR2tZ
	0xw8e0g=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v6 5/5] ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano
Date: Sat, 23 Nov 2024 13:39:05 +0100
Message-ID: <20241123123900.2656837-6-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241123123900.2656837-1-csokas.bence@prolan.hu>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732365796;VERSION=7980;MC=2302033481;ID=80957;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD9485560726B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_044318_296352_33A99113 
X-CRM114-Status: UNSURE (   7.70  )
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



