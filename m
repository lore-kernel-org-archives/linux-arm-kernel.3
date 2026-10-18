Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E812CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JipYdo2bB1OfUJDoroTZjZ485KsuI12cRAd7OrDUZ0=; b=THCVh48ROTRJoKoIbfObuQiYSM
	h2iQlzU1K3Jlibej1Gg7PKrLaky5GZfrae2I7rGuNu43De+cbH6mdOp2ECrQx2TrRVhJsH5LEGLxj
	sxVM2wYwAfOB1SeYP9LPn4zNAsnTM77k4U5gDhwKj+ac8kgH3FlaRD70FOd3BAeH2vyWuCeaNTb/U
	4VW/Jz4PN+9P0XPBBucFGjI/1fTXYSP8qAOgb+fzqK9zDgVp7Vjh5caG3aHW26X06LpADeO++zm7U
	79zoLkohqdBgqp46AlAZ7J0C0Gxbel9BWHBlFgHikslbOb82BxWzadkE20Gf1G5Y2JbwaRUkuyhWM
	bHGN9igA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISqT-00000005ziz-3ACS;
	Sun, 18 Oct 2026 15:30:45 +0000
Received: from out-200.mta1.migadu.com ([95.215.58.200] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISqR-00000005ziW-0jXr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 15:30:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/JipYdo2bB1OfUJDoroTZjZ485KsuI12cRAd7OrDUZ0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792337441; v=1; x=1792942241;
 b=U8eM9eGhc2RfnOjNhpnMbs4gg2+nDzQG8clNYNBVE5sFmmxA/1Pmhl0rqcuoK9aKHzmVwkwO
 EhRfRm+8WojJcaZKV2urh9GjVpApNahgU4swYLOP7qRMIFE8EYS9lWgIswNjs0+dOXn5HFIkW86
 fPY3UYSbRLvtpPT86JbVThIc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d5c2c56c8a0a8650;
	Sun, 18 Oct 2026 15:30:41 +0000
X-Mizu-Trace-ID: d5c2c56c8a0a8650
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso4821e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 08:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjlVdDU1V+Djln8vqrVzR/KwqwD93SHwghDriftcWOv/WS3k/TsoiWoEcrskRBnsfQ+q8LFwTUjaIWma++JdqQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJXZg9zEMPTCmAX4zG0VyZQqzyl54TlywJ+2+6THExZJNT3AGww
	n5FGteqoYfhNp/PWPuW0RJtajcXx5aeJzeaaJ4aVLzRzsy2xa5uOB2sFcDdBhifq14ShT7t40N4
	Mysil9aTzfSccDkYgolebxsonpagC2QFA5l1C37Dr
X-Received: by 2002:a05:6512:4026:b0:5be:5605:3606 with SMTP id
 2adb3069b0e04-5be560540ecmr42233e87.8.1792337439769; Sun, 18 Oct 2026
 08:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261014162126.964330-1-maz@kernel.org> <20261017165204.3343275-1-sashal@kernel.org>
In-Reply-To: <20261017165204.3343275-1-sashal@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 18 Oct 2026 16:30:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzNJ_Cmzthn04bzHdu2+1cDmwqRsnK1uWQ1XBmxJdt04g@mail.gmail.com>
X-Gm-Features: AclHuK-MBUMuIZ1CdPDTxZws0S-OBMvb5spNuDbDe5Ykb1uD70nnFSK1DYZMkr0
Message-ID: <CA+EHjTzNJ_Cmzthn04bzHdu2+1cDmwqRsnK1uWQ1XBmxJdt04g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Take a protected vCPU's TWI and TWE only at
 vCPU load
To: Sasha Levin <sashal@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_083043_703754_60217F1D 
X-CRM114-Status: UNSURE (   8.36  )
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

Thanks for fixing this Sasha.

On Sat, 17 Oct 2026 17:52:04 +0100, Sasha Levin <sashal@kernel.org> wrote:
[...]
> Build-tested only: arm64 defconfig with gcc and clang, W=1, no new
> warnings. The only code generation change is the protected vCPU's
> per-entry mask, 0x6100 to 0x100. Not runtime-tested, as the in-tree
> selftests can't create protected VMs.

I tested it on QEMU, with the host booted with
kvm-arm.wfi_trap_policy=notrap and a protected VM using kvmtool. The
protected VM doesn't take any WFI exits (4415 with the default
policy), so TWI still reaches it at vCPU load.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

