Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39349E73147
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 08:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kGb5tEG1VOIoITicmnlT7KV6MD9I7+LZxxMBQmSh2pc=; b=ng3kjZBxTPUTrCb3FBj1RviBhB
	fj2LOOBW0GAdGJdMh2IYuQGzbQ/BmxEHwGxrCmGwBiHvLysYyxcNLRVGVnTL9APHV+okuXJMRoxcH
	D28fzRQW25Ax/qjoCZMZtlS335yzaPaVwW6CJqPgHLJiqv3ArfENyt7zvlSsWtbUMOTAGVOuF9hA5
	PA2xaxIMjCYqSOXZHUD/+PT1CgKMISRk59F86wMUP4aftMRkP7bJx1MzW2569StTz+35u5qUgZVu3
	NBCJRpJsUPPsO3Mhk4FREAWUA0Nvd/+YsH90Ho/pZRnbwGnBFrXD+ro/24dTjbl3T9YbkAtzxyoQi
	6YgKHtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpkN-00000004fie-2msn;
	Mon, 02 Feb 2026 08:57:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpkL-00000004fhR-0Kf6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 08:57:26 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4803b4e3b9eso33802455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 00:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770022642; x=1770627442; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kGb5tEG1VOIoITicmnlT7KV6MD9I7+LZxxMBQmSh2pc=;
        b=KirGfb0FjuwjoNrjC0lF7BbZZAcy2si1nU8bsSr1TpKc8t90SVhy1Bv8DCs3aK6KUr
         rzsgjkle2O6MG2w1DAC9c7UHGvw4p2zakJSufL+RImTXv4oI4dILKo7Put9/In7oe2z5
         F3IxoAwd8eIhUqg4W29vq0OA74eeUAppuK/CxBxgkYvAFqDj9qBeWcVQcPVK0RXNGBI7
         uz6jZfi9DSvMwktPQCcHXtSLPWB46qWelkozBcxxkze1endAdKzea9tOGdWFtSMg5IBJ
         n7ImfYR0YPrk4N1SPubJL5btqL/8iZvDQ7/LBrfghsuP2VSUVcK8kGZEyuFDrHb31wqG
         14iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770022642; x=1770627442;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGb5tEG1VOIoITicmnlT7KV6MD9I7+LZxxMBQmSh2pc=;
        b=R2PacgX3k2PfyRIEbvB1mUUUtB6FraZp3D96+WuFi947vtHcBkFX0FuYngKNTCDyxO
         dqEcI61kL4Q9ab6wpSUY7wP9TBsdWRIgpJ7p6SGNlsrlnvGFYaP2WhpRMUVT0oNODwFC
         d04Z57kral4fBVXZ9UPoocZaLs9qpW2y1v8H6AZ1+/hLhGwy3oNL3lqV7PLUkzHcTTAw
         6kkdEptOu1LzPwT/EQo5G8cnGXSFBWFM0Vsv6fe1BSObHGSmpSY2Imwy4dKM9++xSJ40
         L53CpWIPMxziQ+sxUyjQkVqrJX65HPH5sTLcJsnrFSn9nlFurQlEbnSBJzb5xTMqU5DL
         MohQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPiDuCJvE0KrXD3FPaRrJLX1Mom4G5nGmMTyHvm9PdMLkEoIJtsM+MmGtNZsmERkueaW9pGEMNbD0lYPazeTkY@lists.infradead.org
X-Gm-Message-State: AOJu0YzPNKpR7cxtPhMx/sddv4OrgHGwYvsnm/w6y8Ci7NrWttGrsQsD
	p9p910IH3ZhOVO77Oru8stHy7+w0ut4QazPs4vsS7xMJr3PSWNFpCOzGKmJFkBrTDmIsVZor95d
	g2w==
X-Received: from wmil16.prod.google.com ([2002:a7b:c450:0:b0:480:694a:dd63])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:348b:b0:47e:e779:36d
 with SMTP id 5b1f17b1804b1-482db4d826dmr117690445e9.23.1770022642339; Mon, 02
 Feb 2026 00:57:22 -0800 (PST)
Date: Mon,  2 Feb 2026 08:57:18 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260202085721.3954942-1-tabba@google.com>
Subject: [PATCH v1 0/3] KVM: arm64: Standardize debugfs iterators
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_005725_125142_2663E136 
X-CRM114-Status: GOOD (  10.22  )
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

This series refactors the debugfs implementations for `idregs` and
`vgic-state` to use standard `seq_file` iterator patterns.

The existing implementations relied on storing iterator state within
global VM structures (`kvm_arch` and `vgic_dist`). This approach
prevented concurrent reads of the debugfs files (returning -EBUSY) and
created improper dependencies between transient file operations and
long-lived VM state.

The `vgic-debug` implementation relied on an XArray marking mechanism
to snapshot LPIs during iteration. This modified global state during
read operations and could lead to reference counting leaks in certain
edge cases.

Note that `vgic-its-debug` (for ITS tables) also uses a custom iterator
pattern, but it is not addressed in this series. Unlike `vgic-state`,
the ITS debug interface iterates over linked lists (`device_list` and
`itt_head`) which require holding the `its_lock` for safety. Converting
it to a lockless iterator would require a more invasive refactoring of
the ITS data structures (e.g., to RCU or XArray), which is outside the
scope of this cleanup.

Based on Linux 6.19-rc7.

Cheers,
/fuad

Fuad Tabba (3):
  KVM: arm64: Use standard seq_file iterator for idregs debugfs
  KVM: arm64: Reimplement vgic-debug XArray iteration
  KVM: arm64: Use standard seq_file iterator for vgic-debug debugfs

 arch/arm64/include/asm/kvm_host.h |   3 -
 arch/arm64/kvm/sys_regs.c         |  50 +++-----------
 arch/arm64/kvm/vgic/vgic-debug.c  | 108 +++++++++---------------------
 include/kvm/arm_vgic.h            |   4 --
 4 files changed, 40 insertions(+), 125 deletions(-)


base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.53.0.rc1.225.gd81095ad13-goog


