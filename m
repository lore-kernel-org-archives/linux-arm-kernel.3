Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8341DCD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 06:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwP076I/SbrBnwh9hhmLpYzId0geiVgIKLZ2AElPwTQ=; b=cbKVM9ZaYZbWwq05bWONzOM7qD
	i2fnE/CoSjNMFG0d5JQGEhhB+cePoB8PUYgrOFFQ4UPBPNkGK32aJ+ASvfyhlsyvuFYjcQLHjOwUQ
	UyNDZ/JUOaLlbw+by2g2VpNVGnhYPj2lzv9mYr2QUsyee2KHyXHAESMWGkN61m7TtOgL39jHfnHMQ
	e0UX98lSrQIEssIHmAW4QkhlZcNQpcy2wh77sIQ9XksIgjEDPqO4jZdlkrHLK0C0uhlSIZIouFdhl
	TCqTbFsklffDP0j0eYT/RfXFjiHf7vsoghqat9rQslV5cScertiAyBTHvNSALd2SPqpzuPX1QHWFa
	GZNttgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrB2-0000000EOAN-3QtF;
	Mon, 18 May 2026 06:10:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrB1-0000000EO9g-0Edr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 06:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PwP076I/SbrBnwh9hhmLpYzId0geiVgIKLZ2AElPwTQ=; b=Qa4nuuz+DEBE2gGCIm/SllorGs
	bUFQ/qXsZa1LHVKryL0gXGJ/e2ERsPf8sqxwkm9J04h3jLt0wITcQ0cLe/F2Ioa+sIaaxkT30mRX+
	P7ooJPUwNz27Axp9fzXxMwcyO6tqOKMwr7wBcuHSpnHqTrU+rkP8FDIrRjYyrRG8hQOARJn7kNfwA
	6SUaPmtT0OsxeguSUD8lvMvjyZyVkl7sdh6e7Su7qebSx6FFuOQvbCpTm4U9031pIAa5ZjkpNgLij
	wVUnvmmLvKVMUFd+biI/6+/utJiDS3li+6S04V0/6oiCt3k9h50DmwHdrl+gRyLRNuxOfPXviElL/
	GOMuv4RQ==;
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOr6U-00000009yuz-0ha8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 06:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779084315; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=PwP076I/SbrBnwh9hhmLpYzId0geiVgIKLZ2AElPwTQ=;
	b=U6RcwSU7G7hRSt7F2+Ku9VlkHQzwFO9CgfVTgjKmrMWmPqaWoJMfzIIEK4WmRLGhQRYTBfvNdlMAbTXPL0Ob2HfY4n+EN80qtZB+ONyMRjNdFFWV3dzmO9zSuPSYsj4DOVxVRxpI58nzzkPBn1IIJ1dyqF2AF0zCGMWMyZZ+cOk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0X33TsTD_1779084313;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X33TsTD_1779084313 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 18 May 2026 14:05:14 +0800
Date: Mon, 18 May 2026 14:05:13 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic-its: reject restored DTE with
 out-of-range num_eventid_bits
Message-ID: <w6zdprlry2y37wtkirv4zhiy5awau3stbkjohmvfwkswgoaafe@ul53z6xwyuhw>
References: <20260517174955.273004-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517174955.273004-1-michael.bommarito@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_070531_426555_88D11FD3 
X-CRM114-Status: GOOD (  28.78  )
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

On Sun, May 17, 2026 at 01:49:55PM +0800, Michael Bommarito wrote:
> Userspace can trigger a host-side denial of service via
> KVM_DEV_ARM_ITS_RESTORE_TABLES. A Device Table Entry whose Size
> field encodes num_eventid_bits > VITS_TYPER_IDBITS reaches
> scan_its_table() with a sign-extended ~18 EiB length, where the
> loop holds the per-ITS mutex and never calls cond_resched(),
> pinning a host CPU for a time linear in registered guest memslot
> size. The accessor is any process that can open /dev/kvm and
> create a VM. The same out-of-range value also disables a
> subsequent live bounds check on EventID, as described below.
>
> The MAPD command handler already rejects this case in the live
> path:
>
>   if (valid && num_eventid_bits > VITS_TYPER_IDBITS)
>           return E_ITS_MAPD_ITTSIZE_OOR;
>
> vgic_its_restore_dte() reconstructs num_eventid_bits from the DTE
> Size field but does not apply the same cap, so userspace can
> install device state that the live MAPD path is documented to
> reject. The restored value is stored in dev->num_eventid_bits and
> is then used by vgic_its_restore_itt():
>
>   size_t max_size = BIT_ULL(dev->num_eventid_bits) * ite_esz;
>   ret = scan_its_table(its, base, max_size, ite_esz, ...);
>
> scan_its_table() takes the size as int and assigns it to
> unsigned long in the callee:
>
>   static int scan_its_table(struct vgic_its *its, gpa_t base,
>                             int size, u32 esz, ...)
>   {
>           unsigned long len = size;
>
> For num_eventid_bits = 28 the size_t value 0x80000000 truncates to
> INT_MIN as int and sign-extends to ~18 EiB as unsigned long. The
> scan loop then walks the registered guest memslot one ite_esz at
> a time with the per-ITS mutex held and no cond_resched(). In a
> QEMU TCG arm64 guest at EL2 on v7.1-rc1, with an empty ITT, the
> ioctl returned -EFAULT after about 14 seconds with a 256 MiB
> memslot and about 56 seconds with a 1 GiB memslot (linear in
> memslot size). The per-iteration cost on native arm64 KVM
> hardware will differ; the loop shape, and so the linear scaling,
> will not.
>
> The same out-of-range num_eventid_bits also disables the live
> vgic_its_check_event_id() bounds check, because event_id is u32
> and BIT_ULL(32) is unreachable in that comparison, leaving
> subsequent MAPI/MAPTI handling without an effective EventID cap.
>
> Mirror the MAPD cap in vgic_its_restore_dte() before allocating
> the device, so out-of-range restored DTEs are rejected with
> -EINVAL up front rather than triggering the int-truncated scan or
> installing a device whose num_eventid_bits silently disables the
> live bounds check. Sizes within [1, VITS_TYPER_IDBITS] are
> unaffected.
>
> Fixes: 57a9a117154c ("KVM: arm64: vgic-its: Device table save/restore")
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index 2ea9f1c7ebcd0..a5dcf9a6a2854 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -2307,6 +2307,15 @@ static int vgic_its_restore_dte(struct vgic_its *its, u32 id,
>  	/* dte entry is valid */
>  	offset = (entry & KVM_ITS_DTE_NEXT_MASK) >> KVM_ITS_DTE_NEXT_SHIFT;
>
> +	/*
> +	 * The MAPD command rejects this case; mirror the cap here so a
> +	 * restored DTE cannot install an out-of-range num_eventid_bits
> +	 * that vgic_its_restore_itt() would then convert into a
> +	 * sign-extended scan_its_table() length.
> +	 */
> +	if (num_eventid_bits > VITS_TYPER_IDBITS)
> +		return -EINVAL;

Hi,

IIUC, the same issue is still there when VITS_TYPER_IDBITS
change to >=28, I know it's limited to 16 in GITS_TYPER's
definition. I mean the issue is still there w/o really be
fixed.

Change the scan_its_table() and other related code path to
avoid such date conversion issue is more reasonable
fixing to me, please also wait others' input yet.

> +
>  	if (!vgic_its_check_id(its, baser, id, NULL))
>  		return -EINVAL;
>
> --
> 2.53.0
>

