Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19A9C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDaByuob3STQywTT3cAOlaBCTEAiWYMVBfjiNkGWQmQ=; b=flLhzpOwe3qAhTOOU9lVWwuXO9
	/pJ6xSWTOtbujdECdlVTvqu4vYCxI6jQk+8ygAPwGbYTufibFcx6QKgZBnygG0IVCrcDrpFJqYS2h
	AyjMF0GzqWjIpFj1DB5yPLyei7i3OlsmnPaJTkmDAHpf/5OLGPOP4AGwjAxVTWgDEfNxr/hk9gnBA
	y6OJC4c4E1m9gP9CstNrHIhaXBba2W2ell7igUVglgIFBtoP+VWZEf9B58HQCEBIO213qhU37nGEX
	FwxgcXRnvyWejpuq68eM+0u37PH5fQPNiLVBU4qelLKcavmV4z5CA0QMqnA7f3ooWgo1bLGSISMMb
	QkSF5eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eep-00000002KzU-17R2;
	Mon, 21 Sep 2026 14:06:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eel-00000002KyT-3WTu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 14:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kDaByuob3STQywTT3cAOlaBCTEAiWYMVBfjiNkGWQmQ=; b=YrRGB0IfRJl0amrEhDsI/S5C2X
	1x1fY6MFiEiINuiHVT3eHkiByJMY5UzIHS74yBs55m/Nj8E2ZP1hxsOxiN63sDl9BpJ4YaYpte0wj
	we8g074ZxC+00R2IOoNDwhM49+kKLd6yP8WN31JqqCWmgG//jSrOvFHmFXyZzmbPAPLi9bdAwv6H2
	oJ0xyDUxkobez7mrDpY00AslJjBtaMu1XZSdM7QW+sJOHGuR9WRNbAs82ptPGip57IcFjuvcbilFt
	Leaniec5BBjz3J585/W70k4Pmqn+4UYrU5RjVpc6W7/VgGlvH4nxAnaFjMXkIvPCjjsxG2a8DKoSL
	c/HuR4hA==;
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8eed-0000000CNhw-3uh1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:06:05 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4078484a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999555; x=1790604355; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDaByuob3STQywTT3cAOlaBCTEAiWYMVBfjiNkGWQmQ=;
        b=Dti4r6AA9B1hlSGQtrrBhjyFnWPkhPSMBNbLykaLU6gPnxeOYqvA3lDK0BcD7LIPb1
         ji77U8bqc+dGf6IslTb6GvHmKOjSHqZ0dduzqAzgSL1TyWqV4HDHZ2weBN6r9UXK/S/V
         hevmPti9o2uVxTL2sqphCcupPancVyq6QVaCwCpJ+Ez7B3RuD41Z1vVatk4EMKBjgf6W
         xnn+Y1CeXevv9QCjcbbsF0iCkHXQvFBeNuqEBz7Ba8I0hZm1CchYHghOOK5w1PDnU+vq
         pF5pm6gnFiF6/k/0JcfS0BVVsAq3iRNF5yfZVicFK6IFfzV6pqXmJTapZH89cLamFMFB
         CqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999555; x=1790604355;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDaByuob3STQywTT3cAOlaBCTEAiWYMVBfjiNkGWQmQ=;
        b=UBMrv1A3nU2E+TIImhJLL8ou7SpOq5J8EW4pWinVSQ/83q3WFbtCbFFRx2s90WdUh7
         MKiQPRly+KvaT8mIEBu58sRPcH0BgHAWx91tANDLU8R4fsMTISJEtb3LI4BacinkJUvJ
         H5qieg8G6raiJ0amiJYiGRHHqy/zv3P9LoMPj/Du/IdEO8brgoWRAnTLx6AR5P7wVqR1
         1gnIibi5cdcvv2dKhUQMmgwxyTjkVRyJcmkxu59sEGx5oco3/32OXI4fggdYE0oNQOYT
         EgC4oC5R2VNpDsls4uxztWh95ezcqJyucvCCn5JWYROSLaXyvzTkQdFr0ryed4PuYG9k
         x46A==
X-Forwarded-Encrypted: i=1; AKwUvBzuz9ZKF518B/CGwlrI+43wMWeUandiBmKavYEF1Yb27yBGP0b8ui/HhBTCu2QczjwAMnoR5lmssHW8cfczgTQm@lists.infradead.org
X-Gm-Message-State: AFuF++ntyMD7hnu8sqZ4u7yVH5bQ5xc0bJwvv/Dz4WNIwFtFNwI9HQiv
	dx0ZUkVRCW5ANYJ/UE42RwZ5fyoPYtENdxphbhX5NCNqEYlRUzCdiT/AD8DWim9idr3a+foDFXm
	beL/Mnw==
X-Received: from pgdt6.prod.google.com ([2002:a05:6a02:3006:b0:cc4:e953:2e4b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d07:b0:3d3:aec2:4dcd
 with SMTP id adf61e73a8af0-3dd8c48ee7amr18530514637.25.1789999555175; Mon, 21
 Sep 2026 07:05:55 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:02 -0700
In-Reply-To: <20260806214618.82180-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806214618.82180-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999694044.717318.4471496122366852907.b4-ty@google.com>
Subject: Re: [PATCH] KVM: Never clear KVM_REQ_VM_DEAD from a vCPU's requests
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_150603_626034_37269AAF 
X-CRM114-Status: GOOD (  10.52  )
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

On Thu, 06 Aug 2026 14:46:18 -0700, Sean Christopherson wrote:
> Use kvm_test_request() instead of kvm_check_request() when querying
> KVM_REQ_VM_DEAD, i.e. don't clear KVM_REQ_VM_DEAD, as the entire purpose
> of KVM_REQ_VM_DEAD is to prevent the vCPU from enterring the guest ever
> again, even if userspace insists on redoing KVM_RUN.
> 
> Ensuring KVM_REQ_VM_DEAD is never cleared will allow relaxing KVM's rule
> that ioctls can't be invoked on dead VMs, to only disallow ioctls if the
> VM is bugged, i.e. if KVM hit a KVM_BUG_ON().
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: Never clear KVM_REQ_VM_DEAD from a vCPU's requests
      https://github.com/kvm-x86/linux/commit/8cd280282d12

--
https://github.com/kvm-x86/linux/tree/next

