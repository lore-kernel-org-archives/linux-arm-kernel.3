Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E2FC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JySm67fHnESL8Q88SmdhwLZQvpKI176J17Nt4E7e3iU=; b=UgO76jKhEC+GhofNqBQSZnc1GH
	zjvZZJiD/m5BWOguHTy81Yjl8/YlEKbCDHyUaOQfHnufrvhbXl4Abvk+l9olVbN0kGD8qZtiNNiu9
	UugB0Kt74QaXhfl9kTkkXQRum41duTTQ2o/jpvd0qN1bS0siCvcp3W6xMfX97iKTez4fqpO7apNV3
	yxRkEk9aqpRCL84FsC1MDg9NjmG7qRE6jxCcjxHgUdtWLfC8kuoGaxD/Anu7baSW4RRywKB+CrztX
	UT4AKniteMSvd0IfnTsPtIuaCzd7edwGh2AMGjKAdWvmeD9+nw1OmJbggTlp8xe6v1QbwMEyydtah
	n7k6nYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RjY-0000000Dbp3-178J;
	Thu, 17 Apr 2025 16:05:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5R7F-0000000DUyu-2Eoh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 15:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JySm67fHnESL8Q88SmdhwLZQvpKI176J17Nt4E7e3iU=; b=KC1H5SWXs4IhtqrhqF+IT+bXNh
	1p1IGLwEPJ099yvDwibR2YPvXWdKd5lg3xmXcvuaPUMc3T3NzKoGwEVmVxbz3WBSUALRVD9Ei2rxm
	sNUVJsBg2HxVKqO9f8IFgFYxXo0BtIeqtyK+a+zoGo9KbUS5p7yNwLz6Ocbck5v9WF9xCCpcEOBfT
	ZPJMFuiozWGc+UCZBE0pgxgkvgjF7cW5TUFje/A/9oqOZLqF9+y4sP0Q8sgg3PdDcMLy0esYoo584
	mH/ML+Xq91/hsfGObldta2xSMWejPgLhtS3c46I4+GE+ywZpHb73c9mq/GHs9mEV1GTGApXiiVbrP
	RDAANTWQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45184)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u5R6m-0007Vs-0O;
	Thu, 17 Apr 2025 16:24:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u5R6f-0002Y8-2W;
	Thu, 17 Apr 2025 16:24:49 +0100
Date: Thu, 17 Apr 2025 16:24:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	upstream@airoha.com, Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kory Maincent <kory.maincent@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Robert Hancock <robert.hancock@calian.com>,
	Saravana Kannan <saravanak@google.com>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next PATCH v3 00/11] Add PCS core support
Message-ID: <aAEdQVd5Wn7EaxXp@shell.armlinux.org.uk>
References: <20250415193323.2794214-1-sean.anderson@linux.dev>
 <aADzVrN1yb6UOcLh@shell.armlinux.org.uk>
 <13357f38-f27f-45b5-8c6a-9a7aca41156f@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13357f38-f27f-45b5-8c6a-9a7aca41156f@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_082525_567874_AF1F1670 
X-CRM114-Status: GOOD (  16.62  )
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

On Thu, Apr 17, 2025 at 10:22:09AM -0400, Sean Anderson wrote:
> Hi Russell,
> 
> On 4/17/25 08:25, Russell King (Oracle) wrote:
> > On Tue, Apr 15, 2025 at 03:33:12PM -0400, Sean Anderson wrote:
> >> This series adds support for creating PCSs as devices on a bus with a
> >> driver (patch 3). As initial users,
> > 
> > As per previous, unless I respond (this response not included) then I
> > haven't had time to look at it - and today is total ratshit so, not
> > today.
> 
> Sorry if I resent this too soon. I had another look at the request for
> #pcs-cells [1], and determined that a simpler approach would be
> possible. So I wanted to resend with that change since it would let me
> drop the fwnode_property_get_reference_optional_args patches.

Please can you send them as RFC so I don't feel the pressure to say
something before they get merged (remember, non-RFC patches to netdev
get queued up in patchwork for merging.)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

