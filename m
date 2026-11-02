Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1AA606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vD9K4EJ0;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rs6Lpuwz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lC0H5g0YrSAcKMtHAPXy68KCAMvnOvxnNXHE3eR5o/8=; b=vD9K4EJ04m8tEWlVWu1eecdovK
	58VfxbsV12J3gk9X1NFiSP4AjofckKwiXFUljLlFLzD00JGg+WP6yXvZySAOoEXSk4yBQWAEpnrSE
	x72rk31WC4FlE6Ev2rYIMfOsGKzcHXCSeRW8F/GzzNS2vTCAhJqa3v3EqEyApdgOKm9/Jmhu31SeB
	rAez28g+v3y5u9tgT/19xmLrpMjcFGTlC+YffJnTd1Xzv7mSdGvDA7Jj2t+2MyoRBH290viu71Knw
	lvXaZt+VyKFlTM9Aa7j7w0WpIrJ7mecs2ulOxvON2u4iCA5bP2w/HxiJPKAbf5XhoKt9cgQfVeTdv
	Hq8d8eQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1gS-00000000fga-1suX;
	Mon, 02 Nov 2026 23:43:24 +0000
Received: from mail-dy1-x1348.google.com ([2607:f8b0:4864:20::1348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1gJ-00000000fdK-3Abe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:43:18 +0000
Received: by mail-dy1-x1348.google.com with SMTP id 5a478bee46e88-36a1e2485fdso8942513eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793662994; x=1794267794; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lC0H5g0YrSAcKMtHAPXy68KCAMvnOvxnNXHE3eR5o/8=;
        b=Rs6LpuwztDz3Jyy5hiX4AuMAuWNOxSoxpabLXY0Z47zyfOtxvKh9WXh3mpnci5ukHI
         2bZ5cr+NQ2i5HAxFS3utT15R2A1910EuJ9YNfy0ABOyvHwxmym2mhw1lQbcZa5dpIllO
         Bn/znBIh15sf9K4Icqxwy+5+w9j+s/Wp//lG8oIr5rUo3VQPqNV74skXWiKAONqEUa5u
         +96qA/IdIEslFXgmYEfUbtFovq+fd3adu+5+ewpEky+QFcQsILwoKvvIHJ/h3f1iDX5E
         lvwy3M1ZpFy05PnvR4cMoqiklLEiEucsvOcWOCGxMn2pYJXR9AdmvgX10Ydbxa5dOxii
         B9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662994; x=1794267794;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lC0H5g0YrSAcKMtHAPXy68KCAMvnOvxnNXHE3eR5o/8=;
        b=usCDJt1j8qrrgjIUrklp3b+LvqOUJamyhFAcDDydAiIg/I+vdzjxaBfLHV3N8eI4PD
         5a4dQ/FRm+oH9mmCEggBNg4uh4lsGz9hK7bLB57QRJu0pruXZmkaxdI1LxQoeLfR55wO
         RheIV2rUcWbEpbxYbqmxjxP5+p0LLuI2ACmoMfvYIRL8Ivm+Qp5WYMUJJ//Gr4MZwsEU
         6+U+pNYZr3MWIrYyzBhgRYVhXtW64HUM7kJKg7AgkLcTXCRryiB6AbwiTXLSK9P2Mqn4
         jjQ+Z5SPX+XpG0CE5JQadb9ppa3nyKVsXFfaRhxG86B8jS5ofOEYKnwH4c3USNqxj2dS
         YjtQ==
X-Forwarded-Encrypted: i=1; AKwUvByw4LWaPDq6kzJ1YoLpn4mCeK872Gw58JcVwsA6AAAnhBZa+LSuBTPJhx4PFhkOX5bdfk686O5p8K/qT5u69pEl@lists.infradead.org
X-Gm-Message-State: APuU4Z8hPeHLfgTKm4SDFtFAtwUDLr32F7swxhei3vGlV1HtdjZKdqp2
	cdpwgaEDmPt7N46/SEhFurvhqDlVf0kZXyfXHJRFPYk7s5GZaBfZwS9r74yLA0STT2r/pbzypBV
	ndS0eQoenkw==
X-Received: from dybhd21.prod.google.com ([2002:a05:7300:e115:b0:351:1933:2028])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:cd90:b0:34b:4b99:24ab
 with SMTP id 5a478bee46e88-36a42454b8emr26238451eec.22.1793662993373; Mon, 02
 Nov 2026 15:43:13 -0800 (PST)
Date: Mon,  2 Nov 2026 15:42:58 -0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102234301.2242242-1-irogers@google.com>
Subject: [PATCH v15 0/3] perf: Add Raspberry Pi AXI PMU driver
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dom Cobley <popcornmix@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_154315_816944_1B109046 
X-CRM114-Status: GOOD (  16.93  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Motivation & Background
=======================
Currently, Linux lacks a standard perf-API compatible driver for the
Broadcom AXI bus-watcher performance monitor blocks on Raspberry Pi
platforms (BCM2835, BCM2711, and BCM2712). Prior out-of-tree vendor
solutions relied on custom debugfs nodes and ad-hoc kthreads, preventing
integration with standard Linux perf tooling (`perf stat`, `perf list`,
etc.).

Note that this hardware block (`brcm,bcm2835-axiperf`) is distinct from
the Northstar BCM5301X AXI Trace Module (`brcm,bcm5301x-axi-pmu`,
https://lore.kernel.org/r/20261027175124.3518239-1-florian.fainelli@broadcom.com).

Key Architectural Features
==========================
1. Standard Linux Perf Integration:
   - Exposes uncore AXI interconnect events via
     `/sys/bus/event_source/devices/rpi_axi_pmu/` and documents them in
     `Documentation/admin-guide/perf/rpi-axi-pmu.rst`.
   - Supports up to 3 concurrently monitored `(bus, filter)` pairs per
     monitor (`NUM_BUS_WATCHERS_PER_MONITOR = 3`), with reference counting
     so all counter metrics on the same `(monitor, bus, filter)` share a
     single hardware watcher without multiplexing.
   - Enforces group validation (`rpi_axi_pmu__validate_group()`) to reject
     event groups requiring more than 3 watchers per monitor at
     `perf_event_open()` time, while supporting time-multiplexing across
     more than 3 ungrouped buses.
   - Masks counter deltas to each hardware register's bit width (32-bit for
     `*trans`, 28-bit for `*wait`/`*max`, and 8-bit for `rpend`) and tracks
     per-interval watermarks for level registers (`*max` and `rpend`) so
     `perf stat` and `perf stat -I` report accurate peak levels.

2. Hybrid MMIO & Firmware Mailbox Architecture:
   - System Monitor (`monitor=0`): Performs fast atomic-safe MMIO reads.
   - VideoCore VPU Monitor (`monitor=1`): Polled asynchronously in process
     context (`vpu_work`) via a single 44-word bulk Raspberry Pi firmware
     mailbox `RPI_FIRMWARE_GET_PERIPH_REG` call across all three VPU bus
     watchers. At probe time, `rpi_axi_pmu_vpu_accessible()` verifies that
     the firmware can reach the VPU monitor hardware and hides the `vpu_*`
     sysfs events if unavailable.

3. Per-SoC & Stepping Support:
   - Patch 1 adds the Device Tree binding (`brcm,bcm2835-axiperf`,
     `brcm,bcm2711-axiperf`, `brcm,bcm2712-axiperf`) and `MAINTAINERS`
     entry.
   - Patch 2 adds the driver and admin-guide documentation for BCM2835 and
     BCM2711.
   - Patch 3 adds BCM2712 (Raspberry Pi 5) C0 and D0 support, including
     runtime D0 stepping detection via the bus-watcher AXI ID mask field,
     C0 (13-port) and D0 (10-port) System bus tables, 6-bit sparse AXI
     master ID filter tables (`BCM2712_FLT_MAX = 64`), and `ratrans`.

Hardware Validation
===================
The bus tables, master ID filters, and register layouts have been validated
against Broadcom register documentation and direct hardware measurements on:
- BCM2835 (Raspberry Pi 1 B+)
- BCM2837 (Raspberry Pi 3 B+)
- BCM2711 B0 (Raspberry Pi 4 B and Raspberry Pi 400)
- BCM2712 C0 (Raspberry Pi 5 rev 1.0)
- BCM2712 D0 (Raspberry Pi 5 rev 1.2 and Raspberry Pi 500)

Example on Raspberry Pi 5 (BCM2712) counting all 11 metrics on the `arm`
bus simultaneously on a single bus watcher:

  $ sudo perf stat -a \
      -e rpi_axi_pmu/arm_atwait/ -e rpi_axi_pmu/arm_atrans/ \
      -e rpi_axi_pmu/arm_amax/   -e rpi_axi_pmu/arm_wwait/ \
      -e rpi_axi_pmu/arm_wtrans/ -e rpi_axi_pmu/arm_wmax/ \
      -e rpi_axi_pmu/arm_rwait/  -e rpi_axi_pmu/arm_rtrans/ \
      -e rpi_axi_pmu/arm_rmax/   -e rpi_axi_pmu/arm_rpend/ \
      -e rpi_axi_pmu/arm_ratrans/ \
      -- dd if=/dev/zero of=/dev/null bs=1M count=2048

   Performance counter stats for 'system wide':

           222,085      rpi_axi_pmu/arm_atwait/
        21,789,405      rpi_axi_pmu/arm_atrans/
             2,196      rpi_axi_pmu/arm_amax/
        39,623,624      rpi_axi_pmu/arm_wwait/
        43,482,567      rpi_axi_pmu/arm_wtrans/
             2,197      rpi_axi_pmu/arm_wmax/
               554      rpi_axi_pmu/arm_rwait/
            96,264      rpi_axi_pmu/arm_rtrans/
                 1      rpi_axi_pmu/arm_rmax/
                 5      rpi_axi_pmu/arm_rpend/
            48,148      rpi_axi_pmu/arm_ratrans/

       0.208600205 seconds time elapsed

And filtering `per_atrans` by `VPU_UC0` (`filter=1`) and `ARM` (`filter=11`):

  $ sudo perf stat -a \
      -e rpi_axi_pmu/per_atrans/ \
      -e rpi_axi_pmu/per_atrans,filter=1/ \
      -e rpi_axi_pmu/per_atrans,filter=11/ \
      -- sleep 1

   Performance counter stats for 'system wide':

            29,393      rpi_axi_pmu/per_atrans/
            19,934      rpi_axi_pmu/per_atrans,filter=1/
             9,452      rpi_axi_pmu/per_atrans,filter=11/

       1.001089440 seconds time elapsed

Tooling & AI Assistance
=======================
Per Documentation/process/coding-assistants.rst and
Documentation/process/generated-content.rst:
- Tools used: Google Antigravity (gemini-3.1-pro), Anthropic Claude, and
  Sashiko automated kernel patch review, alongside standard kernel tooling
  (scripts/checkpatch.pl, scripts/kernel-doc, dt-doc-validate).
- Summary of prompts and assistance:
  - Assisted in converting the downstream Raspberry Pi debugfs AXI monitor
    (drivers/perf/raspberrypi_axi_monitor.c) into a Linux perf PMU driver
    (drivers/perf/rpi_axi_pmu.c), generating the repetitive
    PMU_EVENT_ATTR_STRING sysfs event tables across SoC generations, the
    Device Tree binding schema (brcm,bcm2835-axiperf.yaml), and the
    admin-guide documentation (Documentation/admin-guide/perf/rpi-axi-pmu.rst).
  - Assisted with iterative review and fixes across revisions, including
    synchronization between atomic MMIO reads (pmu->lock) and deferred
    process-context VPU mailbox polling (vpu_mutex / vpu_work), bulk VPU
    mailbox reads, BCM2712 C0/D0 stepping detection and filter masks, and
    per-interval watermark tracking for level registers (*max and rpend).
- Portions affected:
  Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml,
  Documentation/admin-guide/perf/rpi-axi-pmu.rst, and
  drivers/perf/rpi_axi_pmu.c.
- Testing and verification:
  All generated code and tables were reviewed by the authors and tested on
  physical BCM2835, BCM2837, BCM2711 B0, BCM2712 C0, and BCM2712 D0
  hardware using perf list and perf stat (single-watcher multi-metric
  counting, perf stat -I interval watermark tracking, AXI master ID
  filtering, VPU firmware accessibility probing, and 10-bus multiplexing).

Changelog
=========
v15:
- Device Tree Bindings & MAINTAINERS (Patch 1):
  - Dropped `kernel-list@raspberrypi.com` from `maintainers:`, sorted
    `compatible:` alphabetically, and required both `reg` items (`System
    monitor registers` and `VPU monitor registers`) across all SoCs per
    Krzysztof Kozlowski.
  - Added `MAINTAINERS` entry and noted distinction from
    `brcm,bcm5301x-axi-pmu`.
- Driver & Hardware Validation Fixes (Patches 2 & 3, co-developed with Dom
  Cobley on https://github.com/raspberrypi/linux/pull/7671):
  - Added `Documentation/admin-guide/perf/rpi-axi-pmu.rst`.
  - Masked `*wait`/`*max` deltas to 28 bits (`GENMASK(27, 0)`) and `rpend`
    to 8 bits (`GENMASK(7, 0)`), and implemented per-read-interval
    watermark tracking (`counter_is_level()`) for `*max` and `rpend` with
    `prev_count` reset under `pmu->lock` in `rpi_axi_pmu_read()`.
  - Removed non-existent `ratrans` on BCM2835 and BCM2711, and corrected
    the BCM2835 VPU bus table (`0..13` matching BCM2711 plus `14 = sdram`).
  - Re-enabled the BCM2712 VPU monitor (`0x7ee00000`) via the firmware
    mailbox, added probe-time `rpi_axi_pmu_vpu_accessible()` verification,
    and hid `vpu_*` sysfs events via `.is_visible` when firmware support is
    unavailable.
  - Replaced per-event VPU mailbox reads with a single 44-word bulk read
    (`rpi_axi_pmu_vpu_read_watchers()`) with `__le32` endianness
    conversions (`cpu_to_le32()` / `le32_to_cpu()`) and `config_gen[]`
    tracking, and defaulted `hrtimer_interval_ms` to 1000 ms when the VPU
    mailbox is used.
  - Used `rpi_firmware_find_node()` to locate the firmware node.
  - Corrected BCM2712 sparse AXI master ID filter numbering
    (`BCM2712_FLT_MAX = 64`), added BCM2712 D0 runtime stepping detection
    (`pmu->axi_id_mask`), D0 System/VPU filter mask encoding, the 10-port
    D0 System bus table, and renamed `bstm_top`/`arb3`/`src` to
    `rp1`/`sdio_wifi`/`sd_dma`.

v14: https://lore.kernel.org/r/20261002175738.3242646-1-irogers@google.com
- Removed `firmware` phandle property from `brcm,bcm2835-axiperf.yaml` per
  Krzysztof Kozlowski.
- Removed `LINUX_VERSION_CODE` checks per Uwe Kleine-Koenig and Florian
  Fainelli.
- Separated BCM2835, BCM2711, and BCM2712 bus and filter tables, exposed
  all counter metrics per bus without synthetic `Bytes` scaling, and added
  bus-watcher reference counting and group validation.

v13: https://lore.kernel.org/r/20260815172712.50119-1-irogers@google.com
- Added `allOf`/`if` block in `brcm,bcm2835-axiperf.yaml` and cleaned up
  sysfs attribute definitions and comments.

v12: https://lore.kernel.org/r/20260815082048.4043217-1-irogers@google.com
- Added Device Tree binding patch (`brcm,bcm2835-axiperf.yaml`), split
  per-chip `attr_groups`, and returned `-EPROBE_DEFER` when firmware is not
  yet ready.

v11: https://lore.kernel.org/r/20260815082048.4043217-1-irogers@google.com
- Added `READ_ONCE()`/`WRITE_ONCE()` on `enabled[idx]` and restored
  `flush_work()` in `rpi_axi_pmu__exit()` so queued VPU watcher disables
  complete on module unload.

v10: https://lore.kernel.org/r/20260815082048.4043217-1-irogers@google.com
- Removed unused `num_started` state variable from `struct rpi_axi_hw_events`.

v9: https://lore.kernel.org/r/20260813064228.2799872-1-irogers@google.com
- Adjusted PMU and CPU hotplug registration order in `probe()` and
  simplified BCM2712 sysfs event visibility.

v8: https://lore.kernel.org/r/20260813064228.2799872-1-irogers@google.com
- Switched `pmu->lock` to `raw_spinlock_t` for `PREEMPT_RT` compatibility
  and reduced `RPI_AXI_PMU_TIMER_INTERVAL` from 2000 ms to 100 ms.

v7: https://lore.kernel.org/r/20260813052419.2770841-1-irogers@google.com
- Isolated all BCM2712 definitions into Patch 2 and initialized
  `vpu_disable_pending` on watcher allocation.

v6: https://lore.kernel.org/r/20260813043533.2744442-1-irogers@google.com
- Fixed `Kconfig` `RASPBERRYPI_FIRMWARE` dependency, added
  `vpu_disable_pending` for VPU watcher teardown, and let the hrtimer
  self-terminate when `active_events == 0`.

v5: https://lore.kernel.org/r/20260812230800.2646749-1-irogers@google.com
- Added `monitor_running` tracking, deferred VPU watcher disablement to
  `vpu_work`, and protected `event->hw.state` updates under `pmu->lock`.

v4: https://lore.kernel.org/r/20260812052417.2361040-1-irogers@google.com
- Avoided global monitor reset when other watchers are active and fixed
  error handling on mailbox read failures.

v3: https://lore.kernel.org/r/20260812002728.2283079-1-irogers@google.com
- Switched hrtimer to `HRTIMER_MODE_REL_SOFT`, set `.suppress_bind_attrs =
  true`, and cleaned up probe error unwinding.

v2: https://lore.kernel.org/r/20260811235112.2267241-1-irogers@google.com
- Added `of_device_get_match_data()` chip selection, CPU affinity check in
  `event_init()`, and counter wrap delta masking.

v1: https://lore.kernel.org/r/20260811083828.2057695-1-irogers@google.com
- Initial submission.

Ian Rogers (3):
  dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
  perf: Add Raspberry Pi BCM2835 AXI PMU driver
  perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support

 Documentation/admin-guide/perf/index.rst      |    1 +
 .../admin-guide/perf/rpi-axi-pmu.rst          |  164 +
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   |   50 +
 MAINTAINERS                                   |    9 +
 drivers/perf/Kconfig                          |   14 +
 drivers/perf/Makefile                         |    1 +
 drivers/perf/rpi_axi_pmu.c                    | 4145 +++++++++++++++++
 7 files changed, 4384 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/rpi-axi-pmu.rst
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
 create mode 100644 drivers/perf/rpi_axi_pmu.c

-- 
2.56.0.385.gac671c819a-goog


