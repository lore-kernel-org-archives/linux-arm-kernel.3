Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E13DC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zF1PsVs8tAIHp1nwIAkdofs/M/mB7uWevLMDDPw0xkI=; b=Ed/8tdVeV6EsFw4Y3Q13lhxtM9
	OB9LKiX1VRDSeJhoYWJcffS2AAOYVECWTw501ligzxt9eyCxxJirCl0GjrMFDVhEKbTrNn66iJOcI
	X1wTb7zL32fAROwwvshzmRDijrAowPkeIGnyYsnniArWeJlDIM0bQ0Wts0cD80OkQE2WAZCZAeCWe
	PaKHLJvQUXsPEaeqV/HXiFWRYD/LTsxNm8sCY04Hr+iANEpOl242O01ez39E4ZDEsbCtYeMghdlPp
	8XXhD5TO0A6CFS9O9zNpMPEaeh6LEn++tntHGTDws0V9MUyF/ku/VTxxhML3dnLdBw2ftV38WU+we
	JfTw6uKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEZd-0000000C22G-3yjl;
	Thu, 20 Mar 2025 12:00:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvE8y-0000000BxVz-0of1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Mar 2025 11:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zF1PsVs8tAIHp1nwIAkdofs/M/mB7uWevLMDDPw0xkI=; b=CT5mD7G/G02ygKBoS5PXvthmNJ
	LxqN5K+BO4aIUg2+Ru1Df2n8rT7nPp38BwQcZ22NcuqTNCDvg/T0E941dYRmvA+fpAF9j6oHywJch
	n1jmYPl1NtpK2Qg9SoKXJtkvcn1H1cZH3hgHEqg9FfIWeFGhsWPIEyiEwx+O6j60KhtyAc7ZBvHxI
	2lVKfj9M1yzLtH6o1vQ0KlWXpqYe44sKKKUMwXoQF+dVkDRJRl+JvWEdFVW6ew8BZuwmpLZnAwRNh
	+mHjut7MZVZRykxiHrAq1jJDqYUoYHU1ayw4J84jUZIF7snlP8VXhwein3BQVytg0/kByqatGinOj
	FvRVeQgw==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvE8r-000000047jd-31Lc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 11:32:59 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K7I9lT006831;
	Thu, 20 Mar 2025 11:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=z
	F1PsVs8tAIHp1nwIAkdofs/M/mB7uWevLMDDPw0xkI=; b=xD/yK+D8BxNv9R/wZ
	LiKwt6VKHXFyeGlQW8YjSme4KgT9smalk2Fdbe08tRvKLycGtBXXdMMFAYDNf4iF
	2mSgQVOzl4fBh67pTRIF2UkISQK7ChcuXkoH8m9PK+kHlpqcyq0SIkW6mnr0jIoN
	PkI07T3bGyl4VUao7xZIbmz6P/dZnJqFVliTUJsj4XOlMyzIRwN0ZZCXv8wBf8mK
	JXNM/Ct2vxrJufHT0YQr6gOLCVm+TYZCzkqf43YhhkoZU1m1EWk/9kTgQV0yaqLG
	k09et2vRS1mqw9I8REQtJqAQzIieePRcDaDrINvnZM++LKoL1uGPzrYSZojDq//N
	PZ/Jw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45d2h1kwg1-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 20 Mar 2025 11:32:27 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.0.133) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 11:32:26 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 20 Mar 2025 11:32:15 +0000
Subject: [PATCH v4 05/18] drm/imagination: Add power domain control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-sets-bxs-4-64-patch-v1-v4-5-d987cf4ca439@imgtec.com>
References: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
In-Reply-To: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        "Michal
 Wilczynski" <m.wilczynski@samsung.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7131;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=lzMiSBj3W97x6LnL+njszLrGkUtUMHWsN2UbS7jRfF8=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaTf/nNEQWqB1FcFtUmTAz4brf3HkNM7z9zmQ4bnAs7jh
 os5mEUlOkpZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAiRU8Y/sel7LqwbYJd0Qee
 mJJOhXO/p/M5chbs29/C4x2hvHaDpREjQ/+JsFu7rhgskFQ/Ias2U8Oq/HC0VtHWgw0TBDYsMK0
 rZAMA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: C9Vv6zmkmSKWcFM0Bt4-RiPunjZCXROY
X-Proofpoint-ORIG-GUID: C9Vv6zmkmSKWcFM0Bt4-RiPunjZCXROY
X-Authority-Analysis: v=2.4 cv=V8Z90fni c=1 sm=1 tr=0 ts=67dbfccb cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=Iu228gY9Y64KKxsXE-4A:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_113253_958051_380A801B 
X-CRM114-Status: GOOD (  22.63  )
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

The first supported GPU only used a single power domain so this was
automatically handled by the device runtime.

In order to support multiple power domains, they must be enumerated from
devicetree and linked to both the GPU device and each other to ensure
correct power sequencing at start time.

For all Imagination Rogue GPUs, power domains are named "a", "b", etc. and
the sequence A->B->... is always valid for startup with the reverse true
for shutdown. Note this is not always the *only* valid sequence, but it's
simple and does not require special-casing for different GPU power
topologies.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-5-143b3dbef02f@imgtec.com
Changes in v3:
- None
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-6-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-6-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_device.h |   8 +++
 drivers/gpu/drm/imagination/pvr_drv.c    |   7 ++
 drivers/gpu/drm/imagination/pvr_power.c  | 114 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h  |   3 +
 4 files changed, 132 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 6d0dfacb677b46a880f37f419dfa7b67c68fe63d..2dd8a8885fe07078896d669d822525fb2b7bab51 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -18,6 +18,7 @@
 #include <linux/bits.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
