Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A044CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNfWHKHbRyM/GBX0pKVevF1bo7N98M4gqN+Cm7IF6fk=; b=azRZPbt6Y900k7iXrlYLwkcdHE
	iL+pZdA+9OEXO6D6iIOppvlJEcnYpW6t+CdOrp3hap+318CtcSpr3BlzQgExs5IUBFGo9XVglu1ZH
	mPzeMb/qpZ0V3rGbSbH69hMpMdkjHcQKpZaKUQlRpgF9mgbTTapAlFr9aUozN3LTdjXkh4BKgquQM
	q8cA/zIiFpW/Xcq2GuYshmCvZi0hlu1gj9lzhO6MPZcy9mkY/DHqaaQ0sHilBBRYby8Yhu0ApxQ3j
	CmRzcSFDpw9dPsPA/gHaRqxwHf1VQA4HpnJ3aohpcTEeSdkCSNP36UpQE+qfLm7YHrvaWuOGEr4kw
	vjOsCQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0z22-0000000CtkD-2eal;
	Tue, 23 Sep 2025 09:09:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0z1z-0000000Cti0-25oP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 09:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LNfWHKHbRyM/GBX0pKVevF1bo7N98M4gqN+Cm7IF6fk=; b=UXfEpc5VubhTvRh2RDuRRIh8YM
	wHrPPSm8C2tHgvqzoDIfqk5TMwb2k4m1mgnmfhb57jFA+ehquSFq7dsoduoRpaanDbZDZLrYuRqLI
	+9U6n+BiDgOP1U3DoVWYzWXrAFhuu2uP/VZa9LaZ9rF73VrsQStK5HypqZGevNgJoY0zGqTKn9kH3
	u3wB7yiR64cNSEjnmx+d++TN++QcI+NaYMZ2cIZdogktMk4wtW4rHUP9r2n6Sx+YlW30DufLLJZgi
	hkOYu+egUknb6FZx53Z59xf8bRp3IQVV6jXtvVtZLivTnVsknAh2L8lahjY8QxwTG3SfaGNGPBgd2
	rT6EeylA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33712)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v0z1P-000000006rv-3pdk;
	Tue, 23 Sep 2025 10:09:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v0z1G-0000000060w-2BgJ;
	Tue, 23 Sep 2025 10:09:06 +0100
Date: Tue, 23 Sep 2025 10:09:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?6Z+m5bCa5aif?= <weishangjuan@eswincomputing.com>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	yong.liang.choong@linux.intel.com, anthony.l.nguyen@intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, jan.petrous@oss.nxp.com,
	jszhang@kernel.org, inochiama@gmail.com, 0x1207@gmail.com,
	boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v7 2/2] ethernet: eswin: Add eic7700 ethernet driver
Message-ID: <aNJjshm4Z8H2Z8_V@shell.armlinux.org.uk>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918090026.3280-1-weishangjuan@eswincomputing.com>
 <aMw-dgNiXgPeqeSz@shell.armlinux.org.uk>
 <30080c70.16e1.199748921d3.Coremail.weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30080c70.16e1.199748921d3.Coremail.weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_020951_597717_D6809D73 
X-CRM114-Status: GOOD (  10.23  )
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

On Tue, Sep 23, 2025 at 11:06:08AM +0800, 韦尚娟 wrote:
> In the current eic7700_dwmac glue driver, the regmap_read()/write()
> operations(for phy_ctrl1, axi_lp_ctrl1, and the RX/TX delay registers))are 
> performed directly in the probe() function. Would it be cleaner to move these
> register configurations into the init() callback instead, so that they are
> also reapplied during resume()?

This is a question I can't answer definitively as I don't know what
happens during a suspend on your hardware, and thus which registers
are lost / reset by the time the system resumes. So I can only give
the obvious guidance.

If the settings in the delay registers are lost over a suspend/resume
then they need to be re-initialised after resume.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

