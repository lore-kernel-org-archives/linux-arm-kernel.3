Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641DDC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PepoxNXX/9CvbteCUHU1EZLQKR4wc0toI75mkEMCMQ=; b=Wp9arI0waqmMIVRA8T5YLdLYrN
	0iyDAuJ1/lBe2UfxZ2aNd/pkiGK40XFyiGAG2Q9QaxBNN1pF1HCOXURRPKjlLTX5qPF4f2dm38bmd
	0qIp4GXJg8FNrxJZuoIBmtD6Cm9Zp6dOvvqJq7BVHT77ur8LETjozCrespFSIhqkAWGr2EIOmkx+k
	psWWktRSCOkxX7AThEhHLxNOQDzj8Tnh40xFuvj4LcLFd+UrENya6BAFn73QsWbWEC/lFmmFNqoIE
	DkCgOXd+Un6zLAvYbuHGAERCYB7BKQW4+Q5o/pEXsRVCFBUddw++bhYsF/72yt6BrFHLtU0zmKGgh
	jX9GKtlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0RC-00000003F7N-2EFd;
	Mon, 16 Jun 2025 03:23:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR02C-00000003CtV-060E;
	Mon, 16 Jun 2025 02:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8PepoxNXX/9CvbteCUHU1EZLQKR4wc0toI75mkEMCMQ=; b=Xo9en6wp8VQoxSGwj0Q8lhJSsh
	/Rjrf3mEQDWLbOQZnGJgT2GDUkgbetIRMmQ5c97GQA6pnQwaxO6S0UE+fmFpKQtKFv5n9zsG95NB3
	qyiYJH9J+H/EEZaLy9SAbXXO6rCpqxiVUu+VyTClaFkrWCv2Y/8AT7Igy8/gdnyxOL5+vm01EhnWV
	OYQKlMvFzi90uwLTlkWiGjgH+0rJFeuo45+j8PsY0nxfiZiRm72FTvsDUIPfHg4IKV3FTWQSOAVYg
	sO5LDM+7w7IdguGpj5xY7f2FsmDlFE4ID++ed3rv4iYBg8escziYb/NyNuLcYY4o9a2grG0FANDNg
	fTZkRYyA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR021-00000003TXU-1lOy;
	Mon, 16 Jun 2025 02:57:18 +0000
X-UUID: 8c6773184a5d11f09f706fa2197c6ceb-20250615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8PepoxNXX/9CvbteCUHU1EZLQKR4wc0toI75mkEMCMQ=;
	b=Xi732G1Mc+6I2iM9XM9ggUt5vfpezyenEelMfO0rMGdF5mqGP3hLsEz9SlwrMSmxqoAvdWg60BLlwc7zlMieaS48efYa3uS1+rgIKtTEouUAlFn1D803iadCtdba3wFDhgT+rCS+Wq9/xxlyWwDc+tgB/NYjqEpK8bmGE3PK8oo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:2c248719-9da0-4b68-a9d6-85c0f9621c08,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:09905cf,CLOUDID:4c94b703-0d95-4f6b-a95f-3c560ebcf3ab,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8c6773184a5d11f09f706fa2197c6ceb-20250615
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 914402994; Sun, 15 Jun 2025 19:56:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 16 Jun 2025 10:56:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 16 Jun 2025 10:56:45 +0800
From: Xueqi Zhang <xueqi.zhang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ning li
	<ning.li@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <iommu@lists.linux.dev>, Xueqi Zhang
	<xueqi.zhang@mediatek.com>
Subject: [RFC PATCH 7/8] iommu/arm-smmu-v3: Invoke rpm operation before accessing the hw
Date: Mon, 16 Jun 2025 10:56:13 +0800
Message-ID: <20250616025628.25454-8-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_035711_000510_DAB65222 
X-CRM114-Status: GOOD (  21.19  )
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

Invoke rpm operation before accessing the SMMU hw.

Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 84 ++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  3 +
 2 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 154417b380fa..88912b0f8132 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -122,6 +122,22 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
 	} while (arm_smmu_options[++i].opt);
 }
 
+static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
+{
+	if (smmu && smmu->impl && smmu->impl->smmu_power_get)
+		return smmu->impl->smmu_power_get(smmu);
+
+	return 0;
+}
+
+static int arm_smmu_rpm_put(struct arm_smmu_device *smmu)
+{
+	if (smmu && smmu->impl && smmu->impl->smmu_power_put)
+		return smmu->impl->smmu_power_put(smmu);
+
+	return 0;
+}
+
 /* Low-level queue manipulation functions */
 static bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
 {
@@ -2082,23 +2098,35 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
 static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
+	int ret;
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret)
+		return IRQ_NONE;
 
 	arm_smmu_evtq_thread(irq, dev);
 	if (smmu->features & ARM_SMMU_FEAT_PRI)
 		arm_smmu_priq_thread(irq, dev);
 
+	arm_smmu_rpm_put(smmu);
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
+	int ret;
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret)
+		return IRQ_WAKE_THREAD;
 
 	arm_smmu_gerror_handler(irq, dev);
 
 	if (smmu->impl && smmu->impl->combined_irq_handle)
 		smmu->impl->combined_irq_handle(irq, smmu);
 
+	arm_smmu_rpm_put(smmu);
 	return IRQ_WAKE_THREAD;
 }
 
