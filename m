Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD71D2D0EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8QPX6ZNIf2tJRE8LE0f+mWp9FzhMtW5IaPCrANgiH8=; b=NU9HPOZFp9u66McwLtGNFfx7+1
	LpSnivV0mfAtAMN7ESnRw6zYsf53ASZkxRnTOzB2c7oPSK8vlZWlGdZRsMRIdkfym+Cm4G6ZFt+2L
	TnJwlLvGW4Z/8nsnBYvnnh6ygHTX7dPxxZjigkZWkNz7NDRjYNz7X+bpurmiAR75swztHd+KAAidu
	kDv1Jt7YXD3Mw9ALBJG43Tnh/PAybWpsUlifgUxCcPxdGjJfpiM6ccP7bQnyV2lyb91Fa2PNheXYN
	3qBr8ginJJB2GYJvLOP2XjGiOKJhLavOxaFsZ4EqiQN9sOAMNZMZ/LwQQODpqUBX+g+24D+HH2Bzl
	Zcw58pIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffg0-00000007Hil-489O;
	Tue, 13 Jan 2026 14:47:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfffy-00000007Hi8-2wes
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8FEF41ABD;
	Tue, 13 Jan 2026 14:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE765C19422;
	Tue, 13 Jan 2026 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768315637;
	bh=bmqIQmLkIZkqUem7xNcRewV5DCcMsK6QQXdiFILHQ0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+RZ1DOBedS4sV6A2tN6gPHd2HAtS3KDmwnCtimAkiaVTt473o8qz37Bo/DVVPnzT
	 VLc+zPNuLqjjLEubdOyE4PFduehIXRO6QY301c57hvGI4pI1l4rCR6H+3zU73wo49p
	 sBYgi+JEjlG0pqb0no1Huv9ChlUEBLqI/FcJ3AuqOyIWz5uXFBPZsVCD0pMBjCR0vt
	 PcKFuobxyYU29g1Soos49w40PmXylg1ltjCWxrVhFNGvb1XREdgtQ464zV6j1nhBEe
	 +eyUsNY4HfdfyZm5YgoQ4PDpK6+K6T6f2y6VJ/bIPAmMhy9fT/NqsDzvMb06bXnbXO
	 LwkRMpJy3k9AQ==
Date: Tue, 13 Jan 2026 08:47:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Anshul Dalal <anshuld@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v8] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
Message-ID: <176831563605.3742417.8691359583329615033.robh@kernel.org>
References: <20260113-k3_syscon_add_boot_mailboxes-v8-1-d43954527b5d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-k3_syscon_add_boot_mailboxes-v8-1-d43954527b5d@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_064718_785767_4BD897D8 
X-CRM114-Status: GOOD (  20.38  )
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


On Tue, 13 Jan 2026 11:08:56 +0530, Anshul Dalal wrote:
> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
> which might be different than one's available to the kernel (firmware
> spec).
> 
> Therefore, this patch adds the missing mailbox entries to the DT binding
> if the matching compatible is ti,am654-sci to represent the mailboxes
> exposed by the hardware during boot for the purpose of loading the
> firmware.
> 
> The newly added mboxes are made optional by keeping minItems as 2 to
> remain compliant with existing device-trees. The new 'notify' channel is
> not supported on all SoCs and is therefore kept at last in the list.
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
> Changes in v8:
> - Refactored the patch to a simplified diff
> - Link to v7: https://lore.kernel.org/r/20260107-k3_syscon_add_boot_mailboxes-v7-1-d97a943f0a52@ti.com
> 
> Changes in v7:
> - Removed ti,am642-sci compatible
> - Keep examples unchanged
> - Modify ti,am654-sci ordering to ensure compliance with SoCs without a notify channel
> - Link to v6: https://lore.kernel.org/r/20251222-k3_syscon_add_boot_mailboxes-v6-1-b93ada9f1d47@ti.com
> 
> Changes in v6:
> - Added ti,am642-sci compatible to represent SoCs without a "notify" channel
> - Added new examples instead of editing existing ones
> - Link to v5: https://lore.kernel.org/r/20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com
> 
> Changes in v5:
> - Added commit description for the optional mailboxes
> - Link to v4: https://lore.kernel.org/r/20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com
> 
> Changes in v4:
> - Make new boot_* mboxes conditional on ti,am654-sci compatible
> - Link to v3: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v3-1-66155a4236dc@ti.com
> 
> Changes in v3:
> - Drop [1/2] of the last patch series
> - Update existing example with boot_* mailboxes instead of adding a new one
> - Link to v2: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com
> 
> Changes in v2:
> - Remove maxItems entry
> - Remove RFC tag from patch (added by mistake in v1)
> - Document the new mailboxes in mboxes instead of mbox-names
> - Provide example with all the mailboxes set
> - Update commit title to have "ti,sci"
> - Split into two patches
> - Link to v1: https://lore.kernel.org/r/20251111-k3_syscon_add_boot_mailboxes-v1-1-529a27f21076@ti.com
> ---
>  .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


