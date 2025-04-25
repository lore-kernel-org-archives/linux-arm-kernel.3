Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E234C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHzuw+bc0eV8DSy5e54/eajHTpo5TtF3m3H+/km2+yw=; b=jWny3r6boQNqg/NGAbOGn+Pe4N
	REScOFqYybsJIkabD/+duAY/4zmin+aheyAqVaU+mSj1m/HxaAB8ZUxUidfWpUScwOsKm/axkIFpP
	KFLSV/U/OiukC3OmpdYDpqCAYk/z4fNVVOoFOKWee3uE7TiNJS4iJ6WbyNgovkN46hmXfH/bclct+
	0mAXE0Qv1UBug+vOjuhStvQU4105RG16NpPKFE+sDGu8WlbuYP4Ght0yURNnAmT6HaTRNu9FC0feR
	qf2N9QlxDjNLfFSeRbePrbzUsy53ednT2K4CSjTkn5ilWrb8FTdeVr3xlG11srP/KOZFb0kf2TZ0L
	j8nkFFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88VX-0000000FkaR-3F7P;
	Fri, 25 Apr 2025 02:09:39 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88Th-0000000FkUj-2ZOV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 02:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eHzuw+bc0eV8DSy5e54/eajHTpo5TtF3m3H+/km2+yw=;
	b=cOjiR3hpGSq5JZGnS9/s2OQIiPq+SRuNJ5amBAFBfyGNvxgSvcUAuOcCBxk9vn
	t/8q5N3mwg9ZWGocNMeM/sfyAtdcbW/JeUpFJAux9YqMcpdc3JPLGNGld12Vmgk5
	hg58WmynrXNlqV9Qm4nDOzTckLTpfNZEcMT8mM1by4Kjg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgB3KU1Z7gpoJI3SAw--.37105S3;
	Fri, 25 Apr 2025 10:07:23 +0800 (CST)
Date: Fri, 25 Apr 2025 10:07:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Frank.li@nxp.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 01/10] arm64: dts: imx8mm-beacon: Fix RTC capacitive
 load
Message-ID: <aAruWUaXtM1O5Js3@dragon>
References: <20250416010141.1785841-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
X-CM-TRANSID: M88vCgB3KU1Z7gpoJI3SAw--.37105S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAo6ZWgK1S9vFAAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_190745_953669_D5AD83D5 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 15, 2025 at 08:01:27PM -0500, Adam Ford wrote:
> Although not noticeable when used every day, the RTC appears to drift when
> left to sit over time.  This is due to the capacitive load not being
> properly set. Fix RTC drift by correcting the capacitive load setting
> from 7000 to 12500, which matches the actual hardware configuration.
> 
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied all, thanks!


