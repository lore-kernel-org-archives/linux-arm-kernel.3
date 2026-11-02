Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF85606D232
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yESVS8O8;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iDpmS6rn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BWyhBgnl5ljVt2Vm8I0njJJDAjJXWTVLrBozwNDgUng=; b=yESVS8O8XnOYXo
	Tu1pg0mgMeVETZ1cEZpsVJa8LmSH68azUbIEkUtz8dJbeJpAwWlvJ4spvSbOub3xXTfIuTgGcs7yf
	3EdSgzuREFcQxnr/1jUB902wVDuvJEDlG9o80NXXFf9vQWsXen3f/fgGd687zVsxejfYXU0UBSgad
	CaPpzjysQ5vasjK9PVgjHSlRSYeOhmgnYGrbF8G7kvBQqMvYdjIvAxXD2n+a9htVpUxPBy4CT2XN0
	roeOwjocsk5Br29vPSphIrdzLMdqt79AwDF/yHV7244ATtWy9etOT28p4lb/Rpx0ILtX9oi0K1flq
	doAcDG4/Zbb55QvlYGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxG-0000000GQaU-1B0g;
	Mon, 02 Nov 2026 12:16:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqx9-0000000GQRs-1ODJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:15:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so22012495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621754; x=1794226554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWyhBgnl5ljVt2Vm8I0njJJDAjJXWTVLrBozwNDgUng=;
        b=iDpmS6rnvwNIwdYbULAKR9TgqOD596nEx/TnE73zJ5XZPmPO3Ax10TyhAfvYCCvhG0
         p08VoTI2JGGcAtRho5uSoWOcv10Z41KvPv9loeRJKhLLlUERU/zzYy0ilP+IG/BjSNUP
         ZLB+/Sm2qusZYti5sXg5oPwzkDQfZig/CrLnV82E89+e3kCJZQMh5MXnsgIno9t8O+MP
         6rdYiOj1T/8fAkljWza152E1KSI07TkxBuunKMilS4+MLb40T6SFlHLFvrGouql2irB9
         GMOrE8ECj22P8tvJr5l/Un6//wwsI9bNpeDpg5K3aHIb9om7jLW8zdKWF4xauvuLlcim
         lifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621754; x=1794226554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWyhBgnl5ljVt2Vm8I0njJJDAjJXWTVLrBozwNDgUng=;
        b=xk742By0OTJ0liuZLV/D/8L6ld0R1Xai1D3nsCX80o3JghiH8J5IABHsQSSg4iLmM1
         /vqgl4WODIqwrdj2NU5+s4f5IIS09H79sIJVn/EufEgBhF/dPWSoGSwbkdESgPR8Dv6d
         15X4orB8kHPYUMAKEQ252DUKsfvXpK2DI1lGsT71zTh+pHzjJDw58WHIczTSkfB1qoI6
         nuIlo2CMs2TXALEkYVmFjh11nwyFap+fljkv3vIfuKv+Yc60lhXoeRQA7I2O8ZysIFTn
         6KZMJyO3TyVDKB5DXTakrp0lTzFqUj7ssq9QMDKf4O0dsoce1Xwxwunp4TmZqKKJwIrW
         QcPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgFZKMI8lXQoKRi9FSqF9zX1aRF6wxB2dIxK1bwtr2MNE6ebxATFe1odQ0MmX4RjgrFqx40DNlYVrTCP0KNEoQ@lists.infradead.org
X-Gm-Message-State: AFq9FYKB78G+FBXRvDI3oATJ0mLOCOql/m8Xkex0TRfBRrqVRbpGFnc3
	s38UZ5WDMokCL2yXKJkH3qmivHG2BY+TWqOfgeey8AWJd5BwpnBV8XdhuuQwKAe5GGA=
X-Gm-Gg: AYBFou1L+pbh3q3OwAf15udcICShhiH6xm7LNVqnCROrNQWc7D+SYK9EfiOmKwzNcV8
	4HrjadSZYYQ0ICUV6EbEwsvOXfBJspkm96ioX0OdFe4xo8M8HXjzlu9YWCpf/kRqdYvGvVYJOrv
	pt8XaXJq6JRMi1XzAlE5l3KSDHUBG3Gfgkq40+mD1hTiWp8YkT2rQyA4e5JzcHeaRrAphLHVZts
	AV7P3my4OkDD4xK6t/m/Nv4ED+IjvTHGo8BTlQkW9IN9orqA6WExBdV15mPh0xf/0u0mC8q3WYY
	dK8MmeLqHEiGUxnkmbA165gcNxxfXZtmULIYm4YY4Lk9l1uIBakLbMzpaPtyL76CMZNdbUtpTAk
	fZhEqyPG9e5qBvpL305jWthrHxig3qLriYRYF8wRZYUi6KS9q9OieWofwOYt/F7p0nc+P9El6W5
	T4pFl1v8pMisIqgpKGo3eXIPGIqziKUSZML1J2ibsHEDhjFvVWXCOyhINYPfNoA/WzARbZ61+VW
	GgiY4/f9ADrrfuOEqOhITR8u2TukypN0m2ghursjQY8waqxpcRJCFkTVbEqeJnk6+2ZBxJgq+Cv
	tL52h7idLaxJzLCBHWJtX6S8Ep2/Mlz0
X-Received: by 2002:a05:600c:a103:b0:4ae:63e9:36a9 with SMTP id 5b1f17b1804b1-4ae63e93a86mr93551315e9.14.1793621753669;
        Mon, 02 Nov 2026 04:15:53 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:22 +0000
Subject: [PATCH v3 08/18] perf cs-etm: Use instruction length in
 disassembly script
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-8-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041555_784956_981324CB 
X-CRM114-Status: GOOD (  14.81  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The disassembly script adds four bytes to each branch sample's IP to
include the final instruction in the range. For an exception sample
whose IP identifies a faulting or interrupted instruction, this
incorrectly includes an instruction that did not execute.

Use the decoder-supplied insn_len to calculate the exclusive end
address. This preserves zero-length exception entries, includes executed
syscall instructions and also uses the decoded size for Thumb
instructions.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/arm-cs-trace-disasm.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/python/arm-cs-trace-disasm.py b/tools/perf/python/arm-cs-trace-disasm.py
index 5a7daf927bea..7cf0af5d2780 100755
--- a/tools/perf/python/arm-cs-trace-disasm.py
+++ b/tools/perf/python/arm-cs-trace-disasm.py
@@ -315,11 +315,12 @@ class TraceDisasm:
         #     [ sample_prev::addr .. sample_next::ip ]
         #
         # sample_prev::addr is stored into cpu_data and read back as
-        # 'start_addr' when the new packet arrives, and sample_next::ip + 4 is
-        # used for 'stop_addr' so objdump includes the branch instruction at
-        # sample_next::ip.
+        # 'start_addr' when the new packet arrives. Add sample_next::insn_len
+        # to sample_next::ip so objdump includes the last executed instruction.
+        # The decoder supplies a zero length for an unexecuted instruction at
+        # an exception entry, excluding it from the range.
         start_addr = self.cpu_data[str(cpu) + 'addr']
-        stop_addr  = ip + 4
+        stop_addr = ip + sample.insn_len
 
         # Record for previous sample packet
         self.cpu_data[str(cpu) + 'addr'] = addr

-- 
2.43.0


