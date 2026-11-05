Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C333606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RzVL5DV1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQkDk6Iq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9pCQOlyy34aTJ0Xl/cposoP8D26iQ61ySMYUpGfFOkk=; b=RzVL5DV1iFToI/Hm74JdXoFcEU
	K4dj1S6SqJBpfmin1iwdM2cMj6Y6CagLnfYIy930MqPoGHECLAHc8y/6b10vRYLQ4zoAy/7vpymOk
	GiGk5UxWQZYE22RH68h551ZG1QrbJo5la3bZO7EjrXiuero1lP50zWt5Eckfxrc0gkWrfmvntaRP5
	ZYrOwbCmjorYIvi4eR3AYYMruIqYD/BIOwjh1o8217WcAJaeVjH/1kKJN/kdVUcwASGptunQemc6Y
	jgYHRZuUMPdv7798vcLhd7VRC2WuFMynv4hjo21Nvs3+DoDKYJuE0tV4TRhf1L/AJiBhgPIyp2D3l
	j9LYngMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOy2H-00000009Cy2-1NxR;
	Thu, 05 Nov 2026 14:01:49 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOy2E-00000009Cxi-3xlY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:01:48 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b30477a320so15409297b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 06:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887303; x=1794492103; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9pCQOlyy34aTJ0Xl/cposoP8D26iQ61ySMYUpGfFOkk=;
        b=AQkDk6IqcLZvjx75b0/yCwarvTLfWFdA5tAoRPo4bSuUYu6KoJKMyDL9bJjTmzbG2P
         7I1L7QqNb3IfRCr2B5NR0z0AFXdeJJtGeQV6bKAwC4TwXOM6H4NaOMm88LXXDAFsbK0L
         ffWF1npCzYQa70ek9cTPnK/lHgcXt2wCokPtN8J/SO8y/sm09w0VvLsCtMLU0FxBOLQR
         fzx7lH6Y/eOm6ZKtuMZ52WC66qxZ8tqiEhLhAMFWle8us2c1AqO3ua/fsdSLrPPFGhCG
         uSGbLZcSRUDbQkK7auO9I6aq4gj/1Jri6bwe5amoQjJpAUbYm6dPn8oli/RW7bkzVFFy
         QL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887303; x=1794492103;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9pCQOlyy34aTJ0Xl/cposoP8D26iQ61ySMYUpGfFOkk=;
        b=A6R1PzoEnkkOue8l3Y5Nv6Mwzwloc7bQct2EmKcm0zxXGj9JULyqQCLSE45wzvoAvr
         Rf4LrPT+S3e+7tXLkXiPE0bCUGPlnbolqjbgF5uFyfy1OQJVIoTzv5cHrpMCngS/+POo
         Wuf+wWWKWeZNlTy96hRf5B1iZuXZ5lwMVvWqjqW8l+cA5IdG3F0bGD0PJL7GanWrBwiA
         Bhs+63iK+dl/jWW86rLgbE871ETHh+UHDK5KdcYXywNjWh0ckQW3YcpVB4tqSzb5qDG8
         Bar/3wcxnMKyGLh8ay/vDcOHNbx0Ut6DKPCyx9qbBzy4MIS41zrrk2lCTw5TEQxrOmrO
         0KZA==
X-Forwarded-Encrypted: i=1; AKwUvByjaqWQzWag1ECw8r1ivxTabHParqYPxR/gQT19eFsLzPE0XR2kXZQIiER+eqWadSJNgaOkyhnB3b31hz0tKKlL@lists.infradead.org
X-Gm-Message-State: APuU4Z8B1ps81eWiGZFn9KcaYJu16k0LYxHdC9kaaTO1fqktOEzVDVOK
	ZHRrO2gUezZC0dsUklaEfkKadjFkQkjzw+d7ZJELLk+DRKXgb8juI1l8
