Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5A5606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 06:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LOIJH+y8;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F9AEB5Le
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oA9OvOIfFIXhU1CLKiK77BzQLTal7gVWqxQ2qyRWaBc=; b=LOIJH+y8IOnjp95J2Aqfw7JQnB
	Z/YFbrjEDsI1opj1CrecuD1PHsLR1nSyTiucxWAOWjsmChF5Q28MY7TWCGOlzV1HwcvX60jSn3mGP
	oFgEctPji+PPtFS81++XwYXk9uwvqzj+ZXndgUYQKE1ghl5P7YBBu/hHsRxAcOpbU2gnVEFBxYZZD
	psI85PyPTcDXgbpqaneqi+YHHsP03iCpLBksO0UVEMf4IoA3LWBET8bOgwcgebPZCPYD3I9h04a9L
	r/DbiKMOl46kreyF1NkAFauBnVdWD/RVLeiCVBiAd7cvBRIb/W0RAu1SDsG+x9+aYf9TmcMekBPXc
	5rmIQlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD5x-0000000BJYd-2Brf;
	Fri, 06 Nov 2026 06:06:37 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD5u-0000000BJX2-16X0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 06:06:35 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1b244fb7fffso528411c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 22:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793945193; x=1794549993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oA9OvOIfFIXhU1CLKiK77BzQLTal7gVWqxQ2qyRWaBc=;
        b=F9AEB5LeW+pAeK0HfpVtKB5Tjux2HAoaIzzHkkqtS3hoVoL5cQZwnj2tBTygKoAm9s
         52mkREbOxu9DQtZ+6NOcRo1er3sG/ZmjwNTnkcygHJN00IhWLmNG602kPf94ilXPIsea
         qRvluycgWGUY/0gKhyM0h7Hsxq91P73qCFe0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945193; x=1794549993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oA9OvOIfFIXhU1CLKiK77BzQLTal7gVWqxQ2qyRWaBc=;
        b=tmYfCI6fzSqRN3mUbcSd/bLgWNhl11zVvl3ND3jQ67L3n1SxHTpeluHm6fQyswm5D3
         vh8dtvyb/2btxDvoHbtrPPhHLw+5VRN6AIIslXqFSoYK4AK4ptRxoXrOCdC6CmJs6WL0
         jPN9op3/uU3AUhMP0WOqxRR1o/9AxFiosy+OyGrDDraeukzzCqlUu1MgxFuLC/BjIrYT
         X8EsFmoL4mttNwDi9U1XB2306pymp85p86t7qdRAVany5neWmKelCIfszVoZpGFoogYt
         RZqIwjab1YPLq7C9Hp9aegnOrHmm5hPQbNfj8wGCGGW4WzvqfjulX0iGChLZB2K3CqaL
         BSIw==
X-Forwarded-Encrypted: i=1; AL+hErFOsgOfQpxz7xQs5FIkZGjOD6g5ijT3LnVMaDutkthaojx0zvdZpJ+Vak6rKrwdlW6Ws9uloZyMUbHEYXE9Z9PB@lists.infradead.org
X-Gm-Message-State: APuU4Z8Yojrfznk7w2H7GsVpl9shg7vRckJ9qqwd9voOtv027NLIE2h9
	+XUEvksFNA0TUmrMmZrLWjCcNw2nLUIT57t19UoNJGlEW0Xus5kDqPYZsxL7AThfNw==
