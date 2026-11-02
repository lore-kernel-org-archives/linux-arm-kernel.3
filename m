Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470D0606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PzzrxG1t;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RAUMeGN6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1cPbn7Qf9c8iItDK/ZSc6D51DtwGlZeo5sCNSCk2nEE=; b=PzzrxG1tjvtIdI
	Q4grR8l+ZXx7xN2HCULXOl00kE7NKlyv6f/No04TO1aXNl5P0UeeBYFJge+Y603yTo9ii4UdbI8lo
	ZiE74UcsGaXvhYXex+SQoG10JC3CkxCy2J2jCkxPSxDPIjyKGyyX5tonI721Ppe3n9PShdUbOVLvT
	AVlKLwP6ZaQt9YVlLESRgdOaRqlYZFuWwuo7FNsr6oh6GB99jgd/C/cNm7kUp6tm/zQKeXW6X/KQ3
	mAxmjBRRmPEGOmAmfYJo2VvkXUPdG02JWIbBzdJD9SXbU/FLVgjLPMosZIgs1oi9qYWUsI1YVADiM
	w5yXXIuMY+I9oSWhfn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxC-0000000GQWE-3PrM;
	Mon, 02 Nov 2026 12:15:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqx8-0000000GQRr-2iIg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:15:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso29635605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621753; x=1794226553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cPbn7Qf9c8iItDK/ZSc6D51DtwGlZeo5sCNSCk2nEE=;
        b=RAUMeGN6VMq8DYzBhwNdzirMeOd4Eo4FXEMF7+hliD1SxrnLNq3dO9lAgicimm1ITm
         nTxQm/xmqCfChLZXZQo8zRD+zyXIJb6QnADrRWYxY/0TXWardwTwKkf2KtYPBXK1id5X
         DtJzgoT7K45YjoBCFBhkmMCscqnizpO10es+s/P91U7c8Yf1v2HJlu2GVp5juk+iP8v+
         su1MOgCGdo533GaUMkW2u3TSou+gMNJpjbrdJ79TPYc9RWupm9usFHmH9E41YacD3O2R
         gqx54Codb714QzTalme8DlBcIZpE8dxCs4HkCUbQIlKqnerdj+xqty7GFmq22Imi88Wg
         m0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621753; x=1794226553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cPbn7Qf9c8iItDK/ZSc6D51DtwGlZeo5sCNSCk2nEE=;
        b=GweWE3B9w5knbUsEcW+jY3IsUSnE/+qOTkGPccufY1OgrEA/k4gqS2LLZb0UFYb0jn
         UTQrh/KDps4F/hFVqSu4nqonFgJHj8t/L7fv4Yr+Dof3NMmH47kyh7xhtCDug2ewjNRU
         UX21a7nWw9MagiW8uq1/lAT/KP66g5iLXhX2UkPgLtBbl1y4r7fiQlwtPXlPuv0CoSPE
         RvCRQdRUNuQL/WpH/n+5jjHFD5QVRt/KgZ5oJ4NinATYqOtTl0DNnqtnY1V3VVwtcaiq
         BGx6ONQHoqNdhYkwXsoogIgaY3YDxxM6EMIsWqpxj65ePVC6tK+i2kZkUCV6/660xkXC
         lDfg==
X-Forwarded-Encrypted: i=1; AKwUvBykhPZ0OPzXHieQ8lCre6rwoJ7+HqsAk/QBrYfQkFZytjim2sJd53OgKPv1izVPF85zorqBLOGExGfg5dmf3rZC@lists.infradead.org
X-Gm-Message-State: APuU4Z8QR0IT0Y54TcXklyZ/GzcWgwgEEzrVETT8Eg4LxqrZl48n2ium
	7AI5SBpZZCVuqoQFMwjV4YZ7mruDJF96e8hH5JCkyGDLGnCDHn+C/ZJVSZk0OZ2O3Ak=
X-Gm-Gg: AYBFou0meJwKfr4ecYI1wKMSx33M7CZUb5gXjThU/t4GM1wOTkpoqcxDmGe3gibsbsR
	DzMdduiy0CvQtNXj5kBTFF5u865x9YJtfXpcTOgvcnierdwlkhQrwP4cvbZG7BvHyICsNGFZiXM
	AwqpksOZcWrkoP07U+SPIdQaEMRbNu+fRPC+s27/BpVJvkq49CUh7TuLvncVnDDSfxaiSa8ORhE
	USn9XU77ztOBT0bj9kBVKPBVgDm7Ss0RKwRQMj6IdwHJIztrxiZX3H108WpIttOS2NoDJcPjUkU
	pWqujJzQa7BXRhxSMvawo3psBmfawvI/I2fnUNewZuuBk+VkbX3jMjfifYg4Vr5TwvnuIgdD2g8
	3olM7eIg4Ls0g1AbDPBBFKEn1bKHgfYUK8cGZiX+Saec2ddNXu39J5o3edHhg/UNk+W2Or1GoYM
	FG4zvzmG0nM3sFonfiSHEnKt6shkWHeWirP6W/J1SwDqzYpgK+n4e/4A29dJ5VQDikYoto2K4PE
	vELEAuc/7XbncIyiHIwofQZaVPNc7Vc/SX6ck+1On+0F6vblwn2BI42tu0Ofc2lfWlqFUglDhsm
	QIcjBjNbTm9WUJ6fL6TDIpz71leuW4Et
X-Received: by 2002:a05:600c:8b0a:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ac185bc4a1mr230066925e9.27.1793621751493;
        Mon, 02 Nov 2026 04:15:51 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:51 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:21 +0000
Subject: [PATCH v3 07/18] perf python: Expose sample instruction length
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-7-dbcb0c281b9b@linaro.org>
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
X-CRM114-CacheID: sfid-20261102_041555_704317_4684C3E6 
X-CRM114-Status: GOOD (  11.39  )
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

Expose perf_sample::insn_len as a read-only insn_len attribute.

Trace decoders supply instruction lengths on synthesized samples to
indicate whether an instruction was executed or not during a call or
exception. Let scripts read this value directly.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/perf.pyi | 1 +
 tools/perf/util/python.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/perf/python/perf.pyi b/tools/perf/python/perf.pyi
index 087da00728fd..525d34ed08dc 100644
--- a/tools/perf/python/perf.pyi
+++ b/tools/perf/python/perf.pyi
@@ -215,6 +215,7 @@ class sample_event(_sample_members):
     sample_data_src: int
     sample_insn_count: int
     sample_cyc_count: int
+    insn_len: int
     type: int
     raw_buf: bytes
     dso: Optional[str]
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 60dbe2dad5eb..d2aff058eb89 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -1380,6 +1380,7 @@ static PyGetSetDef pyrf_sample_event__getset[] = {
 	sample_member_def(sample_data_src, data_src, T_ULONGLONG, "event data source"),
 	sample_member_def(sample_insn_count, insn_cnt, T_ULONGLONG, "event instruction count"),
 	sample_member_def(sample_cyc_count, cyc_cnt, T_ULONGLONG, "event cycle count"),
+	sample_member_def(insn_len, insn_len, T_USHORT, "event instruction length"),
 	sample_member_def(flags, flags, T_UINT, "event flags"),
 	member_def(perf_event_header, type, T_UINT, "event type"),
 	{

-- 
2.43.0


