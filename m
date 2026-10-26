Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B795606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GnQSkKA2;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZdqDsYNX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=; b=GnQSkKA2QETZcxFow2NnuXn6+q
	SVnW2A9KSJSxbo8ZmHh5bv5M95zzcnkJlgFvQyh/Fi3VrVvbrVBB5wz0/ce/VOICwd0eH0xSe8Au6
	MfpLD8r1jKeE2YvCVmgqptP/pAoFsSWz5k+8cWfp2o4mA7nWKFUkAWhXCGACmOKryRvMQ7XUfd0kQ
	/X4LUq2uLZBffgozhpbshTiJhqLUQpDbKmTLUos+HfJhapZyqFsnzXDfGf0mOsKeKHopTMvC/gAY4
	KQuX8nUjFsw5rAPVwAm4IsXsFE2+1kGsTCz1664wGI3fshg5A41YC3tojXSi9S62UOJ8FRQY0lNB4
	MyfKpwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRzB-00000003GzJ-0GeY;
	Mon, 26 Oct 2026 21:12:05 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRz8-00000003Gyh-0d7S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:12:03 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1356059a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049121; x=1793653921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
        b=OjsqFv1SxCYUtx2MZIKq5KmXw/yLygqFaJsjF0FEyZ4RYyhfo/pafX01Td/Y5kbMA7
         BHeR8jJdsf+42yodRjaCufGgDEyvS8WSJP2ZXX+fuYoBTdiyW3qIirFVauBp26G+lGWd
         7AzCy4wRvNVSptpNT/2gH1U6N5I6clA/LEvZN9RNfX2SjDdF7xBEeiIIeeN0Bhzl/tu0
         +XPMH5f0+1sFMrv5hP6c1G5Fi1uxef1KhrHeZQTvkcNsghq32L7127uLMWqJQtpkU/jF
         HmoMZpHcP8QjHzNHGyc+w03aE3IVXKOx+QdHFKhfwa4iuRHL0KeINcBQ/MXd8rZHU6hG
         Xxrw==
X-Forwarded-Encrypted: i=1; AKwUvByA6/9xy7aOhBf4FSzBaVY0s0aLFSYZCD40vmo5fPEH3pT78vraHwyqw6MZgC2q2p4OJu+YW3IIk8C7W4u9htGl@lists.infradead.org
X-Gm-Message-State: AFq9FYL1UNoAoLPCXtGR3K1RsYDTWF/eDrPdxaQtFCbhICZboP5p5/xV
	5DNBz/V5Wng4HnFaHLCMCqL2x1+wJctHRfWRtM0C6Kmm4PkCTdDSgbaQOp03toPYzRyRX9F7lZP
	5yQYuZwgqg2u6lqqwzREXWfWBguucxeQ/gXWQfjdTExLtFKOsL9q/mPsGMNrPzMk6i8Ph2nO6g8
	x0R9ngWryNykXxdhabsxuBK9vhXotzN+orXDk3o1Jm/P8Y6l5ycor552CnF3qIO+myhLbFk+fR8
	gwhTErSvEuWnDtKAzebn2diSaPZxEfvKkAC+w==
X-Gm-Gg: AYBFou01LcP7n/IV+5kXk9UqIMQVvRXzI6C2VcFtXqcxv/ZQS3u/FhFare40zRVJC8O
	EjDltVGKnBFE1r5JwEUBm2VG2q/cWHEYF2oeJNF9odyKlxZ1pvDtxLRK7gqpEr5ptEFo8rWKLKk
	PRIui3Sbd7vNrwDED7YPNRNmN3sQpFsf1fAsIHU0AME/HMhUcNPZ/8N1uCNpS+ed4/VZcVhFFYA
	EzkhIB+A9yZWh4GMUu1cpMEH24CJ9CSQuObrYYdjyek/AkpJhNDw6Y81Cgo39crTP+naXJydN1i
	6OoT4vY6FcXUoTQPRzEg2Pubr07OzDymFo3gtGJEq+O4OUjUCM4EcH6WNhIiqGS7tzfr5PfQce/
	QQPGI+aac0V5Jjr1dxY/LNlfMHQOR7M6/iWJ6ER9XAEDyno+virOcKBt3sUFVIoA6tvucDCH0YC
	I393TcSln6VW9n+WG2VQsxEtjU2pTqMQcGjUPF+Ijf
X-Received: by 2002:a17:90b:48cb:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3adeabde785mr6007686a91.27.1793049120714;
        Mon, 26 Oct 2026 14:12:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae4063d1e9sm523575a91.7.2026.10.26.14.12.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18b5ee75447so3762662c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049119; x=1793653919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
        b=ZdqDsYNXelYsHoCEj/kMrKGrNatthu5wERXvxefi4hehgbGflsJNmrp7vlgIgvotMJ
         Eu2h2RrolakK9rWdv+wKz+Vy9bG/rB+++iFeM7xxQqnEnrmnK+MFuEecDfW70CGwiFzJ
         Jb7bHwgfacTWbSuDn7BV1tgoTi2h9eEDJv9XY=
X-Forwarded-Encrypted: i=1; AKwUvBy5VYr6nxKoNXaOio4mFTZ2+5C/ZqgulJXjmHPvBZEGcfB/eHJfOfEykc2BP521CDtSElJO5+36TuD2G6M042XC@lists.infradead.org
X-Received: by 2002:a05:701b:42cd:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-19936e394f2mr11809673c88.26.1793049118824;
        Mon, 26 Oct 2026 14:11:58 -0700 (PDT)
X-Received: by 2002:a05:701b:42cd:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-19936e394f2mr11809638c88.26.1793049118184;
        Mon, 26 Oct 2026 14:11:58 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:11:57 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 0/3] Support for BCM5301X AXI trace PMUs
Date: Mon, 26 Oct 2026 14:11:48 -0700
Message-ID: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_141202_193993_9EDBBD30 
X-CRM114-Status: GOOD (  12.99  )
X-Spam-Score: -2.4 (--)
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

This patch series adds support for the BCM5301x PMUs which are AXI trace
engines present in the chip.

Florian Fainelli (3):
  dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
  perf: Add Broadcom BCM5301X AXI Trace Module counters
  ARM: dts: BCM5301X: Enable AXI PMUs

 .../admin-guide/perf/bcm5301x-axi-pmu.rst     |  92 ++++
 Documentation/admin-guide/perf/index.rst      |   1 +
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  |  43 ++
 MAINTAINERS                                   |   3 +
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi      |  15 +
 drivers/perf/Kconfig                          |  12 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/bcm5301x_axi_pmu.c               | 450 ++++++++++++++++++
 8 files changed, 617 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 create mode 100644 drivers/perf/bcm5301x_axi_pmu.c

-- 
2.53.0


