Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBF3E67A92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff/Zdbjdtkub8MypRwotH58Nhr/5MI7vGyYAVphSh7A=; b=THewzRnlzr3EC8TixznVYFbIDz
	OHFpiQK7sTQ3zpm1gQM9mmclTqeMuoCpP6oN+7N+7qNOqCFfxHsdNdRzaozHkYGJdkTO50cBHD2qE
	63NSWIfBnekSH+lf1TpB9CBuMgAeocxv7mmWUIfOsSPncVpdZhWOklsp/qtOafbfuu8Z30HFUvG+i
	CaQyQJoy4HUEugMdVfDYbCUVjrLQNAHeKZk6m7IffbyJCamdKGnlDsyvi0obY+ll6GdG1ubgmJNXU
	NJhZ9WE2MysRWPvkVJi5YMKupv/oAXD9clKQa5bv45ooi4V5jiKyiTathyy7zjpzPY655KJ/wmwbG
	70CznRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCR-0000000Efqw-2Flw;
	Tue, 03 Mar 2026 07:29:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCQ-0000000Efq2-15dt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 07:29:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 691B760123;
	Tue,  3 Mar 2026 07:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D64C116C6;
	Tue,  3 Mar 2026 07:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772522985;
	bh=rhuH5bZWPXEvksruFJrNP1WLqN+56EEVyEMkg0zDSyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZR7zefrT9PWtsxK7nZQ9yrrrSzG92OTmGeotEIPQhYVbM4vqfmAQJ69oWd3PS37x+
	 YK9+GxeOwegpnxm+d5GLSgQAOJbje/bkQixYPahDuLiBaBhSJMpvpRvbnxsr+aLyXX
	 1I1Zeg3MS2ALu/Kujf8C6ZCnHsFBjsOkSvn1J5PSiMNJh/EJvLt6lqwGL7haC6U/x5
	 I1lvFIStin3T8LJ9VOkmKDQmLK64ndYjKHA+FWjDaVU5Lo3oggR3hAdMk/HJlEWHoR
	 /kOfyiavtyylOReJAg/a6adVPlxvOBrNgRyZ+hXmyxxMVtdCpOYtZbcK72dpczLCj6
	 wTX+M5764oOog==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 03 Mar 2026 08:29:34 +0100
Subject: [PATCH v2 2/8] ARM: dts: gemini: Tag disk led for disk-activity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-gemini-dts-fixes-v2-2-5b92ced841ce@kernel.org>
References: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
In-Reply-To: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Linux now has a trigger specifically for all disk activity
and this is what the LED is used for so tag it like such.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/gemini/gemini-nas4220b.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/gemini/gemini-nas4220b.dts b/arch/arm/boot/dts/gemini/gemini-nas4220b.dts
index 6544c730340f..2488b9b24218 100644
--- a/arch/arm/boot/dts/gemini/gemini-nas4220b.dts
+++ b/arch/arm/boot/dts/gemini/gemini-nas4220b.dts
@@ -52,6 +52,7 @@ led-orange-hdd {
 			/* Conflict with TVC */
 			gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
+			linux,default-trigger = "disk-activity";
 		};
 		led-green-os {
 			label = "nas4220b:green:os";

-- 
2.53.0


