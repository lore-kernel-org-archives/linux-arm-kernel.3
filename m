Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD9ACA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPfTjT2BQVDiFEjRa8BOc+zaw0L/ZUveAjd7LW4fKu8=; b=nkQZc7JUmp6FHMtVuWhtUFqO86
	gBYVQdW+gwLbE+qHMRme6+dvxJ/KXGklfe8nkqR3txj6/ZdeeYVs6ls1XmyL50Sj79QZwHr2sXxq6
	jbku2cFgK+gpDK26wynj1qhQ9OLo2oYLV2Uz02h8ggp3M3froKg2ttck22SwSiijOTQwUPkOOQBhN
	07/ONDS/isEIUrd/o0CgkA6vZiUWspK5Fluk0s98Test6D0cp+UNL+jXxwpTe5mAx6HVVITZwfoKS
	xAxzt4gpMAX1Qa+qzDnMLR16Fd02c1py4KbJkhYjqFk8QymxC7MbP22vXXBXjyQ/UjfZHxFHANJCH
	spQ7MohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFO-0000000CBpi-0O14;
	Fri, 02 Oct 2026 17:40:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFL-0000000CBhy-0q44
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 17:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rPfTjT2BQVDiFEjRa8BOc+zaw0L/ZUveAjd7LW4fKu8=; b=NTOf4WGw4bAFhBHUddgxWKl862
	dIBDz2uof4Gu3P71E0RxyI3HJbHqapZH7+4av6xyGJZkJTnbnC3B4tCqs8KxL0STgfMMvjV5PuTSV
	Weay18y8m8qyjbidbio9HtWPz/R32o5y4GI52qwgQZgkbHQDX3bNrRG5OIIyPl2g/djnctERL49Pb
	e7tFLMDSl5gOuGLGnsYDQi4v1CnxYoZY2Sp0H/2znKOmlPNgeXoxwFMrmufrN0tF+nYZ+/B4Cg/FD
	XbFBBj+WYr/14ZTNDx6ndBlf2xWqrcdygPMMJhyvGA1yVQaoFeVqzNq7MuhWib5MzV/WecMJbQcKg
	i45J28FQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xChFH-00000006BLv-2JOA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60B02143D;
	Fri,  2 Oct 2026 10:40:27 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A60D53F85F;
	Fri,  2 Oct 2026 10:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962830; bh=cPpPhLS6BTkaVczyM1fjipYSlDHRthvzkhXQSZ5llcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCmLD10/ADGZM5ls3lRj5S0mmohBydIdN4xOQcVQnG+YGt9r2aVdEv7kGRwsTvUIq
	 u9yv7hC9t6vSjnFocIQRW9muTgw/MCU/EGzjcCX+CKj91FnmBIMTzvw0zkj4M+bZlV
	 GWZRv/DZ/MYFEkb3ywUf/R5uF8spZWvt80hJKJQk=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 22/27] arm_mpam: propagate MSC access errors for interrupt control
Date: Fri,  2 Oct 2026 18:39:35 +0100
Message-ID: <20261002173941.292319-23-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_184032_159699_58F9DFA8 
X-CRM114-Status: GOOD (  14.00  )
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

From: Andre Przywara <andre.przywara@arm.com>

Allow the functions dealing with interrupt registration and enablement
to check for and return errors, and propagate MSC read and write errors
from the lower level up.
This does not cover the IRQ handler yet, as this needs some more
attention.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 7e7b483ff900..c0f51d41e7fe 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1118,7 +1118,9 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	}
 
 	/* Clear any stale errors */
-	mpam_msc_clear_esr(msc);
+	ret = mpam_msc_clear_esr(msc);
+	if (ret)
+		return ret;
 
 	spin_lock(&partid_max_lock);
 	mpam_partid_max = min(mpam_partid_max, msc->partid_max);
@@ -2082,9 +2084,7 @@ static int mpam_enable_msc_ecr(void *_msc)
 {
 	struct mpam_msc *msc = _msc;
 
-	__mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
-
-	return 0;
+	return __mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
 }
 
 /* This can run in mpam_disable(), and the interrupt handler on the same CPU */
@@ -2092,9 +2092,7 @@ static int mpam_disable_msc_ecr(void *_msc)
 {
 	struct mpam_msc *msc = _msc;
 
-	__mpam_write_reg(msc, MPAMF_ECR, 0);
-
-	return 0;
+	return __mpam_write_reg(msc, MPAMF_ECR, 0);
 }
 
 static void _enable_percpu_irq(void *_irq)
@@ -2823,11 +2821,12 @@ static int mpam_register_irqs(void)
 				return err;
 		}
 
-		mutex_lock(&msc->error_irq_lock);
+		guard(mutex)(&msc->error_irq_lock);
 		msc->error_irq_req = true;
-		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
+		err = mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
+		if (err)
+			return err;
 		msc->error_irq_hw_enabled = true;
-		mutex_unlock(&msc->error_irq_lock);
 	}
 
 	return 0;
@@ -2848,8 +2847,8 @@ static void mpam_unregister_irqs(void)
 
 		mutex_lock(&msc->error_irq_lock);
 		if (msc->error_irq_hw_enabled) {
-			mpam_touch_msc(msc, mpam_disable_msc_ecr, msc);
-			msc->error_irq_hw_enabled = false;
+			if (!mpam_touch_msc(msc, mpam_disable_msc_ecr, msc))
+				msc->error_irq_hw_enabled = false;
 		}
 
 		if (msc->error_irq_req) {
-- 
2.53.0


