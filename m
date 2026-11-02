Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7033606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cVTSTVJD;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PFFpDXIC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7/zHAAnHn2wJw4FI2Tztua6NqJ8mn1b/uKM41eMSu7E=; b=cVTSTVJDcF1jHVZVQwarRIcM0e
	3grhmIhh0gBHaDeFpkIEv1lehisM7LVSz1mGLejmSnNN4K07zJ5ziT+HDz4GywXD78kfZ03+YG0xW
	xFuX3GcuuqH7DOJYn3kHkAOC0m57sLem4wpKrKNmwGTXiu9Bc62oAroVU+K06YfBLxTzJ5iVql+Pw
	JZGgKJtYvBC285vc4MYk6kC3x12n3G1SsAhmvrAAwkigPmrG8Xzmc+GpAmivO3WQm4dkjhGz++MfM
	MZqn8fbKozxrJ2UddqdpO56HnZQ1EgrOSezHkGSzoDouN11mYIrPyESf98XZphQH/3tJEBA4PPIyd
	s+ll6bBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzQ1-00000000SDI-3ZcR;
	Mon, 02 Nov 2026 21:18:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzPw-00000000SBM-08Gq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793654290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7/zHAAnHn2wJw4FI2Tztua6NqJ8mn1b/uKM41eMSu7E=;
	b=PFFpDXIC0Cl8ZW0PI6OumfKqJeaYLSJPskVONC6tyGGzWbmSSv8wqE+7QXsaNz5a33ZvWD
	aNJ3+K7vPduclwpyWTa7MoZk5RggspfgC57UQSatUnVuBzm7RAtw+0IwsxP0dyx5nz5IHy
	vQhVuY/8ointx/MUXu0U5VSl5rhJGa4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-JIA2Z0f9M5CNFKkuDLBgxA-1; Mon, 02 Nov 2026 16:16:37 -0500
X-MC-Unique: JIA2Z0f9M5CNFKkuDLBgxA-1
X-Mimecast-MFC-AGG-ID: JIA2Z0f9M5CNFKkuDLBgxA_1793654196
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48df06cbfccso79131f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654196; x=1794258996;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7/zHAAnHn2wJw4FI2Tztua6NqJ8mn1b/uKM41eMSu7E=;
        b=ImOTdoa8kQaGFdMAZx78rGxRjctB9tzCWLuHDZd00TlI3+EBeoll6SvvBFEDNXNFBa
         3ruJ/+NVKODi0AA6oMvLNElKlspx/H1EoBFzBILhIIWKUeYKj3Sy4cfaMfU0Fdfpk0Ts
         iIJ+iyX11lUcNLsG84k6VOVcbMCzdeCECEOeodyk6C313zI6fNusB32GFJ3GrNO6+w+x
         qfAvRrVz2bjCOZzK7ed0MHSCIhTY6sechnr+aT8nr2r20qEf0H9FQBLW3y+nqx2lD/Pc
         mzp4ziuqSeXNbJ1eDM2qA0nKGFVpHyL7yLzij9WlPpA6eKCi8WOd7I9p6YGhnUC64U7u
         eUxQ==
X-Forwarded-Encrypted: i=1; AKwUvByT++6ZbxqQVgg/tZ6KJ/Xfe/Q2XR6enk8xhY5CU3DFros6ecPxZHOgZaCEuCKzwBFSc6HGAFbuuI1J8kuF+QVF@lists.infradead.org
X-Gm-Message-State: AFq9FYImVi5ztoJvcWR+kB9Ta1b9Mc69lwrVeIgdxl9YeJ3EuAMc2SUu
	ZbT3lLO7D2mrbaZ2TIaOUzVBmaVe26CXYBuynOQWjnoBt9UAzgpXaDbGTkFdbyDbmq7nTiQkcUM
	4ENoBHpQGqAfeiArjsMOzD2EMUODbaZb0DGeOFassNIzG4gxRhikU+YqK8Izh1iHMQch1ubb0qi
	wr
X-Gm-Gg: AYBFou1ht6wJYnYaLVPC57Nx3la7YF4tDXN8hOew7u3Sa6gWBRW2v995L5nsqe0U4X1
	DsulMMNtkO7OvDsYw6qvVZ18NMNTC8lE9lgTo6tA3AIbWxSZDvq7RHyvgWvAKsavsNnzo38raq5
	6CU0DoNn60MhAg8bvM5ww21DjIsOZ1zA2l6tPkoPYNx4xOazJximOJnTchJansdvqJ0a3Bfu+q4
	045R5nwDKtCu0GO6TXY8rDUGd7zPXeUWiWH+rMZL7VeWoyZdDPqOBJLos0DZHaKMqZiSrUr1qlq
	DQRwDIFutbsRDXsdHo9h3vlOfSoydhQNLSsGALfc2msm++lQtgl51qrHHRY3tAsxACl5qTXltZU
	z7347OLP3H0i8OVf6r8YLbPRrYAAgYXes7cAf2GzzPxit/r+6C73aBBZF5bkH03eOx4DahF85lP
	5G543U5MvXjw4Osw==
