Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F75D46600
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 17:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMdaG0br4+SjzOVa+W0fkQCaERZe50KOQISrysMyFcI=; b=2+ZrENvb+CtIumulzW3nNPIjdo
	+N/0INU6PkszgabDJFGlZGbdtz+3mKndvTF+iMy/Aadfd+jic6eOmKk+xaGzOMZj12A3zhNtc+GvP
	oBAkm/BL/qAPnnDxaS+ZSoEVO+Lfj2KSsstnntvZiEqMpWZBjz3wQSrhSAFg7fne7rA2DQT2Ttrmh
	oM1neyFY9+Y7hrzAVqGAS0GH3ilSCJI+/xDk0DIYgKZJL0E03YVRSJuOydK731gRo4dWTMp/TezQH
	pEvl6hfJ0BAYTUeX0hd74YnoWynhqhtZi/W2dn8rV0bRJJ2W17eW3wM7BxR58U4rd/WOKV4yxN2yq
	fhHr8TwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRC4-0000000CrIa-1xKF;
	Thu, 15 Jan 2026 17:31:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRC2-0000000CrIU-2S0a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:31:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5B12601A1;
	Thu, 15 Jan 2026 17:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E48C116D0;
	Thu, 15 Jan 2026 17:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768498293;
	bh=YjX/AfVRJ8laz3W19X9hRSKTlMK1ceRbuKGgYxiY6Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C6E4E+P9WYSMLVzmu016+FYMSX/tHCvbG2Xm7Czn6OD0YE5xSZcP/U7fw/Jmcj3zi
	 HZQTiby3BP6xRjSeETx7hqwxv21ltcgx3nE539xz/yM+neF0rPsIENerk4ruLDmgyA
	 dmWuIjZW7QT+WfzLRpU0WQJhQIsHR0tFZfWVaE+MEre4619kxh1IytEuJUCRxYEMpl
	 tlEPdz1BEyDU3mHI2P6Iml64fDPVPfJQUj62O8U7qlUaXZyu8gO12+CNzS2BLkLKa4
	 t1wkrya6a0u+usK/3Y3EKdWG44X5RosjO184a3Alhe34+XzeusCky4sEZNDyKtEt1z
	 ggvnSiyx0tfAQ==
Date: Thu, 15 Jan 2026 11:31:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Moteen Shah <m-shah@ti.com>
Cc: nm@ti.com, y-abhilashchandra@ti.com, vigneshr@ti.com,
	gehariprasath@ti.com, kristo@kernel.org, u-kumar1@ti.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] ti,j721e-system-controller.yaml: Allow audio-refclk
 as clock-controller child
Message-ID: <176849829204.923576.6698326462461946997.robh@kernel.org>
References: <20260112104536.83309-1-m-shah@ti.com>
 <20260112104536.83309-2-m-shah@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112104536.83309-2-m-shah@ti.com>
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


On Mon, 12 Jan 2026 16:15:34 +0530, Moteen Shah wrote:
> The ti,j721e-system-controller binding currently only allows
> clock-controller@ child nodes to reference the ti,am654-ehrpwm-tbclk
> schema. However, the system controller on J721S2 also contains audio
> reference clock controllers (ti,am62-audio-refclk) that use the same
> clock-controller@XXXX naming pattern.
> 
> Hence, extend the clock-controller pattern to accept either ehrpwm-tbclk
> or audio-refclk schemas using a oneOf constraint.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


