Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B32CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QroFkfsIzFdk7bYeD2yDP4/NwbzDZKM8O5SP6AVtn2s=; b=GTjYhGr9fL0YQedJEF26mEX3MQ
	uS6rzHq+DHosB53bFm++EwgZ2jd/7+pqipRNWvX+CS8YmZbw8cr/NFfhnhMFNeC6pLJSEzYSS3ivZ
	H3/74wwPCkPfDCxpNZ3gP48s1yTT8ulgRF6eC7PaUkWDmda7HkH/AISV88eQEqvWGL+NIz8eBgwpq
	HA64ozFyxl8+XBACoc2xNaMoFIJxTYo8hj+WIQ5hv5bBJPMc8hLkPigMLhRNkcnnTSrabMTxdzhTR
	q4H52yACc+NOD8ytEmtt3hRSQ4/JK6EjhIlMIMkQdWpsbBzQXXSSRIhgIH9TjceRtGV3LcHQdRU77
	maf6ZIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrsh-00000006tkv-3jKP;
	Fri, 29 May 2026 07:43:47 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrse-00000006tk1-3sYJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:43:46 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-49045243094so97198465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 00:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780040622; x=1780645422; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QroFkfsIzFdk7bYeD2yDP4/NwbzDZKM8O5SP6AVtn2s=;
        b=lsR2npt2yoZcXSuY6ZSFiA8kXkC+tbExhquoLa6TSUuE0WBYizmxM5ogqky8yXY4Vt
         bf8Rm4EQcx05/kbMwUbhhu0oosHf/zg5LxnNHS3EYBM7AfiiXnbkvAivS+oJ9uuoCoWU
         j7sFCzvCJL6yqF4xxrdapdcmIlJak6QCj54uP7588GptJrsGxS1xD7yonMgBiF9Cyeqe
         uBsexK3FwmSvn3QF8IiD/yynPIYA+KzPEQUWO1wng0CzfvaMWxPKqco2X+8IQFQNGC92
         6v8h0ili5tock7a7QaiW5I1y9qyNX/PUoC6tgCHToUHc92gvnRmrbwgYco4QNqrlJZ62
         Bo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040622; x=1780645422;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QroFkfsIzFdk7bYeD2yDP4/NwbzDZKM8O5SP6AVtn2s=;
        b=W77snKkzwKg8Yo16MnCrQMtnzGM3nOliXQcwRjVKz4u9Gstu5b7UvQsQl9qHDSNmx4
         qqXGR/V/59qobu2yApSFSltSr7xRx99fq6ugbgvZB0+ey/bAJ01BIRPPKm/OtA0w+N+N
         0mKzVPXtVLD9d7TpUrGnpWcW0ree69b8uPiVlYdmwr64NgcgxFmO5rqO2op+0+YU/m+V
         a9XaAGesykdyt9PjMuLh1DAJLouivmZIervos6aQzhOexWAspEwRPGRxEHCJbVNYC53G
         +/Nw9e1yNnbO3dx/M7gJ3bG+4etTzib1ZUwn91TPDuBc9QZBdPb3KwOcLTfjrrZ5h6Qw
         R+iQ==
X-Gm-Message-State: AOJu0YwR/x+7yXJ4+NSH7eyjLTOgDVXnqVUoSvEYLbi4IclaAX2m/BnY
	tgVSXknAwQI+iH2u3Y66uAvQ72WL1iCvs06e32iF+l49V+YUCsJRQuMR5gfDMuocHSJDfeQrVoO
	ukg==
X-Received: from wmco20.prod.google.com ([2002:a05:600c:a314:b0:48a:5531:d9cb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a7b:cc1a:0:b0:490:845c:a1ea
 with SMTP id 5b1f17b1804b1-4909c0b0c32mr22550225e9.21.1780040622146; Fri, 29
 May 2026 00:43:42 -0700 (PDT)
Date: Fri, 29 May 2026 08:43:39 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.929.g9b7fa37559-goog
Message-ID: <20260529074341.2271950-1-tabba@google.com>
Subject: [PATCH 0/2] KVM: arm64: Fix host/hyp tracking on share/unshare
 hypercall failure
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_004345_019709_7CA3982C 
X-CRM114-Status: UNSURE (   9.90  )
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

Hi folks,

Yet another bug I found while testing Sashiko locally with fixes to
review-prompts.

share_pfn_hyp() and unshare_pfn_hyp() in arch/arm64/kvm/mmu.c
maintain a host-side RB-tree mirroring the set of pages shared with
EL2. Both invoke a hypercall that can fail (page-state mismatch,
EL2 refcount still held), but neither cleans up on failure:

- share_pfn_hyp() inserts the tracking node before the hypercall
  and leaves it in the tree on failure, leaking the allocation and
  presenting a phantom share to a later unshare.

- unshare_pfn_hyp() erases the tracking node before the hypercall;
  on failure the host loses its record while EL2 still owns the
  share, breaking later operations on the same pfn.

Severity is low (no isolation impact) and the failure paths are rare
in practice, but the desync is real. Both patches are independent and
apply cleanly to current mainline. In other words, this can wait for
7.2.

Cheers,
/fuad

Fuad Tabba (2):
  KVM: arm64: Free hyp-share tracking node when share hypercall fails
  KVM: arm64: Avoid host/hyp share desync on unshare hypercall failure

 arch/arm64/kvm/mmu.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.54.0.929.g9b7fa37559-goog


