Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895D2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PsGKDfz7/jaPpiyMeSia4iIgjyJuYXTHPPt+s6+yzBM=; b=JHeuV085ApkYDKJkjxc2iRxPDe
	+GLPFeriFz8pfcJVgNDoedTVMlAenAA1vjoWn5EN1JihVG6b44ZWctTrCUUIiHPewqnZV8Q47OwDK
	vEZN/MFxQ9G/L92eXRcea8+79xtq8J3VO924VhI/+7z+se1U+eCCkRP69MM2UbyR+o0ddcbfRuSfa
	xhZ1UpyaaY0yoGyFfhlpCGIFGBth+itQcVIlzDRRdNPS0o4IDsefKD1tNLbHqRrj0ysbG1bkHhMhj
	LGc1kTArgoysqK+Hlcx5tLW/t0ELLBFSgbIz8AD1OZoV+Ob57/8nBNG5/iUK/H1GakA//yu0v4jfB
	5sBvFrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Ie-0000000Fr6N-48ac;
	Fri, 14 Feb 2025 18:20:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfS-0000000FkVj-3kHo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 17:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PsGKDfz7/jaPpiyMeSia4iIgjyJuYXTHPPt+s6+yzBM=; b=Y6kiFkd4yiceTxO7hMj7nxLi5t
	2600NMrsBFMGvPrx5OsqpduSbopRzs65BzYj4PD43cNFQJFXQmFchLD8baxIDNmoU1AilwLsOtf/i
	eWRvUriYE2LUZSGjw5XR0VF4Yh56+GsVTBBpI5zQVOcvvbaG0m2aYjapQJtszYDxmfbM+e9cU3AMf
	zUf2weYvjNVTNZxdqy3UV5LYC+Sj+LYeczYXdxhmF3cPZw0ojp/wNiZ9HIWB+NQi6Jk9b2tTKwex/
	a2AETDVi1ekuS4uGs+lUHriCsRPB3ym2PK9IlhLsnxVlELxPnpuoa+9cajwbS1vCNnwZHMoQtdnUD
	h7flP2iQ==;
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfP-00000001IC5-0NGj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:39:57 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5fc13355a5bso1109516eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739554791; x=1740159591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PsGKDfz7/jaPpiyMeSia4iIgjyJuYXTHPPt+s6+yzBM=;
        b=RbQHGOAfM4l+3VfkK94WqxomH+0xLdrwPhRIsQUPN8Z1mgFM0JRIMUDVRsHzfAEFkx
         RFKxyC7U6udMpqUiWzRTQADWlRoV8xYjOUoBe+YCPoNBjpnJVfs+i6iAqGPOGuooTGFE
         fSzU4Ul1xtu3Lf9IePB7zobNQpm0hKM9GJRaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554791; x=1740159591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsGKDfz7/jaPpiyMeSia4iIgjyJuYXTHPPt+s6+yzBM=;
        b=JW+p3okPYT10GHCJx6Yfb13EZbFsHg5wxNnjwa0eWPjnxr3SpbBeM2Hz6tysvwMS4Y
         PMnMrFBxGVdTtDNa/XKEb35z5HCoKZF5nhdl6/utiJxBWLDJn2rR6LNZALuX2haZ47WW
         2Icd769WksB0xQGQbnQKEVf6fTl13jVOrb5XR6hOHJcSayZgtji7TB4UgkAWtNPcrpPs
         Az933vuwaSZpVkzldFK0jABsgF5yY+QFHDr/o2H+jeB7T2rlmJhpzQobzWUChSr77udc
         MvREib9uLg+Bv3UH0aPYmQJbTWnY4LyO8CZNVUSVs/xiTKq86+eMm+HY18euIg9+faty
         BH+g==
X-Forwarded-Encrypted: i=1; AJvYcCVywGCqv4o+UmUEAvUPypI5lXWaqex3iAvtUtIvciwWBvQj1/OODToPrhZzhH2HEUhmdFhKR1p4Gm4iqK94qEQB@lists.infradead.org
X-Gm-Message-State: AOJu0YwXrZbFg+9y+n5zBC2LdR5lgbLqLHxc5p0mgUPKOFDUMaVac4TW
	Fy3sioXSZHtsu4iSwKCeVkcfRctLybxAW10hXKi7YwxJ+HAHDjGqeZHXrLHcRg==
