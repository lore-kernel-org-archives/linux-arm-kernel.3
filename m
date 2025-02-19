Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C41C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HYNXCOG+wz0Fdaw+JzO32UazAyTjP8oMfGb/KMbtPQ=; b=I8llgVkZQBDFGhFzOVh7N4vt/R
	uet1iC2flMVyttoMjlUdIIBgfF8QwD032o1VLJMIzCULDr3HupLLxHXD77kltkXJJTPtKFm+F0Car
	Jt/xA2RQlYapzXxavEOhv75r9vR6G/sQHUWhXR8kaKA8gnBpd3XyRFN7vDeTcLo2OAzARc8GoBS1E
	I8BVoxfC6pu0dgxMF0/ozMTmMuOhtmzMC5glmDxB8nFvpq7XvddakQ2HOtiHXjiXt3VeZc6R3+LXO
	t1LhLTu/MfgQom1qjA/h93ovqhMldZlNwTGfhIAoo18AUWUUS2nB2NafCXRkMKvd6bYtXpEAFrHXC
	vQUZFWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tktRt-0000000FgpH-1U0s;
	Wed, 19 Feb 2025 23:25:49 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tktK4-0000000Feai-2qVo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 23:17:46 +0000
Date: Wed, 19 Feb 2025 15:17:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740007060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2HYNXCOG+wz0Fdaw+JzO32UazAyTjP8oMfGb/KMbtPQ=;
	b=rWjIol6+9So8K9A93M3qdYQy57XhJ6qTjdt3sJPKEgVbKEBQ6+SFT8I5y3AI88ntH3Y7AN
	S1MvjMiuGAuZovKk/UGMRVbTxEJMYFvuoXKaypfdQX3MlIhdZxluwsIVrJQ/7uSzsFQyuF
	Hobudgns7BwfXvj1wNR9P6T7YBKmfMM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 00/14] KVM: arm64: NV userspace ABI
Message-ID: <Z7Zmi0WAkudX5h0h@linux.dev>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_151745_308833_611259F8 
X-CRM114-Status: GOOD (  16.58  )
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

On Sat, Feb 15, 2025 at 05:38:02PM +0000, Marc Zyngier wrote:
> Since the previous incarnation of the ABI was proved to be subtly
> wrong, I have reworked it to be more in line with the current way KVM
> operates.
> 
> No more late NV-specific adjustment nor writable ID_AA64MMFR0_EL1.VH.
> The NV configuration is now entirely selected from the vcpu flags.
> I've preserved the KVM_ARM_VCPU_EL2 flag which enables NV with VHE,
> and added KVM_ARM_VCPU_EL2_E2H0 which alters the NV behaviour to only
> allow nVHE guests without recursive NV support.
> 
> This series is actually very little new code. The bulk of it is
> converting the feature downgrade to be per-idreg, essentially going
> back to the state before 44241f34fac96 ("KVM: arm64: nv: Use accessors
> for modifying ID registers"), only slightly modernised. This then
> becomes part of the reset value computing.
> 
> The rest is simply what you'd expect in terms of being able to write
> the ID_AA64MMFR4_EL1.NV_frac field, making the correct bits RES0 when
> needed, probing for capabilities and handling the init flags.
> 
> Patches on top of -rc2, with the integration branch at the usual
> location.

This all looks reasonable to me. NV won't be ready for the limelight
this time around so unless someone shouts I plan on taking the first 12
patches of this series in 6.15.

Thanks,
Oliver