@@ -2255,6 +2283,11 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 	struct arm_smmu_domain *smmu_domain = cookie;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_cmdq_ent cmd;
+	int ret;
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret)
+		return;
 
 	/*
 	 * NOTE: when io-pgtable is in non-strict mode, we may get here with
@@ -2271,6 +2304,8 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 		arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
 	}
 	arm_smmu_atc_inv_domain(smmu_domain, 0, 0);
+
+	arm_smmu_rpm_put(smmu);
 }
 
 static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
@@ -2353,6 +2388,11 @@ static void arm_smmu_tlb_inv_range_domain(unsigned long iova, size_t size,
 			.leaf	= leaf,
 		},
 	};
+	int ret;
+
+	ret = arm_smmu_rpm_get(smmu_domain->smmu);
+	if (ret)
+		return;
 
 	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
 		cmd.opcode	= smmu_domain->smmu->features & ARM_SMMU_FEAT_E2H ?
@@ -2378,6 +2418,8 @@ static void arm_smmu_tlb_inv_range_domain(unsigned long iova, size_t size,
 	 * zapped an entire table.
 	 */
 	arm_smmu_atc_inv_domain(smmu_domain, iova, size);
+
+	arm_smmu_rpm_put(smmu_domain->smmu);
 }
 
 void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
@@ -2392,8 +2434,15 @@ void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
 			.leaf	= leaf,
 		},
 	};
+	int ret;
+
+	ret = arm_smmu_rpm_get(smmu_domain->smmu);
+	if (ret)
+		return;
 
 	__arm_smmu_tlb_inv_range(&cmd, iova, size, granule, smmu_domain);
+
+	arm_smmu_rpm_put(smmu_domain->smmu);
 }
 
 static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gather,
@@ -3038,6 +3087,12 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	} else if (arm_smmu_ssids_in_use(&master->cd_table))
 		return -EBUSY;
 
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret) {
+		dev_info(smmu->dev, "[%s] power_status:%d\n", __func__, ret);
+		return -EBUSY;
+	}
+
 	/*
 	 * Prevent arm_smmu_share_asid() from trying to change the ASID
 	 * of either the old or new domain while we are working on it.
@@ -3049,6 +3104,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	ret = arm_smmu_attach_prepare(&state, domain);
 	if (ret) {
 		mutex_unlock(&arm_smmu_asid_lock);
+		arm_smmu_rpm_put(smmu);
 		return ret;
 	}
 
@@ -3074,6 +3130,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 
 	arm_smmu_attach_commit(&state);
 	mutex_unlock(&arm_smmu_asid_lock);
+	arm_smmu_rpm_put(smmu);
 	return 0;
 }
 
@@ -3216,7 +3273,13 @@ static void arm_smmu_attach_dev_ste(struct iommu_domain *domain,
 		.old_domain = iommu_get_domain_for_dev(dev),
 		.ssid = IOMMU_NO_PASID,
 	};
+	int ret;
 
+	ret = arm_smmu_rpm_get(master->smmu);
+	if (ret) {
+		dev_info(master->smmu->dev, "[%s] power_status:%d\n", __func__, ret);
+		return;
+	}
 	/*
 	 * Do not allow any ASID to be changed while are working on the STE,
 	 * otherwise we could miss invalidations.
@@ -3244,7 +3307,7 @@ static void arm_smmu_attach_dev_ste(struct iommu_domain *domain,
 	arm_smmu_install_ste_for_dev(master, ste);
 	arm_smmu_attach_commit(&state);
 	mutex_unlock(&arm_smmu_asid_lock);
-
+	arm_smmu_rpm_put(master->smmu);
 	/*
 	 * This has to be done after removing the master from the
 	 * arm_smmu_domain->devices to avoid races updating the same context
@@ -4799,10 +4862,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		if (irq > 0)
 			smmu->gerr_irq = irq;
 	}
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret) {
+		dev_info(smmu->dev, "[%s] power_status fail:%d\n", __func__, ret);
+		return ret;
+	}
+
 	/* Probe the h/w */
 	ret = arm_smmu_device_hw_probe(smmu);
 	if (ret)
-		return ret;
+		goto err_pm_put;
 
 	/* Initialise in-memory data structures */
 	ret = arm_smmu_init_structures(smmu);
@@ -4840,6 +4910,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	arm_smmu_device_disable(smmu);
 err_free_iopf:
 	iopf_queue_free(smmu->evtq.iopf);
+err_pm_put:
+	arm_smmu_rpm_put(smmu);
 	return ret;
 }
 
@@ -4857,8 +4929,16 @@ static void arm_smmu_device_remove(struct platform_device *pdev)
 static void arm_smmu_device_shutdown(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
+	int ret;
 
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret) {
+		dev_info(smmu->dev, "[%s] power_status:%d\n", __func__, ret);
+		return;
+	}
 	arm_smmu_device_disable(smmu);
+
+	arm_smmu_rpm_put(smmu);
 }
 
 static const struct of_device_id arm_smmu_of_match[] = {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index f45c4bf84bc1..cd96ff9cbc54 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -792,6 +792,7 @@ struct arm_smmu_device {
 
 	struct rb_root			streams;
 	struct mutex			streams_mutex;
+
 	const struct arm_smmu_v3_impl	*impl;
 };
 
@@ -1004,6 +1005,8 @@ struct arm_smmu_v3_impl {
 	int (*combined_irq_handle)(int irq, struct arm_smmu_device *smmu_dev);
 	int (*smmu_evt_handler)(int irq, struct arm_smmu_device *smmu_dev,
 				u64 *evt, struct ratelimit_state *rs);
+	int (*smmu_power_get)(struct arm_smmu_device *smmu);
+	int (*smmu_power_put)(struct arm_smmu_device *smmu);
 };
 
 struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu);
-- 
2.46.0


