Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4D3606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BofvqsIi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KOh7GSBw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A+RGXs8/Ail6qHnGbLflY644jEJYQOYM38RZLvyetKE=; b=BofvqsIiZB9Van
	y2ICeDyaCbmCbUuoBKECLrjitmzgI/v2XVjj9uVUgEhkyIzgtJFjUasNTKVWyn8DkoY2wRIBI1r1z
	KqligtcgzEGUMpb03mcV3SdTYXsDArmHPd30P6Y7ev49qGg0YrWgRgTy+q93c1uh6ttlgxschlfz1
	Z0EuzrBPmoAdsU0bM9Ut2pk9yFZ4CM0wFQSf1UKFP4sicBXBkaHkPbp7VlZIHPR5c7sv3ocS4PkSz
	Fmx2rT0jJTMNXWZDvyClzFCo3eQMbxoWlk7i+5TdETu906NQor/CcBeyGKs1aG/oKS0vn7VABt5Gw
	QYMXSg7vBcIQmibH9/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Ub-00000007fHa-2Ur5;
	Wed, 28 Oct 2026 17:31:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7UY-00000007fGi-0S0U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:31:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48dfb76b304so240928f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 10:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793208671; x=1793813471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+RGXs8/Ail6qHnGbLflY644jEJYQOYM38RZLvyetKE=;
        b=KOh7GSBwdNjjLaazuJbpFu55b7f8bfvo+9+DKHXmluL22WQ+2GXDNio4DRVTWfGozJ
         OrL+zR6PxMxXtpMyFHM12Ng2jp8zpK7G7TllCLjbyzXfRM5lkLkn/Pw0vgNtPZbjKr32
         QMto+WD63h83ZhJs2wOYpgwR3fJQ2CjzAFnEEKhln/NbmOQ7b4uwNA7C8+iutrkMOI1F
         WozU8eL5qtntZyfnHE/AM0ZI+Dq4N8DWl+paBJUBkICNPvwvTfP1A68c9UZPqncPj2qQ
         S9geeg2OISxSPc8g5TgQuRZdtcP2dy+BHia2tzvD67mWV7rUE8Lh+EJ12I68Pn6eCfCl
         NLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793208671; x=1793813471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+RGXs8/Ail6qHnGbLflY644jEJYQOYM38RZLvyetKE=;
        b=dcz/5adjR4Uk3BMf8vXM+h0qaTr2xTGZyCorAn7oMq6ymadt4su9Fboo6X9g4+BKMI
         81pc5KvogXzCFK/SKKUNYuYfYV065lMFX1S64SB7lNSdIfNb2qmPqyCrCCNN85aszhqg
         RLBbMSw+0/7xfoxBiMVH+N2Mn+jQjxBkDm6IBxR2IfgI5NrGq80Yc+OB5JydcAJQu/wA
         e/D4kqx/7cFctVYjao9Qn9Sm0QRyIAjV2aGZYddhtoyrTzQ8jR0A4bnBkFzDfB+kA2cq
         WKCfMIZlLXEG3AaEESMejrGg7Z36+Tf262PcL+HqR5xYNY5oZHX+Ndhz+DcXAExIaRvn
         5P6Q==
X-Forwarded-Encrypted: i=1; AKwUvBywz0uS5njYSmtbBu13ezCBB/Ys10T3RjdC69MEtm8dmzkGOfCRh2YKDmCjdezet0YmPSjn7oeiy624EtCb+BWr@lists.infradead.org
X-Gm-Message-State: AFq9FYLxpuUSMVlJJX5UrprUsHv4njc+DOphpYNIghB5ynGBvsYi6GF6
	OjbhuoyQM9vg/XAKKVzFn8pXruxgOrpNeTymhTfm1YLbRU124KMsFh1i
X-Gm-Gg: AYBFou1f4rAbk8gaPWUeI/uX8iBDDcB4NbaYVg0SxVWnxGV//zSLSnBSX/J0hKBQOqc
	Sl2OEAmMXets5QfeAnu6S41Zjn+JVy16LUcMyYvJyKvYhbswJZdiZ0iu2vTTGGiZThbNbS3Z3XX
	o8TyUlWGi3CUBz3ErfoJ/hmyf40b7XFoTWBOiJWSre2MJAq3a3nDt1cfSsLo3ZJiBsDniNaz2d9
	ALhgd2+3F+Fsc/xOhGkeGGowWDtqe6GafTu9ptblpQ60KpSmitwAbk/2GueCFYeMYilXikYWMaK
	sHFNAwp6xNrPYRYxxgZKbKhfDtok9qmevuK6nykFJnyIvvW2lWPnpruDPmFbDxnTspQHK+vJr4A
	5MU1Rg3nl2SFreapMu5Lb1DUDGd40jfG0k6MfE9o6tocgMiBqp4HNNZLYjidhGOOEuebM15K2XL
	IjLYjpJ6nZdYtmAkJwxBAkVWIp5lQ09wJDmm9555cxPHvQMyUeXwtI3lj2QnaZo6MUm4XJ2cicQ
	jDE3xPVQA01XB+umNxnL/duh9bsYJXKYalgRQYGUsfD2ZljnyANUgFzWK5hzMCPL/jpFtg7j6wy
	YIntQGrjWjB4Y9lHQi9YP6hPXd+kHJ8jWpT8uNZxudIPWO0zCNKh9BSJsveviq9IufvbZCdTMlB
	QAfFQOAf0JjMeAHNnSS33BL8h/6UZJhJC9dAD4zGTB+PDcyDM8FHPxzYYW4Lh3xrn3QI=
X-Received: by 2002:a5d:588a:0:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-48e5d58d590mr7802427f8f.3.1793208671431;
        Wed, 28 Oct 2026 10:31:11 -0700 (PDT)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm30601206f8f.11.2026.10.28.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:31:10 -0700 (PDT)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: iav@iav.lv
Cc: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com,
	bhelgaas@google.com,
	robh@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: rockchip: Skip the Tpvperl wait when power is already valid
Date: Wed, 28 Oct 2026 17:31:08 +0000
Message-ID: <20261028173108.3457165-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-h64-tpvperl-ab-skip@iav.lv>
References: <20260911211559.207990-1-ehbello@gmail.com> <179196286749.38040.5597453767131590054.b4-reply@b4> <20261016-h64-pcie-resume-tpvperl@iav.lv> <20261028005548.2399155-1-ehbello@gmail.com> <20261028-h64-tpvperl-ab-skip@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_103114_183572_FD5DC1F9 
X-CRM114-Status: GOOD (  12.70  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 05:10:00 +0000, Igor Velkov wrote:

> Since the next version keeps the full wait on resume, it no longer
> changes the resume path, so I'll skip the A/B and test that version
> on Helios64 instead: boots plus s2idle cycles, results in reply to it.

Thank you -- that coverage is worth a lot, but hold off a little, because the
shape is changing again.

Shawn Lin has asked for a DT property for the PERST# pulse rather than a
decision taken in the driver, matching rockchip,perst-inactive-ms and
rockchip,s2r-perst-inactive-ms in the vendor dwc driver, and I have agreed. So
the version to test is that one, not the probe-only patch I was about to send.

Whether the default changes or stays at PCIE_T_PVPERL_MS is still open, so I
will put the DT snippet to set on a Helios64 in the cover letter instead of
leaving it to guesswork.

