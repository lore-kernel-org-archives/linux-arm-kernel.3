Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4BF606D806
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GBA5KwAk;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h2oYDKFy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=v1ehsd1h1KwjntsiObgsijntLBW7FiKbRqCPJkhAIr4=; b=GBA5KwAkDpqB5yxroqAO8xX3Ue
	MZbrgqySHL6V1M5G8ApMC/GS0VR6zAWv1cXvpcgoxpF+hGzirgRBy/oxIkRpEZK+p343BmgijFanG
	NIU8SnJkJwmHICijS0GxLVususVQoDPP1oBORkd0UfAzzjZgwuoKAfNA3ZSoVbq2+R75s3DWfcsFy
	2dlliAF+ysONf6ipfm3Df/sgBFQ+toX1jncLARXfY+RWY7FW1yYJFJ8L0WNB52f3cmsXzAzTKnPZV
	0idBJOaqvZYCVvp98gFEoKo2iIT9xUU+/nbqrOhwZ2/zYs4xgin185XzIleby635My3e2JMF5emZH
	lAOp7JoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgM-000000087k8-2N5U;
	Thu, 05 Nov 2026 08:18:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgH-000000087hC-3dOO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793866724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v1ehsd1h1KwjntsiObgsijntLBW7FiKbRqCPJkhAIr4=;
	b=h2oYDKFy4VokWwcZHkZm7hVsT8DlklQqDVn2BNp3a7Qf5iiM27Bos17m8OLQ1BgOSwx1Rh
	75y9cqPBzuareqoXkWq6rIGqYETVOP4h2GwyLO0iarYgORtjjgbQvAVNjBjC0GjJ8QgAEV
	dsAacHQXpv+ok6AtvN/OOzI2Kgbo1+k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-Rjfee7oeOgG1sh3dET39lQ-1; Thu, 05 Nov 2026 03:18:43 -0500
X-MC-Unique: Rjfee7oeOgG1sh3dET39lQ-1
X-Mimecast-MFC-AGG-ID: Rjfee7oeOgG1sh3dET39lQ_1793866722
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1bd21fb0fso2222945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866722; x=1794471522;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v1ehsd1h1KwjntsiObgsijntLBW7FiKbRqCPJkhAIr4=;
        b=m4mvIRwfiPgi7nsy6CRR1Amsi6G0G88DTu/ZuqXMWFyqMTaJ+pgg+w6EjUSw1kWYwu
         r/PlSlOdW/DLOAXgBGIc7dI2eDX3rrEm7VpQ3zw6aYSCa4Gh9I4Ge9GiVJYiSOQyNscb
         Uckcsr5G6i90CVv6fwGYP1gAtyumPe2vFv6T8FXsEObEuMHm2jalmVF6kKiBC4Jzr4bx
         siiaOS0Cy+kyC7qs6AAuIEJRwfxEj5q6dQCu7BRobdWrLkH7oxkdOmXCI+LD86MS4OXO
         6ZK9YYQJQhErhBdwFktfF5qEa/Y5piSgViB1j8j4QaL1TeAe0HBXiuM0ICw1xG/q5M5q
         DlIw==
X-Forwarded-Encrypted: i=1; AKwUvBw2HAJC4jmMMeJzq6xM+kw5Ij9kp+aT9AhvmJ1Cw4w5f8g9u9AcLIM5wGh+wwTv6oqIUoBIIBq6hw3/5fZ3EbIm@lists.infradead.org
X-Gm-Message-State: APuU4Z9aUX7U9edfu1fA9AjOZyzJvsT/VzxP8o3y+AE2TL1Dbkj904RZ
	JBcCSYcCmv8uaAIQfAFhHSpPqgv94yVLC2k4NItioYm/z3XiYe4QGTPOoS74ij+A/9VsSiDD8UL
	ufEdHXaQW6gS1bZAl3UmpqoG+Ke1PNtLeK/l6wL7mIQf4cvXUVnAUaUMuXEYisqNNdMWUbJ7Ncy
	F/
