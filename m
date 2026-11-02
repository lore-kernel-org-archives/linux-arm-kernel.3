Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BB0606D238
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SNJr7l9E;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A83oIm68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1kx5q/BQBwUxVzCJruBUh0184bcctd1FMQSl+tIj0LU=; b=SNJr7l9ELDrFj2
	LdA2Kkpn9x11XymXEeCqEp4EXyBUkMl3DZCUm8TmjyUPvyk/7DGFVnGEME5ePV1f2dcWxAeGpiEbO
	WmfxsRvyKDbYODE9BvTyhGagUEByDaKbC2tddT5RgbCsqolfN7gehFG4g6eKZIXxNJwxrF5xzfirB
	aAl8tCwKpQOr3Q+Dy/ewKBlwaM+pNk6M0ikKGIWM8gPP4KEUjOhwyjgTjAxZmvFqi/9o2gAFMPUZE
	MJAKh1qHkXJmXHpfbGhWlPScMGi/HNnJ3HgjuRh74VzJvGNbyn+3YMk1I6JM2S/HTskiZkVxWbdds
	CC/30kEfmQm4UOMfwxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxD-0000000GQWi-00D3;
	Mon, 02 Nov 2026 12:15:59 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqx4-0000000GQRE-2v2T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:15:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1682387f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621749; x=1794226549; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kx5q/BQBwUxVzCJruBUh0184bcctd1FMQSl+tIj0LU=;
        b=A83oIm68aYxU0x6ekFBfRBEYk5KA32S2bDThyf1SrEKkStQwvIzgsIMc26G33ltmsw
         8XKT1mKYD2r/l4p5cozTG85PAm+UuKn2vO4+Y/irJXDe6MMS1C3s1QxhyZLhC3pl58wq
         Puql5hIAtx83pkIgEo/bB4j33li3Dn+UbZf+wz98UI1zlbnCaVkWuN/7E1J67xPBMTYf
         tEi9xetqHe3nWlCWm0Q3Z8BHfeAKMAKp+Nlq9LMTw5gl3Iy4SU3w7IsOZvWWjWz1TCkC
         o4WB7JEitwkMUqCiZhSZWsVW+95NJwwDQdeRKTplIYrgye5hYlSqf809kllz4TUCs9Ik
         WvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621749; x=1794226549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kx5q/BQBwUxVzCJruBUh0184bcctd1FMQSl+tIj0LU=;
        b=I86Pcm6sm2kwIFJjI3AwBe5tIS6+7VqJPUYS7thlBLzo4ZAq/HKectHSj7+WbaZMyA
         +ZW0AvyK5tYa/Ek5laa9DVJ7j0CUJKjWDIEPe9Ljih3xVrxkiMx6poyne/AE6Za+OaZy
         iOK2RNtmruQD/igm/lHpRmUE4uNoCaX+4akJ+UH61rHxBpX10HgO04bJUe5MGhOSb7z2
         WSj/UeVJXLe0AnbCdnV7cqCfE6k2XNSBfi9sy0e2z6U4u5TxblxNuB0P6COw/uOKDKgI
         CZm0QhP43jrshMHcrp6xt9VfULRptb+97oV5hPgxClhe1Uf14B+ScVtFy1k9LHO210rz
         QwNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGgLbVrdQReR9Dinfa43sjwQx7D7Q2eRWB7FjdpM5DX8BjcpXtqlukWWw5bSAEYyT5aQJcwsmovX7jbWm2V9id@lists.infradead.org
X-Gm-Message-State: AFq9FYKc5MBPJXSQFf+FoXiiY2hu9gMW4iodq33DPgEOaxsIGfgSw7aR
	4KJCwOP4YLPDss79vO4R9+Rs6IU/QER4HbVe8cHGXIaIzpntu9P9AW/5/MbXukkiQSg=
X-Gm-Gg: AYBFou1nJ5P//16fcGtkWofhWHRv3GQBS5fcGM6Dj1sD6PxsWjbxq4YdSP+C6rQDPHf
	f1CdrnNUBfyFDXY4xnfTd3zmX21HRPA2wiL/f9Vn3lDMoSCpIb2iQDZvtlRowNIJW1ahPaUdt3o
	nVJQagJ+PSJqK1cs94XOS/TZYA74AhdyUxMfpIXMDw6j1aYQwXvJgWLrJe1HJJwuVl5KvhrgkfC
	8JpVxycKrkWt5NrZs9aoYzfMWC9GvZswoFGdwqw/PGYUIrf9Ncxm3mcpCyCYELR+eyAQ5tdxytw
	rVJQzuTMpqImHuDD6M/d96Q3h4/53GoSpRe2oG/guQCij21uVW7HQoaseRdZxf31OtBgBn9l+pt
	Sb/+gxcAQ1J3ppV46NH3AjPScxjKMq1lV0YWJDkS8xP59M+3C4oW7t3pJ7Fpjo9bnNtY/b74sum
	Zb0QxLk07ygXJue06xAzm72sVfoGmaWssPfqKLunP65Ptq4KDqIUbWuG6RrEoaU0l7/we1YycQF
	fJmJ8UB4+hYuFxmFl4UAs4S9ndv6AlebF/5WMemSFSR/WHgN7AGjjUR3IS8ETkqnI9eRH5HK/mT
	1AxKuNlMdJzq66DQ4MxLVB9Y9lxGtVa9
X-Received: by 2002:a05:600c:4e41:b0:4a6:42cc:bf6c with SMTP id 5b1f17b1804b1-4ac16acfbd0mr207623275e9.7.1793621748831;
        Mon, 02 Nov 2026 04:15:48 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:19 +0000
Subject: [PATCH v3 05/18] perf test: cs-etm: Increase window size in
 disassembly test
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-5-dbcb0c281b9b@linaro.org>
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
X-CRM114-CacheID: sfid-20261102_041555_707948_F4CBCFCF 
X-CRM114-Status: GOOD (  15.33  )
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

When we increase the default timestamp interval in a later commit, less
trace will be recorded. At the moment the amount of trace overflows the
64K buffer, so the exit snapshot trace is what happened at the end of
the process rather than the beginning. With the new default interval,
the entire execution will be contained in one buffer and the first few
samples are always various instruction and data faults. These go to the
kernel so don't result in ranges that can be disassembled.

Increase the window to 6 samples to ensure something with a branch can
be disassembled even with the fault samples.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
index d298b18154b2..236c4160e480 100755
--- a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
@@ -50,7 +50,7 @@ if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
 	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} arm-cs-trace-disasm -- \
-		-d --stop-sample=2 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
+		-d --stop-sample=6 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
 	grep -q -E ${branch_search} ${file}
 	echo "Found kernel branches"
 else
@@ -62,7 +62,7 @@ fi
 echo "Testing userspace disassembly"
 perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} arm-cs-trace-disasm -- \
-	-d --stop-sample=2 2> /dev/null > ${file}
+	-d --stop-sample=6 2> /dev/null > ${file}
 grep -q -E ${branch_search} ${file}
 echo "Found userspace branches"
 

-- 
2.43.0


