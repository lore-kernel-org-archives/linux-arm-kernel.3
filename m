Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE913F4BB93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/7wTU2wqO3eKHYFN8DRzgtidY91chf6u6I995CUEKtM=; b=idynNQz5QIRXjaiG9Tds5Ot6XS
	9G5wb5TEjmzQ340nkobOQ1cs5VuRVnfwVq5BhTeiyuHCbFYuBSXtAXkD1FiG/saoWHDPleow1FedC
	WOvzkowDVm1L0GsRlNrPfnyeUsBBdmzCPJEP15Xq8obyfK1L+rOoimuzdKQ8j60PkrM/NZxn6F9fc
	Fuhm0M6hcb5KYJTymPnuNwPmnptDND50qhaBFBpQv8tWUpYxSCpxK3X7qkHJuhHxwzwWHFL0gEM3S
	bPVwBf29y+JfIIvgHXKbvAJDAjx/X9xuo8qAvl65Llwv2Bb4b2jxKgnKpBd8okpNJuTon69S1QwnB
	g18lbdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0Vw-00000002pmu-47sT;
	Tue, 24 Feb 2026 22:04:20 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0Vt-00000002ply-3wJv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:04:19 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso325080a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771970656; x=1772575456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7wTU2wqO3eKHYFN8DRzgtidY91chf6u6I995CUEKtM=;
        b=mtTaf11+qTR81vK1xYGCwwUhcBYBIqWi8SPkpvjIXvKV/+CVVmv7TEhxNhy7VNG9cW
         PSlVJliiNZjTY2GGOVDZ9Nx2egyKjBGwqtBkrV6Q7kBXLucuxrEGaP6QggWA8XgXvFIb
         vqD2smZKz7WfR8Aat73/OE7rwHXOj/ELRDfTsL+x6V44OHI1armzTXoXewKPlY+u1l+m
         4RnsVEVgFQ+aYPSCEHoCSXrxuvF0zKDSFlTNkSNAPsrCql3HRtWQEOPqHtusgiVZ4ktG
         ii7vXn4de+wSzd4/684VGBFlxOOKfa+MDl6HO8YzVvSfcIZgI5ippXoyDqIE8wLI3/VR
         NyWg==
X-Forwarded-Encrypted: i=1; AJvYcCU0IT4fiJ+WydEEhL6LmJaRjKGei+ieNj6tvYZRnPYWbrJGnIEvuYnpKHIk4rM5nwEurVY2RAQqNvLqNCDGFoH4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0exzoqO4Spm+YKysFnUT7jz/ymWgFrjuMYHI/+0d8Gxoo71Ca
	smg6CS3nDOxHI36d/Iveidqz6wRzA03Fgg55gXIJhlvOnPzbFSzoCaidEIBInJarlMVeuXEw6Ww
	Vc0riqbMi4pPH53tv4AmGscfR73h+m1HeueoDglA1v8J3sy1I22Dpng+Nh2EtgROLDRs/PWBES0
	7fI5qXebaE/MWxEgcOv34t8GG0bry9An3DO4QstbV2Lk16winwjM7nqqdQbB/iNp4igeYOb7N/g
	DahvNUUDxt4oqBIrYpj3ofdYeU=
X-Gm-Gg: ATEYQzyEV1ty/MgrY0/ovm6PJ5cfPbwq7uN2jAaXLDYQ4RN1IAyX9+TLz9Mny7tzGG8
	pjTHnXJwCGNvtolGva/EHUNggN0LnR8JT2ohG0iiz0I+qghQz8RKyf7jQaI1MUneZzAefyMxJ/p
	pDQyQbID1qTzyc73nMW/8CWcMax7SHsnjXJBxO5Rs9G0yVNIwC1gc3Vb5hoQMJR+QURDertZd3w
	Gc/tAHmSD2FsMAFe6FUBgrBiA8kbsGlXfu/yy27Q81s15aQutwlgHXHKMeq08tZyIZMoT0W516H
	rMOrKi+x1QVfQdG3gPp1Ul42mnxAg6BnDW1q0e4Q7L8Q6vZIRw2L4l41GztB5f09PTCiz+OZxLO
	CifzX2ni4335GDNEJG2zyvbuzHAinj2v8y+wyP2uSkYO/4l7cBYsSHqzC4RRhGE8BUUDrT7PEDa
	f2r6P+B2C0287B04s45mKekxUIOpno18BdDrx+X0xWoA9AJ8dhfgh0Y22E
X-Received: by 2002:a17:90b:4d90:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-358ae8c2d4dmr11844513a91.23.1771970656303;
        Tue, 24 Feb 2026 14:04:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35902bddd2dsm137597a91.4.2026.02.24.14.04.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Feb 2026 14:04:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdb0c8c5bcso622539eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771970654; x=1772575454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/7wTU2wqO3eKHYFN8DRzgtidY91chf6u6I995CUEKtM=;
        b=aNUph2p/JhgUoMArcZY8qDcJJLfLtgYvF94ZGNvMu56dEevNDdYj32cRRBouxWhk8P
         X8eVbOu5Kg3EGhN7DRUIfKJdMNkOovERcfIsvUXtTNhBMoPVtSIewgEQLhu//H/uwjnC
         mMhimjdJBMdCk5RrNPWuTBU304cs5jWpJQlRA=
X-Forwarded-Encrypted: i=1; AJvYcCUnl+GPTtrnIwujHN4b7L8a/rD7eDgVmaK/OEY87Qezc+zDJBJpgcJGLxRzM7Xla9l8PabH/r0eTJdo5uii6T1Q@lists.infradead.org
X-Received: by 2002:a05:7300:bc0e:b0:2ba:8f47:fe4f with SMTP id 5a478bee46e88-2bd7bd24d3dmr6232092eec.18.1771970654347;
        Tue, 24 Feb 2026 14:04:14 -0800 (PST)
X-Received: by 2002:a05:7300:bc0e:b0:2ba:8f47:fe4f with SMTP id 5a478bee46e88-2bd7bd24d3dmr6232074eec.18.1771970653607;
        Tue, 24 Feb 2026 14:04:13 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdb055507bsm2374822eec.0.2026.02.24.14.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:04:13 -0800 (PST)
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
Subject: [PATCH v6 0/3] Adding brcmstb-hwspinlock support
Date: Tue, 24 Feb 2026 17:04:04 -0500
Message-Id: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_140418_009780_CB5AAB17 
X-CRM114-Status: GOOD (  16.17  )
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
larger sundry block address space.

The compatible string uses "brcm,bcm7038-sun-top-ctrl-semaphore"
based on the BCM7038 SoC where the semaphore registers were first
introduced in settop chips.

The patch has been tested to work as builtin as well as a module.

v6 changes:
Addressed review comments from Krzysztof Kozlowski:
 - Renamed DT binding YAML file from "brcm,brcmstb-hwspinlock.yaml"
   to "brcm,bcm7038-sun-top-ctrl-semaphore.yaml" to match the
   compatible string
 - Updated $id in the YAML to match the new filename
 - Updated MAINTAINERS F: entry to match the new filename

v5 changes:
Addressed review comments from Krzysztof Kozlowski:
 - Changed compatible to "brcm,bcm7038-sun-top-ctrl-semaphore"
   using the SoC where the semaphore hardware was first introduced,
   following the brcm,bcm7038-l1-intc convention

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

 .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 45 +++++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 11 ++-
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1


