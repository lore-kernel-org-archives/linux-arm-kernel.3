Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760FC606B11B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hrIzcRdr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PPlIwQfm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Lp4wdmDdDgGfM571C6SbLFLVEe7WjqNHUjb+fXlBiiU=; b=hrIzcRdrmx5ZfY
	waho6P6gDtoPGm97huNU9FOhySSxn3X043csLGGWx4wkyG7PNjnl3YKyW0lv8xlyapp+cvlwcNkGa
	l8LcF+0O9qf/1l0vCmZ2qwliYFPyOY2ltzzY0G0KTBD5gtzShTtss6qwpLHMhZzzDcc4HpPtYkycf
	Y9h3IotZLHgokJAwkljv/h0FgS6PGu4TsL/P/WWwtYk6oljqLoN8bk6xoP1TJ5q6jZSKsLxuKGeh0
	TGkNTHhIOBa2S1i80YQy+YoLcNVoDO9dQFwHEgaevh9EXiCFTN6r7VnMEXPG73VDEcuGK4+csk3sp
	tlV0ln4pEYBDe8lEl5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCef-00000002BFs-2C1U;
	Tue, 03 Nov 2026 11:26:17 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCec-00000002BEp-2cSh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:26:16 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1617677a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 03:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793705173; x=1794309973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lp4wdmDdDgGfM571C6SbLFLVEe7WjqNHUjb+fXlBiiU=;
        b=PPlIwQfmfujYnhyux3zQetOiGF861k6s+G8YmhyGDBIJX7WuKdliwqceaVE1rg63Wj
         HMTYLg/iYML2Umo8rbteD2IvyuLFwQgGqzNxN7E8P0lLnoubdQrip1bqU7uOyz9gsJ7l
         T+mXDEh7SAcK6rAuSp4YNwDCXdcyx9rHsEQsQRhTtGeBr4QtsYKRbHJbGSKpRdpkaTM9
         VcpsUTX+cT1QI9iyZ3kOGbCPN/k46uKUwTgvlhv56W0KmuMTTBcPf+hz8H16BRMtrgcc
         6wB1LRebJCAgR6L671lP+F/CcwkOWOM6lRmJ7K1+4uTeWIp0L6NoudT406ky7wzH8gFP
         dKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705173; x=1794309973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lp4wdmDdDgGfM571C6SbLFLVEe7WjqNHUjb+fXlBiiU=;
        b=mY5YQ1m8pIHgXnj+D5Dwkwg5LjZ1I7RKKH5Zhc+jmOjtucqlmCzlrXLYTX1ISgcFPJ
         M7NUedI+8kkQZhQuQllQNUL9ZwsqIgtnL3aV9a25KquzGdr700IG4U5FkSJ0JNBhU5xQ
         JG4rOBlhKNe55B7j3k7/1LsLiUmDrD/DGBQ/Y+IDxxb5UTW05o1ouag/PTEPxuH6mdyE
         97Od5gidLinZc3Ipir2QCMdC0AoyS0/rFPv7CSg9FSew4RpOQLN7DhOo9MlGYtTCt3eN
         ULoBkrNgyl8+ljMDZYp8xb2jPeBFsq/Ia2GC3D+GkYDs6n58C6t2o4ghrBWI9fsPq4CH
         drBw==
X-Forwarded-Encrypted: i=1; AKwUvBzpKOcv7vKUztN53spUSm6GE6iS9hVDgb7od4NbJwVx3EyHYKpn6g/oDFt0ntkQKkfKJaHH1cUgol8KS4bvhBVt@lists.infradead.org
X-Gm-Message-State: APuU4Z9yISHczllj6XQQZUoM1cmAY4ZbaLESdDLvPITzYgj/G1nW79jo
	utGTSzxDLfTu6233r+Xp6CIFgWv4yOQ1/bmEG7Ut5QhKQ9JGO1mSKz9o
X-Gm-Gg: AYBFou0ia3QF8ePtYZCjF86UatKEdZg55w7ArwmACj5GABhF0NusSZhyknguo41ScQQ
	cByEzk6qjzLfRhCsYZFWtA06F+IHm8O60wBicTMdsjz+S3ogJhdfeI/5FO0wR7dIrSYF40YxpKc
	oONOD7GDjI+KWrSGjQwTybjVvaHrow3c+nTmXU/NeIS14LwiA1J9Jh6y29YH+UnQhclrYeH0uJV
	8Gn1yz4RycoIJNHkpv+NhZ1HrbfbpC71cjMFwjiaqucIsZCuGdp+Ynneian4Pt1On25il/ir3Mm
	HnrJRQASIOZb1+mj+D54nMZUt/RkyeffXeHJxsr7nlrmejsik+YJFCa1Yhse5dQKDg42JXzGpzB
	2QT5uk1zccRsg8kkWF/itDkgi/h6VUo7+9xulR6fTbqN0Br+HqtBuiMC0bveOfN4ox0b9po0tGI
	onsOdGVk/OF4s7afHdqHjW17fV7YGG4TCyoqq62ixucJiAWjO4mMrzyLexEomvB9+kKx+5hpoG3
	UfEkbDNFFm4Y30BURchAYPd5/t119MK2nhXDwaZXQsmMFo1fQNRHtyjKRF/ZMbUJrRo2oopZzvD
	SdUgpKs5DSJINk/Etcwb
