Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81ABC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXQacLcIFwR7ZuYK6qsdnfsijiXHCug7tTEi1uY6KQk=; b=PRudEl9CxbKBKJ/kHfLO3vBo2A
	T+Uzu97M3ErSbvEaBkLPt7OTebHOTwXokqsBIxwgyQzYynyZXXPg1WFlsi7KUn31AbsPR26CFg0G0
	Fj9EN7pT4c9FxmO5OJuK00oYM6xhmQfveVVjelxTS+GorQkAzjbEZnRRxH6KweDBGf9A5ssr3sTHR
	rECX1joYkQXtKbwItRgfuK5vv2m/sNB1ZTKeV02CsW7WYKlB6QPniQYv0vsr+ZFoocYhM8n2JlDbI
	CWoWF60ciUWsfmYxepCJinNrU7oKp4gI+QgBfM4nwzfC5Oa2oU7GK9VJOUYOAiHMjLT8k8eli6uvn
	7kFrhklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBUP-00000001Rmg-2ZNe;
	Tue, 04 Aug 2026 09:31:13 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBUM-00000001Rlt-39W5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 09:31:12 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqBKs4O6Czk0G9NptYY7ojw78Nd9qmPl0wattWqqlSYlqSbKlRxWUKJpBlvaYlknXL6FUjShSS5UjCxj6WrcraR@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785835869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXQacLcIFwR7ZuYK6qsdnfsijiXHCug7tTEi1uY6KQk=;
	b=rZAK6b0q2248sam+VZIpSeUXUL8Ihn1H5yMOtCeAsgdYy09H0DP3+5Pm7MiCZ59Y0fh7ys
	Z47ftzWIwqM8LR5TwmlBIn69Ery46lVDtrL24r4wVB+Sadq9xVbbhbxRhQsxFA6ZwqTRmm
	BDghTV9PsNaoXscTSJdlBrMUgyNZSeM=
X-Gm-Message-State: AOJu0YyCSkkeRAwpEF7AvVoH6NaNW7sWRehPYC//ezDH5DRvQUrs/Lu3
	h/3sAjgcb5qxVy8VyZo92D0d0zS2iwsuysECMM0sYNu7cm2G5MsQzZDw9O+ElDx8xajhKA2KFJ5
	d0xH4JtO+YBchzOYDDmd2zlKpMbrynrCImqQgC6mM
X-Received: by 2002:ac8:6f1b:0:b0:52c:d3a1:358a with SMTP id
 d75a77b69052e-52cd4fc8ac0mr12704081cf.14.1785835856207; Tue, 04 Aug 2026
 02:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260803-kvm-arm64-idreg-final-v2-0-d7d7e4efc640@kernel.org>
In-Reply-To: <20260803-kvm-arm64-idreg-final-v2-0-d7d7e4efc640@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 4 Aug 2026 10:30:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxNcZrS8vPrrymJq_FZHUenrvxOd3aJ+WB7Fn8qY0NkKA@mail.gmail.com>
X-Gm-Features: AUfX_mwOsdi-QRZEA5-6WcEPzmFvIg_rwrA6SfmdszIDnIgH0ZZi1VAKN1yeckA
Message-ID: <CA+EHjTxNcZrS8vPrrymJq_FZHUenrvxOd3aJ+WB7Fn8qY0NkKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: ID register finalisation fixes
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_023110_928344_EB942EFF 
X-CRM114-Status: GOOD (  18.22  )
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

Hi Mark,

On Mon, 3 Aug 2026 at 23:54, Mark Brown <broonie@kernel.org> wrote:
>
> While looking at some feature enablement I noticed that there are some
> scenarios where we can end up with an inconsistently configured vCPU due
> to finalizing configuration based on ID registers before we have blocked
> writes to the ID registers. This series aims to clean up these issues.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

I didn't want to hold this for the broader coverage you suggested, so
here is a focused test for the failed-first-run path [1]. It fails
without this series.

Tested on top of v7.2-rc5 under QEMU: boot tests, plus the
set_id_regs, vgic_init and get-reg-list selftests, the last also under
nested virt (-M vhe, kvm-arm.mode=nested).

For the series:

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260804092421.1728880-1-fuad.tabba@linux.dev/

> ---
> Changes in v2:
> - Also replace the kvm_vm_has_ran_once() usage in kvm_set_vm_id_rg() and
>   kvm_vm_finalize_sys_regs() with kvm_id_regs_final().
> - Link to v1: https://patch.msgid.link/20260731-kvm-arm64-idreg-final-v1-0-3de2a5616dc6@kernel.org
>
> ---
> Mark Brown (2):
>       KVM: arm64: Finalize guest-wide sysregs prior to per-vCPU sysregs
>       KVM: arm64: Block ID register changes after we rely on the values
>
>  arch/arm64/include/asm/kvm_host.h |  8 ++++++
>  arch/arm64/kvm/arm.c              |  2 +-
>  arch/arm64/kvm/sys_regs.c         | 57 ++++++++++++++++++++++++---------------
>  arch/arm64/kvm/sys_regs.h         |  2 +-
>  arch/arm64/kvm/vgic/vgic-init.c   |  6 ++---
>  5 files changed, 48 insertions(+), 27 deletions(-)
> ---
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> change-id: 20260729-kvm-arm64-idreg-final-77cbc46b558a
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>