X-Gm-Gg: AYBFou1Iu8Kz0YFIDjBmK6WA57zpGE5xeA4V9+qmbKvOmxzAwWnHlOd2Uchv/Jsg8G+
	PPZpF+j4COgfak1oVCraS2GWkhKIGZR63LVmKmGspnH1uqbpgM7WUu1ZFBby7j/GiQhV4/izCI3
	mv/2SYkLr6tNpArYHFD0GnOznHYeKg0J/xMafVpAzZ6m/y8Cr8wwcuoTir0XGZZH8Ee2knG8ug/
	CGz7Ov+jIs23xjt0OaZw3pFBRx+tcMQZjslMqUENp3ouQnkEfjo+YdC4Rtp2n383OYVvK2prCU0
	Ylq7ZhzbSG86dVeRNb2pIwwkFjO5Wa8cGl++ueVhShVDWiK8Buut5agQogDYrqe5p8j3/rhNG7u
	gAqtEkwkVU1cAJPS5Sf+o1+K2oDGsw6UrMKmUkKrOpjMzh0KPwWaOy6dgd6zAIXMPRzkLY/FTce
	phWn3GFyJKNO9f9g==
X-Received: by 2002:a05:600c:a293:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4ac17d19a54mr262872585e9.2.1793866721855;
        Thu, 05 Nov 2026 00:18:41 -0800 (PST)
X-Received: by 2002:a05:600c:a293:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4ac17d19a54mr262872155e9.2.1793866721314;
        Thu, 05 Nov 2026 00:18:41 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm51621395e9.0.2026.11.05.00.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:18:40 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Subject: [PATCH v3 0/3] Fix NXP STM clockevent bugs causing lockups
Date: Thu, 05 Nov 2026 09:18:31 +0100
Message-Id: <20261105-nxp-stm-fixes-v3-0-8129b912e74b@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MTQrCMBCG4auUWTuSTNJUXHkPcRHbic2iPyQlV
 ErvbloQsctvhuddIHLwHOFaLBA4+eiHPg91KqBubf9i9E3eQIKMFKSwn0eMU4fOzxzRPoU0qpQ
 VGwfZjIH3Ryb3R96tj9MQ3ns+ye36LZlDKUkUSMIabTVbXepb4Ka107keOthSiX48+yOnzC+1p
 UoYpwS7P76u6wf3KnF46gAAAA==
