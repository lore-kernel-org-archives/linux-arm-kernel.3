Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDBEFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 07:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AcipymrztotqziX7C3pSX0j0j5jMczP0kYAPjLO05o=; b=aFqfkGwYSTiEhadNss4nNmU8pW
	ig3pLNT5/FTluaT3kpfzj6c7CFaUu157miJqCvvnT0OzfpAsf3/hQsDLWdhip3r/ikV39+vVjsl4A
	SLlFNddhPeGfQchHL04Y+qNw0EoiNL4Di7AWemWfDo7Lp1JVQK1AIkoxl21KP564YKIG+rlZsINJh
	prFdmNVqEq77ECZ2MnmK3+7AUq9zBN8PM3YDgJ0+w+EIDP7GmVI/fZSygjZADXor6za+frU83hni+
	Ybw2NnO7GRyza5QwadJ4og/90RxZVcaG36Nq8nRD0ZCQZW9dkFPa1czySRu90/F4YCL8BwpAFXIk6
	Oclk9cIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKA9m-0000000FPCA-301e;
	Tue, 05 May 2026 07:25:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKA9f-0000000FP67-1SPt;
	Tue, 05 May 2026 07:25:22 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777965916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AcipymrztotqziX7C3pSX0j0j5jMczP0kYAPjLO05o=;
	b=zSDE4QF7sfIkPaBRDfkGp8V87GlkHgZCZEZpncKPWiXlyVJPc5iklFJxyoC16BgEbt/kkX
	2/S43Lno3CWobTMm3YJwKXW0do/UTnI4sI+dRCvaDRe3K82RF7EIjMQmhrdPOUaDXbOedG
	UFB50O+qx+OL83+cJI2dUvkRo/LuXY5cEN8I0MhiGKbZVaWiOwsgeU9RdmbzPuTzpYnSbO
	PC55BDqgVFBuKki8owbX/M7adA7mAyj7BJq5hwOTp09mwT2/Jg4S8CGQ9CCOyL2XLGL4e1
	7ZyaoJsVxcEzikkoeiq9Iiqa36tFqLiWvkVz8pK5J4vRJaNwFN2sI0CP26B6Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777965916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AcipymrztotqziX7C3pSX0j0j5jMczP0kYAPjLO05o=;
	b=SykxpLQ7b67XIrm/zjHnicmSoWLEZpc+pH2lErTk3DlUN8HiW2GK2rFgka4rlSv8UFle6m
	mxef/cehlM3+caAA==
Date: Tue, 05 May 2026 09:25:12 +0200
Subject: [PATCH v2 4/4] arm64: dts: broadcom: bcm2712: add bcm2712-firmware
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-rpi-otp-driver-v2-4-e9176ec72837@linutronix.de>
References: <20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de>
In-Reply-To: <20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777965913; l=858;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=J8uzf0UxBnakhr29755Qqmk8YumZt3G68S6svRZD3q0=;
 b=OaBrTyYswxhcwx6rx7uAFSQ3p80HfRcgtEUXXpD9an/IpdfKr+T5LotzbdIHIz2qHTmbVAFjY
 5qGpMDkMCn0Bh0Q0lFezPrJ+ubSvh+FiQ+sKayJpFI87xPSOh5d4kZ7
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_002519_546752_8E5E5799 
X-CRM114-Status: UNSURE (   9.28  )
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

The Raspberry Pi 5 firmware exposes additional features. Update the
compatible to reflect these differences.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1a..7283078fd441 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -46,7 +46,7 @@ power_button: power-button {
 
 	firmware {
 		firmware: rpi-firmware {
-			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+			compatible = "raspberrypi,bcm2712-firmware", "simple-mfd";
 
 			mboxes = <&mailbox>;
 

-- 
2.47.3


