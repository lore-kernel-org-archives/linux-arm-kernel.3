Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AD4D60D00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 00:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zdxN2vOlsEF33q9U+oiEdloUgcORSZgWWNMJG2WpeU=; b=BmrHGitOTWy3cHnN7eKbt8oVFv
	lPcMRrJGrNjVfe6z2LoBUDu79iiu9emzb68jvIADH+D78OkI8a8Q80wkUbEe1dIFimdbKbTwIEdVC
	vIzesTw6Zt+ku/BlZ2NPlq19vMqYLyXcskS8nu/q4uAYn+DHk+Wj6fzu7N/tT9fbRCo8WH2unr6HU
	fcCmha5vXaVgvvFVpF9nn3TkHZqRQEl0lwnagk2qHvttf+C9Oaga1pj1xp02zT85JoS5Q94PaoYlq
	wDMenfqFELZABs6cW6QkOMwnBsNB1PlkTAYvDfbm+eCMiIyMUovrdlFiTOw0MAiguduPqFg3Xnk3d
	MdcN36FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCT0-0000000AzBX-2S9t;
	Tue, 19 Nov 2024 00:51:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCS4-0000000Az4Y-48GQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 00:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/zdxN2vOlsEF33q9U+oiEdloUgcORSZgWWNMJG2WpeU=; b=gdJAWpZktRAlIE8dOIH3n2I7AI
	Hb84rSn0XKZd3SBkyAz4px0n7Ue0Z6EvSKneVjlhDoHp5BiQTiyJIpNk18dfGtwFKxHDBjkpPDQuG
	tW0kuUzTUGD02z+HiUBGReDEioYavOGrcsrVmOE2wGImuWefDqqAiZhsPG0vfGWj36MY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDCRe-00Diud-Hx; Tue, 19 Nov 2024 01:50:18 +0100
Date: Tue, 19 Nov 2024 01:50:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Parker Newman <parker@finest.io>
Cc: Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Parker Newman <pnewman@connecttech.com>
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
Message-ID: <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118084400.35f4697a.parker@finest.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_165045_022227_7216C263 
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

> This is not a new dt property, the "iommus" property is an existing property
> that is parsed by the Nvidia implementation of the arm-smmu driver.
> 
> Here is a snippet from the device tree:
> 
> smmu_niso0: iommu@12000000 {
>         compatible = "nvidia,tegra234-smmu", "nvidia,smmu-500";
> ...
> }
> 
> /* MGBE0 */
> ethernet@6800000 {
> 	compatible = "nvidia,tegra234-mgbe";
> ...
> 	iommus = <&smmu_niso0 TEGRA234_SID_MGBE>;
> ...
> }
> 
> /* MGBE1 */
> ethernet@6900000 {
> 	compatible = "nvidia,tegra234-mgbe";
> ...
> 	iommus = <&smmu_niso0 TEGRA234_SID_MGBE_VF1>;
> ...
> }

What i was meaning does the nvidia,tegra234-mgbe binding allow iommus?
I just checked, yes it does.

> If the iommus property is missing completely from the MGBE's device tree node it
> causes secure read/write errors which spam the kernel log and can cause crashes.
> 
> I can add the fallback in V2 with a warning if that is preferred.

The fact it crashed makes me think it is optional. Any existing users
must work, otherwise it would crash, and then be debugged. I guess you
are pushing the usage further, and so have come across this condition.

Is the iommus a SoC property, or a board property? If it is a SoC
property, could you review all the SoC .dtsi files and fix up any
which are missing the property?

Adding a warning is O.K, but ideally the missing property should be
added first.

The merge window is open now, so patches will need to wait two weeks.

	Andrew

