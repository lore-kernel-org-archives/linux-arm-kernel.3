Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDE3606A90C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NE87yu+e;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KvMnZnAb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SBB4E1cdIK6ypRojxJrVPdhDpxyA24gDAz038IMcsCE=; b=NE87yu+eNhfsh8
	3cMvelTQ/KSjtyYvyRtEWL0knHUfdxe7VAHKqpm5rwDJBwP/unNCCRiYOiheyCuXECddB2b8upqFY
	H6syXwoqm1ofZ8V65JloQWh9Q+neMAqDJgbHMARq66OHpsIRguQgGDOt9A3mcrwBgpN8X7dDTiKnE
	CM4NeaoF3gvpBqnVUa6fbzfXaZ1dz7bcq+mVdlHoYVzfWg2O3abpMLTSNiVN5NjnG+F4UqPeHOZsU
	/zp2/SQBNOXpbM4xAfIhxRty/Uh/v/UAGUgjYIroCKHoA2p+ZXTJVH3FT0EWB72rBC++tvNH8ajCC
	l2uDSvjM5yVTfGqxi7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuT-00000008iwM-0p49;
	Thu, 05 Nov 2026 11:45:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuJ-00000008iip-3Y4k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4b467581b98so12484385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879126; x=1794483926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBB4E1cdIK6ypRojxJrVPdhDpxyA24gDAz038IMcsCE=;
        b=KvMnZnAb9KC3aoL7VbFEc0ayGfVM6Etl+Mou3FDCtq15CfvfQBQgzqbuEVZYfseNQ8
         AKbmsfGErjYQLuFFviHLozwRYatIodn31rUzvcdGBn8Ng1n0o9HV9stJAO+b+FLLwfBc
         GF8Dxy5NAHTGWkJC1ZhaqPWfVnq2JHc6tAsYJ/J0gG0Qbt7KWvBC2iweNIuHhErwp0w5
         hw4+DcSyZ7zyZFgv27voFTzGwi4R8IR3D3NpZe9LH/MRoMoCpocT4rkgAsOhS4W84MQw
         M41qNJ4yTcjTqKpn6rl8IUhKEcpDVO3x8AqZkprraWyIs00se4d3yEamCI7JKV9oO5gU
         yU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879126; x=1794483926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBB4E1cdIK6ypRojxJrVPdhDpxyA24gDAz038IMcsCE=;
        b=Z9Y4J6O8EiQbinkocMDhWx1ZjlMsmxoA7osIG51aU+AV4GPYHhZumJHlgJt+F57/0g
         EM6H05nr/oud3vqhTkRBOZ4BcHJ86NMKN3LKOx1EtyhVmd4XI/7+c+LIrBS0X6DFA7W0
         oEa5XB1p3z1WNZnA+ImzdtUIzR8q0nq6YHVvPriEqWyU7xk6l83fTGDrWZZtDKPqv0NI
         7B8DU7OosFu/my8vld6jMUfZMhmBCQ7DyDczl+shi1EaTBuE5OotlT2zsPdJURaVcyZ5
         NO1Q7qfrqJ5g4bPvw9mZBhF1vTF58lmogAI0D8aMwO0ZKJy1Mg+Vqr5ocrA+QkKaceQR
         cUFw==
X-Forwarded-Encrypted: i=1; AKwUvBxLqlb/dnXYiDcxNWxLhimDnLDP0PhhZmVl2bhb2jz4Gy+Rqa55XyaV5cxLC95DIruSNBtEWdZEIGfy3D4ZCTEQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8joxEDHb6o70bBZ/MJFmacGJboy1QIg8Iy3FYg7yy3n2MRnIrg
	p/yOhupyqMs3ETpWeR23ZU00ZyEwZoxljrwr/AR+MC9iTNhamZJJA9oUQFTN7oxxzNo=
X-Gm-Gg: AYBFou2c6++3vgoR1ylD1hDLUdpx4JblJWQ8tly02jwk7MWkcaHdKje1QBAg88PyQCl
	Ayhkl20ce3SIMX70s5FoQlcesLA2pFqKMtZK0RSfMtm2A4Rc16KNe4eRveo6x/ab+D2h7nP+43j
	4eKH2fv+QXuVbffAOKjI7/AsDzIS7sKtMr3HUJxTziZ4HTxWgOdSlmG7IK7yrcVRVNzpFUPsMz4
	utDvoJ85zUg0W9RnX5zTsx81m2s9ULUuuSkkSdKsfklThMsqmd9Qq2NdCVShUAmyxkLhpQYdV+e
	EFJpuYeGoNhYQpaQb8pkJdLJ47qSMSnXlAPUQm0pdWImtAbl4kjEPjVvhZG0FkLl7tvM0loCzpW
	8/0PhRGZURfnbbgE8xu+bhTAtDtHNLrO9GVECc77SIEZinee5CGehblE8DMm/m+85+5lKYVX6Zt
	UgDZl+L3tA+tq6SnCDQ+dr6t0eP7t2ZufE7FebynbbshxAZbOO1vIMNScjs2MUFGXzUo31C+qNw
	MjqSpyfj4rE6/HAhjM4bLdmhmp8+Dv2siMF8guh4foAHAwSEtj8nLOfsoq0Ux+En6A4w5EiJSzP
	Rn7CzOmI2c9NFIcU/9/aSZhVzuNt9NEm
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4ac19234ad8mr417649255e9.30.1793879125831;
        Thu, 05 Nov 2026 03:45:25 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:25 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:53 +0000
Subject: [PATCH v4 05/19] perf test: cs-etm: Increase window size in
 disassembly test
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-5-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034527_915792_516FD376 
X-CRM114-Status: GOOD (  14.71  )
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
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


