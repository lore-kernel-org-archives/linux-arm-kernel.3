Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4890C606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qNNZHnZ5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFhPcH9T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AVQv90cVLZ+qJuF4mQ4kF8CxT7gJb59j0c9vMsRIsuI=; b=qNNZHnZ5qkYcHrUVec33ai4w3m
	PXGZTsFY0rAXmYCZH4EQqTL/IcWIxTsA1v3WBQqLMCTfBQwtu3039Ib3h84GpEy93IlIcT5vQ7M/N
	9THqUcRJJCXJVYHQvwu6PCdhHhJtknNd/6Wgp6TWQgFBwalkUnXNoc6KuFc3rs6wfbgF3j2aDcn0N
	1bXhxWwG3WaKjYL03w0d3BH4GKYn0lESxiOUnv2R/598gk+nCL0T30jGk0Rnw6QOfzdSExunis0Ye
	pPNNf8nHeZ6o681GS/+HKU2DYzoVdcZ0k29nurokwhyE81YeAmYICJKSjpUYwpwPoFfwWISlyTfvW
	qbSnV/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMd5N-0000000AiXs-1YVK;
	Fri, 30 Oct 2026 03:15:21 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMd5J-0000000AiXR-2YRH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 03:15:19 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so142424a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 20:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330116; x=1793934916; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVQv90cVLZ+qJuF4mQ4kF8CxT7gJb59j0c9vMsRIsuI=;
        b=GFhPcH9T4nR5pQnhodwjN4oNLoXBsKhUnUb3Xt0ohA77CE1Nq3gf7OXM6afuE1kN3D
         1uXVPfurg6eekhlnkwCsm63oOaEiCUe9EV+VmdlPO9vo/43VY8KqGq+/lCcmeDd0xeMR
         v6QMd6CHFHwrLy/IyfhSCaUNjDOryvtcLO1Oc5hHZJngx308TGOGl9sGRGB4J+6TBFlr
         U5BonryIDqAc85ccl2FwDNVqt+Fh4mRVGaqZuC/jitiBMYbY8hX2okpxZU4DBLPCQXyG
         agJgK0zdvrDfuc49V+3X3XoO3vV/jFCm7TtfBCsjzmeD3sbJlZ9loype5z48DXeX6Puh
         QUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330116; x=1793934916;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AVQv90cVLZ+qJuF4mQ4kF8CxT7gJb59j0c9vMsRIsuI=;
        b=BISZGO3iR9P0W4UeAjZu620uv5I3brt9nURpo5WuIxlzFBi8m5RSNIF/o9RKzV9Fvy
         f6L+vPeW8ahKcTe9wz4YglSrqTzLiUWw1d9lO+vaAyqB5eQET8BEBhOffO16I1OpLKSR
         2IimaO6/tvdqTLR66r5FPy5xw2Dz0YTUYUBKvpVkI0SKtgXFtvNjjO3R3gQ01coD9FuC
         lYVJ/haLduMAdrq9AtEjsg4Q8sN+E+5YfPggnnoNl4oJe5EP/vsUpLMe/OUvqDruleOR
         U5+VkJAUcxr4ngRUJTaN5fcut4S0+rKQD2FQxhl053dJuRfVTryBGuu5d2IeTycRjtNM
         V+ew==
X-Forwarded-Encrypted: i=1; AKwUvBwst1ZMgMNC96ci05mfyqbZHLCXDXyZbuY21Ku7RU85w9iVsEwkV7dW/l9EC7OFwNltrqzRGvAJWS5AilRD69MR@lists.infradead.org
X-Gm-Message-State: AFq9FYID1j+czSAblWWhrMbyD5otRtPr4IxJB3byEWEWlrUcdbgkVmKw
	bUfFREwLFJc3BjG5vftSFA7d9bQXqVbvrIL4d6dqQ6JKgHpNApjtbqdK
X-Gm-Gg: AYBFou15ggza08XxHwKwgkmRN9dpS9E6xm2100d2pU8s7vcIqyQTEfDwJrn0R4YdHAT
	eJbmvreTDYJ0R9NjdT2IbRnGi0duaNoR6QWsZfScvJ0mO1w53dTD7GpQISBMKa1/29nL/17W+x4
	A7IzW362gk7jloDN/WttcseYwriQc/NQ53godqIUNe3xM0H+PJTVClhXepBcU3iQb5oMiiKAs2a
	euimN+sv7E3CBaEnqAMtjgxpL7STC/9BYBQGSONV580bd6rgrjetbgYwsbdM9770qXFgFSqNS+4
	jyQhBg0cF1GdNFG7TXnGR23s7fzjJYkqkso/Oiu2rgWhyu9Niz3ieXRHDksBZuSD4ubwo3ENagk
	cynwKpo8x38iqm57tibkOal5pA7Eiv04WdbVurvhqX45OjYUQSLKySuwb0ezsMYRTIEavByHhx4
	oDCWqzJ3IfJNN+9BUzeF9idC6IBB2ydEHQ1Q9SSYjko1BFnH2GgEG/uGt1DCZ21vLxJI+jjOtxz
	bO96XZDpr9L6cRMy3kBNT13PZtJ9JW8+EOCSMfC1/9K8IdYtCLuYI15BDP2G3hueOg4eRN9Ko2B
	ZnVCI3AVjRD2r1k8IKB9VS4UGaNrCaUF3MBXsfJ8rS7PD/VBOPmpQazzerqmOIM8Ht/Nz6V1U4o
	6DWkAdJo4XG/dlLk=
X-Received: by 2002:a17:90b:1845:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3ae8974d028mr473136a91.24.1793330115599;
        Thu, 29 Oct 2026 20:15:15 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm6590630a91.0.2026.10.29.20.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:15:15 -0700 (PDT)
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
Subject: [PATCH v3 0/2] iio: adc: Add Nuvoton MA35D1 EADC support
Date: Fri, 30 Oct 2026 11:14:59 +0800
Message-Id: <20261030031501.130290-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_201517_716595_95E80DFA 
X-CRM114-Status: GOOD (  15.68  )
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

Add devicetree binding and IIO driver support for the Enhanced
Analog-to-Digital Converter (EADC) found on Nuvoton MA35D1 SoCs.

The MA35D1 EADC is a 12-bit ADC controller with eight external analog
inputs. It supports single-ended conversion and four fixed differential
input pairs: 0-4, 1-5, 2-6 and 3-7.

The controller provides four interrupt outputs, ADINT0 through ADINT3.
ADINT0 through ADINT2 are associated with the corresponding conversion
interrupt flags. ADINT3 is shared by the ADIF3 conversion interrupt and
the ADCMPF0 through ADCMPF3 result-compare interrupt sources.

The initial driver uses sample module 0 and ADINT0 for conversion
completion. It supports direct reads and externally triggered buffered
capture. The driver supports an optional external reference supply and
uses the internal 1.6 V reference when no external reference is
provided.

The binding describes the optional DMA request and all four hardware
interrupt outputs, including the result-compare sources sharing ADINT3.
The initial driver does not use DMA or result-compare functionality.

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

 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 175 ++++
 drivers/iio/adc/Kconfig                       |  14 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ma35d1_eadc.c                 | 849 ++++++++++++++++++
 4 files changed, 1039 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.25.1