X-Received: by 2002:a05:600c:1c06:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4ac12194311mr313422695e9.0.1793654196430;
        Mon, 02 Nov 2026 13:16:36 -0800 (PST)
X-Received: by 2002:a05:600c:1c06:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4ac12194311mr313422205e9.0.1793654196031;
        Mon, 02 Nov 2026 13:16:36 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09cc3e9asm127877535e9.3.2026.11.02.13.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:16:35 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Subject: [PATCH v2 0/3] Fix NXP STM clockevent bugs causing lockups
Date: Mon, 02 Nov 2026 22:16:19 +0100
Message-Id: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12MQQ6DIBBFr2Jm3WkAkSZd9R7GxVTHwkI0QIiN4
 e6lJt10+f7PewdEDo4j3JsDAmcX3eorqEsDoyX/YnRTZVBCGSlUi37fMKYFZ7dzRHoKadpO3tj
 MUJ0t8HlUpR8qWxfTGt5nPsvv+iuZv1KWKFAJMpo0k+70I/BkKV3HdYGhlPIBl1SLL6sAAAA=
X-Change-ID: 20261023-nxp-stm-fixes-ab0163517e6f
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793654192; l=5554;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=gmcicsJfJh9puN//IBtAaBXqtgplRQNDdjIGjm20/xM=;
 b=+zeEZ/wMfETqYMhmzlR8m77smYNadIVe/c0BrSz54CSNpTYpH5yuWLg8cDgpUjMa2NAct50iB
 rOtIB+qBtXvA2bDG46ewrK3CJtu8L6RCxYCRJyCPgoABxZoitsh8tgG
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o-mLSQvInXsQwtcbP57TxVIhxrjPkvdZMba-59-TAY8_1793654196
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_131812_151385_7C0AF83E 
X-CRM114-Status: GOOD (  17.26  )
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

The NXP STM generates an interrupt only on exact match between the
counter and comparator registers. If the counter passes the programmed
value, the match is missed and the hardware must count through all 2^32
ticks (~32.2s at 133 MHz) before firing, causing soft lockups.

Patch 1 fixes max_delta: on 64-bit platforms, ULONG_MAX exceeds the
hardware's 32-bit compare register width, making it possible to program
an unreachable compare value.

Patch 2 fixes the overshoot detection in set_next_event: the existing
check only detected counter wraps, not the normal case where the counter
advances past the programmed value during the read-modify-write window.
Replace it with a signed comparison following the pattern used by
timer-imx-gpt.

Patch 3 increases min_delta from 2us to 20us: under bus contention on
PREEMPT_RT, 2us is not enough margin and the counter frequently
overshoots the programmed value, triggering repeated -ETIME retries.

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
  Modules linked in: nft_ct nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
   nft_masq nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
   nf_tables veth bridge stp llc rfkill binfmt_misc nls_ascii nls_cp437 vfat
   fat ina2xx rtc_pcf85063 regmap_spi micrel phy_package aquantia crc_itu_t
   ci_hdrc_imx dwmac_s32 crct10dif_ce ci_hdrc ghash_ce stmmac_platform
   sha2_ce sha256_arm64 sha1_ce udc_core stmmac ulpi phy_generic pcs_xpcs
   usbmisc_imx phylink ptp pps_core i2c_imx fsl_edma virt_dma flexcan
   can_dev s32g_wdt watchdog sch_fq_codel drm fuse drm_panel_orientation_quirks
   nfnetlink dmi_sysfs ipv6
  CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G               X   ------  ---  6.12.0-274.el10iv.aarch64 #1 PREEMPT_RT
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
  x5 : 0000000000000004 x4 : 0000000000c1c684 x3 : 0000000000000001
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
Changes in v2:
- Update the code comment in nxp_stm_clockevent_starting_cpu() and the
  commit message: clarify that 20us prevents repeated -ETIME retry
  latency, removing the misleading reference to 32s wraparounds.
- Link to v1: https://lore.kernel.org/r/20261026-nxp-stm-fixes-v1-0-20a64a4ea454@redhat.com

---
Enric Balletbo i Serra (3):
      clocksource/drivers/nxp-stm: Fix max_delta overflow on 64-bit platforms
      clocksource/drivers/nxp-stm: Fix missed comparator match in set_next_event
      clocksource/drivers/nxp-stm: Increase min_delta to 20us for PREEMPT_RT

 drivers/clocksource/timer-nxp-stm.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261023-nxp-stm-fixes-ab0163517e6f

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>


