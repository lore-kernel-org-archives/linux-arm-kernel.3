Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476B8C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Naj+/c+DmeWzjH0iSWv3H6bTHR9+JTgYDr3R1wUOTo=; b=aOYTs5ndQaeZtsLx1onSOT04vm
	FWLlMOVUkcUGyyxM/fEppIWElkuJmuTSQCjlbtQTyrwbN+FNattCd0TSM55Ka9Zn5DYDS3ZGpYrlD
	FgDCyFf2xhjxTHheNVlFzL8dV/t3MRBjN0RiffXqoRedPN9E9z4l1E63j1hyIjoDXQqUA27kOK6is
	kej2aXySsAr5/6UZ7recLvOClDX19I3tHeHakG5699TH4Xysjlc8k9aVlAMdk9YbMtNqYeLBP0+6/
	C7wNoX93Crhn5p/KoE0VD28wtSMly/+jKC+l4hH1PVE9cxr4zDbRkyrvordWBrL1YBhlXumkvM022
	CfbhtZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u271O-00000003pZE-0XLd;
	Tue, 08 Apr 2025 11:21:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Xo-00000003k9S-0avH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 10:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/Naj+/c+DmeWzjH0iSWv3H6bTHR9+JTgYDr3R1wUOTo=; b=Sjt/qk41tHv6SXCN4sJulI7uOe
	XMQaHEQjEU88J2kanq85M9NKyIKlA2ng6+5eO3Axu0Fktqve+GO2wfiA9+r6iMl8kt967SE/BNrkx
	mlDtGhnHfDbor6AreN+ESTJraPuDBm5XTjVp8FFCR5v9kvAvlm0O04enX38R37RROd+GGsYKp3jhN
	lxHBBioYOGR4vbrS6igWoeBSKEJE46B3FKijjBN+sa0RudhQCI/YqwolyHBRkhC6prT5bo3bowiYG
	9Zo31ipvWEpSAnm9ZdFw73vHsXABFr0ieJa8qCyHeHTO3DxFJ7eWjw5s/dsKIbYdNaw8Bl2fKZCSy
	tht6wvkQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Xl-00000008GJa-0tdh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7BBB5A43547;
	Tue,  8 Apr 2025 10:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37D9C4AF0B;
	Tue,  8 Apr 2025 10:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109457;
	bh=gXuthZuxBZQLsvBkFkEhlBn3G2hxd3VqLQiwIZeC8vM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O1VClrhvhQoqFAFwsmzaVjNoCvYwDOPdZwMnSbTggAQSi/aW+TxG/QoKs6WEX4Bev
	 YTkwlBuffY5b28eDs22T+ie4e+0Qbsd+dWG5cxMyxaFhCzKLoPjLsMPzDpRuSm77yy
	 /WmJFKJw0i8u6RU9qk8jJSIbg3Pi+8Dr9p27uih9u3MZCtWgkjK092frtfRIK4hRZE
	 6YwFUNmfqMLb0ucYt/Irs1mIejy8TCabNv6a5NalQXq5K67Os58h8MkylNWDQNuT1S
	 FwrAgSvjOYWO7MQH8WPxq/JqeD4X3BGz69EvchSzjvUuGnhN2UJstFnaf2SsX5CcX6
	 AVVN5hZPFWkjg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:01 +0200
Subject: [PATCH 02/24] arm64/sysreg: Add GCIE field to ID_AA64PFR2_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-2-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_115101_422573_7AD8D0A1 
X-CRM114-Status: UNSURE (   9.81  )
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

Add field reporting the GCIE feature to ID_AA64PFR2_EL1 sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index f9476848a2edfad53bb4af7f68bc05cb2a4af9ce..06e1fb5e126b41b7e41fffa0a00553d73197ac3c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1023,7 +1023,10 @@ UnsignedEnum	19:16	UINJ
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	15:12
+UnsignedEnum	15:12	GCIE
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	11:8	MTEFAR
 	0b0000	NI
 	0b0001	IMP

-- 
2.48.0


