Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6B6C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvRfiETt9/vf5K0lL/pnBeyo0XjXyN5OT4Sb89ZDY2A=; b=FN824re89g0LPIYGY4v7Rcw2jG
	UiQ1yB/krBQ1xAfm3LjefpDD4R3ts/+91sFh1uwkjJsnJkdagtPIPe6M4RgfzncgmrHVBdnoC0aRf
	io11G6jZjictE8EOidH5DfMH5CtKEoZbYuY3r2I4qIcSTzVeqmlyAilDBzRQgXx+afLLuZv8hT4nL
	dDuzX+XJefzDaSNMm1AHEdh6Plh4GXbFGY+IvibrVR6Aj19cpRZFUkj8Tl+tQFV8sTiIF6gpququc
	idbreJnAaU8wgWm3HcXaH6js+I2KFucgaiA3SfEBFUm8QLYVLOvwzk259EQafRi6EHwoSmcKN8+Dn
	fcwpJIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKVE-000000035KG-0wj2;
	Tue, 04 Mar 2025 05:07:36 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKS7-000000034Wv-1NUf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:04:24 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ef85037f3bso82293837b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741064662; x=1741669462; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DvRfiETt9/vf5K0lL/pnBeyo0XjXyN5OT4Sb89ZDY2A=;
        b=uVbB3PagAbAmWqVF2sOCbEoA5QGg8PBwY3IkOvhtfs+DeAH9j+vi4jUgnlX/naoyh4
         EeCHWqBiOvqRVbaqE8PVIcaMH0v/sJwtKc0Aisbj3SzaapnEQdTvIRC9waE9QiPupxiz
         LIT7FvD/ADlvXuge2sLXT4QIyK2nS4/xexYdgQ02lgbBQ9DdPltPfd8dwCa9qKAPfOjd
         WG7yWKq+JNv+WBRKgAizE6HYIR5Bz9fw0qwP2iIN4TpvraW/KtuGxvCqimmahXX75VwD
         5Un28UbMw7bC8FQrmkCowt2SduDEB5TToWBIxVl89c0nDoZsERFbh9X/JdrTqTmOWx/J
         pY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741064662; x=1741669462;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvRfiETt9/vf5K0lL/pnBeyo0XjXyN5OT4Sb89ZDY2A=;
        b=TVASIQIRogf1QHDUBSs064UwkoK559wsnrd0ftHqG7EG/WmSYdHJNixVj8OyR14T/U
         BD4ETa/TvbK/Ljlb8dxbj79eccwqkxrxw87y0n7j4bMnPs+NEBVk8wFC762hpke4+JyK
         zeKyoru91emppBqtbLmikgrbnLcC4yNS/PxqgYiap1izwRzDkVraBIsipCg1p91r7UNE
         CBzDDsb/wGm7tcSWODogb354vDzsG/1cX+xuTkxPDQJM7uULpB/H8Hb1xiDKQLuFa0LZ
         K4D26GW2/yrSORUAP1UKf4wX/DmTFKaSE4zORKp7GmlaW+k6dirWWSLA8LJqBJ5YtU9D
         niVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn4c4jpm60yDfjn+XrPaJ/tk4FpBMFU4mf/wuOX+aivsAVO/PyheKGxP3G5JVp7xjDNvHrWMWAIumsrpkSE7gN@lists.infradead.org
X-Gm-Message-State: AOJu0YxLwKOT7OoKmNZpwrNWRN70Fkc1qGcv1tkAQd3BSHbjUcSI8yfJ
	IkGFvP+yz0TuzJswfUsT9Nr/ceaOTMrWE9qp8lfU4QXSifnQ28ebC8kayFy7mUZPkNwQDSRYq9H
	q19LZJg==
X-Google-Smtp-Source: AGHT+IGBQB6dZZ9Csl0mZ1y8IMIjXPBoV0Vt7a8kIB2h5g+5h/WV1kubj5dpIBkqnpDzwoAkqybaXtIaN5v8
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8af9:d1f7:bca9:da2])
 (user=irogers job=sendgmr) by 2002:a25:7104:0:b0:e5e:1496:7371 with SMTP id
 3f1490d57ef6-e610c1e48d9mr214030276.0.1741064661618; Mon, 03 Mar 2025
 21:04:21 -0800 (PST)
Date: Mon,  3 Mar 2025 21:02:55 -0800
In-Reply-To: <20250304050305.901167-1-irogers@google.com>
Message-Id: <20250304050305.901167-2-irogers@google.com>
Mime-Version: 1.0
References: <20250304050305.901167-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Subject: [PATCH v4 01/11] perf dso: Move libunwind dso_data variables into ifdef
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_210423_367013_E724FACB 
X-CRM114-Status: GOOD (  11.90  )
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

The variables elf_base_addr, debug_frame_offset, eh_frame_hdr_addr and
eh_frame_hdr_offset are only accessed in unwind-libunwind-local.c
which is conditionally built on having libunwind support. Make the
variables conditional on libunwind support too.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index bb8e8f444054..dfd763a0bd9d 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -154,10 +154,12 @@ struct dso_data {
 	int		 status;
 	u32		 status_seen;
 	u64		 file_size;
+#ifdef HAVE_LIBUNWIND_SUPPORT
 	u64		 elf_base_addr;
 	u64		 debug_frame_offset;
 	u64		 eh_frame_hdr_addr;
 	u64		 eh_frame_hdr_offset;
+#endif
 };
 
 struct dso_bpf_prog {
-- 
2.48.1.711.g2feabab25a-goog


