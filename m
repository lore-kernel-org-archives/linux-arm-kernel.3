Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9D4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfSREGSX1y3hVce6wYo9HC92nI5AC4YuLJXbUXJ9fV0=; b=pvjLlfeXYYecgXYlwxK5+1i01+
	JB0ACXmYDDguHXXtLHnLT0ql/5NbQaxCCEO8hsscYFUKwwboa+3XNYdOjSIrmYn1hnZzJm41K98iC
	wkmADaIwCZXJBiogsfboUMacGsY0dmNloR8TZBoFyh6IzMVGQhZ+hef55VoiE1cosj68tQV10EoYz
	abrQOOSIbQUz+Y7fhERs9LZ5aceanecKe1L4wdMvtBwRxMdDdIBmySBTiJKCBrKYIQyp4jSisF0p3
	NsQ2MYVkrwpjk4OcvEn59LvM/UnkJiEFQA2AH9u6PYYdBTuaNdFmXncw5EAxSDBThTBJeAXMnANbO
	4UAafdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Gnc-0000000Gqrw-1Tcv;
	Fri, 25 Apr 2025 11:00:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FeY-0000000GbZQ-2D6H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A2755C61D1;
	Fri, 25 Apr 2025 09:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C343C4CEE4;
	Fri, 25 Apr 2025 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745574445;
	bh=hwJ0UFkl9vhPKzbNWc1Xi5cv3PU5yR6pZ52y0oNJg78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd+sQnwzEGfn4d5AnNfPaRDuzzQi4Cyu8Q7fz7oaU3zLXUrK7swqNXkfSAsDskk90
	 Ef5QPXoRtMp0DZI9lMCtMP/XnBTJvQt+51cCMz7h1HaX5QSFpSYOZp1nGf6Ti/0kD5
	 PvTjNzvmguHd4GdEeJFmK/LPwwCdxk7CX3Sf5d1wUpdXkZR0/oMC+noNPAENwRl7By
	 jgz31BduQXpbrQzUnyVg5ifyiKjlxFRazACxcZZ2KbN7RXbjSGyRBvHfQOcdqjbPo3
	 fXvht/Mf5thEx5KPVgpkeb7Uf/1TJAJEI3hHcJYvxLo6F151Kba+D0DfAE/ULnJw1x
	 NCNpC1iRCrGGg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u8FeY-000000000Ej-1xWm;
	Fri, 25 Apr 2025 11:47:26 +0200
Date: Fri, 25 Apr 2025 11:47:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com, quic_cang@quicinc.com,
	quic_qianyu@quicinc.com
Subject: Re: [PATCH v2 1/4] arm64: Kconfig: enable PCI Power Control Slot
 driver for QCOM
Message-ID: <aAtaLm253EtlXwan@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-2-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425092955.4099677-2-quic_wenbyao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_024726_606800_D44C52A2 
X-CRM114-Status: GOOD (  16.03  )
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

On Fri, Apr 25, 2025 at 05:29:52PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Enable the pwrctrl driver, which is utilized to manage the power supplies
> of the devices connected to the PCI slots. This ensures that the voltage
> rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
> correctly turned on/off if they are described under PCIe port device tree
> node.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 8b76821f1..14d2742c8 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -270,6 +270,7 @@ config ARCH_QCOM
>  	select GPIOLIB
>  	select PINCTRL
>  	select HAVE_PWRCTL if PCI
> +	select PCI_PWRCTL_SLOT if PCI

Note that this symbol is getting renamed for 6.16:

	 https://lore.kernel.org/lkml/20250402132634.18065-2-johan+linaro@kernel.org/

Johan

