Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25810C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bL3gxLmyKoIOFUQltNWan7x+Q3hxZzBXfuqkmaS2PY=; b=cz5YYcHpHEYtES/Q/yZIfsKeeS
	Wy8SCnO1AGm1gqM1WwoqyPMegtl3OaEhTEzaWEoKoXMVTIhNKHNhwrFqjUfRN7Zb9DZ35JoiRuZq4
	d1BrOKXAHVi9VDPU9zaKTOlltxts/R1/gdvfCLufdLTXfu1crEDxV51pWaXbVVwu+4Qi//FCywZgK
	jqtGN1mVK1vlNrjDRrnGJKbwxoiIPl4lI9ZfPjKRsWfINFCM0jW3VslSJjmNWT8p6pXAD2VBSRNFV
	HuwN+ZsBegSUTISHmKeTkdo0M36wiAFphryj4fC4+R3iamQO/oq1LrHbtzw3dUNhv+DNn7mA7iXBN
	1A+H0Mrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgao-00000003Zn2-1YDv;
	Wed, 05 Feb 2025 14:41:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgZI-00000003ZGs-2dvn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 14:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0bL3gxLmyKoIOFUQltNWan7x+Q3hxZzBXfuqkmaS2PY=; b=VeLMyF8biNfumqmuZmc/C6wCWs
	cYHL1aCStiFMh3q45g/T0gP/yblv4P2Sr/aG2NKh5HsTcytUdyGSRMXfQHuOl00YgiuU8X10nSp4d
	kknFpGsZJs26ahI6wJZ5Np3T8QPegTgBgvDL/erMWki4TMPAzMFMssXY7J5BWBYT7glwODUwdaCkH
	sVLbHj3pwXrk/oHU+rfSNeXfURFWx/Doph3ecygwITrKTsKOMC40Gb98HftgsxOQguZc+G0grkk46
	E+l2hNjQaqhq46/kyWqSK8dor0UoSKkUpcC2R9AtG2kDqWJrcf1r7XUM9TdmkY+oKoFZni+5d3qWy
	hoQTXHUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54016)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tfgZ3-0007N2-1Q;
	Wed, 05 Feb 2025 14:39:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tfgYx-0002Uc-2s;
	Wed, 05 Feb 2025 14:39:35 +0000
Date: Wed, 5 Feb 2025 14:39:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, Steven Price <steven.price@arm.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	"David S. Miller" <davem@davemloft.net>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Furong Xu <0x1207@gmail.com>, Petr Tesarik <petr@tesarici.cz>,
	Serge Semin <fancer.lancer@gmail.com>,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH] net: stmmac: Allow zero for [tr]x_fifo_size
Message-ID: <Z6N4J-_C3lq5a_VQ@shell.armlinux.org.uk>
References: <20250203093419.25804-1-steven.price@arm.com>
 <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
 <811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
 <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk>
 <20250203142342.145af901@kernel.org>
 <f728a006-e588-4eab-b667-b1ff7dfd66c5@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f728a006-e588-4eab-b667-b1ff7dfd66c5@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_063956_672065_4D767883 
X-CRM114-Status: GOOD (  18.70  )
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

On Wed, Feb 05, 2025 at 10:22:00PM +0800, Yanteng Si wrote:
> 
> 在 2/4/25 06:23, Jakub Kicinski 写道:
> > On Mon, 3 Feb 2025 11:16:34 +0000 Russell King (Oracle) wrote:
> > > > I've no opinion whether the original series "had value" - I'm just
> > > > trying to fix the breakage that entailed. My first attempt at a patch
> > > > was indeed a (partial) revert, but Andrew was keen to find a better
> > > > solution[1].
> > > There are two ways to fix the breakage - either revert the original
> > > patches (which if they have little value now would be the sensible
> > > approach IMHO)
> > +1, I also vote revert FWIW
> 
> +1, same here.
> 
> 
> For a driver that runs on so much hardware, we need to act
> 
> cautiously. A crucial prerequisite is that code changes must
> 
> never cause some hardware to malfunction. I was too simplistic
> 
> in my thinking when reviewing this before, and I sincerely
> 
> apologize for that.
> 
> 
> Steven, thank you for your tests, Let's revert it.

https://lore.kernel.org/r/E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

