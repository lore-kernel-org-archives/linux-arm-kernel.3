Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FF0CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 21:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0aGfTkloD6thUsau2N6QNXc52Skz2m3NK5z2jAQB14=; b=2C6v8EjI4MUjg6/P2jv/z1LGlj
	iqOjszvPeYRXkyZK8kzo7zYhU+UBaplW+gWNh5TPGNvnOdWIZhnBw881ubY1TIo7fokudLd2zrrYt
	h2BWUCKt/s0fPF36IkwS6xzt3NJBLdGIm602ouHo72Mj7uV4ql6fra7HZT3sNdk9oYmHnnnMYg8ID
	2pSjw3FeGMfof+BGwN2WWvnjVAVEuEcgyRo3n+r2PL3Ee0/9Vmz+5W0Xq8F36elKfcWsCQCbu8UyE
	9HWtPcAx8mGbDLYUgrceCf0pEDwZ/VLBXNLL5+oDQR2lHzxGtnL2pLj7nnqEyx5730hPJxg/YUsoF
	qHcKu6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZ7V-00000006078-0Omg;
	Thu, 30 Apr 2026 21:40:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZ7R-0000000606b-44Sx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 21:40:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE69E169E;
	Thu, 30 Apr 2026 14:40:18 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50E453F763;
	Thu, 30 Apr 2026 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777585224; bh=8lyAwzWVTmFDUmliFb03cvHhr/tGqRi0gI3snoi4/Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jEVDxx9Nr8dqUAI3cJEY920Hm3c+qicOYErtC8OS4rmzF3gQaVhR/BvUf/gEd+Qh6
	 iOl2CVAia5mkOb7KlDqGDY3/odBKfUwxZsCbLdO1ZlubiMLcFMG/i/xi+diYebfftd
	 g3MJFOLRZFlb3Af1MCknmn/nS91k5pw5wISRKS1g=
Date: Thu, 30 Apr 2026 22:40:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Armelle Laine <armellel@google.com>,
	Sebastien Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] KVM: arm64: Support FF-A direct messaging
 interfaces
Message-ID: <afPMQ29x5fjHwtDo@e129823.arm.com>
References: <20260121-host-direct-messages-v5-0-2c1614c94e80@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-host-direct-messages-v5-0-2c1614c94e80@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_144026_223313_194A2963 
X-CRM114-Status: GOOD (  17.16  )
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

Hi Per,

May I ask how this patch is progressing?

Thanks!

> Support FFA_MSG_SEND_DIRECT_REQ unconditionally.
> Support FFA_MSG_SEND_DIRECT_REQ2 if hypervisor negotiated version 1.2+.
> 
> Framework messages (FF-A control plane) are filtered out. For
> FFA_MSG_SEND_DIRECT_REQ, we look at flags in w2. Messages using the REQ2
> interface are always partition messages.
> 
> The second patch was part of a previous patch set [0] but was dropped
> since the use case was unclear. A clear use case has now appeared: use
> TPM device with CRB over FF-A when kernel boots with pkvm [1].
> 
> Tested by booting Android under QEMU.
> 
> Best Regards,
> Per
> 
> [0]: https://lore.kernel.org/all/20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com/
> [1]: https://lore.kernel.org/all/20251027191729.1704744-1-yeoreum.yun@arm.com/
>  
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
> Changes in v5:
> - 1/2: do_ffa_direct_msg: validate that sender is HOST_FFA_ID.
> - Link to v4: https://lore.kernel.org/r/20260109-host-direct-messages-v4-0-95da4221d186@google.com
> 
> Changes in v4:
> - 1/2: do_ffa_direct_msg: check that flag in w2 is zero; drop unused vm_handle parameter.
> - 2/2: ffa_call_supported: simplify logic by reordering cases.
> -      do_ffa_direct_msg: switch polarity of check and update comment.
> - Link to v3: https://lore.kernel.org/r/20251119-host-direct-messages-v3-0-c74d04944b26@google.com
> 
> Changes in v3:
> - Filter out framework messages as suggested by Will Deacon. Update cover letter accordingly.
> - Update trailers: Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> - Link to v2: https://lore.kernel.org/r/20251030-host-direct-messages-v2-0-9f27cef36730@google.com
> 
> Changes in v2:
> - 1/2: Drop support for FFA_ID_GET interface in host handler.
> - Link to v1: https://lore.kernel.org/r/20251030-host-direct-messages-v1-0-463e57871c8f@google.com
> 
> ---
> Per Larsen (1):
>       KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler
> 
> Sebastian Ene (1):
>       KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host handler
> 
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> ---
> base-commit: 6c790212c588fddeb0d852f2790840753bb604b1
> change-id: 20251029-host-direct-messages-5201d7f55abd
> 
> Best regards,
> -- 
> Per Larsen <perlarsen@google.com>
> 
> 

-- 
Sincerely,
Yeoreum Yun

