Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8DACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nh2alkm8UQFjjG7G5D67uKRDFzJ1Yl0TShWq8gVzXkI=; b=ynr59C8nevZJTFNs38m4UdZT1g
	1gWkl5LpUkOnXoGUGx2iE9X4s5MsNMna34+AcoHCpxb9y0Po2L8x6maJw9hzqmHXMaChz2/gLi1+Q
	5DjE3zpw1l+1VSsH98jq/wsI36AUK196sUWomJYpexHqD/lpXrp8pDNWt6FFjwGqylakuIeQIRv11
	WECve5hl8bpWdlopUtOxrJvx5few+rzbR2krX+pOa8H/dztrVR7HnCWyqr6VwtRSJm6MTmTdkMZYo
	Dcey9Qe607nn5m2dH2rDbf6+T11o3nduAzPMNYE6mTln0vqNv2tXRtAOlVkT+Wu82TPFVhdA1YhfZ
	floECDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbTz-00000005pTI-1U8r;
	Thu, 28 May 2026 14:13:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbTw-00000005pSm-3hoN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nh2alkm8UQFjjG7G5D67uKRDFzJ1Yl0TShWq8gVzXkI=; b=R4BkEky7hz78XU1kosJmLQqR2Z
	fk5SOtgOSxfqIOEig/xqZz4ztuPkrBhh/TmgqGO+gBAYWxaQ6CkCQ3bZkHaFCFR1Cv4f0DbCK0bR7
	wJUToPLtuNL7AnLvTeoWwVbATsbDfaQaCMFT44EMl/a5Q/Tjs37sEIgSAzqjykDmP1fI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wSbTm-004uNK-2Z; Thu, 28 May 2026 16:12:58 +0200
Date: Thu, 28 May 2026 16:12:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shengjiu.wang@nxp.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: imx-rpmsg: Add headphone jack detection and
 driver_name support
Message-ID: <37324dcf-5214-432f-9aea-90bcff5fec32@lunn.ch>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
 <20260528020725.2265321-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528020725.2265321-1-chancel.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_071308_919607_74424A5E 
X-CRM114-Status: UNSURE (   9.18  )
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

On Thu, May 28, 2026 at 11:07:22AM +0900, Chancel Liu wrote:
> This series adds two features to the i.MX RPMSG ASoC card:
> 1. Headphone jack detection via GPIO: Introduce the "hp-det-gpios"
>    device tree property and use simple_util_init_jack() to
>    register a headphone jack with GPIO-based insertion detection.

I'm not familiar with ASoC, but have been in a long discussion about
RPMSG and GPIO....

I just want to confirm the GPIO you are talking about is a local GPIO?
You are not tunnelling the GPIO over RPMSG using some vendor protocol?

	Andrew

