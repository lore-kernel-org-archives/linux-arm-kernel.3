Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B24606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dPpS7Rar;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=peQV7KXt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=; b=dPpS7RarRjvxiO9bHnU2ERDNjA
	L/53zbDIXOrraTUCcVHLyCMDg0U4/0aDeIgG68IFs6GEHl+vzyhycYgsk3wXYrahETkhXa/LnT8wu
	E/JvLyDybjrikz4MpRrR7D5E67o5gqWX94197hxe0NXpSXNNQ0eoxSt++8oHQE6bJ1xGHiAUKAtRr
	QmUubStqeS2M6F42g0pjf57cg3nSlhP4uxHOxTZNzpsfWRx5pOi0ksah+A4XL+3HWxuWg7bDEyUNc
	+96WwQRkLUza5RltZU3tygbINsROGoyZdpfjjJ2eSTFm4STCtd7U28PSHklp2dIlp3xA7VecWd7vv
	P+yF3Ksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKlz-00000002bHf-1JOI;
	Mon, 26 Oct 2026 13:29:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKlv-00000002bFX-2h2o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:29:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so21062515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021393; x=1793626193; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=;
        b=peQV7KXtlP/nx8XIa//dWyB58bWPPHlq56OuEOPUUMQhP0zvuUg4dhcAF1qLplocS2
         KKS1+zVyDPjyRF6Wc1yEaDws01EwvkztrM+Z7jtltO0EzB78kgwbO+X9aVZvvx1oE20T
         qxNOwU8F3xjnhy9EkUTocEkNqt4SIA0X5gNT6j6Vq1W7X+UJ6EEKHLLDKfWUREHFSCEx
         6XT0yEPbLakcD+RDjo2DP6CKlpv+1YZ213gAwh67NsiiSqehdep2508CPja67Zm9PNvo
         MdMxVqUShnp1GAD0T1XSNILTqZTd5o3fRLMjowngbAj3eCveYRcTjdIKP6mhaKyXPu0e
         BaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021393; x=1793626193;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=;
        b=x3ae1Ab3hkyqdrghpK1civH4DN0WHNMjBLI+/FKITXwCRbU9PJrnJ1D1oXcZzc6tAn
         N4GmAYM1/MOxEM5ysU031/2VbZVE7VQIU8v088GJ6WSMD1Yq+N9NfIRQcQMA5IXboQkx
         0Ac8CfDD5FyLeVhAPbesStpVB46vEWxKqfi5UpeOH7ScMLhH+oVjElL6DS1hkbj0iSJ0
         ypVUw7CGkhpuxF1gogPU4S3Y9vAafhSCkrLLhv0YWTCpi54nTWIoSPP4JfSyzU7Gxbt8
         IxFH4IvWe8T0V3qzFBXQd9xmhlAqUbAgb8s/xnPdRmbUZnuCzPaiEHpJ1o0angSGaVvo
         R7Hw==
X-Forwarded-Encrypted: i=1; AKwUvBxxTrjefa/YHKxAjYUR0TttTFsS3uBGEY7WEFfdO821X/BolzAYqNN6FBw9ZWI4Kd2qnPMo2bRQLWf6sS2ywtDn@lists.infradead.org
X-Gm-Message-State: AFq9FYIjKszpNtiYVFGBujTvKX82hizmkHEAqrUapNto6R0TWOgq993v
	455gtDU3Reow02XHbK+yUDIpvN2w/gYyzAiVPQLxAf6SiGTKnfPgFPFDTR6B2FXEKXU=
X-Gm-Gg: AYBFou00kSjV3OOmysrob3lWMCRekkjZ5rtA2IBI/Ch6lRXFX8DJerCmn4pURhJqMwS
	fXpSc4UdualKxt04kxKqMfR8flOX9XfcNKZUaC3jrBJHZYBL72+BjwG4hShsgwYFURr0gigxAjG
	Dv3UBHA/GmLTNHuMXGNSy7R+O8yV3yHYtB/CA65lwiZwPIy9rl1Aui4B9rvQsfeqZaLu2sZnheK
	MmFpTWdTrhKF7vdzATJMwv84q712ea0eviXL/CpfcQEbdLzyaCDwUhLzBXJF2ypinwSKs1SvDGT
	wdvS7V3ZlopeAKPQUOfFbnydL50ahy+0uwoQvvtjHIenzCWtAs+CpVHlv4IZK9/SUsp89RjpTnn
	flYBeI8N28eG8SpFe5SAFGmlPaacQGVYZ+Az41zMPiqbj0AgAVhxMLhmB8ccViNlPeauUv2LRxW
	nSN6wzMsePk9EUDAgDdc5fn9oTBOnnzEGXMjwv2gzUKsL+XaBDQwoO5ehxaeGEJ6uCbzkvwditQ
	dufKWFb1UKnqAqGWeVIO3Kp+xrSiJxeiSqjjkASNDlNp7U/7prDJiyNsdc3714Wkw8fM4YF+JFU
	7HjT9xipsBTUfpTfkJEm7iAtA3KU9MxxifvYayN0eZEdXOMQOBADxOMzezS7N+ap6O1roOFE
X-Received: by 2002:a05:600c:8b63:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4a35ae7027emr137803465e9.4.1793021393144;
        Mon, 26 Oct 2026 06:29:53 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:52 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/2] Fix rate rounding for Meson read-only dividers
Date: Mon, 26 Oct 2026 14:29:43 +0100
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMBCE4Vche3YTW6KJvorxUNoprgo0WyAkh
 He3yGEO3+WflTJUkOleraSYJcvQF5hTRf7l+hYsoZjs2V5NGU8pjwrXsf9+WNF2LrEOHGSWAOV
 4A+pLbWMDQyWSFFGW/8HjeThPzRt+3Ku0bT81nJl3ggAAAA==
X-Change-ID: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_062955_986863_6C0A0A11 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Meson read-only dividers can round a requested rate using a divisor they
cannot program. The clock core may then adjust child clocks using the
wrong parent rate.

This series uses the divisor already set in hardware. The first patch
adds a missing /4 entry to the GXL and G12A HDMI divider tables so that
all their register values can be read correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (2):
      clk: meson: add the missing HDMI divider /4 alias
      clk: meson: regmap: use the current divisor for read-only clocks

 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 drivers/clk/meson/g12a.c       |  3 ++-
 drivers/clk/meson/gxbb.c       |  3 ++-
 3 files changed, 25 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


