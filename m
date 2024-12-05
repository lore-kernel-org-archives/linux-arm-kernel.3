Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79934E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 23:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFvZvTOTWkFAKfzfMvGEvGDyWsbLuq+WNKubNabn3ak=; b=jWwUgvx2am+VK0nV3yxAWgfrld
	BM03rSWVYH6XfQ8KYgYngJK19pU+az03gZHzAlReZCATkdDboqyF57b75PIKk7sXqFJwtPvWhSfez
	I9a8pERVygR0x3LXz6ZaD97t7l901GUjrUNPmTxoKXOZCcS3uTHfEIcOJfe8APSUvfunJKQsM6WnR
	L41bzOy9XFRR8doB6apYKZBw8VDQsb1Es9DAlsBY26pr06OV0+93Dt2YuZh/3y/SE+W7Rrt9rd3Yl
	QqnT8qM7CB4L3trjGQelaBPOODc89oXfFp12w0R1D4V8Lo7olM+DrGKZAY6xkYrR6MunJom4ZQ7ar
	f12haLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLYg-0000000Hb2x-0s1t;
	Thu, 05 Dec 2024 23:46:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLXe-0000000HawW-22fl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 23:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nFvZvTOTWkFAKfzfMvGEvGDyWsbLuq+WNKubNabn3ak=; b=mHVOvvyQgCyWfgoPAr3LiGnfz4
	fLb6P1bbHxqjaEFTW1q4clehusxop5BBrefUE1xXna2wpS1cyIHo9ISILDLLanxDO/rMnVJsnER4D
	FXyxm4hEtxxfvWN3tCUFXhvX+UeVGFfhWvMwv8iSgf5nZ9FEGh/TwpaBb3XKo/hzzVtA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tJLXB-00FMhW-Qp; Fri, 06 Dec 2024 00:45:25 +0100
Date: Fri, 6 Dec 2024 00:45:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Subject: Re: [PATCH net-next v8 01/15] net: stmmac: Fix CSR divider comment
Message-ID: <2706b154-737e-467c-8ea4-c9356bdc0720@lunn.ch>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
 <20241205-upstream_s32cc_gmac-v8-1-ec1d180df815@oss.nxp.com>
 <Z1HaB6hT0QX4Jlyx@shell.armlinux.org.uk>
 <Z1Ha+me4+hbOj9JO@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1Ha+me4+hbOj9JO@lsv051416.swis.nl-cdc01.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_154554_528039_C060ABE9 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, 0x1207@gmail.com, netdev@vger.kernel.org, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Dec 05, 2024 at 05:55:22PM +0100, Jan Petrous wrote:
> On Thu, Dec 05, 2024 at 04:51:19PM +0000, Russell King (Oracle) wrote:
> > On Thu, Dec 05, 2024 at 05:42:58PM +0100, Jan Petrous via B4 Relay wrote:
> > > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > > 
> > > The comment in declaration of STMMAC_CSR_250_300M
> > > incorrectly describes the constant as '/* MDC = clk_scr_i/122 */'
> > > but the DWC Ether QOS Handbook version 5.20a says it is
> > > CSR clock/124.
> > > 
> > > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> > 
> > I gave my reviewed-by for this patch in the previous posting, but you
> > haven't included it.
> > 
> > Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Hi Russell,
> sorry for that, I missed it. Should I resend the v8 series?

b4 is pretty good at handling this, it will find such tags and add
them to your patchset if you are using b4 to manage it.

	Andrew

