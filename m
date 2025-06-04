Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DFAC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 20:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ew2KKUfxZ/eWg/FoAGC7r3/GrjX85J4YGoGYiljFpSo=; b=kF9nlO5s62+FerFNnyjeFJ6pwf
	RxuCzP1rmJ1reyzzNBFMj5Tw+BkBPZx4XgvPGQdsozzxDexkm4tCZc1gXW5wGfknubiix0ypxfS8W
	xhkjL9MPb0c2HtGWQBRYQxH5YI63l4h4YrjMlruQaFYZgicrTkP4a1bLPA0OVj8c+2099PeIrKW8D
	pIFDXQNBSSPzj0Ow/ub4RjCtWvXbEpm66wfONccmtCk29NLE/ocmcxg9uOxcJyNh/gIIBKD8hzkNC
	3fDPxL+YTMPszBtOzaTPjFoT51rhZs79MMc37vfMDLKpvyRGDVghOEBdJ7Kg4gQUNV2GLlRFYNfu4
	438iV1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMurz-0000000ECSC-25uJ;
	Wed, 04 Jun 2025 20:37:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMukl-0000000EBqR-1j12;
	Wed, 04 Jun 2025 20:30:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8122944BD9;
	Wed,  4 Jun 2025 20:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC073C4CEE4;
	Wed,  4 Jun 2025 20:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749069026;
	bh=LhtwtfigN8JEw9i0rxsCWNRKRm3pIR9KXYnKVRzhQDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3NK2ujC+1GVDKiRZ6teN8gSNhF8tO2TRhppHrdlfRlSfiNeuu9jI5VyUgF38Nba3
	 b0KddAlFf2U4HeU1Cs/izzo7cg8WVQ5vP3vT7aE6l6ip/ENGRjcofXz4RJEynYcq8F
	 nvonBhGL//OVTO6q678bagJ1WIRJR50ruQacSK/28yNKuua86DdsKkEoFV6swLqqjY
	 Ulb87MbBpm0SLBI3A78+zfMkuhfdR0OPdsDxwfhdj1LRSStXhvaQm3jBAS+A30V6fJ
	 CIHhYo4HVXiFEgO6gXi8H1M8pww/PATd+7VAlLPHdPgg/8WHnhZVzhlTTWWvr81HHM
	 ZR1lZushcOTmQ==
Date: Wed, 4 Jun 2025 15:30:22 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au, 
	linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
	quic_mrana@quicinc.com, quic_cang@quicinc.com, qiang.yu@oss.qualcomm.com
Subject: Re: [PATCH v4 1/5] arm64: Kconfig: enable PCI Power Control Slot
 driver for QCOM
Message-ID: <46r6cdcugwvyuvkjqbi3tq4f7ddkrgy4jut5fwqjsfwbsfoke4@upmtzhcmc7ni>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-2-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604080237.494014-2-quic_wenbyao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_133027_474593_793F4F85 
X-CRM114-Status: GOOD (  17.27  )
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

On Wed, Jun 04, 2025 at 04:02:33PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Enable the pwrctrl driver, which is utilized to manage the power supplies
> of the devices connected to the PCI slots. This ensures that the voltage
> rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
> correctly turned on/off if they are described under PCIe port device tree
> node.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index a541bb029..0ffd65e36 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -270,6 +270,7 @@ config ARCH_QCOM
>  	select GPIOLIB
>  	select PINCTRL
>  	select HAVE_PWRCTRL if PCI
> +	select PCI_PWRCTRL_SLOT if PCI

PWRCTL isn't a fundamental feature of ARCH_QCOM, so why do we select it
here?

Regards,
Bjorn

>  	help
>  	  This enables support for the ARMv8 based Qualcomm chipsets.
>  
> -- 
> 2.34.1
> 

