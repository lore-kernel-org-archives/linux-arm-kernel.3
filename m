Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A673107BCEA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 23:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9olc9FEMIPBTpzCEvFssSp2raytyU4R431IhWwd+KXk=; b=CBSF2+JqJRkW1LKom6E+yXTvoJ
	a8NlbPRu6HD/gY6RqeFELagzZpjXNOwnOO7BShqhb4uEJ4E1BcdN0sabctpBXrReYO+9b1rgJMfus
	N4RRvdDowxTSIwMpRVEOyK8dbDp+Mx2A1EKKv7EvNDHshwmQ7Qkybyfm6p/VeWNZUceO5mrD2EiDt
	JIzkDk4PRGrgaaVk8kKwXrvi4Qez1ss96C/hN5TsMQbkJhLvvfLBgKA8QZWICSolWALDg2S58Jyd4
	IyIYfE/BsEYxVvjTeMfULGKrLdjGPCLCOhno/2Kjc4gvZ2mrZA5ioPgPwRWtWpe6Uzj4RtNpftq82
	5zGu+5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1BW0-00000001IUk-27KN;
	Fri, 13 Mar 2026 23:01:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1BVy-00000001IUQ-19nR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 23:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9olc9FEMIPBTpzCEvFssSp2raytyU4R431IhWwd+KXk=; b=veeipGsjcHjrrKyYCG8wldOYrj
	q1y+pb/krI5uUkJrOb3dQr/Z9cW5CYxF22iriL9I6hQEK5wYsPnZ/GZAs91Ns0hDROPlWzZL010d7
	C28mEDCcmUYekCMXSna37l/Zm1HlSfw81pJ0pk01GGGsQHTVRi4vR63Xtg1TpIzWkOaPjtaYJ6yAW
	MFnkD/tcYTKrpwk8mi/e+pZx9q0fjbXqfbnZRwjV+hlKWAkklQUpI36/EaGx7yFzZq+f2Ww+V2UQ2
	vvS5Bc+yGDoFjdeU1ALdgFL4rD2eW8igCpmMFvgqzJDq1Sq+xvQ39xG0JAZwAMUVGlkb2v7M3jDHs
	uzopc42A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57004)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w1BVb-000000001aJ-24ij;
	Fri, 13 Mar 2026 23:01:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w1BVP-000000000Ar-3IxC;
	Fri, 13 Mar 2026 23:01:19 +0000
Date: Fri, 13 Mar 2026 23:01:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "\\Jitendra Vegiraju" <jitendra.vegiraju@broadcom.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me,
	me@ziyao.cc, siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com, wens@kernel.org,
	vladimir.oltean@nxp.com, lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com, maxime.chevallier@bootlin.com,
	matthew.gerlach@altera.com, chenchuangyu@xiaomi.com,
	yangtiezhu@loongson.cn, ovidiu.panait.rb@renesas.com,
	chenhuacai@kernel.org, florian.fainelli@broadcom.com,
	quic_abchauha@quicinc.com
Subject: Re: [PATCH net-next v7 4/5] net: stmmac: Add PCI driver support for
 BCM8958x
Message-ID: <abSXP3gMFQEiC5Lm@shell.armlinux.org.uk>
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
 <20260313222206.778760-5-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313222206.778760-5-jitendra.vegiraju@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_160154_334719_3F1558B6 
X-CRM114-Status: UNSURE (   9.73  )
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

On Fri, Mar 13, 2026 at 03:22:05PM -0700, \Jitendra Vegiraju wrote:
> +	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
> +	if (!plat)
> +		return -ENOMEM;
> +
> +	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
> +				     GFP_KERNEL);
> +	if (!plat->dma_cfg)
> +		return -ENOMEM;

Please use stmmac_plat_dat_alloc() - this will allocate and initialise
struct plat_stmmacenet_data, and as of commit 7a6387dec8ce in net-next,
will also avoid the need to allocate  dma_cfg.

> +
> +	plat->suspend		= stmmac_pci_plat_suspend;
> +	plat->resume		= brcm_pci_resume;
> +	plat->bsp_priv = brcm_priv;

Populating suspend/resume means that plat->init and plat->exit
will only be called on driver probe (former), probe failure (latter)
or remove (latter). Please consider using these to ensure that
all appropriate resources are properly cleaned up in all cases.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

