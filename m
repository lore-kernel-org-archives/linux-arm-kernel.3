Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC00C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaKoTDQgObCSTF1bxsCDnpmDb57n6449BfSVji5AojA=; b=Zl1uJdACS5vFX0cBZkt0EtoEIo
	/P34xwtqMyQx+xphuCxHI4qBPSiaKgJoCyhMuTD/s4VP6pMPVWuYgGy/FJLNpH6fDnZtfg98OjoWp
	o4BI2Euch5uJsZlI89CvqN8Q3N7sI0I73CpzC9tTvvCVNFIZ/EZSxJubTUBwrKwSQGiUZ3tbyVvh5
	OoysZkukbiB9fW38QE29Z5lRrtY8M174OMY+n+xsrFlkecPn0O8xBJ2d2Ba+i4QSgczz1GhsnaTux
	bt54dyaZnRPQaSZ0qDDa6IjL49A6Vlx9QywpjgRTOFFOpubTetQCuOMD7ZXMFgIooekixdU1GolBa
	3NGO6OMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tfl-00000008qWs-0yOV;
	Tue, 08 Sep 2026 11:07:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tfj-00000008qWI-3G8n
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 11:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oaKoTDQgObCSTF1bxsCDnpmDb57n6449BfSVji5AojA=; b=nF0BaL6zaToi3ktkakVEp91qsQ
	ItFeidYHqG5DIlrI5N/wXFuxPBcJPWL7o8PuIZmEGRXadYcq+MxjEhh9vHR3jCuffEyApoCT+YurA
	n10nsSaDyG3mFC+Ne/OzIvUFmdeMU1/f27pXgr37FBSD77BQZo54Agj9DvIOzU5oqhOvRA+USW9z3
	Y81FZaY23lBpgLXC81sK+g4BiJHZIcAIYJLtx0dSrHzsjI+FlXHGGr5yKa4/m0bg+4nPkw7+JtfAj
	mJS5oY643NTO8RQXqN5JL344FEERYW5NQrcLdbWaSkIxb6WoLUXaBMDnzoJCy49SNcCOTlAclDJkG
	8wVlN7GA==;
Received: from out-90.mta0.migadu.com ([2001:41d0:1004:224b::5a] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3tfg-0000000HJpv-40et
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:07:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DqhRUW75apnnRm/+NgVuUwPZB14lDLNVV5b0Gd4lk2M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788865643; v=1; x=1789470443;
 b=FY3PH6e4/aYAD4gMScM9UVHyVreFsVQy0ehzn3Ul7lA4Ok8aMo5YJtREe2gK8WO3ZNWHPdVQ
 VqpQsEyfnPgMIofhh3IxjpYsazAxmONZvQrcw52uxHV0s8dHDHtgfY20aHO1kB1fO8MPyMimsBu
 v8tTj891DabCsbMH2koAMVSk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b5834c5c726827b5;
	Tue, 08 Sep 2026 11:07:22 +0000
X-Mizu-Trace-ID: b5834c5c726827b5
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Keir Fraser <keirf@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Quentin Perret <qperret@google.com>,
	Hiroyuki Katsura <hk590@cam.ac.uk>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] KVM: arm64: Transfer the hyp stack pages out of the host stage-2
Date: Tue,  8 Sep 2026 12:07:10 +0100
Message-Id: <20260908110713.1540304-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908110713.1540304-1-fuad.tabba@linux.dev>
References: <20260908110713.1540304-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_120725_131175_CEDCB921 
X-CRM114-Status: GOOD (  11.98  )
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

fix_host_ownership() walks only the linear-map alias of each memblock
region, and the per-CPU hyp stack, mapped in the private VA range for
its guard page, has none.

Walk each stack's VA range with the same walker.

Fixes: 1a919b17ef012 ("KVM: arm64: Add guard pages for pKVM (protected nVHE) hypervisor stack")
Reported-by: Hiroyuki Katsura <hk590@cam.ac.uk>
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/setup.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 75b00c3233102..362f2891cb32e 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -269,6 +269,16 @@ static int fix_host_ownership(void)
 			return ret;
 	}
 
+	/* The stacks sit in the private VA range, not the linear map. */
+	for (i = 0; i < hyp_nr_cpus; i++) {
+		struct kvm_nvhe_init_params *params = per_cpu_ptr(&kvm_init_params, i);
+		u64 start = params->stack_hyp_va - NVHE_STACK_SIZE;
+
+		ret = kvm_pgtable_walk(&pkvm_pgtable, start, NVHE_STACK_SIZE, &walker);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.39.5


