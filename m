Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE742C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 05:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ukS+6O6VUnt+grJqSVzkQJWIYuNE2DdB1/VCqDk7Wk0=; b=oRq3zJV7Pxjn2MgCbQ/HB05t6t
	9jWR/7fyvbKOri2EFunmGgiLzwLE8eY1J8XuuqN8F9t1g9l+FRCiTOBZvY+4ytlhsp2usuKcHj+wt
	vds1cQ+ytQOO3gDwSOEOQquXtmRoXaZxPoqXPlazCWUwog3PWkyXC1u7H5prAqwzcEeyVngw5enGt
	gYHsW8T/D+Cw6+90lzEb2sVY74uRJh77sYT/ALWoH5d4QuARJ4vcpofY9vTH5jfdfX4VcqOXp8aOv
	N2lS5UuKxpDJAYZP3oOFd/SmgRB0B/MOgzLFtE3SWKkzuIuhADJn1YEmlZyyj8XB26gDnoTXNSaQQ
	tO37BY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0BxR-00000006ksL-26Mz;
	Sat, 29 Aug 2026 05:50:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0BxP-00000006krX-1eST
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 05:50:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so12094765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 22:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787982621; x=1788587421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukS+6O6VUnt+grJqSVzkQJWIYuNE2DdB1/VCqDk7Wk0=;
        b=kAZFbgdmW5ki2gEkzW5kLfqrelnPGr+KzeAbhZ8Q/DL1EAu0gpQnVaKGqSesqDoXSd
         d1bs46xeUQF8qRq8q3wnbD4iC7ubac2qxv7S3JGCfM8GUp/ojQRmv9I7iEma44l8qpoZ
         6XZb4Ti15+DxN62ghT0RCzUO1RYeH1DtGS4ezWhvhF6q/kpzYwfYi336CzHWK/+U3ooh
         ScHPz9gmaRNAtGf3HaDEbw3YDL5cAU0rSCdmy8mZwU2N49ebIgh8ZDBHMF5d/UYaNLqj
         +/KIr1CSEnXfYKdc1iIFseyjvujRE4ASxoVHIwfB6sp7iFchBMp2ZsoO+lXW7qTGNPkE
         9PNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787982621; x=1788587421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukS+6O6VUnt+grJqSVzkQJWIYuNE2DdB1/VCqDk7Wk0=;
        b=XL9aoLe7K8HH7dksMYv9BfLfldUJ4j7aPhYWsSNwFIvaQnviAgmH3VMOMkcm3PfqzV
         hRNXyBNMYGz3gnD6yPJn18oHm6NrQdcAeWPRiPQCqTbB1bNkKsPhgZiKvYjZ58p7gtWF
         djyn1Aztff/IpQLSFCDNQqP78jXpBNmEgaLlDEgMHas+keLRQxPm0t1G6IMifT5oaoWC
         Eh2tvvVfrGQgVbNM924zcpvHBdQ/8FXDDsdWLFphUhW+SHfTbVxNyourR6J/6RMYLIOA
         g47pRmvbHHiK9SVPRteqfJSUM31B/LsbVPUVUcLvCByUyISWpBEQB85Gu+kGx9+F91o1
         yf9A==
X-Forwarded-Encrypted: i=1; AHgh+RpvFKn2H2RoyYtH4MMxEGt1L/2yHy8PV+/S42H/vCFmFiU7U+TtN3ttG4nUC/x0oqF2nanxupN+CXxcvkuPkzjU@lists.infradead.org
X-Gm-Message-State: AFuF++klYpfYe4OF51nmlJd8fzbUN18j1f++odTw44d9gTqrf1HzySsC
	WX7FycW8lYuuZYAVH4NOe7tNBexqhQbMKmsufJKVUDsHCT6l+F1tAIm3
X-Gm-Gg: AR+sD10qM4siskJ+bZdhpdPXH27+XTFZqOysPEct3jcGJaqQqy/U4dnCPEAeOlPvnRj
	eQisWhRvYVAAlH67AqBXSdDB3MHDD13BEZgTkBaft8H4fGLEi6YTEJ5a1Xu2QKnuvE+g/M9YtHy
	M9Cu//67c2rJvRHnMGPXVM0lHdJtnEdSTqWIByt/Q+jU6EgEr36VUNXhh0Omd9d3HGfrOXCSQZX
	JXt6fZhXXLGncerYFkLNiNp7/8Wd1nfZlsoJ6YMA/msifwaAyW60T040fDGuDH57giyFtN1my/x
	LF7ZOhGqUCMgjC2iYlBsr2nO9rTMu58RkJo7y1T4QswQsvmn0sWRajndieAGVhOiJmucPWSRvbZ
	Geqrgq3B3mmwMybmBjWWjFaGjsPq7i575XObzIKQrZZqzW9IZPo5fOdhX6t51aY+Tsh43pS8jcM
	ATUSWMLFmTAKh9KihnE7bpfvoXJ2QArn0NUj48D5Mxc75Gwda8Zfe6rHYeR5WPfswXqxaf77ZAF
	oru5/ErE8UtRExVdt3pXmQjrgtDOs9m/5uPj+QPawAIhKmG4cS3GhI/vzFWmVNLCHZGABdFaSTy
	eiNhC0zu4FM7EgVEcJIU
X-Received: by 2002:a05:600c:4715:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49b91c26a01mr172319715e9.5.1787982621199;
        Fri, 28 Aug 2026 22:50:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm35357485e9.2.2026.08.28.22.50.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 22:50:20 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
Date: Sat, 29 Aug 2026 07:48:54 +0200
Message-Id: <20260829054856.70549-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_225023_451751_0C67D822 
X-CRM114-Status: GOOD (  10.39  )
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

KVM_ARM_VM_SMCCC_FILTER rejects an empty range (nr_functions == 0) with
-EINVAL for every base except 0. kvm_smccc_set_filter() only rejects a
range if its inclusive end, base + nr_functions - 1, is below base; for
base 0 that end wraps to U32_MAX, and KVM then tries to insert
[0, U32_MAX], which overlaps the reserved Arm Architecture Calls
ranges, so the attribute returns -EEXIST instead of -EINVAL.

The request is rejected either way; only the errno is wrong, so this is
a minor UAPI validation fix.

Patch 1 rejects a zero function count explicitly. Patch 2 adds the base
0 case to test_invalid_nr_functions(), which only covered a nonzero base
and therefore never caught this.

Tested on an arm64 KVM host in VHE mode running under QEMU TCG: a small
userspace reproducer gets EEXIST before patch 1 and EINVAL after it, and
the smccc_filter selftest including the new assertion passes with patch 1
applied and fails at the new assertion with EEXIST without it.

Karl Mehltretter (2):
  KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
  KVM: arm64: selftests: Test empty SMCCC filter range at base 0

 arch/arm64/kvm/hypercalls.c                      | 3 ++-
 tools/testing/selftests/kvm/arm64/smccc_filter.c | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)


base-commit: 548e7bcd0c5460ddcbca9600cea603ebeebf4da7
-- 
2.39.5 (Apple Git-154)


