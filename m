Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1151DC982E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jjr7HC+ntlWrnO3TI37akXeZWG1zGWLKM7VCjYK9WdI=; b=NbzF/U57sdkFhV
	9DG1N+lcVHtXp5FzW788xpnN7pFfH8RXwruomgxDNfwOvP09TBZQrQwlMZJevBMS1G17tSwCfVkh9
	03HCzoIpZlOQzx453CHfiUki+Le5KLJ+zaqSobqPnN9T14McdTdBRWq84MYOAdNVC2qq6WKpk/96b
	ZeFuKp2ZGTf09TIdSh8I2zbpYQIaEv91GxVTa3wMFnBcEpUA6sZzMPjN6u7J+dS7XyJ56ULGHYdAU
	ekCd51itGv5iBKESp2NZFSheFAC4Po2e7QmQMaZjm5ukLrn2ROHqEX4tGGG91STUwNy/lep4J3ENh
	/0LRpi3I86vj914Uyjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJl-0000000Efwb-3pDH;
	Fri, 18 Sep 2026 14:11:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJd-0000000Efsg-3Nb8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 14:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Jjr7HC+ntlWrnO3TI37akXeZWG1zGWLKM7VCjYK9WdI=; b=Rb1g37njbzxHcfNzZmizlqaV5Q
	Rv+fxV47C4ggA9032HlzgM5aP2TioQJlcsG6YiPtHcqRtj4c1foupl8iCBt/hNmmOaPariMguMLQm
	2y/weRue4ehfl7/MNjLEdZDxZIHmiUcJOVIFHJQqoQfvy+cHmpQY5SDEjGDQDzXq45U6NGZWx59Pg
	FX6x+zIgzTn6358nJP9DQ7zQ9No/1A/O1Vi/NZQJ3eqRAkJFRrHkwcSmsxDjyiH9Ize2HFwMa3KsF
	b7QPoggQ4sppRFm4LydEW7yhQACdPgiJB54cB6oFbdPx46Qb/UoGv9fWHAWwMzMfiou9soVDN9LDD
	Zg5Pzraw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7ZJa-0000000ABem-3Rdr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:11:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C84291C00;
	Fri, 18 Sep 2026 07:11:41 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF9293F86C;
	Fri, 18 Sep 2026 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740705; bh=l6z/d8J+mDpH7w64Ngl6JhjLmuSLkYpaYqcIi48vBz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EktjJMX104nV8fGBNIxtoKmxhb7pql0uIgXDsyF7l6CyphhBcS3i/BX+zPhuTRn9j
	 ZdkzOpUGOAGyDbqf8ng+eLX43LFeF61MKQlZbyP63mJeSk67Kf6aeZZGjqtBq59GST
	 8rdehKl70TdFnI4uttHmVXIzMTtghVUCsTxXrzWg=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v4 7/8] firmware: smccc: lfa: introduce SMC access lock
