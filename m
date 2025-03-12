Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABAEC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R9IlyLC7A5fKrEe72gCHfs3e2o6+wpvRXjQlPG7kMic=; b=y9m3Ywv6j9+FFR
	HWkv3MhDCMyI102pSSXYZwZPMu7i2bihH53NZz5wahKjRd7PJaLYehN7GzpUH7wrg1o9nmyPQflNc
	52e4spR7OdP9zoL22PC+lVrgkVi2+HOc+3zzYsDAU7/na2M2iM4YN2xVqusDb68tOifwhlgNUbsat
	AYzr7V3rYxsd/DuMLNa0UfDY18s54hpLdQEtIfvGGQUpbOgJVNKQnDT77TD0PD4IPqxFeWOmj/K5F
	XQOx66a+SSAxIKo+B3hff3qBJxV+wwV0J5hWDNvjn5hLdC3fnu/LKrcpEQdACCGqjgpAoqED7rHuY
	PkLs/wONPIPTrdoxu7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLYw-00000008T2Q-2HXj;
	Wed, 12 Mar 2025 12:51:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKh6-00000008KOH-2VC2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Mar 2025 11:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=R9IlyLC7A5fKrEe72gCHfs3e2o6+wpvRXjQlPG7kMic=; b=Ri1i6Wtx2xCKdixXszYaWWPd0X
	QNM+z015TuAHA66HllPulDKPw5ePJ28asqd75gumDjR17bz45j1HHesVYOVTmkqyG+7e3bIGWfHYh
	MUg4aGdMpUf4+cR8I38Sfi0X+YrF2b0Opn5CwfkTS6dqGfuqf6iyKPCrmPi6a+u2MTb/o1VRVgqWG
	PyfLJL0bKPLWOcyzKP79mpoCzkAyxww/9tu7PGg5ViyGiKVIf/4JMy/AQGsR+Zg/dzTqflfUTUm79
	tc2saFxyxVMLSlJg6xRULEPvbLRMFhOkMn6Agg4oAAYSiMXcfA0m0LgQCw/KqVlJ2ixtRJEVt2Ui0
	7sN9kP5w==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKh2-00000002MoG-3xzd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:56:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-223a7065ff8so33832365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741780569; x=1742385369; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R9IlyLC7A5fKrEe72gCHfs3e2o6+wpvRXjQlPG7kMic=;
        b=jb6INDk6O3XNRJ9KK2jUkyYcP9AUnz64gpQuSvATEJZXTUHdzc/PhL9lxG49mplPo0
         fsLGAYLe8wL6KfOdQ8m4SNJLMlrhexyUqiuwiKJ0y9vooDQvB+ezqcm4gXVzd8TbgsYV
         //8P/fHoySUN0ONPw8K6ORTX7NDAVZ5b7tAPxU2NmUZR0gks8IGndAZ+e1WVO1Y4lBxb
         l9qlAuHG0TfOEZdoqGHmhaU11lP2SCwIjmckGiYRvS5pEaCA3X58CsnKF6yhvQ4z5Nvf
         te75/9DHdSrHew8tL8b3JO/7PIxHTk4pQTAhkRWaaWU8uOGMP9rWZSl5Rel41rbCTu/U
         V3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741780569; x=1742385369;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9IlyLC7A5fKrEe72gCHfs3e2o6+wpvRXjQlPG7kMic=;
        b=gr0WjfuqN5V/8YGtjyKyiSgeRze3p64RQjgqb9CACZWocKV1l5blcmKHNDc1tulc/i
         OuPnbBxjRJ4wb15H1w4hHgs/etV0J+v0gncImG5E1Lf5qlHzalAod0u3e9jwyA16tAdk
         yjvlewwzBX+h2JVoH+qTWu9R29+EGiQ6hBCN40l4BL30zGap/AlBc8Z/8J79nb6jkzgP
         eyDp1Rcd6cBGKxKL9ydR8etfOZCoSuOWvv6wedr5ABBot5gDGx1CP29/4C1Kqc6tKilg
         Hsqzsxmk0KEKzu8FZuq2t+UX6S1jLmhyGc6NDk3TTT9dm6eN5qkPnjrFAaiTK76D1Y/u
         q5uA==
X-Gm-Message-State: AOJu0YyN+OJu1SbuLmnAS+cktLL9KwP5WRBt3Mb+o+vXJUcZA/mr4G/N
	Abgsvm+lsOrvA3CBC51IZ8tcgCXETccMvQj6scCbgOnin5/jnVFsftV15JP3avE=
