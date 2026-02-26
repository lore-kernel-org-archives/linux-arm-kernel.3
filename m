Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC6BFC5910
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtC52ELc0UW+0V1vkk/lWXLOrSGx7hwRDR6yrPq+uSU=; b=mO9xf7+lw9LoYXUGEexHwYMO2p
	Rrsuy5ef0bB16y8ZUmfPXXNmRFeL9tW1jfq6VG1UTSdbzI2CARcS+dzBwSGgjdiIltfayzoEHMsUD
	uKqPn/QwKVPQJb/0kHem4b1FN1y9wi45q6ZNNWXjz1YMxaThoSJze28D++y/wRJs4ci1PwBb3Q0BO
	X8q0avQMEMj3KWANIi70UrZ6FQdBBldw68kTkvBOVTTA/kJr1kZ8zdb37SpJ+B/l57nD+uHJwGPs3
	z/ce0/SI87lkt2MDVkWbxmn8asjrLhFSOBq4F2F09zlMyqKMxuTGZ8SC0eVM3lJnw7Lhll4E74ucm
	dYtMtT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWv6-00000005fXf-1CGX;
	Thu, 26 Feb 2026 08:40:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWv4-00000005fWq-0X1k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:40:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 671F0443F8;
	Thu, 26 Feb 2026 08:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86137C19422;
	Thu, 26 Feb 2026 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095225;
	bh=03ww9eTAIOimZhGpfh2LPpkkMRKr/FXHrMGkGgHg/uw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ThIjjoHxqM636G0Cb4gnvicEzqDaWweb11h4BxNO2jwU+10Vl/Wm9iKZjaw+5VWjm
	 ufG1bjxq4wdlIb2/8c+ESNhu4fquHv61kkdnMXhsscm6nNgZoBSDd/XFlMMIII4bta
	 VELfeTX6NG22vMvnuPbsOfGMHKYXCUP7nOR02q5dIBc8cDrHMu8Lkq6ibO7Xp+gN6w
	 jmkhuT6D3/c/X1KILWfAeZ72tsTAcXx9sGyAJYBB+Sm0lYnuO2MNBLkGY1kWSlkjyU
	 fPY5MQ5RwoiBS3jeqMHMtlbIvvOrJAN5lBLFN5YvDtHrCrlCWPTE6wzCfu5zBJpgDb
	 SsBLNBXbUPIWg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rayan Marzouk <rayanmarzouk743@gmail.com>, 
 bluebunny <kalorin.bok084@passinbox.com>
In-Reply-To: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
References: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
Subject: Re: [PATCH 0/2] Add device tree for Samsung Galaxy J7 (2016)
Message-Id: <177209522223.26390.6219893536178441080.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 09:40:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_004026_182796_4F535E78 
X-CRM114-Status: UNSURE (   9.30  )
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


On Sun, 25 Jan 2026 01:35:25 +0530, Kaustabh Chakraborty wrote:
> This series introduces the device tree for a new Samsung Exynos 7870
> device – Samsung Galaxy J7 (2016).
> 
> I have acquired permission from the authors of this patch to upstream
> this on their behalf.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: add compatible for samsung-j7xelte
      https://git.kernel.org/krzk/linux/c/be961cdb8ed3befa81dce118a6a41f0138732d10
[2/2] arm64: dts: exynos: add initial support for Samsung Galaxy J7 (2016)
      https://git.kernel.org/krzk/linux/c/5d692f20de6311fa507c952adc3487c641edee00

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