Date: Fri, 18 Sep 2026 16:11:10 +0200
Message-ID: <20260918141112.2115555-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918141112.2115555-1-andre.przywara@arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_151147_322291_47DDF383 
X-CRM114-Status: GOOD (  24.98  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

After a successful live activation, the list of firmware images might
change, which also affects the sequence IDs. We store the sequence
ID in a data structure and connect it to its GUID, which is the
identifier used to access certain image properties from userland.
When an activation is happening, the sequence ID associations might
change at any point, so we must be sure to not use any previously
learned sequence ID during this time.

Protect the association between a sequence ID and a firmware image
(its GUID, really) by a reader/writer lock. In this case it's a R/W
semaphore, so it can sleep and we can hold it for longer, also
concurrent SMC calls are not blocked on each other, it's just an
activation that blocks calls.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 38 +++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index a23df331ffde9..bf97e7d34e6c7 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/psci.h>
+#include <linux/rwsem.h>
 #include <linux/stop_machine.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
@@ -177,6 +178,16 @@ static struct workqueue_struct *fw_images_update_wq;
 static struct work_struct fw_images_update_work;
 static struct attribute *image_default_attrs[LFA_ATTR_NR_IMAGES + 1];
 
+/*
+ * A successful image activation might change the number of available images,
+ * leading to a re-order and thus re-assignment of the sequence IDs.
+ * The lock protects the connection between a firmware image (through its
+ * user visible UUID) and the sequence IDs. Anyone doing an SMC call with
+ * a sequence ID needs to take the readers lock. Doing an activation requires
+ * the writer lock, as that process might change the assocications.
+ */
+struct rw_semaphore smc_lock;
+
 static const struct attribute_group image_attr_group = {
 	.attrs = image_default_attrs,
 };
@@ -259,6 +270,7 @@ static unsigned long get_nr_lfa_components(void)
 	reg.a0 = ARM_SMCCC_LFA_GET_INFO;
 	reg.a1 = 0; /* lfa_info_selector = 0 */
 
+	/* No need for the smc_lock, since no sequence IDs are involved. */
 	arm_smccc_1_2_invoke(&reg, &reg);
 	if (reg.a0 != LFA_SUCCESS)
 		return reg.a0;
@@ -279,9 +291,11 @@ static int lfa_cancel(void *data)
 	struct fw_image *image = data;
 	struct arm_smccc_1_2_regs reg = { 0 };
 
+	down_read(&smc_lock);
 	reg.a0 = ARM_SMCCC_LFA_CANCEL;
 	reg.a1 = image->fw_seq_id;
 	arm_smccc_1_2_invoke(&reg, &reg);
+	up_read(&smc_lock);
 
 	/*
 	 * When firmware activation is called with "skip_cpu_rendezvous=1",
@@ -339,6 +353,7 @@ static int activate_fw_image(struct fw_image *image)
 	int ret;
 
 retry:
+	down_write(&smc_lock);
 	/*
 	 * cpu_rendezvous_forced is set by the administrator, via sysfs,
 	 * cpu_rendezvous is dictated by each firmware component.
@@ -352,10 +367,13 @@ static int activate_fw_image(struct fw_image *image)
 
 	if (!ret) {
 		update_fw_images_tree();
+		up_write(&smc_lock);
 
 		return 0;
 	}
 
+	up_write(&smc_lock);
+
 	/* SMC returned with call_again flag set, or with LFA_BUSY */
 	if (ret == -EAGAIN || ret == -EBUSY) {
 		if (ktime_before(ktime_get(), end)) {
@@ -396,8 +414,11 @@ static int prime_fw_image(struct fw_image *image)
 	 * be called again.
 	 * reg.a1 will become 0 once the prime process completes.
 	 */
+	down_read(&smc_lock);
 	reg.a1 = image->fw_seq_id;
 	arm_smccc_1_2_invoke(&reg, &res);
+	up_read(&smc_lock);
+
 	if ((long)res.a0 < 0) {
 		pr_err("LFA_PRIME for image %s failed: %s\n",
 		       get_image_name(image),
@@ -441,7 +462,7 @@ static ssize_t activation_capable_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%d\n", image->activation_capable);
 }
 
-static void update_fw_image_pending(struct fw_image *image)
+static void _update_fw_image_pending(struct fw_image *image)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
 
@@ -453,6 +474,13 @@ static void update_fw_image_pending(struct fw_image *image)
 		image->activation_pending = !!(reg.a3 & BIT(1));
 }
 
+static void update_fw_image_pending(struct fw_image *image)
+{
+	down_read(&smc_lock);
+	_update_fw_image_pending(image);
+	up_read(&smc_lock);
+}
+
 static ssize_t activation_pending_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buf)
 {
@@ -527,9 +555,11 @@ static ssize_t pending_version_show(struct kobject *kobj,
 	 * Similar to activation pending, this value can change following an
 	 * update, we need to retrieve fresh info instead of stale information.
 	 */
+	down_read(&smc_lock);
 	reg.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
 	reg.a1 = image->fw_seq_id;
 	arm_smccc_1_2_invoke(&reg, &reg);
+	up_read(&smc_lock);
 	if (reg.a0 == LFA_SUCCESS) {
 		if (reg.a5 != 0 && image->activation_pending) {
 			u32 maj, min;
@@ -779,6 +809,7 @@ static int activate_pending_image(void)
 	struct fw_image *image;
 	int ret;
 
+	down_read(&smc_lock);
 	spin_lock(&lfa_kset->list_lock);
 	list_for_each_entry(kobj, &lfa_kset->list, entry) {
 		image = kobj_to_fw_image(kobj);
@@ -786,7 +817,7 @@ static int activate_pending_image(void)
 		if (image->fw_seq_id == -1)
 			continue; /* Invalid FW component */
 
-		update_fw_image_pending(image);
+		_update_fw_image_pending(image);
 		if (image->activation_capable && image->activation_pending &&
 		    image->auto_activate) {
 			found_pending = true;
@@ -794,6 +825,7 @@ static int activate_pending_image(void)
 		}
 	}
 	spin_unlock(&lfa_kset->list_lock);
+	up_read(&smc_lock);
 
 	if (!found_pending)
 		return -ENOENT;
@@ -934,6 +966,8 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 		return -ENOMEM;
 	}
 
+	init_rwsem(&smc_lock);
+
 	err = update_fw_images_tree();
 	if (err != 0) {
 		kset_unregister(lfa_kset);
-- 
2.43.0


