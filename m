Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5DCCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovxHcPr2c6qanD+Vv3eKyELWdpdHqRNDhl0m5BC+0cE=; b=YRqzoBKsOFAMj0myS4gkJrCFAl
	qnX+LpAqT/wuD0XgzkQMegtiueX2h+uVTdWbCBGfzxO/7o2E+fqb/b3VmrlaIXOfOAUZ3OYxqYHqd
	wDjPFj06ryYhXxi2vTMEeC1q2BFJP9lvQDrQQk9vdWZ6OLB2v098QRD1qNhshKm16ZZmdfIpfLpk9
	Qj6g/FR+Ugw6drDFY0NOmjHsKo7z8TJ9yaz6PwxdkV3Kw7FcArD5Vm3gOWpY+mml8bRMOsOuha+iI
	FOQ5vk0UJB52FmXE+GDeA7saH5mQG4+JF/fqjzDpbadsx9Imvp+zEBVlCwtHeP0f1FQmKzORvTcXa
	zmVi4m8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNN-00000005iSQ-1Op9;
	Wed, 30 Sep 2026 10:17:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNA-00000005iMS-0eMn
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 10:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ovxHcPr2c6qanD+Vv3eKyELWdpdHqRNDhl0m5BC+0cE=; b=uSxsHDXX3YvGBfgvPUm1HPeQvn
	tdLEO8Fk8NFbu1kjb9fGTTsBV0QNG7IKRmXSbkVDNiL3DEe2R7chea81MjXvOpIH6gCMu4hCg1eaY
	bOWQXgSeBM2RWWJcymXJ61HujeqGpZqZFfdW6FsN5v3Xq6VqIzcNev5R9dzQgvakxxtGrUoNiMjJ+
	LFwq2Pg1vG6OyPV4ax2wPk1zPPonZRZgHNDwOnUucOjEoUuZEk4cD7UpCiDUyEySC+FhRRTuQsvPd
	sjkbS0c5X3cPah/9z2b/PVVXh3mXSfXl6hHD/ZbYEW+pW//HJhReDuvJhA4Ii37ughiWJQjkJYCLY
	JHNQ97MQ==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrN5-0000000CUTI-0DSv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:17:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ovxHcPr2c6qanD+Vv3eKyELWdpdHqRNDhl0m5BC+0cE=;
	b=gQ5LofUWtwwzCJDR9K4hm1xONWWwK4FEs2aisKnph0rkzaUkvrrZzfS9+qXv3WTbEkH0zd/aJ
	kKlB5R+nWOabsSrRuJCOYxkPUnAV0JSZ7Ep4M/EimPS9bDvcl25PZZiuQjo1YO23nhc6e0lQuW0
	GbOwrljIhC9Anqr7mQZIUQQ=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJg0NrVzcb46;
	Wed, 30 Sep 2026 18:05:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2AEC540538;
	Wed, 30 Sep 2026 18:17:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:16:59 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<tglx@kernel.org>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v20 06/15] arm64: syscall: Rework the syscall exit path in el0_svc_common()
Date: Wed, 30 Sep 2026 18:17:56 +0800
Message-ID: <20260930101805.1770358-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930101805.1770358-1-ruanjinjie@huawei.com>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_111707_451478_0E3FA39A 
X-CRM114-Status: GOOD (  10.24  )
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

In preparation for moving arm64 over to the generic entry,
invert the nested conditional flags check within el0_svc_common().

No functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 3e78e159b2a1..b8d7d29a431b 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,8 +127,9 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (!has_syscall_work(flags) && !(flags & _TIF_SINGLESTEP))
-			return;
+		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+			syscall_trace_exit(regs);
+		return;
 	}
 
 trace_exit:
-- 
2.34.1


