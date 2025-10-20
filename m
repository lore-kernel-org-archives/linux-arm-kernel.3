Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3241CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjICtCf3eQgtE3t/MupIK3q+cX0EOd1X79oQ5cN18Zk=; b=L9nPC3hWuUliv87p9n7L0Gkz7e
	fTwO0l5w3KdArIkOKO8s88hfQs59EbwBIu7w+INOo6mJSOHOaDsJ+vA2cwTSWLJNRT5OmyQwgzzFg
	ZZqg48oKUM4YUB3zoNNhEwZjHGdYXjBVagXMU/Lf1SLRT8LEERrAGXKIEHhyK0yoUtgzobG40M+Ve
	7J80aBHL/93L3/sxhgAKOqCa9MszsWMUB1qKU+3flXMKxEuCIrT1NqLbTZImaoF4Zg/8ktCNbB/aJ
	nJ8e6ENo4JInzw/04glDyZj1PWHYcH427LZWP97mdJ6bqaXjaVOz7YbrcmMlbrCUt9hFykEA6LVt9
	1C9Kl8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp4V-0000000DUzS-1yEp;
	Mon, 20 Oct 2025 12:33:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2D-0000000DRju-43St
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UjICtCf3eQgtE3t/MupIK3q+cX0EOd1X79oQ5cN18Zk=; b=eIaKonNRZ2oBfS+TMb+aKBOxsh
	69fc6894OCUAZsHbuPe5LbfqqzNqDkI1B6BJwDxsPZbvtBtWlBcTfDBpKOA/7rQX0QilCFw1kFiCT
	t/PKstmA7ERuJ9GSz00WsHOR3Gz4SUvpT6iJTUnyrWdVEfuwjhmHWOxxw3cyuiRXb4vvRYCXgLNN4
	9e1wveNtc0t4TATM8Euih3pHpgvtH+erEnp/lON6bAj2mfHgdpAu75jKrhAw0dawwiKkNF5NQNTMC
	tI3762ICinZLdw+O/s5FNbmdsWhEdsrhBY8iY3UN7N1YVtHX2TuLyaNUBtIfe6odMQkjNtKCfSyAS
	Vs+sl/oA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp28-000000074KS-2Cop
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3194D4402F;
	Mon, 20 Oct 2025 12:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1442CC113D0;
	Mon, 20 Oct 2025 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963415;
	bh=Z4H5BsUqrowzozLwQNmNb98DvlFEdBawk1MycZ0axyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=booUqgsrcMGJd9IyHOLMkyyzapma72ctsEsDKJAvFgNtx+gYb3cAcj4bmqfrmxu1F
	 Ba22RtLX1HtxOI8H7kEuSFZ6oMwHpOU2ovTUmraQaLCE+jSSpgsTPxqRFR5tQB18M2
	 nTjbU/LFugGslOBPJjo2Tec4zHuGb0C4vVaybgVmMPWaRBOV2KFPyJ2CYdS5IVXeQi
	 AICja+9wm8hfjWJvxVFf22OYp6WnspIQUA/hHmYIR6MAZEtfVw41E+GhNbCYaN2U1w
	 aOpJj9G98PPRqxXyaBQQkE8e2fXOHGc9S+GAPbKToByEGKBQaMpB1fiEGEBZHMZT0n
	 /6lVXODGKNZuw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1h-0000000FUu2-0bcz;
	Mon, 20 Oct 2025 12:30:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 19/26] perf: arm_spe_pmu: Request specific affinities for percpu IRQ
Date: Mon, 20 Oct 2025 13:29:36 +0100
Message-ID: <20251020122944.3074811-20-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133041_952647_A066E7BF 
X-CRM114-Status: GOOD (  12.76  )
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

Let the SPE driver request IRQs with an affinity mask matching
the SPE implementation affinity.

Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_spe_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 1460b02d20e8b..87908f0712c0c 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1259,8 +1259,8 @@ static int arm_spe_pmu_dev_init(struct arm_spe_pmu *spe_pmu)
 		return -ENXIO;
 
 	/* Request our PPIs (note that the IRQ is still disabled) */
-	ret = request_percpu_irq(spe_pmu->irq, arm_spe_pmu_irq_handler, DRVNAME,
-				 spe_pmu->handle);
+	ret = request_percpu_irq_affinity(spe_pmu->irq, arm_spe_pmu_irq_handler,
+					  DRVNAME, mask, spe_pmu->handle);
 	if (ret)
 		return ret;
 
-- 
2.47.3


