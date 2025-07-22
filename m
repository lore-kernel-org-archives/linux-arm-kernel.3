Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBADAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jFu8sOPMkZ/eXw6Hxbm9Ofc0OdtdvCKlqxK+F5dq+o=; b=HfpKj6X+bNSw+KIvbKHCITPqGX
	2VkwQO726p1U/rCOtiAGcMNPOIHWJTUFd80zX/MwQeobLP2/qsor28+4Q3Rlq+A7p0S/GlvY660JN
	bajpVOdIbA7bEjVvtLP6m0DBSxitGQTFO6vsMIe1XnFti3r5dklsHGwtt5wmQI1W/qZ0n71HvB+sZ
	v6PSCMXTmW/tNdQiMjrLRJ7XuzmrSXCin9DtbtegCr9df5AVfLv1QkIiBxV6ek29L7kl4wtbm5+YW
	tWK15hybtoE7uV8NeiCUTsjOVwTp4LXdSsqF1+MI7+p1xi/gZbXoP73aE5KSj/hsEkz9L6lVFErWq
	vTvbTbFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEtW-00000002ryU-1N3F;
	Tue, 22 Jul 2025 15:27:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDej-00000002doj-2QJE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0jFu8sOPMkZ/eXw6Hxbm9Ofc0OdtdvCKlqxK+F5dq+o=; b=JllzPbi4165KOYJ2nX+VJKqDBQ
	lWhb1tCON1TGIfIOosVj0nG3GP2UA5+/uXuYkTUGckTMi9dwwtCcSR3gGXBtwymADInPsmN2p6uk7
	Pp8KHRCREAg1Wt2aOR6rPdoYn8bZA6zmotNFJ0JtXCk/l0OJbrM/h85Q4W4q5rPLvrSM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ueDeN-002TOt-AW; Tue, 22 Jul 2025 16:07:23 +0200
Date: Tue, 22 Jul 2025 16:07:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
	jszhang@kernel.org, jan.petrous@oss.nxp.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	boon.khai.ng@altera.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: Re: [PATCH v3 2/2] ethernet: eswin: Add eic7700 ethernet
 driver
Message-ID: <28a48738-af05-41a4-be4c-5ca9ec2071d3@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
 <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
 <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
 <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
 <6b3c8130-77f0-4266-b1ed-2de80e0113b0@lunn.ch>
 <006c01dbfafb$3a99e0e0$afcda2a0$@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <006c01dbfafb$3a99e0e0$afcda2a0$@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_070745_627226_B3687B76 
X-CRM114-Status: GOOD (  12.55  )
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

> In v2, `eswin,dly-param-xxx` is used to configure all delay registers via
> device tree, including RXCLK and TXCLK. Based on the latest discussion,
> this approach in the next version:
> - The delay configuration for RXCLK and TXCLK will be handled using the
>  standard DT properties `rx-internal-delay-ps` and `tx-internal-delay-ps`.
> - The remaining delay configuration (e.g., for RXD0-4, TXD0-4, RXDV) will
>  continue to use the vendor-specific `eswin,dly-param-xxx` properties.
> - If the standard delay properties are not specified in DT, a default of 0
> ps
>  will be assumed.

Please keep the RGMII standard in mind. All it says is that there
should be a 2ns delay between the data and the clock signal. It is
also quite generous on the range of delays which should actually
work. It says nothing about being able to configure that delay. And it
definitely says nothing about being able to configure each individual
single.

You hardware has a lot of flexibility, but none of if should actually
be needed, if you follow the standard.

So phy-mode = "rgmii-id"; should be all you need for most boards.
Everything else should be optional, with sensible defaults.

	Andrew

