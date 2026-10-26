Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF760A260E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MlDnP0Gn;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MW8F0WRC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=; b=MlDnP0GnFMV9bSQw0pmFyzW4ZN
	YkvVuKQ+GgaF3qltKzRT5mngQeSVkncf2CwDK0uqPxV0W6DDaAZFDEqef9udhfYnyc5EVwLiaKQsL
	Ay74QXXlFrG41dmNN2w5RzatcYcpWDBx0yVyEUHjd/37CJT1piX9r02sItbeiVTL6wC0w+FOf3u1a
	i9uY9EzbDIQ1Pzdxt4C0Ga9/7M6uLf+J6m7wCYxtytq8actYfTlMk4OMqF55T0BU8Q7ao7kuXlC/N
	Gr3FZiw1yoM/WFVmRLF8gJsIdAu1aS/wSRRrWBJQPMSViHJVpq3l3zpLG60jz7lZIjNCTAcDqkyZY
	im8Rze/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHeI-00000002ELa-44l0;
	Mon, 26 Oct 2026 10:09:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHeF-00000002EK5-1O6o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:09:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12231805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009385; x=1793614185; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
        b=MW8F0WRCxxE3FS6YQiMWw1OnLUiCesW7LpfjXtS3zWo5Pu/QtB/M/jnuvG3/77eQzt
         zCtomtDDMFvnaHgcXUhtdvaCtAitWlrkHkyrjb4TIa/rC9TR67Omyl4MIjueuNZ7bajU
         BNzft29tUN6urtzfMA+gshuK/Nlv7AYZCKUpowYox1478aGYsMtYcPgIg7doJhqFWMeN
         Mds97H1iGExpJku+3V1aIjZyNdqJi7Cr3nZps2K9Yh4/QE5Y7WeRDWC92RzXNoSCKogq
         B3U3e6RPqnRZviWrB4XvjiTV0DfJukCgug0VNhy9w77g14j6EWAHclWuoZdBqcow+oz7
         y30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009385; x=1793614185;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
        b=LOd7AyNcRI4gG1siKw57GprBd4IyELfwtd8vVTaPiOChxOu7QegBpXpEtDG9uEpdSF
         4JY98JkmzSLObhuCZ8HrNWzBCQCgGxwaQhhOOAsJa5O8lekC9b0o3Jy72yRqjynU7zvc
         wzjc2vy+ujILrx72oU25Dh8+DS0Lyn9fp4a1U3zJigpKoPOeywZMcMjAnSWgHnkHrc54
         aYxyFfYhujoWic/fuJsWGDkE39vHilzx+n2ERwvyNTjm/qeeI48yRH8er03NFgjxwQco
         ZnUdCfC7h685PbYzsiAZ4lR/dU26xNJ68mi7//c5cyHK3TluzjhL8qXiabmozCbSFEMo
         w0WA==
X-Forwarded-Encrypted: i=1; AKwUvBxTkPuh/fiCLLAGtkFwpa0/bwy3lW1NpD7cDra+o9EGHrYJigWmFd+evEavDy/pqpbZTjhDUKatsQcz2ngGJpBi@lists.infradead.org
X-Gm-Message-State: AFq9FYKuMm5kViGREGLb2/TraNPieHbVBHk6J6NXMp6jxyItrmY4tDcs
	oj5yQw5nvnZ+yAY/UulECyDOxryqzFCZfX4W+4GYqE5MU1sjfb2ig0DF34p1Oy9yAA8=
X-Gm-Gg: AYBFou0f57IXFnODzFhHDuTjU3YmLtf2EBNkt5VSOlZRJQqo5glahlDgondXNSHe7x9
	ojxr395rw7l4x8P2PmONW5G5dJ5xQuKiZyw1A5QCsECM6bHXq7yuTE6DAhZ/6i3Xskrt1zBtRgG
	dtg7fQsXAMzonAeakq8eitcGKiumgRZNb5zppFpubEOfom+Ye9gnRFvjE9p4NVcLbX57d1E8r/D
	TjzoBKbeXlgv8pYqoXcxWnAfaj7Z2o5TVEUltC/uD3A5z2/XW8kpqr8hkgpmDClQp9zO2uQ6Bzi
	0Q8TgX4AKrA6nPUmvh874ge0vhKGYh7BbM55sYo9Pe7GXq7eIh6OrIR0SSWncwmxTD5TwPkgviK
	4TjTgqq5bhWQYLczB/LcCHx354leByZ0ZgClxykDONmei7e6TCzqSSNEBa1jnRzP8B3wmayAHFO
	WHzmBuBYFpmcAN7vE2DYdpenFr64uUwywxoQu2c99QxdCRLIO+TF+wl6ebLiQ61x4M9aYUe/MzE
	pjV9tnN/Q3+gyZ1+QF83kdeZC/MfPTbKfHS5I1T+Ec8RQEm5vsH8eiZ0KCBlpkxjwg0YTzhdO+U
	USp/5zDZzpocijCzlv+7eTbtRmEKcssB6s9o9vkOZQ==
X-Received: by 2002:a05:600c:1d0f:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4a35acc76d6mr115228495e9.32.1793009384948;
        Mon, 26 Oct 2026 03:09:44 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a59d998sm191748665e9.15.2026.10.26.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Mon, 26 Oct 2026 11:09:29 +0100
Message-ID: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=p8BCvf4WNLvDTsTcauj4vL9ILkW9KOR07cSl5g6yvHs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3ybbdZZQCmOQEwlRereTB+cpQErFhNTawdaYm 8GKarLnZ5OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m2wAKCRCPgPtYfRL+ TiTnB/9q/2uqQ7mxzRKdtOBIs8bbAq6IDNldcSzkBYE882FHSYLuF69QzQGYggbfdshBZF6KfEi 72spEUCb74/WTgDet3zcw610iMpBONFQx/bnX2ygNae5l3T8DwcJ/QLRfRstK9JJBodno+45XLP qFCvgs1ubvMdtdoBLpPTCAmEADK2B5fhqO3+LuR6opB9OseqLp4zSO4/4GF/YxM9aZoLnD0V0Zw aqqoMBTyaJNu773gIqT894WQGRijP+G+Q8hiA8RsiEbmHCXr2rSjjEE34SYCF7AQp7nQoeIZX/R 0YHk4Zo2OTearFppBqodw/347Sk1klnFu9Nxl5okTb67O2W6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_030947_389328_FD76953A 
X-CRM114-Status: GOOD (  10.27  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

I'm currently working on remoteproc for ADI's ADSP SoC family (SC598 +
SC846 and others). On at least SC846 the memory of the remote processor
isn't directly accessible by the main cpu. (The memory is mapped into
the cpu's memory space, but cannot be accessed directly from non-secure
EL2.)

Instead of creating another near-copy of rproc_elf_load_segments() that
just differs by the memory access functions, generalize this function
and make the driver that already has such a copy benefit from it.

This is only compile tested.

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  63 ++++++-----
 include/linux/remoteproc.h                 |   3 +
 3 files changed, 69 insertions(+), 117 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3


