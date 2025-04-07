Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECB3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usLbaNhAd7Igm8lZdoqsCQBAcd9fpkAD8AXGdUGeFjM=; b=KXJFr7qAdJJBU0rxa9FOuPd7zD
	Adk8QdSNEIHjDCYD8wT/2OlrA2VSGQS92fdXzZdwFFqsk2kquNBXLibe7Ogk6HewrGgemvDZyNJob
	vFLg0phYSPI4WTaHA0XjsKFoerli8CJLOTc4fSPieTXCiGYYAj221fG9D2FXQZc4W9vDf9IesjSuX
	9ZWov7/luwf7YxvqJ/pDt/q6d5y4bk9DOuXBPo68OkBwFRpWbGii7/Hjd0SMLa7Va+1PYu85A/Qa+
	1F4qU22kt1TPHRQFQIxASmvl4IrKsZmB5JfzBMndup2oiQ8x28h86CNRpUnkQMGE6SwKwV85ReoN/
	QAPvbm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pS9-00000001EW8-1TaB;
	Mon, 07 Apr 2025 16:36:05 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oWl-00000000z0W-3WMM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040208; x=1775576208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=G+sqUQNrBPH4I/W5mHr1fMjnSyEYSDrtCw2osviFCmU=;
  b=YaoLbDHw2UkbPC2EXNlkH6HEoyIsOj/+nZF8ZFSSB6WC7Z/X3r/TDS1k
   GOYGF4At4/XXBDvpSXOujnIs6JQx3hc7fTOsRtgYLTltHp+FTBsqjMeZx
   LmWduuyQnBH8vQ58lYPaWgMLI9hvwR1hKN6tMHLuPuTBELNqRr3MitsEs
   rZMuFYbe/BdolRj5PtTyR7mDGG7THwsWqQEtjev9JxV1PAfZ2+u4WXp6P
   O7AtdDTNh66JDNJI92NfnqzxdH2iSRQYYB5R9HN2JIWYGqTY0thWr4yKs
   95DSCCaE8U7RohIMhSrpHWN7C4IZrC6EW0Kbjxa+PkxvzObt7dH8FY5e6
   A==;
X-CSE-ConnectionGUID: cnsJ5QerQvOVcSA3oCPOLw==
X-CSE-MsgGUID: 7PB9yaLhRMC0in1qptkaUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="70811287"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="70811287"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:36:46 -0700
X-CSE-ConnectionGUID: rNN1lCbSQX+WW/v4pCR9wA==
X-CSE-MsgGUID: R72zNQsnQ/GnEwWrCsQ2wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132128993"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:36:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oWT-0000000A6zT-16Go;
	Mon, 07 Apr 2025 18:36:29 +0300
Date: Mon, 7 Apr 2025 18:36:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 11/16] of: property: Allow fw_devlink device-tree support
 for x86
Message-ID: <Z_Pw_MoPpVNwiEhc@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-12-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407145546.270683-12-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_083647_890279_B8E56473 
X-CRM114-Status: GOOD (  21.16  )
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

On Mon, Apr 07, 2025 at 04:55:40PM +0200, Herve Codina wrote:
> PCI drivers can use a device-tree overlay to describe the hardware
> available on the PCI board. This is the case, for instance, of the
> LAN966x PCI device driver.
> 
> Adding some more nodes in the device-tree overlay adds some more
> consumer/supplier relationship between devices instantiated from this
> overlay.
> 
> Those fw_node consumer/supplier relationships are handled by fw_devlink
> and are created based on the device-tree parsing done by the
> of_fwnode_add_links() function.
> 
> Those consumer/supplier links are needed in order to ensure a correct PM
> runtime management and a correct removal order between devices.
> 
> For instance, without those links a supplier can be removed before its
> consumers is removed leading to all kind of issue if this consumer still
> want the use the already removed supplier.
> 
> The support for the usage of an overlay from a PCI driver has been added
> on x86 systems in commit 1f340724419ed ("PCI: of: Create device tree PCI
> host bridge node").
> 
> In the past, support for fw_devlink on x86 had been tried but this
> support has been removed in commit 4a48b66b3f52 ("of: property: Disable
> fw_devlink DT support for X86"). Indeed, this support was breaking some
> x86 systems such as OLPC system and the regression was reported in [0].
> 
> Instead of disabling this support for all x86 system, use a finer grain
> and disable this support only for the possible problematic subset of x86

> system mixing ACPI and device-tree at boot time (i.e. OLPC and CE4100).

This is incorrect, they never had ACPI to begin with. Also there is third
platform that are using DT on x86 core — SpreadTrum based phones.

And not sure about AMD stuff (Geode?).

> [0] https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/

Can you make this to be a Link tag?

Link: https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/ [0]

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

-- 
With Best Regards,
Andy Shevchenko



