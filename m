Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0F8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W0tRGlGO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdXZTYDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jhKXBgg1sGJn3Jt16h2wqToqL6AFAOLSOJl/Bs/EcRQ=; b=W0tRGlGOXnyhCSJsRX21ZGkrlN
	dim1xdlKo/MIHMXirxMF3yHu8AMdJDoqEfneo5K+9cm4UiFSG4crPqszmaFIJfK51lno64vbyQIHS
	OzTtxjvWLvu3sayptrSg7gIg58osBPg0Xl9yZ0qIKHq1UQ5dHmpq8inlWKdQKIqnO0qIr/So6DSPm
	myuJ6yRET1mL3+8onm9YttiaC/+BcMS4vS6EjJdxfaZFGpsI/uiixUYrByuv9ZaTCUbvvZr7W4pN1
	6KLZEaLFW2DgayNtlV65EW01wxTgOrUjNRJ1cewAa0gTP7W5ELMqkdt4YVFwOhxEZqwPS7LZaqbp5
	CNqXOi0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOX2H-00000004q71-07Rs;
	Wed, 04 Nov 2026 09:12:01 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOX2E-00000004q6O-2NyY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 09:11:59 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso276513a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 01:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783517; x=1794388317; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhKXBgg1sGJn3Jt16h2wqToqL6AFAOLSOJl/Bs/EcRQ=;
        b=kdXZTYDN8UMHy41Dzkfu5Az5h8APujrIEAleMfpXtWN1dBdLSstzLX8oYUS1j4Jv9H
         adNZSSKleBsMf2DYJ0RqrlJyXb6TAqTxtR6s6LXikUOLRVZbtyBdokBcNiVi4Zhc4EfR
         ooZ7DLVqr9H7b0qOPmIzBc/fasiakf/7haXJNNYh2IRfIGJOQOUGu2ax7STWw0HE24tK
         6Y2a0Ruq6UqQglzeAmW65eOI1hDMDAMhFnKD5fwoTnIeI1+oOvOoGAMwETgBjdCGbs/t
         92psAkgqJMAT/jErsVq27lBdChzX3VG4MRcLxK2E024wnXOmVW9nh++BaqyDiBrBd9oa
         IWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783517; x=1794388317;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhKXBgg1sGJn3Jt16h2wqToqL6AFAOLSOJl/Bs/EcRQ=;
        b=NTwWGeGPFdF7qJYxo8bhQF+fJfqPcM4DgNT8QlLdcFr5YHOF1GxuApPe2e2Gas8JXn
         suHViQM9hQ5kmVdMO7wO0YSHFtjDq0VZWShSqRv+9mg5HOQ8eA8p0xaSPGoXSeRVZZ+R
         U1hZqVdWRaKF/S0tbLX41HqzoFy8oAtsgxdsziJNCI8OdZBNiBX03pDGPaJ/J0msnZSg
         aDLtg24k5OhQFieq2djsUyI4Oql/lQd7Z9umBNe9B/jQgFjac8IGg5Xk04DGbSZPKKem
         jfsvIBBZ7DoTn3qhJyt7y0EN0NhU7ms4kzeK66oQOWmBfQqlePwyJ6HA2W6Qn+NWQiMR
         sN9A==
X-Forwarded-Encrypted: i=1; AKwUvByP60lMumGl6QhnTS6wDz3Pge1Wk00lU3Nzi2yvuBuxmb9uwxY2MxviRNLfWwDDbMRx/ORCqiiXN/vQP3vTlDTP@lists.infradead.org
X-Gm-Message-State: APuU4Z+DEm9+XIZWAOzmrdSo3cdZLLNXWWREw3dRYhCZENROBBUzwt94
	5HuRFCV2K+bSijmBSbQJd+E7GmDheaJVAIWdGkIdnr6FOEt3YJg9K6Eeo949RQ==
X-Gm-Gg: AYBFou0py/ScnmVhtDgea0cdsfkXdITUMbNyNGLyizQvsRNKr6bGCf0mlGb+q2RBlVZ
	beTlm8rK3xpSx/mIj2jhJp9dIbW0DEHhSXzaKxGnqkwC3/H6iMplQUsyr1zisHZpMVG4DIzGPua
	HyIEi+t22xYMEglUIWYfN8NhAuAlmwTVGc82XE3Anx6CfaHDOPTHO8CvJ+IU/o0McRHE2s4IqwL
	SRvnGJzDZlS6uYHL2li01YTfaasDJz6lyDUS3DPZiLJG2xuyZTUtjKmxReRs8MnndtmCvZY+s/Q
	yRtGGgYRQAnImqdVXLoax5BbXvi/WEKzV/KJjbBzaQMe1Ah84rltQJWFtvmHpnm/lJyjQjy7In5
	sLtNEAQ0h3vP4tEymw1QhHqgQBKvdGI/SW8XQbww5i8MdM5BLWT86FucWb42YU2+58A2X882WHp
	Iu4OIxC3G3oj2ekliqQlkoquNuhm1tCbV1RpM/M5MUtCL36WsApCqpCK5w/QXx7dP1WTd4Wnc2v
	GEiLv8Q3FfzUJI5Jb4JzNBNGvmvBpqtw9DiCdHlS2p9Vqj6Lr5YtX70sYZpy8RR7JPbH1vsIO2o
	XrlU4wIqmHXctJgIa2obrhZkpGRbhRSnp7Oq6qvDmcg36cH3X+5E3Vj3T1ztLngeLuqDmYNJACt
	TATeGmVBHKRmCxfA=
