Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8C9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mN0Y6VG8wJwIHBPmUq5Ichmc5b23YwTM3GHpfC0Ov0=; b=DD4gM9N+jq1MCyyPvXCw5+Wg1f
	wrEeTiNxBrKHQMlfx25+dD2dvnTDyQ2QKYQegBeGOwhU53tbSAtUobRhtmrOaZVJGiQN1+JbDloJ9
	9miBDSSmR/Wp8CS10MKLvBZxUBnAZSpbzfQR8u9wk7MiHLFc/uoeqXQyjJ3llPpELfhx0zG6ZRWS3
	hiFlD7ENmu8Q13hxK2jLPGF+967MAxEECuGlzD1ktcXc4AKu7CIGPJ1kUD4Og+8YqPfrV9qt3vDuI
	3aUjbMpo/P4jdZE1frX3npZgAfMYPf4qoU4dD0vdEthZYElmrL76EMnHyYrw4t7P2q658OsV6NPnV
	sYeg4B1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP200-00000007V09-42FH;
	Tue, 10 Jun 2025 16:38:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyZL-00000006rtg-2otZ;
	Tue, 10 Jun 2025 12:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0mN0Y6VG8wJwIHBPmUq5Ichmc5b23YwTM3GHpfC0Ov0=; b=HY1qvyMgHuovJklo58mxohAZPZ
	nx8UyjAvBgauzV/x4dBQ0cgcd2CkG1PLipx2RDx1Rpz61e4MR1vgD5u88Jo9ur0f6RnlEBiG0Iv35
	HpKLXouqlU/OLqxuoM0DAQEKZVIRuzFesesWxCGJC7Cp3i4tPYfOOUHAIfT98NywlBMMLWrIOckTM
	5IogBriofTHuWSpjXyjw/F8VrR2MOYOMOA5Tg3yPEraeJsaJn7FDpkxgAcHADyYhXd9t2DhKzBqy4
	JT+NdRe1x4b744B1MHAQe3wxw741b6nrwnhEb73kgwxCGHedTXNSaWRz8YF8J3XVmJ6bfWdTHvKwh
	ykHTJzWQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyZJ-00000001plq-1dFu;
	Tue, 10 Jun 2025 12:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0mN0Y6VG8wJwIHBPmUq5Ichmc5b23YwTM3GHpfC0Ov0=; b=ujDB7z68qrrQWLKAjGzbmCQGy3
	LdOtDJSTUvPJoAR+dlK+SCrvQO4qgGvAcvh2Obe7Xf1qUhfc6kUAHntYjvGObWD50/ANPKe97yd3y
	StFdUf5u32nQt5lMjBOlGoqnG9dJYy8rhkzxAKLYPIrFSRwObLsOO0zSTHB4qQv0slmA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uOyYu-00FGk5-Tp; Tue, 10 Jun 2025 14:58:44 +0200
Date: Tue, 10 Jun 2025 14:58:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux@fw-web.de, myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
	cw00.choi@samsung.com, djakov@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, jia-wei.chang@mediatek.com,
	johnson.wang@mediatek.com, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	daniel@makrotopia.org, lorenzo@kernel.org, nbd@nbd.name,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: Re: [PATCH v3 12/13] arm64: dts: mediatek: mt7988a-bpi-r4: add
 sfp cages and link to gmac
Message-ID: <e1a49ca7-f082-4983-89fe-1a8f8c8a3de1@lunn.ch>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-13-linux@fw-web.de>
 <934b1515-2da1-4479-848e-cd2475ebe98d@lunn.ch>
 <trinity-b9ab960d-38f8-4524-b645-fc0832ce72ec-1749546239525@trinity-msg-rest-gmx-gmx-live-5d9b465786-6phds>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-b9ab960d-38f8-4524-b645-fc0832ce72ec-1749546239525@trinity-msg-rest-gmx-gmx-live-5d9b465786-6phds>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_135909_527150_F3A950D3 
X-CRM114-Status: GOOD (  13.00  )
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

> > sff,sfp.yaml says:
> > 
> >   maximum-power-milliwatt:
> >     minimum: 1000
> >     default: 1000
> >     description:
> >       Maximum module power consumption Specifies the maximum power consumption
> >       allowable by a module in the slot, in milli-Watts. Presently, modules can
> >       be up to 1W, 1.5W or 2W.
> > 
> > I've no idea what will happen when the SFP core sees 3000. Is the
> > comment out of date?
> 
> at least sfp-core has no issue with the setting
> 
> root@bpi-r4-phy-8G:~# dmesg | grep sfp
> [    1.269437] sfp sfp1: Host maximum power 3.0W
> [    1.613749] sfp sfp1: module CISCO-FINISAR    FTLX8571D3BCL-C2 rev A    sn S2209167650      dc 220916  
> 
> imho some modules require more than 2W (some gpon/xpon and 10G copper ethernet).

Looking at the code:

static int sfp_module_parse_power(struct sfp *sfp)
{
        u32 power_mW = 1000;
        bool supports_a2;

        if (sfp->id.ext.sff8472_compliance >= SFP_SFF8472_COMPLIANCE_REV10_2 &&
            sfp->id.ext.options & cpu_to_be16(SFP_OPTIONS_POWER_DECL))
                power_mW = 1500;
        /* Added in Rev 11.9, but there is no compliance code for this */
        if (sfp->id.ext.sff8472_compliance >= SFP_SFF8472_COMPLIANCE_REV11_4 &&
            sfp->id.ext.options & cpu_to_be16(SFP_OPTIONS_HIGH_POWER_LEVEL))
                power_mW = 2000;

How does your module indicate it needs 3000 mW? Does this bit of code
need extending to read additional bits?

	Andrew

