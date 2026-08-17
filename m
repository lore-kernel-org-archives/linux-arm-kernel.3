Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A7BC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06ePaNIYtV1D2TYd+VS2xlZSCHGC67xKGkcgI5yu8VA=; b=rC5awn+H9U0K5RavQfLvWymOMp
	X5+n0PglVG6Q5MOQrJ/XV9EjP6Xhus20vWp+pveTjZDxiC+6ltow4lYPIEwVArHlKckBirfl6MHRO
	/lotjXCTtfawq3ptU92vpTKgevjlcOYYErNgTdJEz6p9PnejLxLYYMA58wrqd/SXvDc3WVpNqjsKC
	j5YADKH9keBvxTz3C5QrV/XFvkfhWGXm5ngciBf49pkaHSoS7F5Oa4LiNAvvns2Mm0zCeRFRv4tjZ
	gTC88Qfhis5dC9FS+62X1vEMpd20cHc8/mC0vidfumQP+lBeMIMQb0rU5j2X7XnYf1eXRBSznXpnC
	q2fWSn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt7V-00000005kOT-0EUs;
	Mon, 17 Aug 2026 08:55:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt7T-00000005kO4-1wWz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:54:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4912600AE;
	Mon, 17 Aug 2026 08:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704311F00A3A;
	Mon, 17 Aug 2026 08:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786956898;
	bh=06ePaNIYtV1D2TYd+VS2xlZSCHGC67xKGkcgI5yu8VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IQ/JVP2yUPtirEQ/ELjYnVfs4z+GjTJFLfUVnJbVIZ2dwPrFhPQn+6EqNJE8E4/vI
	 VwXtqG10OV+/zCyPLKgAM29Z+2e48BiAnepIMwUvqx3trdU0Cpqk78BMbn6qI34AEu
	 zfrvKAr6CCS4FG/4TQRUX/UnYtQwv5j1YwIBKEAFcC2WE9dr+zYPA0l3itOXwIsNnE
	 h5A+7rsjczQR2qxrcsOG/bMl499wczxgeGfjHnYKsgN4PmPgIJU+TxV3olfTtOHs/W
	 cUvFEeySVsh7ecJqltMidKyBoGARQqUudhyPzPuHX9aO16SFwzflj9sVE7r4taGQbr
	 XJ8WGSFErD3PQ==
Date: Mon, 17 Aug 2026 10:54:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georgi Valkov <gvalkov@gmail.com>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, wenst@chromium.org, rafael.beims@toradex.com, 
	avraham.stern@intel.com, error27@gmail.com, s.kerkmann@pengutronix.de, 
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: net: wireless: add flag
 marvell,ignore-regulatory-hint
Message-ID: <20260817-hairy-serval-of-refinement-49039a@quoll>
References: <anoYr9H4KojJv-aZ@google.com>
 <20260814125025.90522-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814125025.90522-1-gvalkov@gmail.com>
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

On Fri, Aug 14, 2026 at 03:50:23PM +0300, Georgi Valkov wrote:
> WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> from the mwifiex ROM, which conflicts with the platform regulatory
> configuration on units sold outside the US market. For example:
> - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

v1 as reply to v3 in big thread. How tools can parse that?

Does b4 diff work?

b4 diff '20260814125025.90522-1-gvalkov@gmail.com'


> 
> When the system boots, it detects a conflict between the user selected
> region and the radios, e.g. BG FR US, and applies extreme restrictions,
> preventing use of 5 GHz and DFS channels. This also affects phy0.
> 
> Add a device-tree flag, which allows affected platforms to ignore
> an incorrect regulatory hint from ROM, so userspace can set the
> correct platform regulatory domain.
> 
> [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> [2] https://github.com/openwrt/openwrt/issues/9956
> 
> Tested-on: WRT3200ACM, OpenWrt

Not a valid tag, drop. And you cannot even do that, otherwise explain me
how did your device execute THIS (exactly THIS) code?

> Cc: stable@vger.kernel.org

Drop, what is the bug being fixed here?

Anyway, property looks like SW choice. You must describe hardware
instead.

Best regards,
Krzysztof


