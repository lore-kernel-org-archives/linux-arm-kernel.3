Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7932FCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDH22YwAG7urpvbv0o7odbdejuCnA8izwwZdaVSmWOE=; b=e8S+do0iMcnckg2aykomBL9/jD
	NT/h9koxrxrD0A3RH9m68D5l8ckl7l7ThEa7oJH8oFn++0KsZkO3y3tmX0y1lipq+fcLFhHdYWY1A
	Tg8F8LXOPFXVQloQYVYiEefCtQatu4MB7LbgzTT+z/woye2i3v9E4sz/Z3alBfo/Y1h3AkgoXOFlp
	MH1fEgZd/OB3PU+kVenPeCLpYaxHIM1h0TfytIMa7hBttYpxd0EFtMXITzm3e+aAHx1BeH7bTtSAL
	QCC3njbshewhWV+9qzJkcuANMPa0FbLoV6XBQE6AgfJ5/YzpKWGzTXPJV12gP29Tb5MyVb8QwZtYm
	umB2R2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEm-00000000tWC-11vq;
	Mon, 28 Sep 2026 15:25:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEj-00000000tUa-25Mv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 15:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kDH22YwAG7urpvbv0o7odbdejuCnA8izwwZdaVSmWOE=; b=YNZRkoPO9iTKxPXNXo0G8Rhrnc
	XdUjKWmPZbZhkzxCf+o1HetunaxxqYYPW9F3v0jHthveeBo4wxgOXZ6sG2Z8VkRrr0OiJ/PpS6vJC
	xBDOh0jUnCcFGX+mBIpvbOhuaqEgKaltbZjQe1hY8LcWBXLGsmHKYlxDbcHmclkG/6Rw/tIvPKetS
	DZauIccbNTAVIi0mBzcyRnb/zwdmzTBPxGWNqUllcdipJI/1z5+lbKZOfAIXxMKrnzQ03IF2ZNXX8
	2St5vWy+dJ7pvJ686p8LWlFuCyiyt5kVlrnIYbComkcXUjRE/UC7yWGM1AmJmDPw9DQPbW2o8H214
	a9iZPCIQ==;
Received: from out-29.mta0.migadu.com ([2001:41d0:1004:224b::1d] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBDEg-00000001cjE-2t1H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:25:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4/J0Nyoe1OYgfmPuqQeHxdHnDki4Fb0pleDZiROcdZs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609141; v=1; x=1791213941;
 b=SsvceiRJbFyX6mPSL0oOeT56sEHwbENj2tjz7Agj89GXhKICj5deuP+EJ7D+ucln/cWl0MIF
 HhBneBYyTdjTtjUNE+mwDIPzr7LFKBgWHLVbCv2cmpjvSdvwze6quNlxhHKCoqkRI7Nj1g7n2ie
 XlpsJJA6YzLMNrLtzR3VcyLc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id de1ed31cb70c73c5;
	Mon, 28 Sep 2026 15:25:40 +0000
X-Mizu-Trace-ID: de1ed31cb70c73c5
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/10] KVM: arm64: nv: Return a failed stage-2 descriptor read as a fault
Date: Mon, 28 Sep 2026 16:25:01 +0100
Message-Id: <20260928152507.2116110-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162546_850552_48CA3CB8 
X-CRM114-Status: GOOD (  14.82  )
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

When KVM walks an L1 guest's stage-2 tables and can't read a
descriptor, for example because the guest points a table at an IPA with
no memslot, it sets a synchronous external abort on the walk but
returns the -EFAULT from kvm_read_guest(). As with an invalid
VTCR_EL2, KVM then leaves AT S12E{0,1}{R,W} unretired, so the guest
retries it forever. On an L2 abort, KVM injects the abort and
returns -EFAULT from KVM_RUN.

Return 1, as the walk already does when it can't update a descriptor,
leaving -EAGAIN from a descriptor race as its only negative return.
The AT then retires with the external abort in PAR_EL1, which is what a
stage-1 walk records for a descriptor it can't read.

Fixes: fd276e71d1e7b ("KVM: arm64: nv: Handle shadow stage 2 page faults")
Fixes: 92c6443222ca4 ("KVM: arm64: Propagate PTW errors up to AT emulation")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index a67be19e73250..f9a2e50c0b567 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -304,7 +304,7 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
 		ret = read_guest_s2_desc(vcpu, paddr, &desc, wi);
 		if (ret < 0) {
 			out->esr = ESR_ELx_FSC_SEA_TTW(level);
-			return ret;
+			return 1;
 		}
 
 		new_desc = desc;
-- 
2.39.5