X-Received: by 2002:a17:90b:2e4f:b0:3ac:8897:7ba4 with SMTP id 98e67ed59e1d1-3ae8957454cmr10055518a91.5.1793705173332;
        Tue, 03 Nov 2026 03:26:13 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm4008443a91.10.2026.11.03.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:26:12 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	John Garry <john.garry@linux.dev>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [PATCH v2] perf vendor events arm64 AmpereOneX: Deprecate BPU_FLUSH_MEM_FAULT
Date: Tue,  3 Nov 2026 11:26:09 +0000
Message-ID: <20261103112609.3772250-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <42801873-8908-07a6-aed1-c7076c689e8e@os.amperecomputing.com>
References: <42801873-8908-07a6-aed1-c7076c689e8e@os.amperecomputing.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_032614_758662_B069D6DB 
X-CRM114-Status: GOOD (  18.41  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

AmpereOne named event 0x121 BPU_FLUSH_MEM_FAULT until
commit 10a149e4b4a9 ("perf vendor events arm64 AmpereOne: Rename
BPU_FLUSH_MEM_FAULT to GPC_FLUSH_MEM_FAULT") renamed it.  The next patch
in that series, 16438b652b46, added the AmpereOneX tables with the old
name in memory.json, so 0x121 carries two names: GPC_FLUSH_MEM_FAULT in
core-imp-def.json and BPU_FLUSH_MEM_FAULT in memory.json, and the
default perf list output shows both.  The old name has been in every
release since v6.8, so deleting it would break scripts that use it.

Mark the entry deprecated instead of deleting it, as Ian Rogers asked:
perf list then shows 0x121 once while those scripts keep working.  The
x86 tables use the same wording, and
commit eda39f98bbc5 ("perf vendor events amd: Reintroduce deprecated
Zen 5 core events") brought back deprecated AMD events for the same
reason.  The flag is only read when listing; the entry still registers
event=0x121, so perf stat -e bpu_flush_mem_fault resolves as before, and
regenerating the tables changes nothing but that flag.
perf list --deprecated still prints the name in the text output; the
JSON path does not consult the flag, so perf list -j cannot show it.
No metric expression and no other file refers to either name.

The duplicate came in because jevents checks repeated names, not event
codes, and one encoding carrying several names is legitimate, so nothing
is added for that here.  No AmpereOneX machine was available, so the
listing was not run on hardware; Ilkka Koskinen, who added both tables,
tried v1 and v2 and reports that they behave as expected, and his
Acked-by is for this variant.  The JSON edit and this changelog were
written with an LLM assistant, Hermes Agent, working from the code and
the thread; the checks above were run here.

Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
Suggested-by: Ian Rogers <irogers@google.com>
Link: https://lore.kernel.org/20261021224527.167637-1-takano32@gmail.com
Link: https://lore.kernel.org/CAP-5=fX+2eRGCHcU43sqU=gi9iKvxqyS6ipwRSnvFcap3D+QzQ@mail.gmail.com
Link: https://lore.kernel.org/42801873-8908-07a6-aed1-c7076c689e8e@os.amperecomputing.com
Acked-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: keep the entry and mark it deprecated instead of deleting it,
    as Ian Rogers suggested, and word both descriptions the way
    the x86 tables do.  Ilkka Koskinen Acked-by v1 and asked for it
    to be carried over to v2; the description wording was added on
    top of that, as said in this thread.
v1: https://lore.kernel.org/20261021224527.167637-1-takano32@gmail.com

 .../perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
index 6c06bc928415..114f95e41e0d 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
@@ -35,9 +35,10 @@
         "ArchStdEvent": "MEM_ACCESS_CHECKED_WR"
     },
     {
-        "PublicDescription": "Flushes due to memory hazards",
+        "PublicDescription": "This event is deprecated. Refer to new event GPC_FLUSH_MEM_FAULT Flushes due to memory hazards",
         "EventCode": "0x121",
         "EventName": "BPU_FLUSH_MEM_FAULT",
-        "BriefDescription": "Flushes due to memory hazards"
+        "BriefDescription": "This event is deprecated. Refer to new event GPC_FLUSH_MEM_FAULT",
+        "Deprecated": "1"
     }
 ]

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


