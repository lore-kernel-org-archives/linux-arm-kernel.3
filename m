Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF9EEE6428
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NK8HAsEbzuMAmJWJWMfro3WvF+de9PMAbtRd5ci+vDw=; b=5D6yrqikM/RPeen512j+uvcW9F
	tGirqWijwxNhWnqqV8kOpiHwyKN7yyp9ChxouzccGusY+oX6usQT7wuEfhb7IE1cPm4le4gnIqhTN
	wie1XI1CdnW0aAW6heLM1osuOnS7wjqYYlU8tMNZNGfvyDvQVbnu0Uy7NRLlohCMB+YSGuiLLRQzp
	yKS7CevHADyasetjFt+H1B1Fq8bxZ1tA+aUdCNpjF4bowW8TxZU5qT6xMfV4QxkYh3C9oLdOKFMwR
	J3vt91hVzholk+B+CytC+XiF8XdTbApXzFOM4r08cLldzzVurk1KqbHztgwPTrwylVcudW04bAhtr
	O0F40T+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav4t-00000005x4c-2Dr6;
	Wed, 31 Dec 2025 12:13:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav4q-00000005x46-3ye4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:13:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso102126965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 04:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767183198; x=1767787998; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NK8HAsEbzuMAmJWJWMfro3WvF+de9PMAbtRd5ci+vDw=;
        b=cXAwGWZxbW7WiYgnhkGflQtK7DdRX0frzYnHEhNm1IVXsG0tH/aKfjo/hLbORpc6IT
         W1rNUCXeKeNVc5t4OGcKB8S3huOsEgQpZqZ6XJMUQigSAuN3HgPtZQBEZgAjYwyADAOr
         3/48gmsAx+YEcroIaNh+lG0YSQrkUVqlqA5Sjkty6WzLiu1B+tcaLLykcLZFphXkjr3j
         +GarpK22saHoEPyso01mqgbQdbTZfYr4RlQ60QPR2IK22ceC/1Fo/wB12aYPFiGGq5ys
         uz4qbLxPOrnJixCTnTLtai8KYHXo65yY4qntXeYe4qmHOp1hveWdYJfUBIdROtasmS7X
         LpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183198; x=1767787998;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK8HAsEbzuMAmJWJWMfro3WvF+de9PMAbtRd5ci+vDw=;
        b=vg5MlUkdHqgmHD1R37twugLf8G5ev/SylN7ux3Rf427waLCp2g23yZpA50Cb92ACcb
         XTOLaUDOE6LwYxrevaQ0+vYO9980uWBczRLolRN0jSGAnETYLbXnHgB7+dXXx0jsrQI3
         YojHDx8EMwWdU11VACLBG1uoGHVRY/vjTDqkA/KWakT83q32YOGvbxyhqgiPg0vlckAY
         l4GmbEYZO9c009GI9tLhONY6Ls4n3OF2GSChZTcxW9+8Dj0qONSr7JXbdjjcpB1P3tWj
         X0LNTzG8Oqxp2FctFColslLqDQGX441aiUuopKjpEQoanS891DVJ7Cu97FJMXuJxTgzr
         DJPw==
X-Forwarded-Encrypted: i=1; AJvYcCX9j+lJW5C6WMTwranpddYP+QwgCMlmTy1AWSPtnF/7Iu8owVpWACwqkBuDr8TQ4F3L2RAdXQJXfkBzu5gqwPRY@lists.infradead.org
X-Gm-Message-State: AOJu0YwDVm+KQAGzaqdZAhJhZZMuBHukqDzntNBqdwD6AHqrl6ln72Yy
	20Tf5YVpDGwg//rEJnhdtPTsvLZ6qDc8yqVRr7L4Wvxkh8lxPikxYQLO6m4gdz2e8jw=
X-Gm-Gg: AY/fxX4E4AT87K4oBvB1c0BgGTqD0IXs96LQqEFDebYBkx6ICaWSSWCP7FjJPuT9KJK
	WT4xCRPGVxb2NZgd4vVYNw9a8WfCiNPzOpcs/OZWN2aHKspLVyo0lBYFmnKRqdRaIMfTVhu3y5J
	HAag5FUtT5CyIj8BYv38nOP7qMHtqEniWWh3C0/osLzonRZLOFSF0mn4gg3lRa9JIbCVhtzJM1i
	KLUKPMIIpQENWNPKGMNTjrR6rN17Rl23fck2NBKEOmfQ7g1Rmn85qFRofwlfUKL9vWNvXVkH1/e
	z9Efj/hq9iHR2S+rTxGolcMUrXepfIW3r8fTlqOPvswf2j77uqBWfdr0Z4en6KOka5G8H1ijLuf
	QM3Z7Tv5PUql/TSUs4LPLNMAiqh/O+G6aJCU8PUthjelnstjDELEZuyFGIbOj3oZ89obf99p35M
	sDmm4pFF+K3y7wDD7Qd6qC
