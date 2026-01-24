Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC49D778BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 00:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZB71uqjML4w9rR8etBjxBLKoRFzZrwDxpZiOxS2Ois=; b=yEpePMuLpY26qGZRGEzW75+Tei
	SM9lFyStAYRuwgQwVOkUC1WHg+nfR+ImgfI3g/pL/9synxSBj24RI+htfSrJ0otE/+nGa5XBeO1ne
	GKlspi8CrfU9QHqiMSp5T7HObaMjYjGFhJSHaAcXt3AeWZGJHHRDk53UHY3eKsuJv6zBcLz87x4hI
	DNl5TstpO9jxHo9HDQPAUimefZ+hxWX2dRKwDO6LfMtHq0NQWGNiEiebATZCEYa0CWV5yEN4I2jgp
	zLIvuqsRgXaEY40jwjlviQF4KnLfsbZEj16PtYHHda0tsIX671g/3YaKXhI7ccVuaFcSWskXX7mE4
	HoskOruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRKe-00000009bYq-1nYu;
	Sat, 24 Jan 2026 00:16:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRKb-00000009bYO-49sV;
	Sat, 24 Jan 2026 00:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iZB71uqjML4w9rR8etBjxBLKoRFzZrwDxpZiOxS2Ois=; b=vRSuX8oU8/P4wCgCBM9K3rqdta
	ZFSOeo9EMGRE8fRWUz+5xUaBJKm20kbE8f092osZzm89zIJIQMOMjSriMMCx+XzmPJuvFYIdJShSj
	C6RH1gHbjhksFQ7BeCFZS5qInVkMFvhmwAXsQYeSqxE6Xfw47SLPKSSm+sJZ1GOhDDbMQtnNxDXb8
	y/Ce8GNmcD+0y9WBB7GJhtLZ+wXCCKYyAABUYjOQ5L94CV5sVvOuiKsLow80eINl7lIQntrIo3zVZ
	7wAHOswmVW9EA6HQCubITsqcIvNYR0Zkw7w1IXGFjQPET7Lx6RkeLP39OW85A2itOp5AKlNrfwpdT
	Qo3GrNvg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33206)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vjRKT-000000002e4-0vPd;
	Sat, 24 Jan 2026 00:16:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vjRKP-000000002Xd-1kQd;
	Sat, 24 Jan 2026 00:16:37 +0000
Date: Sat, 24 Jan 2026 00:16:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXQPZfRQl2wpQ3Sx@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXNX1oi7nWLcPK28@shell.armlinux.org.uk>
 <20260124000409.36nsxlvkde4zpddk@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124000409.36nsxlvkde4zpddk@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_161650_038652_79DEE423 
X-CRM114-Status: GOOD (  17.32  )
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

On Sat, Jan 24, 2026 at 02:04:09AM +0200, Vladimir Oltean wrote:
> On Fri, Jan 23, 2026 at 11:13:26AM +0000, Russell King (Oracle) wrote:
> > According to patchwork, this doesn't apply to net-next. That's odd,
> > it was generated on last night's net next, and although there has been
> > further work, it rebases cleanly on top of this morning's. How can
> > these changes:
> > 
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++----
> >  2 files changed, 21 insertions(+), 5 deletions(-)
> > 
> > which happened in net-next overnight result in this change in patch 1:
> > 
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > failing to apply?
> > 
> > No, patchwork is clearly wrong.
> 
> Conflicts with commit dc6597fab3e3 ("net: stmmac: dwmac-imx: keep
> preamble before sfd on i.MX8MP"), merged in the meantime.
> 
> In include/linux/stmmac.h (your commit "net: stmmac: add stmmac core
> serdes support" adds a "struct phy;" line, but that other commit
> modifies the context by inserting:
> 
> #define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
> 
> (the last stmmac flag in your context, at patch generation time, was:
> #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
> )

I still maintain that this is silly - to mark all patches as such
and without any details about the problem applying the patches is
not helpful.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

