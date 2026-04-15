Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34510F41996
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnghv1jUkwq/7bM+q9UBGlwH8qDO8vVIEeXzW6hjSuI=; b=gBJ14EuPy9AuVjsvo/NLDtRzt8
	H/yMSrJrx998xfS0mJ1X1CkmvAD9gZe00TUy/tAImK2fOw2XQ/UXfehMw+x63POUMXyBng0R4/t6G
	2QcoisCjPN679Z4P9zwKg7By9D39LJcEbI3G9QLF+DHM5FNvpgBRrdKWLUpZVay/5sMJQ9ejxfUF+
	o3sLVKS4SoyFAlCQUzv5ov38hxvWcPidUXTxX3s+bPO1u/QWNfL5J7TQX6w+31+WCVinuACws7kMt
	EILZstjEdr4aaZziGaWCnkUfa5DdFO3FcFHzxykdxKjcJrDhTnsYxoNpcioYQCPsgK66SmAwbp1kR
	Ww+kVJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrN-000000014TV-34kl;
	Wed, 15 Apr 2026 11:56:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrA-000000014ET-3dlM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Apr 2026 11:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dnghv1jUkwq/7bM+q9UBGlwH8qDO8vVIEeXzW6hjSuI=; b=lDT+lt3IClcxhOTMoopwVfufMs
	Bb8bKgI/ikK+C/XlV2TVZfO8j96k9ncL+6xR333bQyBiptd91NivYq0d7Sfsyuq2DwJa6VKjRs97v
	0LzW1O84bXXKBtG3rNHdOu98p3sufQA1Vy/YSzYJmgf+y0IhMpGXs0qH6IG56yultgwhhYcqHlo6V
	3jQ8hJ/z3gBsdAOCgclhmIfWU8DTVRY3d1qOVrEdY3dmG4ywZf7wn8HUT53ByYBHcEKRCw641VQUO
	70pRLaGhXsMPg2uxwISGv+x4r+8Ftt/wgmRYb205rBCa3+9mTobOH78WCqyIPSDchK8sfYH/LswDe
	xSRRufvg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr5-00000002NLM-1rg8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 643384458A;
	Wed, 15 Apr 2026 11:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EA5C2BCB4;
	Wed, 15 Apr 2026 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254183;
	bh=IHhFWg6GA5Gm7coKQ9f6giTOQmr8ZuVLC0KO5AkOn0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=diDR/u42oANXLmDzPE7J8oQYS3aQXhwVCbIEvA3lC3clHEnmVtopEL7hrqBLIWyM6
	 zRO2/E0+SM8jx3EW23m5Et2h1HrSjRdIqLeUiOmx48bw3kb5HdrpIHw01SesnAOMd9
	 KYI3+nP+qU81Atg9Av0pn/St/aFeDvQr9LmZ7F1bwzI3JTTcWBj1V8VN09OcnOO/Kd
	 3mOjyJpbjob7o+ECvS25Dm8vipk6Eagu5gVpIRJAUrF/vW6t2Zkot8ROkXGV2g3LT3
	 AzYumGmeLBIPWTmmzwkJcn4x+8UgLHZc1h8jO6aYQ01aWxmRyocVqJjCxG9b58a55h
	 miFh32fT1aQVA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqz-0000000Bqsi-2GSi;
	Wed, 15 Apr 2026 11:56:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 12/18] KVM: arm64: selftests: Add missing GIC CDEN to no-vgic-v5 selftest
Date: Wed, 15 Apr 2026 12:55:53 +0100
Message-ID: <20260415115559.2227718-13-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_125628_048104_43EFE0F7 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

The selftest mistakenly omitted the GIC CDEN instruction from the
testing. Add it in.

Fixes: ce29261ec648 ("KVM: arm64: selftests: Add no-vgic-v5 selftest")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/no-vgic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/arm64/no-vgic.c b/tools/testing/selftests/kvm/arm64/no-vgic.c
index b14686ef17d12..e09e3fac904f4 100644
--- a/tools/testing/selftests/kvm/arm64/no-vgic.c
+++ b/tools/testing/selftests/kvm/arm64/no-vgic.c
@@ -159,6 +159,7 @@ static void guest_code_gicv5(void)
 	check_gicv5_gic_op(CDAFF);
 	check_gicv5_gic_op(CDDI);
 	check_gicv5_gic_op(CDDIS);
+	check_gicv5_gic_op(CDEN);
 	check_gicv5_gic_op(CDEOI);
 	check_gicv5_gic_op(CDHM);
 	check_gicv5_gic_op(CDPEND);
-- 
2.47.3


