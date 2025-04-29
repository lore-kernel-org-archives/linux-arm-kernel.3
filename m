Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED95C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 23:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XFiXDTG7h4NZVTZjiToE3/K4nhdKRi+EC25+HGPBRMs=; b=T02TVs1KsPMDQ5A6/pcEljGFP3
	c3avZUVmBZ4rDVmt7PCeh2BhfDP8phcPIAKvrWhvSBgV/zpKBTTAeZ17xiYPjkgENsDpIPrynDHKn
	HKf55sGclzpLZAtMv6uvnnZbbc70TkYK9ZT1gp3baZROunoa1rD/s7EWG3z4G8leRYJvCVRsCDfoi
	I0p8OteZHY//D9VTiEYuxMZ5IVBIZq9N2HAq89szafDKNpQWfqhba0iOMXgNi856or778xWhFbZZI
	YT3bYdKFMrCrZGblFJncIktOci6tGDAxVHqL2MeHY/leaap4frNZJEYUTsIaeP6JBx4+HQ0WHmgug
	A6+6ZqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uAT-0000000B34T-3BZQ;
	Tue, 29 Apr 2025 23:15:13 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9u8Y-0000000B2t1-1V0V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 23:13:15 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3032f4eca83so5882190a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 16:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968392; x=1746573192; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XFiXDTG7h4NZVTZjiToE3/K4nhdKRi+EC25+HGPBRMs=;
        b=WfPUpBWQWEWL4AyPCzz22X+XIR64Ecysx1g8VZP3gajWcxZQuh0XTF4xIYXXWrw13f
         1qzmTJ0wOyeCzQHYIvt2RgFipMgYJ5FK+tresM6DUdV9cvKw7qynPmJ746de3t8gwqNn
         r0ymmN7MmGFX127wrnTFfyCJ7wRCjf1oALCTbCdwv9obcuie48CUuX+wAf+8XU2HnR4H
         Ayw2vVYlHmQ7HeSz9kt0UmFkHYVqekk0PraXuSVxCEMEqBqG0aP5agntLDFoyI3kJmb4
         LZL3+dbELOFIQ7dQiLVUpUkNVtgaJI1Ce9DZ+02Ss9WJEZB2RZi3Mlz6vkq7vmZyJDdh
         APaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968392; x=1746573192;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFiXDTG7h4NZVTZjiToE3/K4nhdKRi+EC25+HGPBRMs=;
        b=wXQ3PGBGH791Y+3XPIThmEFctZqUhSAzLbbDCLFpgc/HsRxsSiPMNzVGAG7gsBtQD/
         jjGDxx4e/AGDMHHg8fF8OQQ+/sc5j3lJb2D8bhSpkDHEFDkTruzwtPu9+Qz2MZQ136ml
         XmJDZAqscSMA31EtOM5x+fNqRtcgOsuKoH3DUFF5IUxfyFPiButvvdT1TqwSCEruuivR
         k12kMbyQrzj6RQawkpnK4cyk/TMFXctgdFJrm71AYXCia7AilFZMbPqGp02tFIufUly5
         pHMOMWcatt20wY83NFkU+WGMediLGWB958kFv2qzhz0k9+pq2Ha3FRHgQi0Mp5CvF31K
         CQMg==
X-Forwarded-Encrypted: i=1; AJvYcCWSs/PxMJMbEo3NTa5ZkZjDjUABh6bLx//p7LebbfvqdhV58vnIsQeVJhY8M9mKsiHn4hpZm3GnsfWmqjeIJ92P@lists.infradead.org
X-Gm-Message-State: AOJu0YxAXcK9DuqTBaJ0JTjAOrzYMgpgqQIdKjZuYINWhBwKxSvNxFwc
	axTWUHAw1goaBV0tzEcloweV//HKn6Hrvn+haRWaDGJ9qpNXUBk0VLPZcw2B3qzIYgRpqnztmx9
	p
X-Google-Smtp-Source: AGHT+IGfB+xOaI+3DToObDK7cBzH7hVJ+FZ/zmtg7PUwy736+JMV/d1hOAVjp8W47jHU/BhIDznpGvFMUtY=
X-Received: from pjc13.prod.google.com ([2002:a17:90b:2f4d:b0:2e0:915d:d594])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e50:b0:2f1:3355:4a8f
 with SMTP id 98e67ed59e1d1-30a343e4035mr681093a91.4.1745968392557; Tue, 29
 Apr 2025 16:13:12 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:12:58 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429231301.1952246-1-yabinc@google.com>
Subject: [PATCH v5 0/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_161314_398767_248221FE 
X-CRM114-Status: GOOD (  12.38  )
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

Hi Coresight maintainers,

When tracing ETM data on multiple CPUs concurrently via the
perf interface, the CATU device is shared across different CPU
paths. This can lead to race conditions when multiple CPUs attempt
to enable or disable the CATU device simultaneously. This patchset
is to fix race conditions when enabling/disabling a CATU device.

Changes since v4:
 - Collect Review-by tags.
 - return -EINVAL for unknown types in coresight_enable_path.

Changes since v3:
 - Add newlines between variable definition and guard().
 - Add path parameter when calling coresight_disable_helpers.
 - Use "goto err_disable_helpers" in coresight_enable_path().

Changes since v2:
- In catu_disable(), return 0 when refcnt > 0.
- Remove the patch checking enabled mode.
- Disable helpers at the places where a coresight device fails to
  enable.

Changes since v1:
- Use raw_spinlock_t and guard().
- Add a patch to check enabled mode.
- Add a patch to disable helpers when fails to enable a device.

Yabin Cui (2):
  coresight: catu: Introduce refcount and spinlock for
    enabling/disabling
  coresight: core: Disable helpers for devices that fail to enable

 drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 drivers/hwtracing/coresight/coresight-core.c | 11 ++++++---
 3 files changed, 26 insertions(+), 11 deletions(-)

-- 
2.49.0.967.g6a0df3ecc3-goog


