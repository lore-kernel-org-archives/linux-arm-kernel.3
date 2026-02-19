Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04532C531E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 21:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LrI6BpFC3eI6yOKYRJrMT8qJD2DqNlsDbhGThIhmnQs=; b=m55f2nXfGrKiAMp5pNmlFZsxnP
	KYXLsvNCmiIBr/EQUCN8FuzdWuVjQtNlH33cQeBhm2eOvxHjBaaFe270Q5useNk6x1VqSVud8apsd
	N945bWh/rnUJHb1uwX0rBiS4iC9wnDFt2xp1OWHd4O58gc4gpn9l9vCxgwJy8JallORi4P+x1J5+G
	UbGMyvnmSLYndalyuotKS0aiwywQFkEVU4FvfSgs9LDFduZPtz5qntUmRL0KF3bPDIAts3svH1OUy
	Mp3iLgszyCpfvsJRM47ahyJQL0SY5+zpaIXolyviE+gWcqgi/1jRGRtOmIaIBpFUvKK8dWqBBaQz5
	tPKWFIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtC1L-0000000C7Kd-45uV;
	Thu, 19 Feb 2026 21:57:15 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtC1I-0000000C7KG-2UuE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 21:57:14 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2ab232cc803so7213375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 13:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771538231; x=1772143031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrI6BpFC3eI6yOKYRJrMT8qJD2DqNlsDbhGThIhmnQs=;
        b=wiudNLTMlHJg2FAQdlgd0b6+JWZT6QOzxskDEtFD3I4EdT3gQ0iA0rkw/taOhg6syI
         AuAeCdNrjvq/7xKwPHtKBu8H0duc1KY6WtpzctUfQxOxC5U5009301HT0AUCoijvYSuW
         VolHy1QlGFqP+Z6HtqGNb9C8rs+7cozTa2ZQOx4OtvlUIOwBKq9bnYMof8wGVv6/dccJ
         bpBvO02vLOb0sG+K93h+Xnocx82lShnDf30IKjQXH8SD4cUl0Jb0qK9sd/hLKZOfgaIL
         +mFkUNsm/ChoHlCqPQlbMIoCUTQVKjFxB4tkAZoQT5d/l+o+qtSESx/Re1hHsQqUHrgw
         pymA==
X-Forwarded-Encrypted: i=1; AJvYcCWqC3ztFgu50FbTn2lNdibb/W3wSnpzb0dO7LWbDVdixyBtk1Rp7PmolW1URgt90O9XhPW32aiObhHkAL81WBxD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx0XPqqJcSm/0nwg7Mf/3LBMnu+2nz5tuzkg54c6zAv/evlYDY
	ag/uA3BOgbk31MpOUsHgp6Bzqjo4oNyYSmo6w4xYSlxjbNyPDtlWobQ4Mv5CuJtQQwse4tA+N3w
	AcDkx8G7cE8lg35ywI+wYIRMKy/cOYhwTCXqkNNd0+WPTSTkuCCTKrJHlFiKVDYp8D2TSn0Tkr9
	LY/LlySCTWTiSKK7JtkstY2ne6AXTIweW6c9CQ47MV+MYa/rJCQCwi/nRdAGyBueuH4Z1XzrmzQ
	QrSrs4RTsi8y+y9VP0W8umCP+k=
X-Gm-Gg: AZuq6aKw9PsKgkJDF7xKLfBzkhxpL6H9eZ2WADb0H0TDye2LNQRJpukgHOvX5+hZKNH
	TPP5//wsfIxGxb42Ac3EpHRSJWiBsQxpXlfvMJ0kamILZjbRZlxbuGBPwMMQkRWUIQgQi7HnNCN
	LGZ/0UD1DLyz839TM5QgMob24iJbBd5ku+oGd9rQIX0aVmxMlukTaJpcztrYkyRY2+BZVeiihSc
	ydc/g9BtrnCxJhjisF0HdcD+nRfFlszWE3nDvKyxMJckRTFMqbOM7LBS+PQbLcEUiKtXX5Langs
	uGZB4vr/ITxr+l3up3yiJFpAkK1aTANGvAc6FB5HBnw6YQqCqf4Pfyj3qZPN8GhYzeZAhxn00q5
	St1YdQYe5vjXXYuNVXO4ewvkOcjSyy0P2rIbLZ1B8yk/5x5LtDGBBZhsCuzu5LCMp5TrBDriUpo
	Xpb+cyKGEaTuwYB0YCNwRqN/7g53XmBy4vidwm6RrJwGNugRsOv9Q6FEmJ