X-Change-ID: 20261023-nxp-stm-fixes-ab0163517e6f
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793866718; l=8667;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=sPmxboU+m8zF5VduzollnuV8Jw2XtblGq9zFKb/a2vA=;
 b=K9rmtzRsFgLDxGjLsE7RpTnOrpN9U4ySH3x+8+hEsb8lyUBxLPp4emqf+Oz0Y6kRGZ66d+uRt
 KPDIQQYkwJtBqew4RP7CiE5SKoRK1YLihAZ8IRqxnXkELTIOyYBOiwu
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BgURT9xU9znbrFKbknocbf6IIWEqUaYDU2Pgvv3eots_1793866722
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001846_071762_E0ACA474 
X-CRM114-Status: GOOD (  25.34  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes three bugs in the NXP STM clocksource driver that can
cause soft lockups and missed timer events, particularly visible on
PREEMPT_RT kernels running on S32G platforms.

The NXP STM generates an interrupt only on an exact match between the
counter and the comparator registers. If the counter passes the
programmed value before the comparator takes it into account, the match
is missed and the hardware must count through all 2^32 ticks (~32.2s at
133 MHz) before firing again, causing soft lockups.

Two independent bugs made that possible:

  - The overshoot check in set_next_event() only detected a counter
    wraparound, not the counter advancing past the programmed value
    during the read/write sequence.

  - The channel-enable write at the end of set_next_event() lands after
    the overshoot check. If the counter passes the programmed value
    before the enable write takes effect, the check has already passed
    and the match is missed. No min_delta can close that window.

Patch 1 fixes max_delta: on 64-bit platforms, ULONG_MAX exceeds the
hardware's 32-bit compare register width, making it possible to program
an unreachable compare value.

Patch 2 replaces the broken overshoot check with a margin based
comparison following the pattern of hpet_clkevt_set_next_event(), and
derives the minimum programming delta from that margin.

Patch 3 keeps the compare channel armed for the whole ONESHOT operation
and manages it from the state callbacks, like the HPET driver does, so
that the comparator write is the last hardware access of the programming
path and is covered by the overshoot check.

With this in place, any delay of the programming sequence - however
long the accesses to the timer module are stalled - degrades to a
-ETIME retry by the clockevents core instead of a 32-bit wraparound
stall.

Measurement procedure for the overshoot constants
--------------------------------------------------

Both constants (STM_MIN_CYCLES and STM_MIN_PROG_DELTA) are sized from
measurements on S32G, collected with temporary instrumentation on
compare channel 1 (which the driver never touches):

  - A write-to-match sweep programs the comparator at CNT + n for
    increasing n and measures how far the counter advances between the
    ordering read and the comparator write taking effect. Targets
    within ~32 ticks are never reachable (the write needs at least
    that long to land) and the window grows beyond ~256 ticks under
    bus stress. No misses were seen at larger targets, so the landing
    window is bounded on this platform. STM_MIN_CYCLES = 512 keeps a
    factor of two on the observed tail.

  - Tracking the read/write/read round trip of set_next_event() under
    the lockup reproducer (stress-ng matrix/memthrash plus 1ns
    clock_nanosleep hammers) shows a worst case of 574 counter ticks
    (~4.3us at 133 MHz), against ~146 ticks (~1.1us) without load.

The minimum programming delta must absorb the worst case round trip and
still leave STM_MIN_CYCLES to the event when it reaches the check,
otherwise a minimum delta program fails deterministically and spins in
-ETIME retries (CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST is not selected
on arm64). 574 + 512 exceeds the HPET-derived 1.5 * STM_MIN_CYCLES =
768, so that factor does not cover this platform; use
STM_MIN_PROG_DELTA = 3 * STM_MIN_CYCLES = 1536 ticks (~11.5us), which
covers the measured worst case with headroom.

Reproducer
----------

The lockup can be reproduced on an unpatched S32G board with:

  # ./trigger_lockup &
  # stress-ng --matrix 0 --memthrash 0 & dmesg -w | grep -i "soft lockup"

Where trigger_lockup.c is:

  #define _GNU_SOURCE
  #include <stdio.h>
  #include <stdlib.h>
  #include <time.h>
  #include <pthread.h>
  #include <sched.h>
  #include <unistd.h>

  void *timer_hammer(void *arg) {
      long cpu = (long)arg;
      cpu_set_t cpuset;
      CPU_ZERO(&cpuset);
      CPU_SET(cpu, &cpuset);
      pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);

      /* Request 1 ns to force the kernel to clamp to min_delta (2 us) */
      struct timespec req = { .tv_sec = 0, .tv_nsec = 1 };

      while (1) {
          clock_nanosleep(CLOCK_MONOTONIC, 0, &req, NULL);
      }
      return NULL;
  }

  int main(void) {
      long ncpus = sysconf(_SC_NPROCESSORS_ONLN);
      pthread_t threads[ncpus];

      printf("[+] Hammering hrtimers with minimal deltas across %ld cores...\n", ncpus);
      printf("[+] Check dmesg for: 'BUG: soft lockup - CPU#... stuck for 32s!'\n");

      for (long i = 0; i < ncpus; i++) {
          pthread_create(&threads[i], NULL, timer_hammer, (void *)i);
      }

      for (long i = 0; i < ncpus; i++) {
          pthread_join(threads[i], NULL);
      }
      return 0;
  }

