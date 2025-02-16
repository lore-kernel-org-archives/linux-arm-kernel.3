Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA86C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECtYGyfh6XO4+F8yQJHe0X3LXhbxNpjObJPeySLpTPQ=; b=47riW8pvSHg80nO59cXNV30i/E
	JnluKJzfHrL6hQk2KzcSAIQovqUt0viqK3r7/ENOK9LnaU6TGTOV4aly+JPWBUegThRvSK5IREOVn
	J5M/4ViH+MWk36Svb4RtloPWb7ATqetz4nJ5Mq7DJpVy9+7R3eruyoCZBcioX3C7iRAO8tPB1e6TT
	bnHZ45rOwOYumX1YEluBXYOA8SmZeViRbNcR60LgJsuBtd+9svPyZ6aoV5XTjhhzrjzX3cNbhpupJ
	qIAF/f3v4/cQNdF3oAYxQhRe9tL7ZCBc1FmfOer9YG5fRW2E844trGp2pUxAU7be7IwOrECZbKl8v
	4fMyJL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhGy-0000000268J-2EMl;
	Sun, 16 Feb 2025 16:13:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhFV-000000025qZ-1Ecr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 16:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43D64A40C67;
	Sun, 16 Feb 2025 16:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F739C4CEDD;
	Sun, 16 Feb 2025 16:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739722324;
	bh=vhzqR3wBf1c57XXipqo0apwTE664UU5tqcgb4s9Eg1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3joIj4zFNHizlHbVPob2/AHjpRkbvFIcNE/o3uBJg4FRZztHwNKkpQqRI2NfCSnh
	 BRz0QcTjzXsQrVDUSsx7wfD5R30i7C3Y+OXFa8/nX74NhFOu/9PjY4b6AyQNAF0Mzm
	 fh0Mx9KgTpt9J3oViV2B4cPfnDCOt7EMjz5q+F/OR9Z7ie7HAcsonH6gsEeS9PFPwu
	 15mvy8rCfS5sFJtJTfByTGMOmDPDuw2Y1VgUexEHaerxqbZ1tWm3sUdEWs4Mr8L9qW
	 Dse7ugMS8h7vTc86vpMYu02Py3SXKCfLOAQVMlCdX+N8o6OMIaez0277mXI0uFUJie
	 jK8GSlpBKc6yA==
Date: Sun, 16 Feb 2025 16:11:58 +0000
From: Simon Horman <horms@kernel.org>
To: "Malladi, Meghana" <m-malladi@ti.com>
Cc: Paolo Abeni <pabeni@redhat.com>, javier.carrasco.cruz@gmail.com,
	diogo.ivo@siemens.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [EXTERNAL] Re: [PATCH net 1/2] net: ti: icss-iep: Fix pwidth
 configuration for perout signal
Message-ID: <20250216161158.GH1615191@kernel.org>
References: <20250211103527.923849-1-m-malladi@ti.com>
 <20250211103527.923849-2-m-malladi@ti.com>
 <3a979b56-e9d6-41c9-910b-63b5371b9631@redhat.com>
 <66f30c0f-dec8-4ad5-9578-a9dcc422355a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66f30c0f-dec8-4ad5-9578-a9dcc422355a@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_081205_476570_27730ED5 
X-CRM114-Status: GOOD (  18.77  )
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

On Fri, Feb 14, 2025 at 11:35:07AM +0530, Malladi, Meghana wrote:
> 
> 
> On 2/13/2025 4:53 PM, Paolo Abeni wrote:
> > On 2/11/25 11: 35 AM, Meghana Malladi wrote: > @@ -419,8 +426,9 @@
> > static int icss_iep_perout_enable_hw(struct icss_iep *iep, >
> > regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp)); > if
> > (iep->plat_data->flags &
> > ZjQcmQRYFpfptBannerStart
> > This message was sent from outside of Texas Instruments.
> > Do not click links or open attachments unless you recognize the source
> > of this email and know the content is safe.
> > Report Suspicious
> > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! updqdzavl0dbisXOnfkDHxHqGlQUHEro3tgnljLa7x4DRPBIRKu8Nqm3bW1LeMtXFyqz6yM7_tLlrvUmslKj9m_IL0hUlNU$>
> > ZjQcmQRYFpfptBannerEnd
> > 
> > On 2/11/25 11:35 AM, Meghana Malladi wrote:
> > > @@ -419,8 +426,9 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
> > >  			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp));
> > >  			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
> > >  				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, upper_32_bits(cmp));
> > > -			/* Configure SYNC, 1ms pulse width */
> > > -			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG, 1000000);
> > > +			/* Configure SYNC, based on req on width */
> > > +			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG,
> > > +				     (u32)(ns_width / iep->def_inc));
> > 
> > This causes build errors on 32bits:
> > 
> > ERROR: modpost: "__udivdi3" [drivers/net/ethernet/ti/icssg/icss_iep.ko]
> > undefined!
> > make[3]: *** [../scripts/Makefile.modpost:147: Module.symvers] Error 1
> > make[2]: *** [/home/nipa/net/wt-0/Makefile:1944: modpost] Error 2
> > make[1]: *** [/home/nipa/net/wt-0/Makefile:251: __sub-make] Error 2
> > make: *** [Makefile:251: __sub-make] Error 2
> > ERROR: modpost: "__udivdi3" [drivers/net/ethernet/ti/icssg/icss_iep.ko]
> > 
> > You should use div_u64()
> > 
> 
> I see, thanks.
> Can you tell me how can I reproduce this on my end for 32 bits.
> Will fix this in v2.

Hi Meghana,

FWIIW, I was able to reproduce this problem running the following
on an x86_64 system:

ARCH=i386 make tinyconfig

echo CONFIG_COMPILE_TEST=y >> .config
echo CONFIG_PCI=y >> .config
echo CONFIG_SOC_TI=y >> .config
echo CONFIG_TI_PRUSS=y >> .config
echo CONFIG_NET=y >> .config
echo CONFIG_NETDEVICES=y >> .config

yes "" | ARCH=i386 make oldconfig

ARCH=i386 make -j$(nproc)