X-Received: by 2002:a17:902:ebc8:b0:2ab:3ac6:8d01 with SMTP id d9443c01a7336-2ad17515116mr192408075ad.29.1771538231149;
        Thu, 19 Feb 2026 13:57:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ad1a8bf49csm22853865ad.55.2026.02.19.13.57.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:57:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad3f8367bso15144055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 13:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771538229; x=1772143029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LrI6BpFC3eI6yOKYRJrMT8qJD2DqNlsDbhGThIhmnQs=;
        b=TS4IMuBthgiF2hEVxMM2W5I8HCjhY29peWSto2rDsJTv+sgc5aftxRHCqOjQzRTxa2
         qBKwc5CSNLj8tVcqZZAXy7TX4bzoxWw8gy3sDdrPHPw3QA2mXUuco6sr6LNdBVZdM2v6
         QSnmz0/zTzrtnjSxK1InkFZqicQsid0gej6R4=
X-Forwarded-Encrypted: i=1; AJvYcCUmN5jo246LzmyYhhmkrmltyANb3hh9/1cKXHJuiIgduGESHw9PRnA6Umpz6ZlUhTBavzB7d7tcAuO7MvOoHwAR@lists.infradead.org
X-Received: by 2002:a17:902:f647:b0:2aa:d2a7:ad2e with SMTP id d9443c01a7336-2ad17515e97mr214771075ad.36.1771538229573;
        Thu, 19 Feb 2026 13:57:09 -0800 (PST)
X-Received: by 2002:a17:902:f647:b0:2aa:d2a7:ad2e with SMTP id d9443c01a7336-2ad17515e97mr214770935ad.36.1771538229117;
        Thu, 19 Feb 2026 13:57:09 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aae9d73sm156416065ad.77.2026.02.19.13.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:57:08 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v4 0/3] Adding brcmstb-hwspinlock support
Date: Thu, 19 Feb 2026 16:56:59 -0500
Message-Id: <20260219215702.63321-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_135712_681949_E69BC447 
X-CRM114-Status: GOOD (  14.95  )
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

This is a standalone patch for the hardware semaphore feature for
all brcmstb SoCs that have the same hardware semaphore registers.

The semaphore registers belong to the sundry hardware block. The
node describes only the semaphore register range carved out of the
larger sundry block address space, consistent with how other upstream
hwspinlock drivers represent their standalone hardware blocks.

The compatible string has been renamed from "brcm,brcmstb-hwspinlock"
to "brcm,brcmstb-sun-top-ctrl-semaphore" to reflect the actual
hardware block name rather than the Linux subsystem name.

The patch has been tested to work as builtin as well as a module.

v4 changes:
Addressed review comments from Krzysztof Kozlowski and Rob Herring:
 - Renamed compatible from "brcm,brcmstb-hwspinlock" to
   "brcm,brcmstb-sun-top-ctrl-semaphore" to use the hardware name
 - Added description block to the DT binding YAML explaining what
   the semaphore registers are and their relationship to the sundry
   block
 - Fixed typo in Kconfig "Setttop" -> "Settop"
 - Fixed email typo in MODULE_AUTHOR

v3 changes:
Added detailed explanation in the all commit messages as per review
comments
 - Added description of 'sundry' ip block that the hardware semaphore
   belongs to
 - Added reasoning for using common compatible string

v2 changes:
Addressed following review comments:
 - fixed ordering of obj brcmstb_hwspinlock.o in Makefile
 - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
 - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
 - Removed unnecessary platform_set_drvdata(pdev, bank);

Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.

v1 changes:
based on fixes made to Initial patch:
Link: https://github.com/intel-lab-lkp/linux/commits/
  Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-
  for-hwspinlock/20250712-034624
Link: https://lore.kernel.org/r/20250711154221.928164-
  4-kamal.dasu%40broadcom.com
  [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed.

Kamal Dasu (3):
  dt-bindings: hwlock: Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 11 ++-
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1


