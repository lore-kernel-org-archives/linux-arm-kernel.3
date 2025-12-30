Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AD6E92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 03:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfMf8DwmSwPSy2ytXF8YUNM2LBer9Hc/1w8nHQO78iM=; b=ewAIaL8/Y1oNXc0UdT+3UeJLv7
	yIurxAms9s34eBIuORhbNg+aq9FX7xAus5egJj4uOQCt44Gle96E0g3ahHRBPhjXVTa1yfukC0fh6
	3yeWHMJEk9b9NlqDL+PRBCUBhLQyr/FTWiCUX4lb3wvW19oy+CeQo2+v1PsvZaI3p8ICTXhv6rzrg
	m46KlRIf5fCR6qgx4RoJZHB78MSqUN0IGlwRegSQnDQxE6i72CXglcljGELVFI3fNy9VfJo8sBFFN
	utF+2YQC5egFiUxItBvvpm0qEePX15Vp8CCm0FtUtOB15FkvBjaba7hOuMNztYWHdCbysBS8phVfa
	8hYsPhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQFC-00000004M9u-1eFS;
	Tue, 30 Dec 2025 03:17:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQF8-00000004M9V-2PgI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 03:17:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7090405E3;
	Tue, 30 Dec 2025 03:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D46C4CEF7;
	Tue, 30 Dec 2025 03:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767064673;
	bh=lMVQ+KapLp/smzNEVl1Ob2owKXzPDHMOWDKikmE6PHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1szQ9NaZZTVIVSErIYpQHEbiZCdoZBySVtoa7vJ8PsPbQOWI7DYiM8NsNqeUO613
	 pIwholDFd4HNGT8ebglR6AbtX0JI+ZGrtXT//1r9HnCgFPlFIobAHXhjwNCzARGQea
	 l8TlRLxF98yTD/hEJvGU0wD2db+NznyL9NYXlO8lcpKpADdqn8y0oZy2/zQ6A54Fz/
	 i6vYrEsq4dk6JAqzUAj8/GZBNzq2OoekDyJeCcYIw4DhWHbb7sMxDlqDlXFndnmSq8
	 CnlHPeXdmOz/3ww4JHqQgvYIcO1K4BbgaW0b9QtskeWi8yH1fWzYfjovQbSrBAVCzJ
	 9/14GDCLLawTA==
Date: Tue, 30 Dec 2025 11:17:48 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	Richard Cochran <richardcochran@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 0/8] TQMa8MPxL DT fixes
Message-ID: <aVNEXMxhkWMumfvG@dragon>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_191754_635182_060D06D6 
X-CRM114-Status: GOOD (  12.74  )
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

On Tue, Dec 09, 2025 at 11:53:06AM +0100, Alexander Stein wrote:
> Hi,
> 
> this seris includes small fixes for TQMa8MPxL both on MBa8MPxL and
> MBa8MP-RAS314. The ethernet IRQ type has been changed to level-low and CEC
> pad configuration has been fixed to use open-drain output.
> For both boards the HDMI audio output support has been added as well as
> the ENET event2 signal on MBa8MPxL, which can be enabled using
> /sys/class/ptp/ptp1/period.
> 
> Best regards,
> Alexander
> 
> Changes in v2:
> * Collected R-b
> * Fixed typos
> 
> Alexander Stein (8):
>   arm64: dts: tqma8mpql-mba8mpxl: Adjust copyright text format
>   arm64: dts: tqma8mpql-mba8mpxl: Fix Ethernet PHY IRQ support
>   arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
>   arm64: dts: tqma8mpql-mba8mpxl: Add HDMI audio output support
>   arm64: dts: tqma8mpql-mba8mpxl: Configure IEEE 1588 event out signal
>   arm64: dts: tqma8mpql-mba8mp-ras314: Fix Ethernet PHY IRQ support
>   arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
>   arm64: dts: tqma8mpql-mba8mp-ras314: Add HDMI audio output support

Applied all, thanks!

