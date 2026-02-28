Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970DC1048924
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff/Zdbjdtkub8MypRwotH58Nhr/5MI7vGyYAVphSh7A=; b=lCdXOW/Y7oI8lE1rS4LGCIMkFY
	WrwcXiKFqngb/LeSygLlOb7mn2b+ibIVpRyf3l6HobWz3zOgutPe0KYlq4M/+k3XzMI/B67+Snz1M
	oyCVaazXTVxAPCtF6ebjfDNsJBf/01+YREKnyi8i/65u/LoT9JmRT0n2WK06gSmXlfxU7efyU8MA3
	3hKT0u1d0fwgTnqxmqMo9oKCHo3YGtSzOSRwBxmaRT74AsInP/GlFu7ReGl5CoHFRlAngiJxeNC+8
	W26GuyH9J0k4fvjDZ8rJta3O6tXXgVO7D+zN2QWlBAuTy6+xuf+v9q1WbOgzvyN9MXID1yucIVlZV
	9GCRi66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qI-00000009ILl-13z7;
	Sat, 28 Feb 2026 00:05:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qB-00000009IK5-1JlS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:05:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCF8343FB6;
	Sat, 28 Feb 2026 00:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48629C19422;
	Sat, 28 Feb 2026 00:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772237150;
	bh=rhuH5bZWPXEvksruFJrNP1WLqN+56EEVyEMkg0zDSyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qq8SbTFriBV4UiyiuEX0BwRXJiliHl0oCUDoxtFnrafh95OGIX51DY6wYTcuA+TNA
	 bovfPekB2LejmhY31inAHKITx8whZRWdZaj4lyBZtnOL5aiXcb0ehRjoDv1FhiCoJJ
	 knD3f3ZHxh/nCRlUJABsErchCn+TgxQA6fbD2h0ljy8t374cCczyb/uIqjdEiJ8x/Y
	 hPi067SUlFzsFZ33jHAsyC2lbIKtr0cmAde07CpKqARmeg3tD1BJYKlTYzkWxNcN2j
	 bA9KAyS/cF+dBY4l7HkIq5B/ZKxP3UKViH+n5ebudrET/OViZBodje+0VtNGmUOvlG
	 k/Z+7tkjLNLoQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Feb 2026 01:05:42 +0100
Subject: [PATCH 2/8] ARM: dts: gemini: Tag disk led for disk-activity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-gemini-dts-fixes-v1-2-0c6f6d0fb4bd@kernel.org>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
In-Reply-To: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_160551_442518_F5A8D131 
X-CRM114-Status: UNSURE (   9.16  )
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


