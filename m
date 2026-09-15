Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DABC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rohFya9ZM43Y/1RiL36Hho8NC7KJKzxy3Nb/imDOR5k=; b=F+ziLnxunBvvTEM9p2dsioLnIm
	v9TOAHj8Qu3Tk2EAyzpA/ln4QlVvjLKVSaE75eSJuFvHBwxNNv5do8NWJvQKnYdFX0xQGhNHTuhQZ
	3TZnhTuygtN5hvNyZc/4D+4p8M38JH3a4vyhVS2PSV//R1sTnrEUH3i5RXkBVLQ3t18CtC0onh3qB
	MRWBjzsbyOtyHkt17ceLbYAxe7KNtLUSxqidIldLpvL4SlEdHb60JozfsB6KTTHLzrTXfsuTHEoBc
	DeAWyIhWQzWz5UpKl1tF4aRVAfrvcoEThByNPlrB2g4PQ0zvuQ25s+ecnguLr36GPxhIITnC1ieVy
	+LR5zg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Omb-00000005fyJ-1at8;
	Tue, 15 Sep 2026 08:44:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OmZ-00000005fxV-2XE4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 08:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=rohFya9ZM43Y/1RiL36Hho8NC7KJKzxy3Nb/imDOR5k=; b=FEI3thoe3yNZhh1sT9N65HHRKE
	XJGAqu/02yDFpBSYYh852a7O2LgS7uVuQQ5EZsLiGwJhc2UiCu0Sqpkdv2EBnnrDEmoYAMTEENiSR
	nZurVbflC+RQ7pjh7I46c1nXpA+dz6acZ6vbkD0E/0U6ni3yf32nmJ4P6cYhiH8fYDeAyLFTSrmM5
	ehL//oLAl3AXXghoC+Q+vZBA65Ffdd3deDL8mZXPLO4ODbSXI6eI2ZiIKaQNyguegPoqnMrBgyhl2
	mPQx7qg7UqRAKapryTn/a1F6kCIfNhs39YyrAVDAq3vBXgeou99DdvfNJ9CPYgNx+P4676nFQhQDB
	YsTytz/w==;
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6OmW-00000006Rz3-0iUv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:44:50 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-486f3dbf7d2so2741924f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789461885; x=1790066685; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rohFya9ZM43Y/1RiL36Hho8NC7KJKzxy3Nb/imDOR5k=;
        b=np732LP0b3yo05qxeDedENrcrC4XzEcT4nMbNE9UeQlieuFL/4i7FPknE5Cs4x1tpj
         hkhWO1OmS02aB1hilrK/waAezYGRYzcm57wtexK91n3FAkBjTDP4me7CLFJ0PZvx/zac
         nq+dmnzWXEjEKcCoM+NQy5DuSHTDt2zvupLapKihHlQ4ASHS6m+VTZGjR2JONFWZwjQq
         Cm5L+VJtP/BKVkv2a8xGETVBsXl4qiyneM0kiirivwIVO81UCNIYuqO2FG4pwqHqyVzg
         Gh+2LCyGBPGU60hyiS+1E2Cm80RdKQpiJX51+NmkP7NrPONb1u/nJp8/VBUua4DwjNKx
         q7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461885; x=1790066685;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rohFya9ZM43Y/1RiL36Hho8NC7KJKzxy3Nb/imDOR5k=;
        b=uPR8TGnL0Qojs5glfS2aOYJDgu/X4SUXwj3eMlbGq0y9W9DUGYix1AU/sbTbvghqSf
         fAfVLfbN9+IdSTANTSHd87vIY2vEt0dKY8JIJ9CC4sU7miMR81BBrYW3dmy4pNuxYfai
         9Vwj5ssZdVQPi3L8hQOXRWlhk9jyluIZ7yTUc1EoD4Xbr2DiTbrD94Oj3n4EWZYnhtuN
         EmQ83uR4KoC+W5uS+0D+7QWVxxMdogC2d+cAqPKENRAxZKpa8nia/VL195jSV2e/Q1Nv
         LPAIt+3G+0yw2sGN3rMTjaXq/tWFKoZ8oUtFI+i3M7EBYN1MBIJddw/f2ujhckFTkZLL
         JU0A==
X-Forwarded-Encrypted: i=1; AKwUvBxSQnV4FCZ+mJVlCbdIOYxnIAzGiqEzLyPXyI/hJFhSJGmzNl9tarlGtOFpv6+rJPB6QxADGJbdUTRYBlO/rmzl@lists.infradead.org
X-Gm-Message-State: AFuF++nvxaKwM4JtI9COOdX2mv3h8r37vM3164jONtM/9UMyWk/pUrer
	DjZOPB0pPk4XMWXubUcycr3jqKEqigNwrzz4rTsHgxN1G2/vjdqL4E61EC4+WtbbwK65MZ+Udny
	/IIWHXy7AHpJlR4XpIdSZfw==
X-Received: from wrdf9.prod.google.com ([2002:a5d:58e9:0:b0:47f:924b:588e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:985:b0:482:fb97:2ae0 with SMTP id ffacd0b85a97d-48702ac0254mr7380237f8f.14.1789461884745;
 Tue, 15 Sep 2026 01:44:44 -0700 (PDT)
Date: Tue, 15 Sep 2026 09:44:38 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260915084438.2076072-1-vdonnefort@google.com>
Subject: [PATCH v2] KVM: arm64: Advertise MMFR0 TGRAN for pVMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094448_493921_FAA29573 
X-CRM114-Status: GOOD (  11.20  )
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

protected VM ID register emulation leaves unlisted fields at 0. This
creates two issues for TGRAN:

  * TGRAN16: 0 means non-implemented. It prevents 16KB protected VMs
    from booting even when the hardware supports it.

  * TGRAN4|TGRAN64: 0 means implemented. This may falsely advertise the
    feature even when the hardware does not support it.

Advertise all the TGRAN fields in pvmid_aa64mmfr0 so that the hardware
support is properly propagated.

Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

Changelog:

v2:
   - Collect Fuad's tags
   - Reword commit message (Fuad)

v1 (lore.kernel.org/all/20260913203108.3343404-1-vdonnefort@google.com)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 8758c6801776..ec469d96516a 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -121,6 +121,9 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr0[] = {
 	MAX_FEAT(ID_AA64MMFR0_EL1, SNSMEM, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, BIGENDEL0, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, EXS, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN4, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN16, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN64, IMP),
 	FEAT_END
 };
 

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0.1032.g73a4cd73de-goog


