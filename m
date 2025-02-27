Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C73C19776
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wMaRPzN9DtDhFSXMETT7W68/dj5OM7TC62vNvIpIxu0=; b=CBffnXROAcWZLorwq7FqaMQmPI
	3sQzSVv5YdwuK8VhuDjHXhDdBejCZlGSACWC6hVNq0P0X4gkO4Cjb3cxiEeEv0sDJONeLxcDNj/KC
	GK+mydGski8hyIqj+mUH5eaXzr9LwFpLNDLDn0+i5nbnEN11ZdND9voYOFjl7usorkFNHyv7OkarL
	MY3CKFPVG30wEdkEHanYNxMGHce2kzQwk0kAdQpsrlh92HJGXEiCOAQLGrmou4ZVZZeKplwNuS/u+
	igRmIt+I0hDGYwmBOf0IeYWQx1WoW+JSs31C+DkcGAGDg8WYetScGzueGlnOv7D/x/qXku+xJjesn
	szeJT8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRrW-00000005p9u-1wAt;
	Thu, 27 Feb 2025 00:34:50 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRpy-00000005oqt-1eWC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:33:15 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5da0b47115aso253545a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 16:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740616392; x=1741221192; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wMaRPzN9DtDhFSXMETT7W68/dj5OM7TC62vNvIpIxu0=;
        b=APWzuHwHxvmXeiWxrNUIcfnHmQd7Kc+/mCFUrfF/wuAlOBZHIol7nSxgSb9P3wCXeg
         mCNhyeleqkxBgQiBeBT7zxEngVWXbePyXZzPw84I7BJwksmkqV6wT8j5+3IJN1R+u9/r
         3qDUhfIVQHwYQlRXM7Huqax0yJx49d05os5nsAE6iWqCPEpkyDo87k5SoJqim2kU8YYm
         2EbfOr1EYVZJKwArDvv8Etk99XDAGgvGSUxBA1zznaO8tsavf5yzKA3W+1z3ZsukMaBH
         xx9htZZFtgHwFwtiurZZ4OGJr+A1PO5zL6XGvWxJ5rBUS9tp5/oHDzYTia9g+IG4yeym
         2vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740616392; x=1741221192;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wMaRPzN9DtDhFSXMETT7W68/dj5OM7TC62vNvIpIxu0=;
        b=k+mcY6ruOOgl+5bMN3aKgzHvEquNIhDxlZLNdyHYQySxZBIElY+6/eARyMV65/nERC
         aA/+ZQyfYIJ39TJXIrjl120OImkskDPUofNtMXkpPsQWeksrEkiePGxYAd/mI+KZh/96
         1pgzjfITONBXtEO/ZVyCMbTEd8ADzAD+wayl8A2Leb5L+npcZEg07ezwWdPhYt9099AL
         toZPugInzN/5kSjJ5xdSnIx4JhbrmPXCDtoASZ0Kkif4iKyYq7RhKjztWTPM61Rqvv1d
         PdY7kBxxNzc1qpu2mrq/S/x8WzRP5dSuYDJ3AhmYbApDTyEQBRgE3AMOlMwquZJKtXQ+
         yd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsc718nuljMITih1EDE/vEdjRQrA1z8EMx/NQnj7m6Uasz1GfHzWOBPStbij86sxJoaWRUoy+L9A/StqiiO3dG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0fQDAuRYPJViI/ZfmeY8ZKD/6v3EyUw1AliSqCzXYSaO7jBRc
	5KZYCswoz7WVO5ttpI7K86Fk3tEMEIiaGbo9/6HgpuTOa/gg69daLa8j4Cw3qLUokZ8lVAAk5Wm
	qu8pWYQ==
X-Google-Smtp-Source: AGHT+IGS4fdHxE39pl3VbWkoYw/QY5aHCxMCm+ank2eEa2pcJSljLByRM9MEI79KT3OUTeH5ozYKhW5tXaC8
X-Received: from edbev24.prod.google.com ([2002:a05:6402:5418:b0:5e4:b657:188e])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:50ca:b0:5e0:9269:f54e
 with SMTP id 4fb4d7f45d1cf-5e4a0d72136mr7684875a12.14.1740616392345; Wed, 26
 Feb 2025 16:33:12 -0800 (PST)
Date: Thu, 27 Feb 2025 00:33:04 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250227003310.367350-1-qperret@google.com>
Subject: [PATCH 0/6] Move pKVM ownership state to hyp_vmemmap
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_163314_432166_5075A7F8 
X-CRM114-Status: UNSURE (   9.71  )
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

Hi all,

This series moves the hypervisor's ownership state to the hyp_vmemmap,
as discussed in [1]. The two main benefits are:

 1. much cheaper hyp state lookups, since we can avoid the hyp stage-1
    page-table walk;

 2. de-correlates the hyp state from the presence of a mapping in the
    linear map range of the hypervisor; which enables a bunch of
    clean-ups in the existing code and will simplify the introduction of
    other features in the future (hyp tracing, ...)

Patch 01 is a self-sufficient cleanup that I found thanks to patch 05.
Patches 02-04 implement the aforementioned migration of the hyp state
to the vmemmap. Patches 05 and 06 are cleanups enabled by that
migration.

Patches based on 6.14-rc4, tested on Qemu.

Thanks!
Quentin

[1] https://lore.kernel.org/kvmarm/Z79ZJVOHtNu6YsVt@google.com/

Fuad Tabba (1):
  KVM: arm64: Track SVE state in the hypervisor vcpu structure

Quentin Perret (5):
  KVM: arm64: Use 0b11 for encoding PKVM_NOPAGE
  KVM: arm64: Introduce {get,set}_host_state() helpers
  KVM: arm64: Move hyp state to hyp_vmemmap
  KVM: arm64: Defer EL2 stage-1 mapping on share
  KVM: arm64: Unconditionally cross check hyp state

 arch/arm64/include/asm/kvm_host.h        |  12 +--
 arch/arm64/kvm/hyp/include/nvhe/memory.h |  35 ++++++--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c       |   4 -
 arch/arm64/kvm/hyp/nvhe/mem_protect.c    | 106 ++++++++++++-----------
 arch/arm64/kvm/hyp/nvhe/pkvm.c           |  54 ++++++++++--
 arch/arm64/kvm/hyp/nvhe/setup.c          |  10 ++-
 6 files changed, 147 insertions(+), 74 deletions(-)

-- 
2.48.1.658.g4767266eb4-goog


