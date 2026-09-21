Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5234C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUFsdEQcnYGG+m7lBvnUdr9bZDhSLWcxl5C7ZDrryrY=; b=oSYMiiMTvRGNDH+CwlAABS185t
	oENHt5fx6NnyQenzJNCC2oKD+FuuEHpFW27ZNumPAx7OEIfqteoUwnOyzn7fSSzY70/hJqNljimWD
	5zxcjST5DBOzwuAn8kcP40Fp/G02ZUhev8cu1hBuiRIPU0bMaGUQKcAvMcMsFVlHOD7P0TMokrCI4
	MEORiVG8cFDKQCe2ka+HH8CqkChBd/x+m4p3+YUlixNCwBknFb+mmcUuuZZLRf+/tPJlv+Bpeh+Fh
	5XTEAlMe0QAAxqGcpVrv7KHINsQGoxgmMN9R6EgXKDNImDtZHWh32eHZo1IxgXD4gtlmsvuNTJvw7
	eVfXed+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8edX-00000002KZ5-3TSy;
	Mon, 21 Sep 2026 14:04:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8edR-00000002KWC-2n4U
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 14:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mUFsdEQcnYGG+m7lBvnUdr9bZDhSLWcxl5C7ZDrryrY=; b=E1c2NZ07wG9RimO2DHwRQz7BZS
	cC9PoyvMrbc/vHjIk7d7OuDKUp70Hq+QyNMBRG4kS1QcrATIuruC8+D0uJl8Rdfl9XpEpGV2wIobe
	aKkNptksluazdZfS/rukU4x8yCbPczix04lW13934lBxb00uD+duqNbc3uA+Wfu8/jxzrYHPBp8+m
	R7Z+5RI2fZGtN0UwOx3JfX5hD2X73i1ncrC5VCdbrxNxQfhMNXySR2OeiOuF6Rx4fOAbbkGFMnE2m
	9V9+RzAmpf9XenTkPV5Ow0JTLqgBKXMTUNmQ1vuN8t39kwzD094tpE7rpBSB8RipyHXQOEj0bL+7S
	a5nqGBrQ==;
Received: from out-124.mta1.migadu.com ([2001:41d0:203:375::7c] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8edN-0000000CNaz-3juA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:04:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ie878rU/JdV+WHZq6reEkW3LocI09006Gd3UryYGcEA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789999479; v=1; x=1790604279;
 b=Ym+yjfJSNoAEEYEZ8nF7MSCaOlkglFvG2PXUFTZUSCR2WK5OnYpE4u5G9is82wrKVkT62a4N
 3BKH6UbTddmpZt07+o7ZsSKH+CNw6hyAPpGlQybfsJ5CmBCRHD0QRiaeTp1SU8NtV/OZ11iSrDi
 U11Fua0vRpoxEyOe7hpcnV+U=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ad4db469fc531011;
	Mon, 21 Sep 2026 14:04:39 +0000
X-Mizu-Trace-ID: ad4db469fc531011
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/3] KVM: arm64: selftests: Test a timer set past the counter's wrap
Date: Mon, 21 Sep 2026 15:04:27 +0100
Message-Id: <20260921140427.2211373-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260921140427.2211373-1-fuad.tabba@linux.dev>
References: <20260921140427.2211373-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_150442_125034_01DC1908 
X-CRM114-Status: GOOD (  12.11  )
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

Program an unmasked timer whose cval sits within long_wait_ms of the
counter's wrap while the guest's counter is at wait_ms, and expect no
interrupt. The guest's counter can't reach it, but a host that applies
the timer's offset by adding it to cval wraps the sum into the past and
fires at once. The one existing case with a cval past the wrap, in the
sanity checks, runs with the timer masked and can't see that.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../kvm/arm64/arch_timer_edge_cases.c         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index d9c9377a63256..69986a7f0d37d 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -787,6 +787,30 @@ static void test_timers_in_the_past(enum arch_timer timer)
 	}
 }
 
+/*
+ * With the counter at wait_ms, a tval of -(wait_ms + long_wait_ms) puts cval
+ * within long_wait_ms of the counter's wrap: a deadline further away than the
+ * counter can reach. Unmasked, so an early ISTATUS shows up as an IRQ.
+ */
+static void test_timers_past_counter_wrap(enum arch_timer timer)
+{
+	s32 tval = -(s32)msec_to_cycles(test_args.wait_ms + test_args.long_wait_ms);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sleep_method); i++) {
+		sleep_method_t sm = sleep_method[i];
+
+		local_irq_disable();
+		set_counter(timer, msec_to_cycles(test_args.wait_ms));
+		set_tval_irq(timer, tval, CTL_ENABLE);
+		sm(timer, msecs_to_usecs(test_args.wait_ms) + TIMEOUT_NO_IRQ_US);
+		local_irq_enable();
+		isb();
+		assert_irqs_handled(0);
+		timer_set_ctl(timer, CTL_IMASK);
+	}
+}
+
 static void test_long_timer_delays(enum arch_timer timer)
 {
 	s32 tval = (s32)msec_to_cycles(test_args.long_wait_ms);
@@ -806,6 +830,7 @@ static void guest_run_iteration(enum arch_timer timer)
 	test_basic_functionality(timer);
 	test_timers_sanity_checks(timer);
 
+	test_timers_past_counter_wrap(timer);
 	test_timers_above_tval_max(timer);
 	test_timers_in_the_past(timer);
 
-- 
2.39.5


