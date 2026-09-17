Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16CAC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGPRaq4S9vBbBXygDE+rIZJwB2PXwdT9MJwWrz7C/kg=; b=h6v/v0ZqzA8SqalNWzr+/zyvyy
	/Hob0jHR6nyXO1ST1i9lmBz8eis0CMRV0YmgxzzOSxGgLJCfX/+P0s2Fvk3QB1pNY2YHgvWd0ZsSE
	lo1+mZuyciQgrNp30rcztoVOO+WMj2t2DBBukWilbuRXB1K11GBFP7JRjB/xwK7aHIsefTmwsH4EB
	7SU3L8GYBjkJ/Q4GcYQUE5xLotOZMe5Fn+u+q3wq5QlbtMFBuMB9RlJhUFrZCv1SgFhIMdZuc3kQF
	f2RguxOcLmae4OHS7jzMII52gxrrppDnBt0ZD5VpkkZSv+WzkvZWuMVsQVW9qatYluTVPg4EvrdYp
	Z7A2OlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x798l-0000000B54b-2TAb;
	Thu, 17 Sep 2026 10:14:51 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x798j-0000000B53j-2FsH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:14:50 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 2ABB01FE13;
	Thu, 17 Sep 2026 12:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789640087;
	bh=nGPRaq4S9vBbBXygDE+rIZJwB2PXwdT9MJwWrz7C/kg=; h=From:To:Subject;
	b=L5YAVrBy9vjQK79Gcib6ggUlUrgChHV4fbdQYS/TYijiWzWWXK330qxETGm7RjHLw
	 EGOg9v+Xpp0BPGr39yYAw6UWI9fmaXt0wMhRau8GLwNAkfRzdfBLEay+V2+C/PUPa5
	 8/xaXTJJWwZXs46VI0syXJrFobp7khqPbwHmhJI8d0I4vXGe5MYqNtViwx8KkHmOCn
	 wYA4RN7BbO0OPcr8zV/czEGeHyu93zbia7Otyfo/cZHyS1S3VgPbeD4dpKeplbJgpI
	 hxlfkQT97EoN3Ebk7XpGWM36RdnYYtP0/dwEn9q6w73dOk52dSzhWWskZ0ckQQYnXr
	 +gL2ZacWde6Bg==
Date: Thu, 17 Sep 2026 12:14:39 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: Add Toradex OSM iMX95
Message-ID: <20260917101439.GA67500@francesco-nb>
References: <20260917094217.59508-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917094217.59508-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_031449_726903_C02A67AD 
X-CRM114-Status: UNSURE (   7.67  )
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

On Thu, Sep 17, 2026 at 11:42:13AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This patch series adds support for the Toradex OSM iMX95 SoM and its OSM
> Development Board.

please ignore, I'll send a v2 shortly :-/

