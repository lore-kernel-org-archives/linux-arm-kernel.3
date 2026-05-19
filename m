Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B46CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDiwcUS7KKcAuA9zQ93RHRaPkFaMupzoLqaQVImJgAo=; b=qv3dbu8C4wb4awbMiW5oREwDCS
	s2oolnywHt26aG3RZFQv6K0RgR2Yr/TQVQonb8ca+zIFLoDFLAfZhl2ihPZmrSCYj2yeK2E41aqCY
	/jqTGZfYaIbYjz94eX4VIjKopQgf7EmtDXL05PZivLO7zuEXR4Eh6UeR3AxAg1v7BqQljtzHTCQUK
	zq8HQ3wJN/HJEKZ7oQF1ta5ZPuTL2Y7uM35BR70xsdvvQ0QrSvo73+v3f7yRygz7tAFeEcAFJ+lw1
	9PMScMwujcMKMbI7xxit6CqLc3QHrBHkgpkdsd6UoFxQ4r8161ERiHTP6aKaxSwz8+ozzMXVBVdTm
	MzaYZiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGeq-00000000u3d-2Aw2;
	Tue, 19 May 2026 09:22:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGep-00000000u2X-09Zv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 09:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vDiwcUS7KKcAuA9zQ93RHRaPkFaMupzoLqaQVImJgAo=; b=YoCJYmwqWshd3foFM1+8HgObxE
	LFvYybWn7OHJcydCio04mPE4DZfoxjg9h1GyTUjSdS0oPLRwhIlBpr5pmrgXNDMnB/FkNvG8aUj8T
	b380xcJ3+Fc4HzcMHdnWUpeEan2SWpiyfLb8x+rvSCOjneGGGzJAqm2M0esx5MjQCIX0kXtEHy1o/
	cUGhrcZjl/1qBecFARxzAR8h+tj/CaqgalOb0yargKHzLtbgnImO5wv434wXLP1BcJOsC89KwWAbi
	HXT3Vm8YgGLXa3f89DFnM35iGWSuzdkWOPaXvniYyw//SjKlhfuVgviEKfpCiFaK7lg7Y4QDM5Tzw
	rXMWNVDw==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGek-0000000DgpU-3H0d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vDiw
	cUS7KKcAuA9zQ93RHRaPkFaMupzoLqaQVImJgAo=; b=K16NRXKGWgwSp/DERPis
	kGb8sfRsH6tY2Iax1PPnAlDP7JGg1DqyIPCp1pkacciz63ayYD+1LpAiMM9PbTZC
	rNce/Vodq9K6BDhsrKjaZB9TlXWMgQygCcpMPEQv6GSp+kCm+ijVAhxTcsExRv5p
	H8LgtA3WLNPvphIMfh7yi+M+JOocr4frblYKNwr4OT4IWvxRX6OiFBUW0UxjpBiY
	PYnJ3ymCxCCIMGzACtEVqo/4uFArp/FsMkj4ztaSvAk02qjGmtAQyEwFWECM3E2A
	dsoXQOBFtLhK6XPs1rKFXggtmvK6b5TL8+aJppapbUlV/KU1H+xWZnMbNK0nXDGV
	Jg==
Received: (qmail 201991 invoked from network); 19 May 2026 11:22:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 11:22:25 +0200
X-UD-Smtp-Session: l3s3148p1@TtmWNyhSU4tUszca
Date: Tue, 19 May 2026 11:22:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Wolfram Sang <wsa@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v7 1/3] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <agwr0BE3EdYx70XA@shikoro>
References: <20260511155755.34428-1-herve.codina@bootlin.com>
 <20260511155755.34428-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511155755.34428-2-herve.codina@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_102231_241003_24CFB37D 
X-CRM114-Status: GOOD (  10.13  )
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

On Mon, May 11, 2026 at 05:57:48PM +0200, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
> 
> While the commit fixed fw_devlink overlay handling for one case, it
> broke it for another case. So revert it and redo the fix in a separate
> patch.
> 
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Link: https://lore.kernel.org/lkml/20240411235623.1260061-2-saravanak@google.com/
> 
> [Herve: Fix conflicts due to f72e77c33e4b ("device property: Make
> modifications of fwnode "flags" thread safe")]
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C


