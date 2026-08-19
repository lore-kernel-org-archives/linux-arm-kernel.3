Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85937C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIiYPq1vcnLnFm+K0IBpegZpaRy0riQEBHbOf+BbH1M=; b=JaulmkslQ/m88MGkDTJWpqcEYf
	jlaqsVGsjxFfTEoSSXNI8AzH78lPJSH+4gbPacwmReqrKfla/Vya/JkN1ZWzxd9x5MHdOrrP5gdTS
	iXhWwjMmQICoVLH+JsZmf2Zl3voViomf19SwgRmshcIaLLkugDCufaJ8GvxqC9JQaqYHoe6mBcp9y
	chntWwVQFUYgVOKALdEB4Iy8w+5lV5OP/ILFVeF9auyG1h0KcchVk1jFCOgm707szsnz4HdAbW6w+
	SxEVcBHxjeEkYavUHuS+8ktK/HaRKw3yI64i7ZAFMedI8R6Zh5J3Wm8TX2VCc01SJVnFCq1ZrsFSy
	Nv6zribw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcmP-00000009Qv5-36PC;
	Wed, 19 Aug 2026 09:40:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcmO-00000009QuY-0i9N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:40:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E45F943EDB;
	Wed, 19 Aug 2026 09:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC461F000E9;
	Wed, 19 Aug 2026 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787132415;
	bh=NIiYPq1vcnLnFm+K0IBpegZpaRy0riQEBHbOf+BbH1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TlmnRACDndhz9vBW0wumZcoY3Euv8VCbT2RxROlWtWwE+8tkLc3lQqPN6hme6dMas
	 LAYWCI1Uy11yKpitp3AeFZ3Iz7nx1Be04YFju4xY9PGBFjs1rHpVHNrPS5F7EHOzLS
	 0jNq8Mk2VUFZawzZe6ZbDglTVT37atQOTZthQjCZZbxAOB574qXmVo7bITeUO0TF3t
	 pQS9cGqWMNfy7Z9nRro3sSy+Wssi5qbiP8NMhsBxY3fI+moSlOozKJKclswHkc94/t
	 wq+vsE+Ptyvl3QYIPGnPXp5g7+CVh04JEStoKyFkF2aTNWGua8FkTxMbHqp1HVTWXX
	 hxPqlxGSdgymQ==
Date: Wed, 19 Aug 2026 11:40:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georgi Valkov <gvalkov@gmail.com>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, wenst@chromium.org, rafael.beims@toradex.com, 
	avraham.stern@intel.com, error27@gmail.com, s.kerkmann@pengutronix.de, 
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag
 marvell,ignore-regulatory-hint
Message-ID: <20260819-fervent-rich-saiga-be15fa@quoll>
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817215428.84740-1-gvalkov@gmail.com>
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

On Tue, Aug 18, 2026 at 12:54:26AM +0300, Georgi Valkov wrote:
> WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> from the mwifiex ROM, which conflicts with the platform regulatory
> configuration on units sold outside the US market. For example:
> - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
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
> Cc: stable@vger.kernel.org
> Signed-off-by: Georgi Valkov <gvalkov@gmail.com>

How did you fix the threading problem I mentioned in v3?

Best regards,
Krzysztof


