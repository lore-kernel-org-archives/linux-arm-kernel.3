Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9D4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 23:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MJ6XcQrf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xiEZXLks
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=; b=MJ6XcQrfWVLNEBOl1WmuBEYOLj
	iIy4MSYJwVM6A2rPFpXv6VfUAxq8xGPCxfE9pLIhxxcDvGGWgFgHzPlWMJhzgJdXAWoOWxPZJ+2Mh
	qbuGYFmkxvSaMnRm4UGKDQiuvHr4ziWCxQOLCNxVCs5MhY3xggRUfWbgUFb5WA/dxeVW+c4LoHzIb
	gBZec9tOZU/PXJU7q9zaN1IRuLZpO4wFU2fy3I1BIeRxaCy9NZ2STsaaoY45rM1THfxx420q6PS0M
	2GHiQKhvX+y8Ul33/OEs6b2tz/mcu0KBrO1CPjRyRlUfL3gqexC9SU6id2CLRXqdqZLnKN1lv6r6g
	AmMag3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZJm-0000000AWma-0532;
	Thu, 29 Oct 2026 23:13:58 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZJi-0000000AWm3-1bCj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 23:13:56 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so275275eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315632; x=1793920432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
        b=xiEZXLksFAAk7C+P42W2YwbGL5VTtNGiokaTHICazXwBxLGbZk7z7XRV+SLZgKFAbo
         gw64/dvfz7+irmIYgywrz7pUVoq43Euss8PjYa7EgupS28NQb8UaPcX40LRZCxW5GICt
         Vnm6OEE4AdDTa7UaRdRpi3fU1SSiHtL3NiIMgBOT8KuoOLI9PF53+UCj93JbpEWcS5Sw
         N+tHoBx5QzwZuPvRsgY+2+WzSoCirz5x1fU1a+FY3b25Kpm5ajAjfFxAm1U/tFmcZ8yA
         nlYfnE4sLVPdPCtRn3qA0L2RWn29loLHQifMDKbmbPqQCTagZyK140QGVg3OPz34FJRK
         Q3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315632; x=1793920432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
        b=vld20lHvNf36ma65xMSSFGfPGORKgw0QU6JX+9lgDY8/1U5ItpCtKHlOYkF3zq2LD+
         fqPwMkiasPGh4VD1ySpRFxqXKSNVwnRDFQQ16JhcVzQ6/A9a6ny/l/pQdp5N13Dd2lDV
         OkTcoGC6wzshfEWkOhg5vDeDcWLAB98g+CV2fQ2doZqZqNPAZ7znabwSdTZCvmONeOwQ
         t31CFnTE+scuUI+qz9n2A9+NyMoN62jKJ+QLJRIHNMnDbN98hEyrELkOXbCnBDZXEV3w
         RMNxoVAq3MLoUpl7CGI0Ul7lxR9G+OEJik6kBwt5NZiVXd7guCqUg5pYDIuwGre9WoHE
         EaAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnY8HDUQIHvZFpQONlsuQp/T4UXDUWZV6tfgKlZ5rDbhBShnyfE4uuWgMwSO2wU2jU/eoh8BCKNu8yw27ZLit5@lists.infradead.org
X-Gm-Message-State: AFq9FYKu+00lWGWowZSL8fp0kpo3hXtnFVKmR/OfGIgIT2Qoev6gRiQ/
	5TLsHKdzytIaZjfWZ+lK0NgnfJIqWEsTp88m2RPZU2b4TtcBEiiyX+Fj
X-Gm-Gg: AYBFou1pzOLUlz/qPdN2xntQ+HyRRAJZWWv1hpwRp1CFNnaSJx4q+xIXIYTPNojMaGd
	Cj5Ru7DFkgoAGoRUhXSMESJ5nsSqm8uKB2OXN0pT+wU4w6lz7ONdKYVEEP2S5TZeO5HiMAHF8Sb
	/cdRHR6dkMTi0IsGC689krfpXPw9PEqKjHNPwDmjSCICmT3YY4TMbbuz3dP4PuUSf/0p1fUKw+F
	Eg9FY35v1qlyOB6cJtaUhKIqjifYU3zgsOHfy2yX88m1kzdKUlQ3a4GLhEG4bg6Ce0gDFxXog9E
	YLAAbu3RSf3AWd650JedInbiDPcTKv7lsW85cF/lKOlV0igJgUFqNgXj1LU8hScQbd+zGDdq9pn
	6qKGPtB5QeqdoQ8FBbK24B/rAaU773nXz/NFeK4eLOiS/VCTXI5Z5lkKWAusZMGqzG9rUpeVWnj
	1AizhFyl9eafdO9bgRZ9UCYuv0f/k5lnS9XflcTzrLxASRSGlLfgTcUBq+2aptKqG8csxOIndwm
	Vkwh1oLGxmoYCQy/6Fqb4/QbdbVLSo6TFtTibcEaYmVpaTE1Ffg4U0jGGr3gHCJ1UjWvInqdGpd
	5CDkTml85gquO+eGDDYxYjP+QGOag80Ucn6slSp5WfUG
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr1174873eec.38.1793315631951;
        Thu, 29 Oct 2026 16:13:51 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm1662742eec.7.2026.10.29.16.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:13:51 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v10 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Fri, 30 Oct 2026 04:43:37 +0530