X-Gm-Gg: AYBFou1fXRZ669byEKhUgKvW0CFv1y2iQxAOu20qBYpEOdlGjyFTGbrHXmkFd6rHiuI
	PRCVK7pkKi4OaiMyHWsMSqFELPQfMMg8fA0uqib/N4f/kMsq/TG2leHuP1i0W+8DFje8QyHFkEN
	hyHJWQK+FgDXTp4ap48VV3T2aLaRfpVNm2F5bGPKKuyOVPhjMjHCIOAbIz+7rDMpaVlvBN707dY
	6Kh78Q4BnqtPKES4AlGNzstSHanTsBtYoKmNLrfmqaoOC0BlXmameHmKFq1IrXUmBohc1sifQIN
	2Sa9XwELSswZqeEMquuJc6E0Pw/5HG2zKLBfToguGZ48iDTVsG3QOZGj+l+cpW5dw66BSUb3Wkz
	kRALZC8oLTEIEhUGGfhk5y+8bBMWEKkLHjPP+VaabJza3e3sTmCeRmb0bMa9L5fQdB0cWyL3MzA
	KgRAE0uWdj/4PWlAy6D6JTxPmFkoviwzYAhUh2J1ApeNHmVgiIqT7UNKyD+ZoNDYxnfSuAYMocV
	EtUmO00ISdziHbG47HTG0fAFGkjhGyTv7XblmpWmrgQ3ACVoTyJe8oqxqAtxa9tNFPpV/kPw+4K
	yBOS2qOjps1l6PNyxY8acSLohaddLlcRJv3uAmofcwMJ4gDXP8jp+6VtPnYTX8sOUq+W5gOz8Mu
	LN0zGoiArIj6j0zheOu033e6cNKF0XkHMbSveoEtw9A+wcO+z49PdG3cbp8fS
X-Received: by 2002:a05:690c:d85:b0:8b2:e7dc:dfe8 with SMTP id 00721157ae682-8b2e7dce2c2mr67970057b3.3.1793887302163;
        Thu, 05 Nov 2026 06:01:42 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099ae415sm40127677b3.35.2026.11.05.06.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:01:40 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Date: Thu, 05 Nov 2026 09:01:31 -0500
Subject: [PATCH] coresight: fix stale and misspelled kernel-doc member
 names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-kdoc-coresight-v1-1-eb2b2ff5b677@gmail.com>
X-B4-Tracking: v=1; b=H4sIADqM7GoC/yXMTQ5AMBBA4avIrDVpG/9XEQvawZCodBCJuLti+
 S3eu4DREzJU0QUeD2JyS4CKIzBjuwwoyAaDljpTSqZits4I4zwyDeMmSlkonSS6tXkHIVo99nR
 +w7r5zXs3odneC9z3A3OnyqxyAAAA