X-Received: by 2002:a17:90a:e187:b0:3ac:77c8:ac29 with SMTP id 98e67ed59e1d1-3ae896f862emr12115163a91.15.1793783517097;
        Wed, 04 Nov 2026 01:11:57 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09369c638sm3167257a91.0.2026.11.04.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:11:56 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v4 0/2] iio: adc: Add Nuvoton MA35D1 EADC support
Date: Wed,  4 Nov 2026 17:11:34 +0800
Message-Id: <20261104091136.151269-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_011158_620749_B3CBB903 
X-CRM114-Status: GOOD (  20.54  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds IIO support for the Enhanced Analog-to-Digital
Converter (EADC) found on Nuvoton MA35D1 SoCs.

The EADC provides eight external analog inputs which may be used as
single-ended inputs or as four fixed differential pairs: 0-4, 1-5,
2-6 and 3-7.

The initial driver supports direct conversion and triggered buffered
capture using sample module 0. Although the hardware provides multiple
sample modules, this version of the driver uses only sample module 0
and therefore supports one active voltage channel per buffered scan.

The series is based on Linux v7.4-rc1.

Changes in v4:
- Use the common ADC diff-channels property to describe differential
  inputs and keep reg as the logical channel index.
- Restrict differential inputs to the four hardware-supported pairs.
- Restrict channel child nodes to the ADC properties supported by the
  MA35D1 EADC.
- Prevent single-channel and diff-channels from being specified
  together.
- Document that each single-ended input and differential input pair
  may be described only once.
- Remove interrupt-names and simplify the interrupt descriptions.
- Update the binding example to demonstrate separation of the logical
  channel index from the physical ADC inputs.
- Update channel parsing to match the revised binding semantics.
- Store physical ADC inputs in the IIO channel/channel2 fields and use
  address for the logical DT channel index.
- Reject duplicate physical single-ended inputs and differential input
  pairs.
- Use the physical positive input when programming the sample-module
  channel selection and the logical index for firmware-node channel
  translation.
- Use interrupt index 0 instead of looking up ADINT0 by name.
- Add the standard one-hot scan-mask validation callback.
- Use iio_for_each_active_channel() when selecting the buffered
  channel.
- Use a fixed scan structure for the single-channel buffered layout.
- Limit conversion results to the 12-bit ADC data width.
- Always report -ETIMEDOUT when a conversion times out.
- Make timeout recovery best effort so interrupt disable, control reset,
  IRQ synchronization and stale status cleanup are all attempted even
  if an earlier recovery step fails.
- Use devm_regulator_get_enable_read_voltage() for the optional
  external reference supply.
- Rework clock management to explicitly balance prepare/enable state
  across probe, suspend, resume, error paths and driver teardown.
- Improve suspend and resume error-path handling.
- Remove the redundant explicit REGCACHE_NONE setting.
- Split interrupt status read failures from interrupt-source checks and
  handle failures when clearing the interrupt status.
- Use symbolic definitions for the ADC resolution and differential
  scale width.
- Use cleanup guards for mutex handling in buffered capture and keep
  trigger notification outside the locked section.
- Use more specific error codes for channel capacity, duplicate channel
  definitions and out-of-range physical inputs.
- Apply the requested regmap, control-flow and coding-style cleanups.

Changes in v3:
- Document all four ADINT0 through ADINT3 hardware interrupt outputs and
  add interrupt-names.
- Document ADINT3 as the shared conversion and result-compare interrupt
  output.
- Remove the redundant minItems/maxItems constraints from the fixed
  interrupts items list.
- Rework the channel binding for the fixed differential pairs and use
  single-channel for single-ended inputs.
- Add #io-channel-cells so the EADC can be referenced by DT IIO
  consumers, and define the cell as the logical channel index.
- Add firmware-node channel translation so sparse or reordered channel
  child nodes are mapped by their logical channel index.
- Restrict unsupported generic ADC channel properties including bipolar,
  common-mode-channel, settling-time-us and oversampling-ratio.
- Explicitly configure INTPOS for end-of-conversion interrupt
  generation.
- Explicitly configure the ADINT0 sample-module source and clear unused
  sample-module routing.
- Reset the EADC control circuits during hardware initialization and
  clear inherited ADC interrupt enables, result-compare interrupt
  enables and sample-module trigger sources.
- Add timeout recovery using the EADC control-circuit reset, followed by
  IRQ synchronization and stale status/completion cleanup.
- Use iio_push_to_buffers_with_ts() for triggered buffered capture.
- Avoid mixing cleanup guards with goto paths in the trigger handler.
- Add ARCH_MA35 || COMPILE_TEST and HAS_IOMEM Kconfig dependencies.
- Drop redundant linux/bitops.h and linux/mod_devicetable.h includes.
- Use direct regmap helpers, explicit REGCACHE_NONE and
  regmap_assign_bits() where appropriate.
- Use fixed-width register offsets and kernel time/unit helpers.
- Use size_add() for channel array allocation.
- Request ADINT0 by interrupt name.
- Improve system suspend and resume handling.
- Address review comments from Jonathan Cameron, Rob Herring,
  Andy Shevchenko, Uwe Kleine-König and automated review/testing.

Changes in v2:
- Reworked the driver to use regmap.
- Added optional external reference supply support and IIO scale
  reporting.
- Added optional reset handling.
- Added externally triggered buffered capture.
- Added signed differential conversion handling.
- Added fixed differential-pair validation.
- Added system sleep support.
- Added optional DMA properties to the binding.

Patch 1 adds the devicetree binding.
Patch 2 adds the IIO driver.

Chi-Wen Weng (2):
  dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
  iio: adc: Add Nuvoton MA35D1 EADC driver

 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++
 drivers/iio/adc/Kconfig                       |  14 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ma35d1_eadc.c                 | 912 ++++++++++++++++++
 4 files changed, 1090 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.25.1