The soft lockup trace looks like:

  watchdog: BUG: soft lockup - CPU#1 stuck for 32s! [swapper/1:0]
  Modules linked in: nft_ct nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft
   nft_masq nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
   nf_tables veth bridge stp llc rfkill binfmt_misc nls_ascii nls_cp437 vfat
   fat ina2xx rtc_pcf85063 regmap_spi micrel phy_package aquantia crc_itu_t
   ci_hdrc_imx dwmac_s32 crct10dif_ce ci_hdrc ghash_ce sha2_ce sha256_arm64
   sha1_arm64_ce udc_core stmmac ulpi phy_generic pcs_xpcs usbmisc_imx
   phylink ptp pps_core i2c_imx fsl_edma virt_dma flexcan can_dev s32g_wdt
   watchdog sch_fq_codel drm fuse drm_panel_orientation_quirks nfnetlink
   dmi_sysfs ipv6
  CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G               X   ------  ---   6.12.0-274.el10iv.aarch64 #1 PREEMPT_RT
  Tainted: [X]=AUX
  Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.04-15.el10_4 04/01/2022
  pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : default_idle_call+0x3c/0x170
  lr : default_idle_call+0x30/0x170
  sp : ffff80008011bdd0
  x29: ffff80008011bdd0 x28: 0000000000000000 x27: 0000000000000000
  x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
  x23: 00000000000000c0 x22: ffff0008803ac840 x21: ffff0008803ac840
  x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000000
  x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
  x14: 003369266b813144 x13: 0000000000000000 x12: 00000000000002eb
  x11: 00000000000000c0 x10: 00000000000010a0 x9 : ffff800080350ff4
  x8 : ffff0008803ad940 x7 : 0000000000000000 x6 : 0000000000000000
  x5 : 0000000000000004 x4 : 000000000c1c684 x3 : 0000000000000001
  x2 : ffff0008803ac840 x1 : ffff800081712628 x0 : 0000000000000001
  Call trace:
   default_idle_call+0x3c/0x170 (P)
   cpuidle_idle_call+0x1a8/0x248
   do_idle+0xa4/0x118
   cpu_startup_entry+0x3c/0x50
   secondary_start_kernel+0x124/0x168
   __secondary_switched+0xc0/0xc8
  hrtimer: interrupt took 7246 ns

Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
Changes in v3:
- Code review and commit message editing assisted by Claude:claude-opus-4-6.
- Rework the overshoot check following review feedback on v2: replace
  the signed <= 0 comparison with a margin based check in the style of
  hpet_clkevt_set_next_event(), and derive min_delta from the margin
  (3 * STM_MIN_CYCLES) instead of increasing it to a fixed 20us.
- Add a new patch which keeps the compare channel armed during the
  whole ONESHOT operation instead of enabling it on every event: the
  trailing channel-enable write was a posted write landing after the
  overshoot check, which no min_delta could compensate for.
- Size the margin constants from measurements on S32G instead of the
  estimated timings.

Changes in v2:
- Update the code comment in nxp_stm_clockevent_starting_cpu() and the
  commit message: clarify that 20us prevents repeated -ETIME retry
  latency, removing the misleading reference to 32s wraparounds.
- Link to v1: https://lore.kernel.org/r/20261026-nxp-stm-fixes-v1-0-20a64a4ea454@redhat.com

---
Enric Balletbo i Serra (3):
      clocksource/drivers/nxp-stm: Fix max_delta overflow on 64-bit platforms
      clocksource/drivers/nxp-stm: Fix overshoot detection in set_next_event
      clocksource/drivers/nxp-stm: Arm the compare channel from the state callbacks

 drivers/clocksource/timer-nxp-stm.c | 101 +++++++++++++++++++++++-------------
 1 file changed, 65 insertions(+), 36 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261023-nxp-stm-fixes-ab0163517e6f

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>