X-Gm-Gg: ASbGncscXk0MsLq/PXr2tsF6Ee1ph1XlSwafNu2eqsb70EIuncLbB5IrvE8Lyq1Iod/
	n9OjYdMbCc1/Egrag2UmQhi/oV9F9+pfYsrrtdjAAuKeUkTtoIgBby2+GTM7pEi8se7y9Fq9lkm
	JDffSv9o4RRhtsnybdFymPt+4c0KMpiupu6mD4n9iB5sSLXO1vyMNW96EM17y1laRbbfVztdQEp
	0M5jsjaD58rzKDw6496WI52W6DSRQJfcQB6Ki4sTxzgqNtfI0DMMGpvUOeBCnjavCCy+p6rMVGx
	36taetIletA1YbH259Bq7B7aYn8tHeYUa84weOkWNRJfTGzlTF2Q8PrZi621G9uh5tir99U=
X-Google-Smtp-Source: AGHT+IGDUd5DZupELTIH1ZNHElTcoWH0Jy+aI2jHUJxfXC+3Fwg31SHzk1pcdrf8sVKAQ1860xNHbQ==
X-Received: by 2002:a05:6820:229d:b0:5fc:89d9:a050 with SMTP id 006d021491bc7-5fcc55ce468mr11226eaf.1.1739554791273;
        Fri, 14 Feb 2025 09:39:51 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb17a4ca4sm1284073eaf.30.2025.02.14.09.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:39:49 -0800 (PST)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH v2 0/8] PCI: brcmstb: Misc small tweaks and fixes
Date: Fri, 14 Feb 2025 12:39:28 -0500
Message-ID: <20250214173944.47506-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_173955_240458_F730310A 
X-CRM114-Status: UNSURE (   8.31  )
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

V2: Changes from V1

  o All Commits: Wrap all commit messages to 75 cols (Bjorn)
  o Commit: Refactor max speed limit functionality
    -- Split into three commits (Bjorn)
  o Commit: "Fix error path upon call of regulator_bulk_get()"
    -- Changed so regulator_bulk_xxx() funcs do not get called with
       num_regulators==0 (Bjorn)
  o Commit: "Fix potential premature regluator disabling"
    -- s/regluator/regulator/ (Bjorn)
  o Commit: "Cast an int variable to an irq_hw_number_t"
    -- Change commit subject line (Stephan)


V1:

  Six small fixes and improvements for the driver.  This may be applied
  before or after Stan's V5 [1] on pci-next (they should not conflict).

  [1] https://lore.kernel.org/linux-pci/20250127113251.b2tqacoalcjrtcap@localhost.localdomain/T/#rfe31466507e3e540ad681278924e0ae4e0b8a727


Jim Quinlan (8):
  PCI: brcmstb: Set gen limitation before link, not after
  PCI: brcmstb: Write to internal register to change link cap
  PCI: brcmstb: Do not assume that reg field starts at LSB
  PCI: brcmstb: Fix error path upon call of regulator_bulk_get()
  PCI: brcmstb: Fix potential premature regulator disabling
  PCI: brcmstb: Use same constant table for config space access
  PCI: brcmstb: Make two changes in MDIO register fields
  PCI: brcmstb: Clarify conversion of irq_domain_set_info() param

 drivers/pci/controller/pcie-brcmstb.c | 40 ++++++++++++++-------------
 1 file changed, 21 insertions(+), 19 deletions(-)


base-commit: 647d69605c70368d54fc012fce8a43e8e5955b04
prerequisite-patch-id: 17728ad3425bcbd72e06271f2537a5aeec9ec0f2
prerequisite-patch-id: fab98130bbf5ffc881704b02153e387aa4a08e87
prerequisite-patch-id: 0d2d8d02821ca742aed46f16e9ed60db2ead359d
prerequisite-patch-id: 8cddbbc69bd26c0284784d29f5abcc30db1c8327
prerequisite-patch-id: b5d9165e3627079a44c08faaa306c17ef735fc9f
prerequisite-patch-id: 95858e79f69b693a7955cf12549ff1ce8df27699
prerequisite-patch-id: cc66e7df1fc7acef4ce10f99033a39359b6d57ab
prerequisite-patch-id: af00ddbf164acf1742020616d8c0f05cbd5c1fa0
prerequisite-patch-id: e37b800216e856a32ec7e7231d5191f17026ebc9
prerequisite-patch-id: edeed902cf9a962e3431132dacbd95781b1cf970
prerequisite-patch-id: da4f731901ffc44f2f1a3e69c1c35213d531fcae
-- 
2.43.0


