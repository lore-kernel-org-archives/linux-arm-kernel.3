Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691D7C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/AnzTG4qR4BsGrKzsY7N+S07WkDz2GkP8AvfN3T5m0=; b=qqYhkPdRSf7mFe5gTxCgkkdUPM
	fIUuIWPfwceYVSrGMLW/RSOyrksZUZni4gX02sjKDVo5lY7HtsXw7lEo4wN96HJer1k22j6IPtSdX
	oZ7q22UlUnaVBdXHCi90mTB3hIuvr969b+hPSy46Oh7Q0BdB2gcA/3C8OsfsqpIi1T7h+5YGzr2yk
	cPjwdVKt5nOG7iSOAOFL1i0zX8Fo8Fd37re5KYcDNq3ITDxNF8iA9hYWzVWVwPrMAa06oQ/3MYUPQ
	ekf6ZAMlHvv00DtfkAEewF8m5xD3iA7tNROdm+Z54LLDhYxYG9bPdVH5RVGOV/l1jeNC+hrg/IOug
	ALY0vcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXRY-00000003pbf-3wIY;
	Thu, 27 Aug 2026 10:34:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXRX-00000003pbO-3CvE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 10:34:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0A5A600D0;
	Thu, 27 Aug 2026 10:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23FA1F00A3A;
	Thu, 27 Aug 2026 10:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787826886;
	bh=T/AnzTG4qR4BsGrKzsY7N+S07WkDz2GkP8AvfN3T5m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hsI2aRryVKLYJWanLZ3CmqO1rcYnhJ4swYDHu1LdSSLpizFKjgh8fO2D49Xnjl+6n
	 YFiSHwKM1LNr+lq9htUVLUfz7oKHYq0qdqrDwwB6cFqtvG99UpKbScoKe4PUK1Svcc
	 sTPiVd9LtCPXsPXBlb7rfY/wQTEpg+AUXrD21fL1dUGqkuFnbel2Ts/IPVC5FXPxCl
	 M4eUFTPqTbe/26V/8DsVkUYxwjlFrxDajeCshDYs8snBmLKrlLLUoLs+48PVQC0g7V
	 fzwsOSZ9YxO+rsUVGdvqOS+11zeDz895S3xHP2ThP4EMajpwYwdcipPCj7YArgd8/e
	 CupksjgIoPB8Q==
Date: Thu, 27 Aug 2026 12:34:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georgi Valkov <gvalkov@gmail.com>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, wenst@chromium.org, rafael.beims@toradex.com, 
	avraham.stern@intel.com, error27@gmail.com, s.kerkmann@pengutronix.de, 
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	arend.vanspriel@broadcom.com, peddolla.reddy@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: net: wireless: add flag
 marvell,invalid-reg-hint-in-rom
Message-ID: <20260827-helpful-icy-donkey-9bfdaf@quoll>
References: <20260821010728.45065-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821010728.45065-1-gvalkov@gmail.com>
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

On Fri, Aug 21, 2026 at 04:07:26AM +0300, Georgi Valkov wrote:
> WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> from the mwifiex ROM, which conflicts with the platform regulatory
> configuration on units sold outside the US market. For example:
> - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> 
> When the system boots, it detects a conflict between the user selected
> region and the radios, e.g. BG FR US, and applies extreme restrictions,
> preventing phy0 from starting on any DFS channel. phy2 works.
> 
> Add a device-tree flag, which allows affected devices, where the radio
> conflicts with the platform to ignore the incorrect regulatory hint in
> the ROM of the radio, so the platform regulatory domain can be used.
> This does not allow the user to change the regulatory configuration of
> any radio. It only allows phy0 to start and operate according to its
> certified configuration.
> 
> [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> [2] https://github.com/openwrt/openwrt/issues/9956
> 
> Cc: stable@vger.kernel.org

I don't think there is any bug to be fixed here. Support was incomplete,
so you add a missing quirk, but there was no bug in the binding.
Binding was correct.

With stable dropped:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


