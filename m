Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912FFC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHuBxSVI3miYGq7VQcz5Dk/EGYJMTC0E0UPB/7Z89ow=; b=4lI1f9hPWBV/TMPEpQ8wM3GWB9
	C0SR9rnk5FmbV1FQ4keqlP0ZB+j04tx14FQVRJN1vFoKZ1LaBLw91O8SM5mxHWqGtvn0d8CRlxQMp
	g5l/a8Q1Tl5kA+Z5dj9FLGnmB2EcTT3ZRrZeCJlQIWQ/w6u/32qTRWeNvWv+pThwGcQw1xE1oJfoQ
	jyHoDlMFoX3jy5hnVb6TA6joE1r0dI4yI+2+/3tqTQ/hVthvdFabNntAsAE0NyweOpPYdOBQaIgYf
	af2ABhPRBdJaYalVNtnLNnW6NhtHrI36UD2Siu273pEYm2tiDPLdddAVvETuK+KFQoTxgI2DjQ6IU
	LJypLthQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKjC-0000000Ca9u-0kZ3;
	Tue, 06 May 2025 16:01:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHMu-0000000Btnj-1fe8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:25:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A4F15C05C7;
	Tue,  6 May 2025 12:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A11C4CEF0;
	Tue,  6 May 2025 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534351;
	bh=Dhr0rsx9WpeMa8aspdbgl7YO+d4d6KcEE2+waQCoYbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dq5cTMtyj0wHuo1T5aHKQkBcSlr+6GhC/2Qcc90isxK0fDRSfA0/Qo/GQnLnu53YZ
	 6S/53TJ5C1EXGWuq4Qd55nzieRvN0xzjjM3zme/3EvAv4Wj3tLhELaUTdAMAidfbFd
	 kIbLU6kV4uSUVi8DAvFe09ZzCOdtMaL8hHvY51pQKaTND8dkWddz1nSt6/ZiBZ90+8
	 uK2I0XBLiZ7PxGSEZFtnHWlCj1BsFMF9AXFId2lfnYLepQi8xtoX+EyKVmoF7H2krc
	 T24abHve5ye3qgA806xvLjWw+4bjpPF648cjcMWeaQ982/BBEa3ZbF+LAkI0/8E+ro
	 6WBwFb1pMheHA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:54 +0200
Subject: [PATCH v3 25/25] arm64: Kconfig: Enable GICv5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-25-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_052552_483493_CD1E8821 
X-CRM114-Status: UNSURE (   9.17  )
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

Enable GICv5 driver code for the ARM64 architecture.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08bfa0f3e6f630dc4adfe797a4d273..f1b3c695b376717979ae864865238ae12ad65ca2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -128,6 +128,7 @@ config ARM64
 	select ARM_GIC_V2M if PCI
 	select ARM_GIC_V3
 	select ARM_GIC_V3_ITS if PCI
+	select ARM_GIC_V5
 	select ARM_PSCI_FW
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS

-- 
2.48.0


