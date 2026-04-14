Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55123ED7B96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrj0TgymHiMmZwZs2Vo2Bt+4CUgM0die06+x7rWw59g=; b=BnatvVdG9QlzNigepdI99QKHQR
	mLlBZFBIbouuK4WDl0un/xDBrI5Tqvng13aeYA7/NynZTJvwvjOsQw8wj0q671KjZmP2Oo2ug0Wok
	wbUpmogjazUgVZ2XF4s21X+PuwARYdeHjOZMDz8V6vE7HvY5gfWtA/mmha879ZkKZEyriIN8UOn+q
	suYCDDSCxyFx3obFjy7Oao0w0hL6azxi6Naoz5BJGM+84RKTV3O3Z8HgLZZBQoX4wykpXJ3B1XjDd
	h5WYEOqQJNuVCEg+Rl9desLA8+ZvgAgoU/9gRzpOdnNMV63bVcA9G23ynWqbaCEEjj7VMyNWjLxW3
	tOKuKxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCauQ-0000000H8HY-3Zk0;
	Tue, 14 Apr 2026 10:22:18 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCauP-0000000H8H2-1h8K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=mrj0TgymHiMmZwZs2Vo2Bt+4CUgM0die06+x7rWw59g=; b=Sqz9M3LXIsN+s1ZYgdcBHfRdjS
	BQPb0aiMYyE7+TUmuI9k6GybWCOqYRsB0itaIgQTGeTMoVAUOdoJxQpEvYwRRrl6oVLDShTM+qSHh
	F2A1W8mDhStkHA3/nwcRkkPFUjzP1WUr8qt2Szs2vjoGJi+5ecSuy148Mq0jkNNHjztEcceX7/VkS
	iVp1Eje/IrkowGM61e39a8ELoRKv4Nv3q8s4b7Z8yrIjLh+uV9MVCxT9fBymiIEnCAj2/VcO+muUp
	vIenLrg9CivGsD8GxC4anEpwCsbGEuFx3wHXO5TXWuyTGFWIYXfWWvzNeWhyzBGDPjAnJmJVb+s8p
	xKErlGwA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCau0-00CzuK-0k;
	Tue, 14 Apr 2026 10:21:52 +0000
Date: Tue, 14 Apr 2026 03:21:46 -0700
From: Breno Leitao <leitao@debian.org>
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	lpieralisi@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pjaroszynski@nvidia.com, guohanjun@huawei.com, sudeep.holla@kernel.org, 
	linux-arm-kernel@lists.infradead.org, rmikey@meta.com, kernel-team@meta.com
Subject: Re: [PATCH RFC] ACPI: processor: idle: Do not propagate
 acpi_processor_ffh_lpi_probe() -ENODEV
Message-ID: <ad4UWJ__dnDQtrj8@gmail.com>
References: <20260413-ffh-v1-1-301704f69e2f@debian.org>
 <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_032217_446480_5E737B67 
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

Hello Huisong,

On Tue, Apr 14, 2026 at 05:43:51PM +0800, lihuisong (C) wrote:
> But it is a real issue. Thanks for your report.
> I think the best way to fix your issue is that remove this verification in
> psci_acpi_cpu_init_idle().
> Because it is legal for platform to report one LPI state.
> This function just needs to verify the LPI states which are FFH.

Thank you for the prompt feedback.

Would this approach work?

commit 6c9d52840a4f778cc989838ba76ee51416e85de3
Author: Breno Leitao <leitao@debian.org>
Date:   Tue Apr 14 03:16:08 2026 -0700

    ACPI: processor: idle: Allow platforms with only one LPI state
    
    psci_acpi_cpu_init_idle() rejects platforms where power.count - 1 <= 0
    by returning -ENODEV. However, having a single LPI state (WFI) is a
    valid configuration. The function's purpose is to verify FFH idle states,
    and when count is zero, there are simply no FFH states to validate —
    this is not an error.
    
    On NVIDIA Grace (aarch64) systems with PSCIv1.1, power.count is 1 for
    all 72 CPUs, so the probe fails with -ENODEV. After commit cac173bea57d
    ("ACPI: processor: idle: Rework the handling of
    acpi_processor_ffh_lpi_probe()"), this failure propagates up and prevents
    cpuidle registration entirely.
    
    Change the check from (count <= 0) to (count < 0) so that platforms
    with only WFI are accepted. The for loop naturally handles count == 0
    by not iterating.
    
    Fixes: cac173bea57d ("ACPI: processor: idle: Rework the handling of acpi_processor_ffh_lpi_probe()")
    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidle.c
index 801f9c4501425..7791b751042ce 100644
--- a/drivers/acpi/arm64/cpuidle.c
+++ b/drivers/acpi/arm64/cpuidle.c
@@ -31,7 +31,7 @@ static int psci_acpi_cpu_init_idle(unsigned int cpu)
 		return -EOPNOTSUPP;
 
 	count = pr->power.count - 1;
-	if (count <= 0)
+	if (count < 0)
 		return -ENODEV;
 
 	for (i = 0; i < count; i++) {

