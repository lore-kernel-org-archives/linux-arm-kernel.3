Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D414606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3VQetOa0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q2KMi/LV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=; b=3VQetOa0IMjFMZfErCBsroPyu1
	AuNSBsbuGVhDe75zj1WTVHFvbmMFfy4/iM9q0Sy7WggQdE9bblMCF9qNsWJjNFzOKanG+FamL34RX
	BMmLiLP9RLd4YFc+hY3zmj1UsKGzDfeLTJIAyrp4NriA6Dc+o1q8QOOldD9V4pvPFU19cIZGDxV3T
	HYguk+sTuKCIItf+ACnFeCK/4YScb9GsZImYqrJLJJKDMJT8HtXTshC6/NVEtlRaQ7IKxhd1j85gW
	DSPZjBLFCkBbjI/yqbC7XRvSxu/VDi8zyqrlzGvCEia0CqUnKx4O7oQ5NNg7TqPjO9VjNadHHLSah
	bNoQhe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAsU-00000009x1G-1B1e;
	Tue, 20 Oct 2026 14:31:46 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAsS-00000009x0R-1WgZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:31:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1904650b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506703; x=1793111503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
        b=Q2KMi/LVGULK6R0EaUGgckCleRWi5WKdmO9ZBc6RjarxDtA/a5M8xE+Brkc11d/oJV
         BlSskG6FjYa8ztX0ZUmPPAQgSaVEw6Drdapck/u8iMbZ4YhTbhh4g2X786doOMqw+ZYl
         qc7K7P8AJD02ef3UABm7xTm6x4GIcTdOKCRB4SEVysQLRzhgJcdNuRqGG2wv1QRb6dHV
         1uF09xncgcn29Yc6s/EfMJxoO/RZciQ+l/phSMCATIMzgerxPslwJw8Ctzjh9EvI8FnA
         ChlA1BQkUqX4+ke7aAFsf4tTgOMVAwdIM4rbHDCf+oN8+PawPVPoa7uAfxl+8iqmZZch
         X18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506703; x=1793111503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
        b=g6CbUFObjVV2KhckuWfSk1DYhqLl+Bz9LButAg2UBDjyQ07Kko+kFp7xgvTluwI3+/
         yc+TbYqdjSVJB3qjRO0xTZsZyrhzlhYNcHT4zr7rLHLg5zN3bvQO2pZaYcdgk2UGRY+o
         bj5T+pxXysD1coPowcSOsSa7cwYVMNaOkq/G6v+c4YSbDNMHvrEldY8apWAfYcIAVO+H
         IcJMWe2414V/SmjXthNO7yy1vLP6pZaqg5bgaXJ64ag8GJatd2+CxfPdUBfsJ3ksQw7v
         Srko04SJJRZxgiVARmqJdgFPTAxVr0AZ+dmTPRdXmDtA0oNXVG76kwdhGngXFHLK3Q1Y
         tt7A==
X-Forwarded-Encrypted: i=1; AKwUvBwGb87z2W1wfiO7Me9JbiP+WZBXt2xh9VWTZHOHVEk0+eHNBoUFydYtU1HQU1EkvkRXANJpQvogY4ZfCp4FH3Kv@lists.infradead.org
X-Gm-Message-State: AFq9FYJzni+TwYbAIlGbhNn6Je1ALFPWhPTTiCW3k5G5FndXCF4MN5vb
	nBirjSa5s7jatmqrbHzRopRKwAgGSL5/bWl7+7Ej/x+v0MjEQ1Agb6GB
X-Gm-Gg: AYBFou1EWpT3x3Im2neHVDvvR/kU10OyFbG/NOaMC4y2AOFG5OCwfkqxnOSHrSZMZRH
	o3wr6cLT8ggXMbVCs13kV06ocEZwyluXbxnvuNvc3hfgv+VfXmikJOegxjyJc652tBzdaCWKx77
	k5pyYkqGMI05XfWsQPQJr0S7IAz7YCCdn9SOktZIm/CCfMq5Mfa3uyn/23/E+x8/MLG6Ad6d3nS
	5HI3VupSOfb9ZzDWOicaFQSvIGvOhaG5Gfar13XXM024TpqVuOPOj+B6i3hi/jP0tqUNiP1xyJ4
	1HefzxpR1EYQqnhhywaT4GOblQkhl4+kqjjUtUzqDBqlkdYOUNd5KXClL7tW8Ue5pS54Ocae81M
	vPvEfZ31J8VNWo1SU+1p0trYzZHCj9uoL+98LYJ2tUK8RJ32ZkTr3BzXNsiAw2HsClz6Kd/14C4
	EyXjPVzzEbs0sL3iQIEDhFuQDBZ31NKW/PEX4pG48V6xBwiuEWqdQgFYSUHdGzI2ZBVLv57J46M
	A96Cxk0zOO2d0kMAL96jSR8gVLiu8Qibw==
X-Received: by 2002:a05:6a00:4b49:b0:869:84b4:4b36 with SMTP id d2e1a72fcca58-8a04be69ef6mr8251834b3a.16.1792506703265;
        Tue, 20 Oct 2026 07:31:43 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4789001b3a.50.2026.10.20.07.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:31:42 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Tue, 20 Oct 2026 22:31:30 +0800
Message-ID: <20261020143135.623897-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_073144_436393_435E4EF7 
X-CRM114-Status: GOOD (  12.28  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C. Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  10 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 372 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 133 +++++++
 5 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

--
2.56.0


