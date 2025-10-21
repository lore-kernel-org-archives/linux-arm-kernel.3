Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA514CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGFQDK06oh6OLUShVkpRbJc+sQgtZHJKwB3osXf18fU=; b=Cv8O02tNaJ8QxR0LdklBmjRFxA
	11CeQfyy2TBr0ph2zZocIe73SNGhud8SVcUIiJs/4Md3+0pY3Os+T/5H5ueMza1EK0t8B/Bfx0LKG
	K48ogWq2quZ+fNWtcSu74lAn3C/aCnBBxRcex2xZxZengrZNuAvCRTI0ngI038N3pWSbG7fMtleOB
	cjQgpzfDMyncOiyzhaJGZSAlWyZtJbs8edVUlksz61tMcUwCqtW7Sf+GkOkiHXDozmvbgSoz+8Ulc
	Je7zTy6tY6a7vVop6W6FWuU0JBRiCd3AEoWl5t08m2n1H67sbzOw00BhawPeKS92QW3ci2KJimh/N
	7eMTrOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBC0V-0000000H59Q-1NHr;
	Tue, 21 Oct 2025 13:02:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBC0T-0000000H57a-10wB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 13:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qGFQDK06oh6OLUShVkpRbJc+sQgtZHJKwB3osXf18fU=; b=hdMqbjlVBeNERiKKRmc4fxopEf
	7ijQKQJ25i4cUunwHzEDydRxnusbakgP7Nn4u6JcLFAAj4oZSOsqrGyLgKkPXpRu1jPHtbxUPiibN
	0zZYOSoq26JmtAlLEJdHkC62UwIB7hXtwDw2K4/dRZ7uLTb64PGB5VU/T+pWr344eiQJKaXF2eKdW
	44YDhyLkEPjdGPZLAh7w3SS0GIB+ZaRoN2FYmeQ/DLWniUE4U1Pfj24mHFtB/I7KVphFTTS6TahZP
	JMNlJXuue0hvv5+LfafQshiMC3ZaxV+M07HUVMJJesJ6DkC0TK7bAYWSd50O6iNTa0C4W65FfEuYC
	fhzXwVhQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56540)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vBC0F-000000003iO-4C50;
	Tue, 21 Oct 2025 14:02:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vBC0A-000000008Cd-1Yri;
	Tue, 21 Oct 2025 14:02:10 +0100
Date: Tue, 21 Oct 2025 14:02:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: replace has_xxxx with core_type
Message-ID: <aPeEUmHeQWh7ZuIU@shell.armlinux.org.uk>
References: <E1v9Tqf-0000000ApJd-3dxC@rmk-PC.armlinux.org.uk>
 <CAMRc=MccHEaXs6KJfG_ph=wG5TS4UTpG4Rzj25C4qbC_fCS21A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MccHEaXs6KJfG_ph=wG5TS4UTpG4Rzj25C4qbC_fCS21A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_060229_279041_FB105B5B 
X-CRM114-Status: GOOD (  16.22  )
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

On Tue, Oct 21, 2025 at 02:42:09PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 16, 2025 at 9:41 PM Russell King (Oracle)
> <rmk+kernel@armlinux.org.uk> wrote:
> >
> > Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> > can be set when matching a core to its driver backend, with an
> > enumerated type carrying the DWMAC core type.
> >
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > After the five patch cleanup has been merged, I will want to submit
> > this for merging.
> >
> > The problem:
> > - Any new stmmac glue code is likely to conflict with this.
> > - Bartosz Golaszewski's qcom-ethqos patches posted on 8th October
> >   will conflict with this if resubmitted (we're changing lines that
> >   overlap in diff context.)
> > - Maxime Chevallier's tiemstamping changes will conflict with this.
> >
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Please can you reply with your reviewed-by to the latest patch submitted
today, so your r-b gets picked up if netdev applies it? Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