Message-ID: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_161354_623399_67354336 
X-CRM114-Status: GOOD (  15.60  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the board compatible and device tree for the ASRock Rack B650D4U
AST2600 BMC. The DTS describes memory, SPI NOR, UART5, GFX memory,
GPIO names, the I2C7 EEPROM/NVMEM MAC provider, MAC0/MDIO, and both
ADC engines with an ordered IIO-to-hwmon bridge.

This revision corrects regressions in v9's compatible ordering and
binding acknowledgement, restores the revision history, and addresses
the UART alias and DTS-style feedback. No new hardware is added.

Changes in v10:
- Restore the binding Acked-by from Krzysztof's earlier review [R1].
- Place asrock,b650d4u-bmc after the aspeed entries, as in v7/v8.
- Drop the serial0 override and use the inherited serial4/UART5 alias
  for stdout. Bootloader console arguments and getty must use ttyS4.
- Consolidate the root node and order peripheral references and ADC
  properties according to the strict DTS-style check.
- Restore the earlier history and discussion links below.

Changes in v9 [9]:
- Enable ADC0 and ADC1 with 2.5-V internal references and pin groups.
- Add the sixteen-channel IIO-to-hwmon bridge.
- Rebase onto the Aspeed ARM DT maintainer branch and normalize GPIO
  comma spacing. This revision inadvertently lost the binding Acked-by
  and regressed compatible ordering; both are corrected in v10.

Changes in v8 [8]:
- Correct the validation report to multi_v7_defconfig with ARCH_ASPEED
  and MACH_ASPEED_G6 enabled; retain the DTS and scoped review trailer.

Changes in v7 [7]:
- Correct GPIOP reset/power/NMI button/control names and remove the
  obsolete F5 reset name; leave the binding unchanged.
- Subsequent review requested the validation correction and carrying
  Andrew's review tag forward [R4].

v6:
- Prepared locally only; no public submission. The sent version number
  moved from v5 to v7.

Changes in v5 [5]:
- Add I2C7 EEPROM/NVMEM for MAC0 and select rgmii-id.
- Use the standard OpenBMC 64-MiB flash layout.
- Add initial GPIO names and the reusable 16-MiB graphics pool.
- Drop the previous RX-delay-only justification.
- Follow-up review requested GPIO mapping/style and threading fixes
  [R2, R3]. Andrew's Reviewed-by applies only to MAC0/MDIO.

Changes in v4 [4]:
- Correct memory size to 512 MiB and add explicit flash partitions.
- Report RGMII traffic tests and select rgmii-rxid; that delay rationale
  was challenged and superseded by the rgmii-id selection in v5.
- Order peripheral nodes alphabetically by label.

Earlier public submissions:
- v3 [3]: board-compatible/DTS series. Krzysztof supplied the binding
  Acked-by and requested preservation of review tags [R1].
- v2 [2]: early board DTS, including UART5 via serial4. Its complete
  per-version changelog was not recovered; the archived patch is linked
  rather than inferring an unsupported change list.
- Initial submission [1]: board binding/DTS, with QEMU console and
  board-identification testing reported in the cover.

Review tags:
The binding carries Krzysztof's original Acked-by address. Andrew's
Reviewed-by remains explicitly restricted to MAC0 and MDIO nodes;
no complete-board review is claimed.

Validation:
- Compiled and schema-checked the v10 board DTB with multi_v7_defconfig,
  CONFIG_ARCH_ASPEED=y and CONFIG_MACH_ASPEED_G6=y, using
  arm-linux-gnueabi-gcc and dtschema 2026.9.
- dt_binding_check for arm/aspeed/aspeed.yaml completed without
  diagnostics in the reported output.
- CHECK_DTBS=y reported no board-specific errors. Two unmatched-schema
  diagnostics remain for inherited aspeed,ast2600-lhc and
  aspeed,ast2600-i3c-global nodes.
- Strict dt-check-style and whitespace checks passed. Checkpatch reports
  no errors and one MAINTAINERS reminder for the new board file, covered
  by the existing Aspeed directory entry.

These are DTB/binding checks, not a complete kernel build or boot test.

Both ADC engines, twelve configured voltage rails and recovery after BMC
restart were tested in a custom Linux 6.18.24 OpenBMC image with the same
ADC settings. That image has separate power-control changes, a different
flash layout and ttyS0 console configuration. The complete upstream DTS,
including v10's ttyS4 console selection, has not been boot-tested.
Voltage scaling is userspace configuration outside this series.

Base: 8db593481c8669eddb8b4e21ea44f3fa11d9f030, aspeed/arm/dt
https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git

Previous submissions and review discussions:
[1] https://lore.kernel.org/all/20260512175019.47548-1-prasanth.padarthi10@gmail.com/
[2] https://lists.infradead.org/pipermail/linux-arm-kernel/2026-May/1129461.html
[3] https://lore.kernel.org/all/20260518033440.17569-1-prasanth.padarthi10@gmail.com/
[4] https://lore.kernel.org/all/20260830182036.284736-1-prasanth.padarthi10@gmail.com/
[5] https://lore.kernel.org/all/20260915013110.4780-1-prasanth.padarthi10@gmail.com/
[7] https://lore.kernel.org/all/cover.1790079398.git.prasanth.padarthi10@gmail.com/
[8] https://lore.kernel.org/all/20261002062933.26497-1-prasanth.padarthi10@gmail.com/
[9] https://lore.kernel.org/all/20261027034911.99482-1-prasanth.padarthi10@gmail.com/
[R1] https://lore.kernel.org/all/20260518-rustling-watchful-viper-b9c4b4@quoll/
[R2] https://lkml.iu.edu/2609.2/00630.html
[R3] https://lkml.iu.edu/2609.2/00642.html
[R4] https://lists.openwall.net/linux-kernel/2026/09/22/1982

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 169 ++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts


base-commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030
-- 
2.47.3


