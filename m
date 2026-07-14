Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA67C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tB5a8FtyJj5HJIDAKydoHG7QYuYFAziBXwegGN1DKI=; b=JbDPmaVcGQWo/63rpL4nHzkajw
	n+tzkvvo3mB+kgZCW3KM0zZEMxKkfSWbmCwlZAe4GNnGKbxilUYtujwOkRCDjsA3BdgrGgGMYkMPM
	eaEavGoDQIYnH/758tBiCr9qNI5Nxk/p4OJphomUeizxMvZ7LAm7S6THA4/pjVOAbyZnhxbCNZFgY
	XJ0euO9B5kO1ABWuUUuvrS4BXYHrgJ1sbTVjIYMvthW5A3U+j/7lyPgr2fdi/RwtmVvXwFyfVoI/i
	AL7a3r8qgeoGifSq/cLXmP/DgkbT9frJ3tY1N5J5gRsIIrgNexOzSrZmrH80tT7/uWDo+Vt90pnl6
	F8iJsdfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjetk-0000000CVTO-3KNJ;
	Tue, 14 Jul 2026 15:18:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjeth-0000000CVSk-1jkR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 15:18:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4996A2F;
	Tue, 14 Jul 2026 08:18:07 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957A53F915;
	Tue, 14 Jul 2026 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784042291; bh=zB7jMLeR7v5xieyyCOBRixKDYFJVFK/R+3mYJg2Ffms=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=b8gJZUyg2Ilxyw6TxcxewYIGZQvMW6wiYwH7U1dSyxvXATEFCTC3kCuLdB83kUWGw
	 82P78b/OWlHKr59NlPgcTM0EiPBL4Qp5l+Ukc1owicBsSrOA/URBXvkYJ93XPbp3HW
	 bTD/573o4seRmcGnr4SPGs0/h3kfXOMsmS2XdrJE=
Message-ID: <d4d83179-e88e-47ff-a320-47fdba8de7de@arm.com>
Date: Tue, 14 Jul 2026 16:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/36] arm64: Add support for FEAT_NMI
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <375ee9ac-f715-47bf-8f0d-7ec8dc35c7f2@huawei.com>
 <bb6e80db-dd5e-405f-9aa9-2a59fae3a1dc@huawei.com>
 <b70b65b7-8ea4-4dc9-bf0b-f184e14d4850@arm.com>
Content-Language: en-GB
In-Reply-To: <b70b65b7-8ea4-4dc9-bf0b-f184e14d4850@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_081814_554632_D5973348 
X-CRM114-Status: GOOD (  19.87  )
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

On 7/14/26 11:32, Vladimir Murzin wrote:
>> Hi Vladimir,
>>
>> Even if PE supports FEAT_NMI, the GIC may not be able to generate a
>> super-priority interrupt.
>>
>> The following patch can fix it, we should use
>> gic_supports_v3_3_nmi() instead of system_uses_nmi() in
>> ipi_should_be_nmi() because the GIC.
>>
> Thanks for the report!
> 
> I think it would be better for me to spend some time making the arch
> IPI code tolerate both the presence and absence of NMI support,
> perhaps similar to how perf handles this, rather than creating a
> strong dependency between the architecture code and the interrupt
> controller. At least, I’ll give that a try!

The diff below appears to work and doesn't require any knowledge
of GIC internals

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 80e35a8e5c8f..a7f894e82491 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -67,6 +67,8 @@ static int cpus_stuck_in_kernel;
 static int ipi_irq_base __ro_after_init;
 static int nr_ipi __ro_after_init = NR_IPI;
 
+static DECLARE_BITMAP(ipi_nmi_bitmap, MAX_IPI) __ro_after_init;
+
 struct ipi_descs {
 	struct irq_desc *descs[MAX_IPI];
 };
@@ -1057,7 +1059,7 @@ static void ipi_setup(int cpu)
 
 	for (i = 0; i < nr_ipi; i++) {
 		if (!percpu_ipi_descs) {
-			if (ipi_should_be_nmi(i)) {
+			if (test_bit(i, ipi_nmi_bitmap)) {
 				prepare_percpu_nmi(ipi_irq_base + i);
 				enable_percpu_nmi(ipi_irq_base + i, 0);
 			} else {
@@ -1079,7 +1081,7 @@ static void ipi_teardown(int cpu)
 
 	for (i = 0; i < nr_ipi; i++) {
 		if (!percpu_ipi_descs) {
-			if (ipi_should_be_nmi(i)) {
+			if (test_bit(i, ipi_nmi_bitmap)) {
 				disable_percpu_nmi(ipi_irq_base + i);
 				teardown_percpu_nmi(ipi_irq_base + i);
 			} else {
@@ -1098,10 +1100,24 @@ static void ipi_setup_sgi(int ipi)
 
 	irq = ipi_irq_base + ipi;
 
-	if (ipi_should_be_nmi(ipi)) {
-		err = request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat);
-		WARN(err, "Could not request IRQ %d as NMI, err=%d\n", irq, err);
-	} else {
+	if (ipi_should_be_nmi(ipi))
+		set_bit(ipi, ipi_nmi_bitmap);
+
+	/*
+	 * Try to request NMI if it should be
+	 */
+	if (test_bit(ipi, ipi_nmi_bitmap) &&
+	    request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat)) {
+		/*
+		 * Fallback to regular IRQ
+		 */
+		clear_bit(ipi, ipi_nmi_bitmap);
+	}
+
+	/*
+	 * Otherwise regular IRQ
+	 */
+	if (!test_bit(ipi, ipi_nmi_bitmap)) {
 		err = request_percpu_irq(irq, ipi_handler, "IPI", &irq_stat);
 		WARN(err, "Could not request IRQ %d as IRQ, err=%d\n", irq, err);
 	}


