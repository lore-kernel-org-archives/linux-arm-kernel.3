Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7EDE909B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noah+ahWLsLbjMlCHgxT7YuEr4pbD0Lx5cvHqvNKHn0=; b=yafPAemZcpaVT8jcEOr6RRu8jV
	GJNf5jYB8/IaqIYTdsJ6UxvUBWA0BWBVc7Cc78f8FBynOkljtaL5EFL/PP2SjiVM+aWrO8xJH0zWB
	igjW8ko9mltzNnME5rpo2SatD30bEFIFuG+M2h8/M4WeylMlBceK2thK7R6F13Qo1CUsQxlM5cQSO
	rtVpRkgmAQW2CFNiyzVQ50U4e7I8J+VKPEjXoJBuEyY96dtl4dh/DEjlsziQAVoP0q9Y0r2PKKlpz
	C3Aj2IjGL9tAx7EeOTdFuwI9KFMuj4TqbsJfWm1+XBVV7Iqbr4GX8XzSDANUiC04l/C2R4Rh0C/OK
	BlzcQU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMS8-00000008TE5-10HT;
	Tue, 17 Feb 2026 14:53:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMS5-00000008TCp-1b18
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=noah+ahWLsLbjMlCHgxT7YuEr4pbD0Lx5cvHqvNKHn0=; b=ahjoqDGR3dg6s6pXBpNrSOh2En
	AHtLeFFglpmBgoJ/oeuG49oOkw9EYh90FYlkrJtpiOcUOBd0+u7LXhUbMjRVJeYB5kBXd9Ig3XdKE
	fDSVhX/zBw/SZF+z4qpN5FgVCUAeS5wDProFMTC5iEkK+uAuFeapI7UO/a+FVDauSOA4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vsMRo-007een-4Q; Tue, 17 Feb 2026 15:53:08 +0100
Date: Tue, 17 Feb 2026 15:53:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx: bx50v3: Configure switch PHY max-speed
Message-ID: <6dc304c8-2e65-4090-85b2-4b69a5751823@lunn.ch>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-2-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217125952.53997-2-ian.ray@gehealthcare.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_065325_460677_0835FA7A 
X-CRM114-Status: UNSURE (   8.98  )
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

On Tue, Feb 17, 2026 at 02:59:48PM +0200, Ian Ray wrote:
> Configure maximum speed for the switch PHYs according to the electrical
> connections from PHY to RJ45 connector.

Are you saying only 2 of the 4 pairs are connected to the RJ45
connector? And i assume you are using a 1G capable PHY?

> +					max-speed = <100>; /* only 100Mbit/s lanes are routed */

lanes generally refer to SERDES interfaces. For twisted pairs we use
pairs.

	Andrew

