Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A377C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuaKggYDRTaGllYGEl45fC0lvQ48d6zJXW22p95ihu0=; b=gxF2u/Ghjovkqz0hUgcGFwMRks
	yIzKO+8ccrGipI2nPiXmYyWVC+XJmL3FC5IxR+nxVkheY2D3Vp5H/Sguib1tw+4zcduwyAu94LMp3
	mcw2Je/eo7eDtF8HIcbUI5Y/npfYNQ7vZZp5mhs8kacEEER1Cf/l3OcKTXwF4z6h+Nu6Fjmhg+XY8
	MqDayXrzmB0hG+R5KBJsiIhL0zIrvrF4YlJRy8cGPrSFe27U+Su1sl9ZM/E0vzTG0RqCwGQDFV3yU
	sxIH2uIJjkOxYv3RML2j2PuRqlWNvbi7hjeKCtAZkZiedMZFqjVU+MCYgT0RIGNMYyOtJrzDXKv/d
	zdPx9glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4L0k-00000002RAH-3GSM;
	Mon, 14 Apr 2025 14:42:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Kql-00000002OWg-1qOh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cuaKggYDRTaGllYGEl45fC0lvQ48d6zJXW22p95ihu0=; b=Zm9eD3mk3WM5hftniSBwFF1yr9
	wvxNTAJzgVasbkxZJHOK1DR3oOVb/26e4oc2Nzpgxl1KKp3lmgm7r0q4O4v1RXq44g3YXAnkmPM43
	2ha6YdMWO85CxFeTmi0XPvzd/aM0EX4N1G0Bo7ih03EUeqbV7ZcBOWGPdcG+MVbfEwUGIeKhmBY1g
	wZUp8xPG4mf95iso0eT2piUlROajI6jwnHoSX8Ei8Of0/zZAt3qtyK3lSb39SV9/9l7TRKiqaPBao
	z2gd3UeLxHusJWeDBZkkC2cny2t4IQ9/61aLTMG/t/Bj2Ul5kUTCL/MpnPtuL1et0NBwMJz/BygFc
	P5hiyRbA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58820)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4KqS-0006gu-0p;
	Mon, 14 Apr 2025 15:31:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4KqM-0007pA-1n;
	Mon, 14 Apr 2025 15:31:26 +0100
Date: Mon, 14 Apr 2025 15:31:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <Z_0cPmY_LzI_fo4S@shell.armlinux.org.uk>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
 <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_073151_481189_8F1E51C9 
X-CRM114-Status: GOOD (  14.72  )
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

On Mon, Apr 07, 2025 at 07:07:49PM +0100, Lad, Prabhakar wrote:
> On Mon, Apr 7, 2025 at 6:58 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> > > +static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_data *plat_dat,
> > > +                                       const char *name)
> > > +{
> > > +     for (unsigned int i = 0; i < plat_dat->num_clks; i++)
> > > +             if (!strcmp(plat_dat->clks[i].id, name))
> > > +                     return plat_dat->clks[i].clk;
> > > +
> > > +     return NULL;
> > > +}
> >
> > In addition to Jakub's request, I'll ask that you hold off for a week
> > because I have the following that I'd like to submit:
> >
> Ack, please add me in Cc while you post this patch.

FYI, the patch was merged last Thursday, so please update to replace
the above with stmmac_pltfr_find_clk() which will do this for you.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

