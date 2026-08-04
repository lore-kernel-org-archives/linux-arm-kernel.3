Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC02C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ottxVU9lmATMxS27KNTpJhhVUCPJJDW3skRaFvjRvaA=; b=YZ15SiE5UKEy9Iz3jiZSBPV9/c
	Wc8nTZkL0/5PkNF2VdOPxBtEkP1fqY7tLXevKd1RcGtMqBXLj6+J2R1vJ33837DHY+F5ZMEp/cd4U
	Dez/V6M/fBuP7S+fEGjWAK1L0KwCpdYhBbWOdDqBgE6G7FDlKpio66Bbvz1v9T7/Y+YvuPqFGpw0P
	3Q+uSL24pK3y9KlP8DJfZrhwXNjoBK1jnMzgR0qEASUjraQ2Bb5V4FPFh0pCXe7xpiz52HHj+/We6
	j+CB7ub+AjHGCDb7maGO57ColGLh7t3PlnISBttRaMcTg2rBpfvLCPOB7C+M8b1MXtJD3yMbrkSPj
	fkpB7sng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEyA-00000001te8-3am8;
	Tue, 04 Aug 2026 13:14:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEy8-00000001tcX-3MQM;
	Tue, 04 Aug 2026 13:14:10 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ottxVU9lmATMxS27KNTpJhhVUCPJJDW3skRaFvjRvaA=;
	b=dslGIiMmsdfaYY/VUGwD3MRk/iW8udv2QGLgMvruBLcBJG0mRoXo91ofHK1kS1py3dpoFB
	bm9uLWQkDO+8BhwD4+LrU2WLwkAtYhFpgKMQ/CXXuatSCToJdSjZFxnnaKujcI3owLm5mU
	bvgGBV4/PaiJw2aPshuulU5prxs+WwHdOhlZMEgublIyExUAPgCYVcWUoiJ9WA84dhAqzH
	xbKW/D5n3R5n1ADK7O0rrkXCNB0/90YMMcET5iZ3OCPVrV3pLaixZLM0Ms3PY2oLrL2TD6
	n7zyzaZjybXiM0nBBp3OXDae5+J/wo0jIuZu2w4OrpbPlYt5EtHfE/0CE7xgEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ottxVU9lmATMxS27KNTpJhhVUCPJJDW3skRaFvjRvaA=;
	b=MY63SY/DTgdWZBZzaLcxkPLKgpV8dXQrz8/qVv5rQh73aWAOnoprO3ckwun4zG5BKCibQp
	nn0EWguVpKOdzsBA==
Date: Tue, 04 Aug 2026 15:13:49 +0200
Subject: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
In-Reply-To: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785849242; l=1217;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=7f3naYgkeff804R+bmXoqHjRNXOpcMBIka3iPoDNmBw=;
 b=LpPlPJ89DacDPZsSss/PxhldgmbBomzwoht73l6wVCl0QOyams0w7Dto610nx7yzeDdUZxeDu
 f2s70ifMPwkD31WOR2gUkltfNaFDUEGdjKvbpDMRnwT7xhWfamg+5zX
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_061408_980172_DA56449A 
X-CRM114-Status: GOOD (  10.06  )
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

The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
and in a c Stepping. There are two separate dts files. The
bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
the d Stepping. The d stepping does not set its own compatible/model
string but uses "raspberrypi,5-model-b".

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
distinguish between those two steppings.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index 127be0fc27c22..5a86ad69645c3 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -3,6 +3,11 @@
 
 #include "bcm2712-rpi-5-b.dts"
 
+/ {
+	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712";
+	model = "Raspberry Pi 5 d0 Stepping";
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 

-- 
2.47.3