X-Change-ID: 20261105-kdoc-coresight-90812442ad7b
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_060147_141260_A14F8FB6 
X-CRM114-Status: GOOD (  22.03  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several kernel-doc comments in the CoreSight headers have drifted from
the structures they describe, which makes scripts/kernel-doc warn.
Update them to match the code:

- coresight-cti.h: @nt_trig_con is a typo for nr_trig_con.

- coresight-etm.h: @use_cpu14 is a typo for use_cp14, and @base was
  replaced by @csa in commit a1b0e77ce517 ("coresight: etm3x: Convert
  raw base pointer to struct coresight access").

- coresight-etm4x.h: @bb_ctrl is not described, and @ss_status was
  moved out of struct etmv4_config into struct etmv4_drvdata (where it
  is already documented) in commit b5022acaee3b ("coresight: etm4x:
  exclude ss_status from drvdata->config"). For struct etmv4_drvdata,
  the comment names the wrong structure (etm4_drvdata), and @mode was
  moved to struct coresight_device in commit 9cae77cf23e3 ("coresight:
  Move mode to struct coresight_device").

- coresight-priv.h: the comment names struct cs_buffer instead of
  struct cs_buffers.

This reduces the kernel-doc warnings in these four headers from 13 to 3.

The struct etm4_save_state comment is intentionally left alone:
correcting its name makes kernel-doc parse it and report its ~37
undocumented register fields, which is better handled separately.

The warnings were found by running scripts/kernel-doc over the tree.
An AI coding assistant (Claude Opus 5.5) was used to locate the
warnings and draft this change; it was verified with scripts/kernel-doc
and checkpatch. No functional change.

Signed-off-by: Amit Patole <amit.patole@gmail.com>
---
Comment-only change. Not build-tested on arm64 (no arm64 toolchain
available); every changed line is inside a kernel-doc comment.
---
 drivers/hwtracing/coresight/coresight-cti.h   | 2 +-
 drivers/hwtracing/coresight/coresight-etm.h   | 4 ++--
 drivers/hwtracing/coresight/coresight-etm4x.h | 6 +++---
 drivers/hwtracing/coresight/coresight-priv.h  | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index c5f9e79fabc6..a11a8a4f022f 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -97,7 +97,7 @@ struct cti_trig_con {
 /**
  * struct cti_device - description of CTI device properties.
  *
- * @nt_trig_con: Number of external devices connected to this device.
+ * @nr_trig_con: Number of external devices connected to this device.
  * @ctm_id: which CTM this device is connected to (by default it is
  *          assumed there is a single CTM per SoC, ID 0).
  * @trig_cons: list of connections to this device.
diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index cf65d89a8e98..9cd1b9aef5bb 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -231,14 +231,14 @@ struct etm_config {
 
 /**
  * struct etm_drvdata - specifics associated to an ETM component
- * @base:	memory mapped base address for this component.
+ * @csa:	CoreSight access descriptor for this component's registers.
  * @atclk:	optional clock for the core parts of the ETM.
  * @csdev:	component vitals needed by the framework.
  * @spinlock:	only one at a time pls.
  * @cpu:	the cpu this component is affined to.
  * @arch:	ETM/PTM version number.
  * @caps:	ETM capabilities.
- * @use_cpu14:	true if management registers need to be accessed via CP14.
+ * @use_cp14:	true if management registers need to be accessed via CP14.
  * @sticky_enable: true if ETM base configuration has been done.
  * @boot_enable:true if we should start tracing at boot time.
  * @os_unlock:	true if access to management registers is allowed.
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 5417280cdb27..0787825227fd 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -923,6 +923,8 @@ struct etmv4_caps {
  * @syncfreq:	Controls how often trace synchronization requests occur.
  *		the TRCCCCTLR register.
  * @ccctlr:	Sets the threshold value for cycle counting.
+ * @bb_ctrl:	Controls which regions in the memory map are enabled to
+ *		use branch broadcasting.
  * @vinst_ctrl:	Controls instruction trace filtering.
  * @viiectlr:	Set or read, the address range comparators.
  * @vissctlr:	Set, or read, the single address comparators that control the
@@ -941,7 +943,6 @@ struct etmv4_caps {
  * @res_ctrl:	Controls the selection of the resources in the trace unit.
  * @ss_idx:	Single-shot index selector.
  * @ss_ctrl:	Controls the corresponding single-shot comparator resource.
- * @ss_status:	The status of the corresponding single-shot comparator.
  * @ss_pe_cmp:	Selects the PE comparator inputs for Single-shot control.
  * @addr_idx:	Address comparator index selector.
  * @addr_val:	Value for address comparator.
@@ -1051,13 +1052,12 @@ struct etmv4_save_state {
 };
 
 /**
- * struct etm4_drvdata - specifics associated to an ETM component
+ * struct etmv4_drvdata - specifics associated to an ETM component
  * @pclk:       APB clock if present, otherwise NULL
  * @atclk:      Optional clock for the core parts of the ETMv4.
  * @base:       Memory mapped base address for this component.
  * @csdev:      Component vitals needed by the framework.
  * @spinlock:   Only one at a time pls.
- * @mode:	This tracer's mode, i.e sysFS, Perf or disabled.
  * @cpu:        The cpu this component is affined to.
  * @arch:       ETM architecture version.
  * @caps:	ETM capabilities.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..d55929aedb32 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -91,7 +91,7 @@ enum etm_addr_type {
 };
 
 /**
- * struct cs_buffer - keep track of a recording session' specifics
+ * struct cs_buffers - keep track of a recording session' specifics
  * @cur:	index of the current buffer
  * @nr_pages:	max number of pages granted to us
  * @pid:	PID this cs_buffer belongs to

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-kdoc-coresight-90812442ad7b

Best regards,
--  
Amit Patole <amit.patole@gmail.com>


