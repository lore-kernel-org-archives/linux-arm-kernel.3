Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91893C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tb2sXr7iZMxtDZGeGysd/W5Iy0nEDu8fCyzmsqY0v14=; b=BN7r1rkOH7GnAK3KbNJLOT7yl/
	gjnbkNgRZvlIbu5Sx0ttiRZSIFT13mR4zmhX6yz2NRF6pbUrpTSTLRGEaNVBiYUwqE9a6IUF1Cbth
	1ikyCvi9ARUh4c+I/DnJKEnApBzSnrNHhx7dpqM3ZNnGutYE+xw2zVj3wVL6kVP4WzTdMWnsWtAmU
	jWJ1ScLMrjVlLa4j+8/K6xqc2eBuID5JMgY8wvS1FCyNUovtWgWrODzAMaT4tyDgkVfmympeD7N5S
	REj4YsHEWewyjgQKZA3JlasGjYfhaPC+5GKKAdSF0g7phqKrL+QqZ3KQ3V6ibeTLi6SnlYuoFquK0
	x23N0DlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2uz-00000001365-1ZCg;
	Thu, 07 Aug 2025 15:52:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2sS-000000012yI-0qph
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 15:50:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-240763b322fso13354695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754581799; x=1755186599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tb2sXr7iZMxtDZGeGysd/W5Iy0nEDu8fCyzmsqY0v14=;
        b=KEkwOPoTcMAXmux9nr74aMdUQH5/R1hde+2yBaSCXVKJqy54t7y61/U/Fo9zYwz5nj
         ae1bX7GuMxDYy/4oIoElSqYm/a7t6hl+dCurq7lGsKMDCr5mUEt+QKPKsigchvDO9YAL
         OIGrB2I8sMOqiKlY50ZU5odsqlShizJME9oj3r7rkexwrpqfHyUty/2vTkInPJQFt4cv
         NzOKYuM0R4bolVXJWSGgNag06QMWOkOIeMhWR/qMf/wG3nfwDoK9cCNLW6hA6Qhi059t
         tuxxXMkIS4p51YsXwdfgj5xI/dQPxQ9+O0Kj2G1k/q4TLQTXyuL6k9vWGbGeiJAbb9Ic
         imIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754581799; x=1755186599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tb2sXr7iZMxtDZGeGysd/W5Iy0nEDu8fCyzmsqY0v14=;
        b=kjChxykcQEdp18KDCWSyuh4sdj/af4pFeG2oZEQatumwRmZvYSQF9kufq3PWGo3/N6
         x6KJSv3m7nnsT34DPrCSlEQJed3CSXZOw1snQsuYUny7q4iTmDHEHqkkfCj4UPO2feB7
         wgVyYAZz9lBG31YaaGMh5woUofjoZWSixrmseyWjiluGyOD+Uz9kAhh2b94HiXOT/lG/
         AYBMC3xEPLQ5HNrDCOrlPUPZdh9ijr/x5ruFnzZFwgfo6WJueNm+EOxspeGSoJDQoyv6
         vUEWONa6r6QpNB48hkGmRPkkfOrKL9SeJKkBn4YoJYbgiswk5f9FibuGvGwNjej3czAF
         cTGg==
X-Forwarded-Encrypted: i=1; AJvYcCVp4Xgv6E/RFknTfM6jSlM8PW4P/dVWw5+c2IsDmZaFBLhAE7HnRB3elaiqqhOKcTUOG5G1fD32blkbA62tohNi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz83+geP7E1EY61/BnKoYXbKdTSLHnucVdqg+Q5MONYxsVmtUFf
	vlrrJxX4AWTlJZzgWD6QSylTHMGfIMYJIWlQz+ZRM+Iq5wFryj6sLAwzq2KrklbYvrk=
X-Gm-Gg: ASbGncvtp3KdrCo+xY/pPUnalZATZlbPQbX3HC5DTZG0/9jqvukUHYbl8SZtsBZPqJc
	DJiiWefsxxLDHP9W5ZBMgOsleDYSPjgDV/9XTiw58J2cW4dm6yV+MZglEtnjyFQlBMY0GD7vNSS
	dOr2fpKXlyygTDNiFQyrX3zU04pmDPx608DLFX3gwgqVFuOeGcsvbH3L7ghIIlgWenK+h9bZ0yV
	WBZvmQupHFcqn+p66I/g6rc4Jx9wTEz+rjKjTMv+8GuSUfXqRjX6NR8DM5pOYzwhLsjJ0wbfj1q
	7EF9gk6EwU7h6EVtXFzyMwSlAGY8NR+oy6KSqU/VgOlIeN79/5JbTqTrLuX3yiHjSmdzDnp7odz
	zDkyxx+nDV40dOeVyLVatVnfOZPippWJ+hw==
X-Google-Smtp-Source: AGHT+IGtBI9mRz+JUlweCAYDzHjTxQ+R6ODQboeLUripcDbFR1smhvfREX+e7Demyuc5DLZ15yPraQ==
X-Received: by 2002:a17:902:ebc1:b0:242:9bc5:31a0 with SMTP id d9443c01a7336-2429f5bcd01mr110369575ad.56.1754581799169;
        Thu, 07 Aug 2025 08:49:59 -0700 (PDT)
Received: from server.. ([103.250.145.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b5f2sm187873315ad.125.2025.08.07.08.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:49:58 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	broonie@kernel.org
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: arm64: Check fread return value in exec_target
Date: Thu,  7 Aug 2025 21:19:47 +0530
Message-ID: <20250807154950.24105-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_085000_243931_D63C5B5B 
X-CRM114-Status: GOOD (  10.84  )
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

Fix -Wunused-result warning generated when compiled with gcc 13.3.0,
by checking fread's return value and handling errors, preventing
potential failures when reading from stdin.

Fixes compiler warning:
warning: ignoring return value of 'fread' declared with attribute
'warn_unused_result' [-Wunused-result]

Fixes: 806a15b2545e ("kselftests/arm64: add PAuth test for whether exec() changes keys")

Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
---
 tools/testing/selftests/arm64/pauth/exec_target.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/pauth/exec_target.c b/tools/testing/selftests/arm64/pauth/exec_target.c
index 4435600ca400..c22db59194eb 100644
--- a/tools/testing/selftests/arm64/pauth/exec_target.c
+++ b/tools/testing/selftests/arm64/pauth/exec_target.c
@@ -13,7 +13,12 @@ int main(void)
 	unsigned long hwcaps;
 	size_t val;
 
-	fread(&val, sizeof(size_t), 1, stdin);
+	size_t size = fread(&val, sizeof(size_t), 1, stdin);
+
+	if (size != 1) {
+		fprintf(stderr, "Could not read input from stdin\n");
+		return -1;
+	}
 
 	/* don't try to execute illegal (unimplemented) instructions) caller
 	 * should have checked this and keep worker simple
-- 
2.43.0