X-Google-Smtp-Source: AGHT+IGLQlOVOkiDjec3oBGg4+Ay31+MFr1T1oasXTpgdA5gcl1YGVgHyCirJ2aVhoFz1PXleO1q3g==
X-Received: by 2002:a5d:5f87:0:b0:431:327:5dd4 with SMTP id ffacd0b85a97d-4324e50db43mr41813742f8f.46.1767183198565;
        Wed, 31 Dec 2025 04:13:18 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b0efefsm40904221f8f.25.2025.12.31.04.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:13:18 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 31 Dec 2025 12:12:28 +0000
Subject: [PATCH] perf vendor events arm64: Remove uncountable events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-james-perf-uncountable-events-v1-1-f2d9932999fd@linaro.org>
X-B4-Tracking: v=1; b=H4sIACsTVWkC/x3MQQqDMBAF0KvIrB3QhNLWq4iLRH/aKe0oGZWCe
 PeGLt/mHWTIAqOuOihjF5NZC9q6ovEZ9AGWqZhc4y6t8w2/wgfGC3LiTcd50zXENxg7dDV2tzC
 lePfx6hOVY8lI8v3//XCeP4R9qiNvAAAA
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>, 
 Yoshihiro Furudera <fj5100bi@fujitsu.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_041321_036324_865F11CE 
X-CRM114-Status: GOOD (  16.08  )
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

These events are never countable by the PMU and are only intended to
be used as external inputs to trace. Therefore showing them in 'perf
list' is misleading so remove them.

The generator script doesn't emit these events when used with the new
telemetry-solution input files [1].

'perf list' should only show countable events because there are events
that are sometimes implemented, sometimes countable and sometimes not,
for example TRB_TRIG. If we always include any implemented events
whether they are countable or not then it's not possible to tell whether
they are usable in perf without going to the docs, defeating the point
of 'perf list'.

It's also not useful yet to display implemented events that are not
countable (for help in using trace rather than perf stat), because
PMU_OVFS and PMU_HOVFS are practically always implemented and TRB_TRIG
is always implemented when there is TRBE.

[1]: https://gitlab.arm.com/telemetry-solution/telemetry-solution/-/tree/main/data/pmu/cpu

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json  |  8 --------
 tools/perf/pmu-events/arch/arm64/common-and-microarch.json | 12 ------------
 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json   | 10 ----------
 3 files changed, 30 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json b/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
deleted file mode 100644
index d8b7b9f9e5fa..000000000000
--- a/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
+++ /dev/null
@@ -1,8 +0,0 @@
-[
-    {
-        "ArchStdEvent": "PMU_OVFS"
-    },
-    {
-        "ArchStdEvent": "PMU_HOVFS"
-    }
-]
diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
index 2416d9f8a83d..468cb085d879 100644
--- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
+++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
@@ -432,24 +432,12 @@
         "EventName": "TRB_WRAP",
         "BriefDescription": "Trace buffer current write pointer wrapped"
     },
-    {
-        "PublicDescription": "PMU overflow, counters accessible to EL1 and EL0",
-        "EventCode": "0x400D",
-        "EventName": "PMU_OVFS",
-        "BriefDescription": "PMU overflow, counters accessible to EL1 and EL0"
-    },
     {
         "PublicDescription": "Trace buffer Trigger Event",
         "EventCode": "0x400E",
         "EventName": "TRB_TRIG",
         "BriefDescription": "Trace buffer Trigger Event"
     },
-    {
-        "PublicDescription": "PMU overflow, counters reserved for use by EL2",
-        "EventCode": "0x400F",
-        "EventName": "PMU_HOVFS",
-        "BriefDescription": "PMU overflow, counters reserved for use by EL2"
-    },
     {
         "PublicDescription": "PE Trace Unit external output 0",
         "EventCode": "0x4010",
diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json
deleted file mode 100644
index 65bd6cdd0dd5..000000000000
--- a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json
+++ /dev/null
@@ -1,10 +0,0 @@
-[
-    {
-        "ArchStdEvent": "PMU_OVFS",
-        "BriefDescription": "This event counts the event generated each time one of the condition occurs described in Arm Architecture Reference Manual for A-profile architecture. This event is only for output to the trace unit."
-    },
-    {
-        "ArchStdEvent": "PMU_HOVFS",
-        "BriefDescription": "This event counts the event generated each time an event is counted by an event counter <n> and all of the condition occur described in Arm Architecture Reference Manual for A-profile architecture. This event is only for output to the trace unit."
-    }
-]

---
base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
change-id: 20251230-james-perf-uncountable-events-28adfb93b73f

Best regards,
-- 
James Clark <james.clark@linaro.org>