+#include <linux/device.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -131,6 +132,13 @@ struct pvr_device {
 	 */
 	struct clk *mem_clk;
 
+	struct pvr_device_power {
+		struct device **domain_devs;
+		struct device_link **domain_links;
+
+		u32 domain_count;
+	} power;
+
 	/** @irq: IRQ number. */
 	int irq;
 
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 3130193f8fffc185e630a293be53374bdc4b7ce0..ac4f5855c5692f0956862cebdbf76b16d8da9a81 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1411,6 +1411,10 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
+	err = pvr_power_domains_init(pvr_dev);
+	if (err)
+		return err;
+
 	init_rwsem(&pvr_dev->reset_sem);
 
 	pvr_context_device_init(pvr_dev);
@@ -1450,6 +1454,8 @@ pvr_probe(struct platform_device *plat_dev)
 err_context_fini:
 	pvr_context_device_fini(pvr_dev);
 
+	pvr_power_domains_fini(pvr_dev);
+
 	return err;
 }
 
@@ -1470,6 +1476,7 @@ static void pvr_remove(struct platform_device *plat_dev)
 	pvr_watchdog_fini(pvr_dev);
 	pvr_queue_device_fini(pvr_dev);
 	pvr_context_device_fini(pvr_dev);
+	pvr_power_domains_fini(pvr_dev);
 }
 
 static const struct of_device_id dt_match[] = {
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index ba7816fd28ec77e6ca5ce408302a413ce1afeb6e..19b079b357df78e8bcdecfa377fc9c05b6e8e4b0 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -10,10 +10,13 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/timer.h>
 #include <linux/types.h>
@@ -431,3 +434,114 @@ pvr_watchdog_fini(struct pvr_device *pvr_dev)
 {
 	cancel_delayed_work_sync(&pvr_dev->watchdog.work);
 }
+
+int pvr_power_domains_init(struct pvr_device *pvr_dev)
+{
+	struct device *dev = from_pvr_device(pvr_dev)->dev;
+
+	struct device_link **domain_links __free(kfree) = NULL;
+	struct device **domain_devs __free(kfree) = NULL;
+	int domain_count;
+	int link_count;
+
+	char dev_name[2] = "a";
+	int err;
+	int i;
+
+	domain_count = of_count_phandle_with_args(dev->of_node, "power-domains",
+						  "#power-domain-cells");
+	if (domain_count < 0)
+		return domain_count;
+
+	if (domain_count <= 1)
+		return 0;
+
+	link_count = domain_count + (domain_count - 1);
+
+	domain_devs = kcalloc(domain_count, sizeof(*domain_devs), GFP_KERNEL);
+	if (!domain_devs)
+		return -ENOMEM;
+
+	domain_links = kcalloc(link_count, sizeof(*domain_links), GFP_KERNEL);
+	if (!domain_links)
+		return -ENOMEM;
+
+	for (i = 0; i < domain_count; i++) {
+		struct device *domain_dev;
+
+		dev_name[0] = 'a' + i;
+		domain_dev = dev_pm_domain_attach_by_name(dev, dev_name);
+		if (IS_ERR_OR_NULL(domain_dev)) {
+			err = domain_dev ? PTR_ERR(domain_dev) : -ENODEV;
+			goto err_detach;
+		}
+
+		domain_devs[i] = domain_dev;
+	}
+
+	for (i = 0; i < domain_count; i++) {
+		struct device_link *link;
+
+		link = device_link_add(dev, domain_devs[i], DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+		if (!link) {
+			err = -ENODEV;
+			goto err_unlink;
+		}
+
+		domain_links[i] = link;
+	}
+
+	for (i = domain_count; i < link_count; i++) {
+		struct device_link *link;
+
+		link = device_link_add(domain_devs[i - domain_count + 1],
+				       domain_devs[i - domain_count],
+				       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+		if (!link) {
+			err = -ENODEV;
+			goto err_unlink;
+		}
+
+		domain_links[i] = link;
+	}
+
+	pvr_dev->power = (struct pvr_device_power){
+		.domain_devs = no_free_ptr(domain_devs),
+		.domain_links = no_free_ptr(domain_links),
+		.domain_count = domain_count,
+	};
+
+	return 0;
+
+err_unlink:
+	while (--i >= 0)
+		device_link_del(domain_links[i]);
+
+	i = domain_count;
+
+err_detach:
+	while (--i >= 0)
+		dev_pm_domain_detach(domain_devs[i], true);
+
+	return err;
+}
+
+void pvr_power_domains_fini(struct pvr_device *pvr_dev)
+{
+	const int domain_count = pvr_dev->power.domain_count;
+
+	int i = domain_count + (domain_count - 1);
+
+	while (--i >= 0)
+		device_link_del(pvr_dev->power.domain_links[i]);
+
+	i = domain_count;
+
+	while (--i >= 0)
+		dev_pm_domain_detach(pvr_dev->power.domain_devs[i], true);
+
+	kfree(pvr_dev->power.domain_links);
+	kfree(pvr_dev->power.domain_devs);
+
+	pvr_dev->power = (struct pvr_device_power){ 0 };
+}
diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
index 9a9312dcb2dab7d36ee8ff7f69e69d126c5469a9..ada85674a7ca762dcf92df40424230e1c3910342 100644
--- a/drivers/gpu/drm/imagination/pvr_power.h
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -38,4 +38,7 @@ pvr_power_put(struct pvr_device *pvr_dev)
 	return pm_runtime_put(drm_dev->dev);
 }
 
+int pvr_power_domains_init(struct pvr_device *pvr_dev);
+void pvr_power_domains_fini(struct pvr_device *pvr_dev);
+
 #endif /* PVR_POWER_H */

-- 
2.49.0


