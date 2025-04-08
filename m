Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E70C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8RWM2V6ZnehV9xCG2Wi7D3YFpwSdHlPKuNFJkQ/bqQ=; b=hTntSuHhVmU6v2jCsFN8NZlb79
	GatmHl2n43LCKLwvZWaE2YaTatSzTh8QWfvuwrGCRb6wUHKeW/ojP5SWreqhI1dcF4kFnzFLzKsz4
	1AikNlHeI8p4XRGzo9mIewpt96We72uUFlY6kKPE9FxnCyYfYa2EFyBgB+Vbn9OasXZdwiXLlvthz
	6L9oXIYQI71Q8fizC6GLKXzPR4uJyzmW4crfOsew+iKmGJ5JwM1bg1czwrju941njg8zJ4H70U5mx
	+w2uc3Ig1Ud9Spw1QfWvOtQNwrOMA5zEhJ46X8dIg907+/XeZThxKYdidMX1rhZNmOGzm9ExlOWvC
	G4LZzrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DHe-000000053PC-0Mnr;
	Tue, 08 Apr 2025 18:02:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CkB-00000004yia-0ecV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 17:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y8RWM2V6ZnehV9xCG2Wi7D3YFpwSdHlPKuNFJkQ/bqQ=; b=Gug+5dJkFQ2rbCZ5IXZX4osrkc
	z4jCLXuY8M+Deo7TGvO4X3azXzNOY81Pym6BE1wRVtlX0j1A55PWe5bI2sC3crPMPxHw1CeStLy2o
	/V0QKXahJUMiiC0QA75pZ0B71CSfo3v561yu0Dz00hSkJbrLJPo2YlqRoNq7PJUrXxcRgH84YKKRU
	OmVjnaBReXWpYspNTe4XnqnxjIhTFm+dq6EUTbPorz00lCBHEMhGAjD6JCR7I3D0tHI4klOBUjGmX
	WZfuxE+cKAVpE7S62ePuI4c2mcHsgReKBCz99EZlrG7OMoPEVQAv2csuoYJ61Ua+C90ZhC8XailZA
	nZx7znGQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51470)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u2Cjb-0007pu-0I;
	Tue, 08 Apr 2025 18:27:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u2CjV-0001bg-19;
	Tue, 08 Apr 2025 18:27:33 +0100
Date: Tue, 8 Apr 2025 18:27:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, upstream@airoha.com,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
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
Subject: Re: [net-next PATCH v2 00/14] Add PCS core support
Message-ID: <Z_VchfzoKOTvy5TQ@shell.armlinux.org.uk>
References: <20250407231746.2316518-1-sean.anderson@linux.dev>
 <20250408075047.69d031a9@kernel.org>
 <08c0e1eb-2de6-45bf-95a4-e817008209ab@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08c0e1eb-2de6-45bf-95a4-e817008209ab@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_102815_195590_57BBC5F9 
X-CRM114-Status: GOOD (  20.04  )
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

On Tue, Apr 08, 2025 at 11:30:43AM -0400, Sean Anderson wrote:
> On 4/8/25 10:50, Jakub Kicinski wrote:
> > On Mon,  7 Apr 2025 19:17:31 -0400 Sean Anderson wrote:
> >> This series depends on [1,2], and they have been included at the
> >> beginning so CI will run. However, I expect them to be reviewed/applied
> >> outside the net-next tree.
> > 
> > These appear to break the build:
> > 
> > drivers/acpi/property.c:1669:39: error: initialization of ‘int (*)(const struct fwnode_handle *, const char *, const char *, int,  unsigned int,  struct fwnode_reference_args *)’ from incompatible pointer type ‘int (*)(const struct fwnode_handle *, const char *, const char *, unsigned int,  unsigned int,  struct fwnode_reference_args *)’ [-Wincompatible-pointer-types]
> >  1669 |                 .get_reference_args = acpi_fwnode_get_reference_args,   \
> > 
> > Could you post as RFC until we can actually merge this? I'm worried 
> > some sleep deprived maintainer may miss the note in the cover letter
> > and just apply it all to net-next..
> 
> I would really like to keep RFC off the titles since some reviewers don't
> pay attention to RFC series.
> 
> Would [DO NOT MERGE] in the subject be OK?

I'd bet that those who have decided "RFC means the patch series is not
ready" will take such a notice to also mean the same, and ignore it.

I think there needs to be some kind of push-back against these
maintainers who explicitly state that they ignore RFC series - making
it basically anti-social behaviour in the kernel community.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

