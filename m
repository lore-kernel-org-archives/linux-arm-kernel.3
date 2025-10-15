Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8355CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGNZ6BnW7rDeS6xIFWWg/LtSXEvcJ9kKWvp8uKo+oqA=; b=4vVTm4ESi0bOromhvM1XuqP+8m
	mO253Tyu+MAH1JxHBxtgXCRJGuDH1H4MwEqRwlvaSnhjB6i1lMdongKOOIl5KP4kAsUpcPLpBIyJs
	QL7+a9wb/U3TFPVYNvM3DHYYiJ4bIjyUAhLZPK+0NoCwp5PgOe24XkucK2r44tyFJrFXxKZ1x3wHq
	Um+clKY3TfeiYYaa1krsJ9Nw1M8sPzLKXyLLuWP0NpLgCjQnoSU8JoCQwezZ8yD4RzqSNz7uwbPCN
	tY2k4tt63xbMq8WC2ZTHhrNQIVIY1YOZmJcGeRaIkvX+dhLIWx74PYPWUuna8aAY1SgaGScpXwOE6
	HVsfR/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v991f-00000002wPJ-0JM2;
	Wed, 15 Oct 2025 21:27:15 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v991c-00000002wOJ-1lJY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AGNZ6BnW7rDeS6xIFWWg/LtSXEvcJ9kKWvp8uKo+oqA=; b=uokyPi/pdGzl7esJWjMXLznKWD
	Xh8ANLAQ3j/YYuKO/QDwcdjjA5LzS2ydgQlncrmo6rg2+3/3owLO+lQT6+w2PKicRlxWRA08L5hB3
	flhkYz0tYu8t8pkzqzpbW+aY6ULd4DfeIKTtX/OmtTBtIlcqN4rd0LSS27wtWlDzwEdR0lkFOSgLD
	dJ2Gzg49La+Q730WbMPlUeFL1sXF5IME+Uu8UlPh5t4H5E+4EKNaYXg+SUkkej2VjHfzwMhpkgGpO
	IzoIpUEIoiBbL2FqIqB8+W9q/XpbQbbxdiPQrh3UGALGAmh7cHr6dZmyu2DUyejo2ap+XnQ0amvES
	66vxG8dQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47068)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v991M-000000005So-2bPW;
	Wed, 15 Oct 2025 22:26:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v991K-000000002cN-3eca;
	Wed, 15 Oct 2025 22:26:54 +0100
Date: Wed, 15 Oct 2025 22:26:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] ARM: dts: imx6: rename touch-thermal0 to
 touch-0-thermal
Message-ID: <aPARnldAwAYvT0YQ@shell.armlinux.org.uk>
References: <20251015-imx6_dts_cleanup-v2-0-41a7281b98c6@nxp.com>
 <20251015-imx6_dts_cleanup-v2-2-41a7281b98c6@nxp.com>
 <aO_9Tw1s7VcHauNh@shell.armlinux.org.uk>
 <aPAFWuJCfvTcK8hz@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPAFWuJCfvTcK8hz@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_142712_460053_8D4698C8 
X-CRM114-Status: GOOD (  12.47  )
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

On Wed, Oct 15, 2025 at 04:34:34PM -0400, Frank Li wrote:
> On Wed, Oct 15, 2025 at 09:00:15PM +0100, Russell King (Oracle) wrote:
> > On Wed, Oct 15, 2025 at 12:44:27PM -0400, Frank Li wrote:
> > > -		touch-thermal0 {
> > > +		touch0-thermal {
> > ...
> > > -		touch-thermal1 {
> > > +		touch1-thermal {
> > ...
> > > -		touch-thermal0 {
> > > +		touch-0-thermal {
> > ...
> > > -		touch-thermal1 {
> > > +		touch-1-thermal {
> > ...
> > > -		touch-thermal0 {
> > > +		touch-0-thermal {
> > ...
> > > -		touch-thermal1 {
> > > +		touch-1-thermal {
> >
> > Is it touch-N-thermal or touchN-thermal?
> 
> What's difference? I suppose both naming should be okay.

Surely you'd want to be consistent with the node naming? Otherwise
state in the commit message why you're using two different names
where the originals had the same name.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