X-Gm-Gg: ASbGncvT40rL18nEEAc1Yb64u9LEX9H2Y9FAwrWcZ2/38QLcvTDHAyLHFOQIwNzpdGY
	hjMSUnAzP19tQO7GKR0qP7HwK3ZjhM4ev37RFQYNfGxkgu6EL67VN5KLNEldfp0G5LdR66rLqs0
	1P5dNlLFwhhRL1AYX17n1lmF2puLdix/Unno0AV1sOlPMGjG1oBaCLEKyI+gHVbrLJ2/5K4kJ2Y
	2nhLrPZRxPrRtI39n+RZkKviy/l0SsF339JtlDP5OJS1JMLpvGGs9u76JkbfQGHrElld6PhY1ke
	4BxwAwBw0eAzm7EXcEcXkofGJNX/V9S9w0N9eX7zOdWsdbtQ
X-Google-Smtp-Source: AGHT+IEZMl7qgOp/elCr4VXp7AlgwKiCuKen+kfThanblODxDmQAYt3d4nqftKdNx7NyuuUlrtd5xg==
X-Received: by 2002:a17:902:c94d:b0:223:5c33:56a8 with SMTP id d9443c01a7336-22428ab89ccmr358251575ad.35.1741780569502;
        Wed, 12 Mar 2025 04:56:09 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736a1f813d1sm11378575b3a.129.2025.03.12.04.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 04:56:09 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 0/6] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
Date: Wed, 12 Mar 2025 20:55:54 +0900
Message-Id: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEp20WcC/1WMOw6DMBAFr4JcZyN/MOBUuUeUwlnssAUf2ZEFQ
 tw9hjShnKc3s7LoArnIbsXKgksUaRwyqEvBsLPD2wG1mZnkUnPFJUw9wstw21TWm1Ijy88pOE/
 zUXk8M3cUP2NYjmgS+3r2kwABaL03jeFGtXhv7TLQfMWxZ3sgyX+p/kkSOFSoVK2t9sKVJ2nbt
 i+40r9pzAAAAA==
X-Change-ID: 20250302-pmc-b90a86af945c
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <drjones@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_115613_419674_24F7A8F6 
X-CRM114-Status: GOOD (  11.25  )
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

Prepare vPMC registers for user-initiated changes after first run. This
is important specifically for debugging Windows on QEMU with GDB; QEMU
tries to write back all visible registers when resuming the VM execution
with GDB, corrupting the PMU state. Windows always uses the PMU so this
can cause adverse effects on that particular OS.

This series also contains patch "KVM: arm64: PMU: Set raw values from
user to PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}", which reverts semantic
changes made for the mentioned registers in the past. It is necessary
to migrate the PMU state properly on Firecracker, QEMU, and crosvm.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v3:
- Added patch "KVM: arm64: PMU: Assume PMU presence in pmu-emul.c".
- Added an explanation of this path series' motivation to each patch.
- Explained why userspace register writes and register reset should be
  covered in patch "KVM: arm64: PMU: Reload when user modifies
  registers".
- Marked patch "KVM: arm64: PMU: Set raw values from user to
  PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}" for stable.
- Reoreded so that patch "KVM: arm64: PMU: Set raw values from user to
  PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}" would come first.
- Added patch "KVM: arm64: PMU: Call kvm_pmu_handle_pmcr() after masking
  PMCNTENSET_EL0".
- Added patch "KVM: arm64: Reload PMCNTENSET_EL0".
- Link to v2: https://lore.kernel.org/r/20250307-pmc-v2-0-6c3375a5f1e4@daynix.com

Changes in v2:
- Changed to utilize KVM_REQ_RELOAD_PMU as suggested by Oliver Upton.
- Added patch "KVM: arm64: PMU: Reload when user modifies registers"
  to cover more registers.
- Added patch "KVM: arm64: PMU: Set raw values from user to
  PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}".
- Link to v1: https://lore.kernel.org/r/20250302-pmc-v1-1-caff989093dc@daynix.com

---
Akihiko Odaki (6):
      KVM: arm64: PMU: Set raw values from user to PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}
      KVM: arm64: PMU: Assume PMU presence in pmu-emul.c
      KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
      KVM: arm64: PMU: Reload when user modifies registers
      KVM: arm64: PMU: Call kvm_pmu_handle_pmcr() after masking PMCNTENSET_EL0
      KVM: arm64: Reload PMCNTENSET_EL0

 arch/arm64/kvm/arm.c      |  8 ++++---
 arch/arm64/kvm/guest.c    | 12 +++++++++++
 arch/arm64/kvm/pmu-emul.c | 54 ++++++++++++++++-------------------------------
 arch/arm64/kvm/sys_regs.c | 53 ++++++++++++++++++++++++++--------------------
 include/kvm/arm_pmu.h     |  1 +
 5 files changed, 66 insertions(+), 62 deletions(-)
---
base-commit: da2f480cb24d39d480b1e235eda0dd2d01f8765b
change-id: 20250302-pmc-b90a86af945c

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