X-Gm-Gg: AYBFou2iLLm8OQ4ET1F7V3ctn7Ebnh80LMDS1JDmn7wy2F/7Nch7vrUgGqKzPxv2DEp
	UjYyJ0lUr/DNJraTRw5/r0bx+WQp2azY4oWPIRjEl15UFohZ7eyzQGK8RIKhZOWC7dGoA0cBayx
	xeldEHk5t7RmsK7fI+sJfSYA0wCV4TkpphWs5wqMfHiy0moAlbYIk2Fve3B1LNrilWI4LlUvELc
	XS+VAAu8DOq+P5p1szx4akQGlKpWrFU1dLxmo+Ng4aDTdLphytdM8X70Bx3efyME0Ic+c2JK47A
	nSufzyWkbhP4ZifRzEslVqw/Tc8YPGa0FUHidx1hBlTxIMlmGp2sxH3MPZlA8ssYtsR1j9/bW7S
	tdPWF+gapbi8gSecKaSPCqJWQipQA3EEIHxJkm6dbV1VVBHb6sYebao751U2KyY0lidKfIBKyj9
	0NMGcVImIDoGMXjPvYGuCmJ+kkI+V3mYBMHCOMyn3OAdtF2hhAx+bNXT239Lk2AUwmVQA3Zlk0d
	lp470sZhUN4DvTQTcQYJGDqi1Oeop7ZS0w7g5T9jcSWN7/KmZ04Ngr8245H3Jt31bYCnS3GMyWu
	A1SAFjgu0ADY2PyaPGpaVC2C9JEKM6jGZDHU06vlwineFzQ+jtc27+HpkfBK2TRTZXzjD3u+rpX
	rztFiba3otu9WnQ==
X-Received: by 2002:a05:7300:f586:b0:36e:2b8b:a09e with SMTP id 5a478bee46e88-36f76c1875amr1931679eec.34.1793945192713;
        Thu, 05 Nov 2026 22:06:32 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:f73e:d73b:c0da:5b05])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3821809eec.6.2026.11.05.22.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:32 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: mediatek: mt8390-genio-common: USB fixes
Date: Fri,  6 Nov 2026 14:06:17 +0800
Message-ID: <20261106060621.2706658-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220634_348087_826FDDC2 
X-CRM114-Status: GOOD (  13.58  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This is v2 of the Genio 510 / 700 EVK USB fixes that came out of the
MTK XHCI binding fix [1].

Changes since v1:
- Patch 1 now also switches the type C port to a source-only port, and
  limits the source PDO to 5V 1A, matching the hardware (Sashiko)
- Patch 1 now connects the SuperSpeed and HighSpeed lines to the
  correct USB hubs
- New patch 3 fixing swapped USB hub labels
- Link to v1: https://lore.kernel.org/all/20261103083335.2944847-1-wenst@chromium.org/

Patch 1 corrects the USB type C port: the controller operates in host
mode only, the data lines go through the onboard USB hub, and the port
can only source power (5V 1A). The block diagrams for both the Genio
700 EVK and Genio 510 EVK were used as reference.

Patch 1 depends on "dt-bindings: usb: ti,usb8041: Fold in TI USB8020B" [2]
to allow graph ports under the TI USB8020B hub nodes. Without it,
dtbs_check will complain about the new "ports" nodes.

Patch 2 moves the pin mux for the USB hub supply enable pin to the
regulator.

Patch 3 fixes the swapped labels for the USB 2.0 and USB 3.0 hub nodes.

I don't have the actual board to test this on. The changes were only
compile tested.

This v2 patch series was partially put together using LLM. v1 was done
by hand. Sashiko review comments were fed to the LLM, as well as the
datasheet for TI USB8020B. I manually checked the PIDs in the datasheet
before giving the datasheet to the LLM. Same goes for the board block
diagrams. The changelogs in each patch and in the cover letter were
also put together using LLM.

Also, the LLM seems to do a decent job at mimicking my writing style,
even though it's a bit more verbose than what I'd go for.


ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-11-wenst@chromium.org/
[2] https://lore.kernel.org/all/20261103095425.3097720-1-wenst@chromium.org/

Chen-Yu Tsai (3):
  arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and
    connection
  arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable
    pin mux
  arm64: dts: mediatek: mt8390-genio-common: Fix swapped USB hub labels

 .../dts/mediatek/mt8390-genio-common.dtsi     | 76 +++++++++++--------
 1 file changed, 43 insertions(+), 33 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog


