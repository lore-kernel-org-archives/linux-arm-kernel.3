Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8ADC531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWPKBw/udNlAFvfeFQEW9foNX3wn/NW2ej1pH1Zq2zc=; b=dVh0eFrqpcSy2d/jgDe4UelN1U
	Xjsq/BuAKgeidP7NkfmZ5uOuBsPjTPXsg0x3eBrH2sPvk4nfzXK7L90e5wjapZnC8fcsd00H0iE0E
	j1mQ6IDG4GTf24dPYkHBT26yjyc0CPDnkJ7aHirwSFNhaW6P9fDUmj7uBVYfxuLtbjkR21AJ4m7pJ
	He64gWJuRmPgBiFeGAVO+/Xp439ez9axMsVtfDXaiID8IuieaF3SW5zTy9ezZUfrtKifkufH/4T/V
	n8iPz1GI7ZNFksqiw+5rBCDjxO56RucBcHYNCT/tU7Hw1ZpTaK76wEiXuBzdT9vQMFevTl44SFVVX
	3wvb7Q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw18-0000000EgFh-1CDJ;
	Thu, 23 Jul 2026 16:11:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw16-0000000EgEv-0JNq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:11:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25D9A60A67;
	Thu, 23 Jul 2026 16:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FC71F000E9;
	Thu, 23 Jul 2026 16:11:22 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmw0p-0000000872K-2Boh;
	Thu, 23 Jul 2026 16:11:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Update Fuad Tabba's email address
Date: Thu, 23 Jul 2026 17:11:04 +0100
Message-ID: <178482303769.3351010.1300036776625625622.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719163257.3156529-1-fuad.tabba@linux.dev>
References: <20260719163257.3156529-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Sun, 19 Jul 2026 17:32:57 +0100, Fuad Tabba wrote:
> Switch my KVM/arm64 reviewer entry to fuad.tabba@linux.dev, my canonical
> address for kernel work, and add a .mailmap entry so the existing
> tabba@google.com commits map onto it.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: Update Fuad Tabba's email address
      commit: 5aab4d46278df6e9e94bd0a92df9a135a5fe16ad

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



