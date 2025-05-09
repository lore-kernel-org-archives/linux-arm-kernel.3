Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C54C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0tQx/NpHIPKayk3PQvGhHP9Erua5/o/RYaG8auxYrs=; b=nwAmCZ3YLH4G8izNF/GSfEO0cp
	9uCjmrRJco6dTM9My5QOroWpZzAnRf3yxmzSr4lFLmHAcYPrn2PEAJ1tJsorUT4+ycTy0k3MRfcFr
	HyjVWKgNDOhOpwbK3elAOtvA7sgdjfn/Iy31Yw58Mavyk9k/q2w/IGPnERv8wh36BpqcH3we9jOhk
	jcd5Hvoswhk/CgxrUX2ezzF2OIpZWj+wuRoH90OdRV3aRMXxOKb5YlyuxIcBoxCAxZmr8DCpp/N+K
	L2hX0+EkmeF6uFGIhmfCLU+Zzlvtb51gmajQYkyApMBwTIcTojyjJEzI5DZJdE+hRwct39A0f5STo
	w7QynF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQah-00000004HVs-3vd4;
	Fri, 09 May 2025 16:28:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOX4-00000003v3D-4B4N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2570C5C6C33;
	Fri,  9 May 2025 14:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4B0C4CEE4;
	Fri,  9 May 2025 14:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800218;
	bh=U+eIzfvbDzC+peDIexb8/J/VSJleddT2WMz6l2+u9Ao=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MZoqE8GvExAd9uHeApXsM+CZVl7myYnzo8tKwSkcsY5XpLZOA3cwU2enpOPQGvWAI
	 +iPFvYQq4k0crGCaMMUHJ0pRY7XBBhW85dC+n920KVYiNpm34RX+t/HuqmzZtGdxhO
	 l0U3dgopbDBm6kohHVmsYiMolHbMVZKhCLksa8B2tyCU4COaaB75EZ68fWww5Ujnzu
	 ua6fEDAMazplVp8o0MPHZiW9mIYyHGe8F0nos9qVNAYl3LR028/nH6ruZcptriNwCV
	 YosgCn5rY4F7B+GvFsUz+OdI+vXB0ONNgGRxkgeg6At239Vjqsh3jsSysdV2ZzvDlV
	 n+49iyJMpNfyQ==
Date: Fri, 09 May 2025 09:16:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Leo Yan <leo.yan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
In-Reply-To: <20250508103225.354925-1-sudeep.holla@arm.com>
References: <20250508103225.354925-1-sudeep.holla@arm.com>
Message-Id: <174679984875.3368325.1365758165371282064.robh@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: fvp: Add CPU idle states for Rev C
 model
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_071659_088061_6E88E562 
X-CRM114-Status: GOOD (  15.54  )
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


On Thu, 08 May 2025 11:32:23 +0100, Sudeep Holla wrote:
> Add CPU idle state definitions to the FVP Rev C device tree to enable
> support for CPU lower power modes. This allows the system to properly
> enter low power states during idle. It is disabled by default as it is
> know to impact performance on the models.
> 
> Note that the power_state parameter(arm,psci-suspend-param) doesn't use
> the Extended StateID format for compatibility reasons on FVP.
> 
> Tested on the FVP Rev C model with PSCI support enabled firmware.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm64/boot/dts/arm/fvp-base-revc.dts | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc1-1-g59529bbe642d (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/arm/' for 20250508103225.354925-1-sudeep.holla@arm.com:

arch/arm64/boot/dts/arm/fvp-base-revc.dtb: idle-states: entry-method:0: 'psci' was expected
	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: timer@2a810000 (arm,armv7-timer-mem): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#






