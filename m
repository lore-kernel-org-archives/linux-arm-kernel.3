Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CBBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJsn94m6kic0rpMASlJenrkAlsCmPp1NHeAGw6wWVxQ=; b=CeR9l4ro1iMRRrZ/EInZO6WKwl
	BZlQsXbYT+d6NrgwuqVPOL3u+71DIC3D6XJWJP7EhbDwAsJKd1+VNq2cMjpxiD2JGZpSlSXCswBeJ
	mTfRQ4oS0PNx7V1ptIPkA5RvA93lhk1aO6xEk2RGbvUbG86FM8qercOV0/vMYsCZRuWkTS0/UMIJ7
	1Z+0/NWORhjeC878C4JTlSRVTudMnkX+lAK/wiEhhsTcINYxrNwvH9GsRqeOw3xZjhUiNCNNusAsP
	y+FPny8HiHWQ0MfBnd92Jt+SECtoBcgquVsaYtCF6ME2SyE2kOKsPpj3U4ouUuSzXQuj4mQ+Hoabr
	QsNS6vdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmnb-0000000E7qS-2i3B;
	Tue, 11 Aug 2026 13:45:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmna-0000000E7qC-10Eb;
	Tue, 11 Aug 2026 13:45:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85F52600AD;
	Tue, 11 Aug 2026 13:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103C51F000E9;
	Tue, 11 Aug 2026 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786455945;
	bh=WJsn94m6kic0rpMASlJenrkAlsCmPp1NHeAGw6wWVxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z1nBu3DebBwuYpYckdodFKUrP+ADbfP/H6DZ9Y7liRp4zCqpa1Em/f1dsmucYYZlB
	 uKxKK9eBm9rDvJXTNMBEGOeutrmvkDldbUFo/u8nLPptd9AD9CTlMepHS0ndurXDNB
	 E8dIWiONEFU8L85VE5esCGzLvc/K5IZrmyCwsSBPHRdEAwTUvtAT04th3lNApzi+q/
	 /OlB/3rbUfl9L/OyH2IkRBWCgCVZyGX4+uYz01IvoOl1heuAcBLHr7+bJ5lrRae9NS
	 sKgu9vcmgiAnVH5ReVr/rNA90/4er3MqtptduNrGJrk7/9FUK14kTH0wFhR+jIvihj
	 ogEfyug8003eA==
Date: Tue, 11 Aug 2026 08:45:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Manuel Traut <manut@mecka.net>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Ondrej Jirman <megi@xff.cz>,
	Olivier Benjamin <olivier.benjamin@bootlin.com>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Warnecke <awarnecke002@hotmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/4] media: dt-bindings: dongwoon,dw9714: Example
 shouldn't imply 1.8 V
Message-ID: <178645594369.2062848.622744149571079300.robh@kernel.org>
References: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
 <20260801-pp-pro-camera-v1-1-7b4d90788f9f@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-pp-pro-camera-v1-1-7b4d90788f9f@ixit.cz>
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


On Sat, 01 Aug 2026 02:35:20 +0200, David Heidelberg wrote:
> The datasheet says VDD should be between 2.3 to 4.3V, usually around
> 2.8V. Correct to prevent confusion and extend description.
> 
> Fixes: 2a96b40f366a ("media: dt-bindings: dongwoon,dw9714: convert to dtschema")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


