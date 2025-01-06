Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43352E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HH3ED89tsTdnsw+rE9QWfbTCRTEYg4GmdA47cOVplWg=; b=Bi9P97R/JobiZv0MLz+rkIOtp6
	FxrlGuuTM7Qy9lQWRxznTXdBXWPikq7Z82hjqoH1EP8EE6SphVERVllfUoQHosEPGQbzdFfkwtp16
	UdRxJJGgpsRaBRRagBOGin4RZ4czUBpY8CgqBW2ClT5dUJZZT+uJb7AjoSv7nC1UsSDoqZF+ScBKv
	ZKR4HkBQGxu1XahUPNiu1ImZTE51btMuCYmBm5SPQzIbqLMwLM80DKw4zpzlKZlyGwFrSZkYklajw
	haABuZ+L0cIl2YM9YGUji5vF0RB6esVCfj5dNBlWRy6xRiUEa3Ld/524EgeST0YNFaKQxex8Zy6oL
	7zQ57kVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUddV-000000007mW-3BC8;
	Mon, 06 Jan 2025 03:18:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdcJ-000000007Zp-3Lfl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 03:17:24 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso17664025a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 19:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736133442; x=1736738242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HH3ED89tsTdnsw+rE9QWfbTCRTEYg4GmdA47cOVplWg=;
        b=h6f7J+zo9iyTI3KybZ+L49w+U8tIjH6wlnvuVceEcOzhPmlP1FidWc0RYHT+PIoJK1
         jRawC9ufWJFv8BlFC2P5AdMaf+wAdmqj5qQrqwz+eoQsAgpuOp90/FNzf/pHTBfLqHym
         fYmXF5JHtjo7arZug8gdKyqkbEprQPGOubz4LAJnVD131bkGaHRaiuLS6Sw01uPfH8lb
         DpLaXDVTegkZMDEsBJD5gRLpp48YIbm83hf5UVgK7ncrSt9JMfdGoOz6wC5fMkisj/oG
         QO/Ky7GtJWqS0rUsW1IX0EurtBqpyAxnxKdKqHhCeGqyeCWxi9owpPKBGIwzhIuhzauH
         Nnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736133442; x=1736738242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HH3ED89tsTdnsw+rE9QWfbTCRTEYg4GmdA47cOVplWg=;
        b=NKZUky99N//+mkrWkElNjpn/TRd2WevplN0mWHenv8p5TFlVBmRmn7aqBFrFwBp6m1
         4BPqBXyeBNBngUuNDD5NR5UQt0kcUzz1eamq8GHo9dDi8U1sRzPxfY80Qju1dbvaL1GS
         /3vTJ9y9aB+tc/0ZJNIYzB2nkCNrMQ0Buuxe1ATfTiUuakJCbyCIB9W0FsDoqbrwggih
         S1bNTO8LkS8kYhgGm5IFbc9g39cMnb1nYqJlYT3/zuJyGGPYRGruDmrNXSJvzPltUOMY
         p+4NcJF6qYKKCu7/hUtjZgDkiTEPpPmbM71zmRkzxwFT1xNults8CgQ489apBCFH3ulk
         NT5w==
X-Gm-Message-State: AOJu0YxXL2CCy+1rxNQ/ynkhahYAfg8GO+HeDCNppeD5Pd6MELLmpoYu
	TLnaYYFaDor/Gpn2F4j78FjrPm4GSSzbIbx3cWY9b8gO+1OIq/a3
X-Gm-Gg: ASbGncu3oYDdyuP3yZbNaKoT7cPXOImGaQyabhKKl5sAQs5HPzUxfaDc2bcDlOJ7kdf
	mO8Nfou4qQq2t4MzrQTzOQueKarAyqHYNdJNmsiVkg2c9YQ4Bf6An3GZZ/td1AWW8GTNU9DkkjR
	5gf09eIFmQnOeK8tsA3WwRbkqp+VnfxtDuTMImB2J4dpR1XN5TYP+1EP5/6dfO15kKYWm46PTt/
	Cet8pr2+XhOR7Pwb6UHeCZNMHuWUYT3dx9EJmNMfi+XdIHQF8vVvgJ2POMgshDKLfja9w60X9XY
	W/+jvCPF
X-Google-Smtp-Source: AGHT+IHJsZoBMBkLol8NRyoMUhyLk6Yxfu4EjG4wqDyWD6EwH7i2BeNlGm0Phl+st/gLUAqxALBIPg==
X-Received: by 2002:a17:90b:2b83:b0:2ef:9dbc:38d1 with SMTP id 98e67ed59e1d1-2f4435ad5e6mr82526493a91.5.1736133442245;
        Sun, 05 Jan 2025 19:17:22 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:a54c:5ad3:ad27:edb7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cde6sm38471399a91.13.2025.01.05.19.17.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 05 Jan 2025 19:17:21 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	ioworker0@gmail.com,
	david@redhat.com,
	ryan.roberts@arm.com,
	zhengtangquan@oppo.com,
	ying.huang@intel.com,
	kasong@tencent.com,
	chrisl@kernel.org,
	baolin.wang@linux.alibaba.com,
	Barry Song <v-songbaohua@oppo.com>
Subject: [PATCH 0/3] mm: batched unmap lazyfree large folios during reclamation
Date: Mon,  6 Jan 2025 16:17:08 +1300
Message-Id: <20250106031711.82855-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_191723_836699_AEC06D6A 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

From: Barry Song <v-songbaohua@oppo.com>

Commit 735ecdfaf4e80 ("mm/vmscan: avoid splitting lazyfree THP during 
shrink_folio_list()") prevents the splitting of MADV_FREE'd THP in madvise.c. 
However, those folios are still added to the deferred_split list in 
try_to_unmap_one() because we are unmapping PTEs and removing rmap entries 
one by one. This approach is not only slow but also increases the risk of a 
race condition where lazyfree folios are incorrectly set back to swapbacked, 
as a speculative folio_get may occur in the shrinker's callback.

This patchset addresses the issue by only marking truly dirty folios as 
swapbacked as suggested by David and shifting to batched unmapping of the
entire folio in  try_to_unmap_one(). As a result, we've observed
deferred_split dropping to  zero and significant performance improvements
in memory reclamation.

Barry Song (3):
  mm: set folio swapbacked iff folios are dirty in try_to_unmap_one
  mm: Support tlbbatch flush for a range of PTEs
  mm: Support batched unmap for lazyfree large folios during reclamation

 arch/arm64/include/asm/tlbflush.h |  26 ++++----
 arch/arm64/mm/contpte.c           |   2 +-
 arch/x86/include/asm/tlbflush.h   |   3 +-
 mm/rmap.c                         | 103 ++++++++++++++++++++----------
 4 files changed, 85 insertions(+), 49 deletions(-)

-- 
2.39.3 (Apple Git-146)


