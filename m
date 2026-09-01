Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B103C624D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKWhKoY3dsr3R8e8ZzeesufclzbVL0D+O9N4G30TkCE=; b=5E1JLDV2n1WFlbRS65qjx5inHu
	79EWytqquDWcx4rlT0xSf9fzXU6CkVbgdxLRtleaXM9kuMoRzYDHXEcv4jxFmB5pO8ZAjLaw+FP1C
	5kf2ESn/WbUE4nw8oS2JkO8BYfz/pPvru/J3VcdLNpnXZhOR/DF/ld4S9ivhk+7EQYWhPIn2wpR8V
	63L6y3ITeYVyZF2ViNnegawmwgNCgH/HvPpuXq7ZihgcAAbeOeqVUwDKrYop/3NcbqgFLGaAuIIEg
	aowG1fbAM6halcQjzfb72cP9FDbm+CeUF1nzyI1YacJoM5XkP0wv9zU6esMYAe9OLoAvm1QJSWesM
	cmqnWeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P6J-0000000CHa4-1k9a;
	Tue, 01 Sep 2026 14:04:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P6I-0000000CHYn-3BcQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:04:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B0154321B;
	Tue,  1 Sep 2026 14:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB571F01559;
	Tue,  1 Sep 2026 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271474;
	bh=PKWhKoY3dsr3R8e8ZzeesufclzbVL0D+O9N4G30TkCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cS7Vdfn+Z+Dl8XQDollKPQuL1NWlUhxY/7OkqWhP7SdRFeCis/8eGeLnbUBB8KH/N
	 0xvFeeEdb4d/NQLMUIUKVu38CTZAJAAMRds73fshrQFhrm+cljGrB+LuKwI4AXFioC
	 f/k6PdZ0atmHPQP0ClTTTNRFBNDU1UzsoyrJiEX1BTuY9fVUDJ4dJF0la4dvcAqi6B
	 dI4N/tmoaJvOrQmXOHQlJU0llXC2iILRH3AbEbKlUWqvvoR4uFL0OEokXxUh+aFXNu
	 hB2191TKrbJbel0R+fTHWGr+aPQmBd+vAmuRX2mmHCNy7B8p4YZO1cjerubB6JriRN
	 8zgS3Y6W6YwMg==
Date: Tue, 1 Sep 2026 09:04:33 -0500
From: Rob Herring <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	=?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] arm64: dts: imx8mp-skov: add new 7" variant
Message-ID: <20260901140433.GC1244140-robh@kernel.org>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
 <20260831182243.GA955466-robh@kernel.org>
 <87o6ehjth8.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6ehjth8.fsf@pengutronix.de>
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

On Tue, Sep 01, 2026 at 09:55:47AM +0200, Steffen Trumtrar wrote:
> On 2026-08-31 at 13:22 -05, Rob Herring <robh@kernel.org> wrote:
> 
> > On Mon, Aug 31, 2026 at 10:17:37AM +0200, Steffen Trumtrar wrote:
> > > Add a new board variant for the Skov i.MX8MP based family of boards.
> > > > This variant uses a different 7" panel than the existing ones.
> > 
> > The sashiko issue needs to be addressed.
> 
> I'm not 100% sure what would be the correct solution for this case.
> 
> Would it be valid when the *.dtso just drop the "skov,imx8mp-skov-revc-touch"?
> The generic compatible is not really needed, but the base DTS wouldn't have a compatible otherwise.
> 
> Or do I have to change the binding, so that 3 entries are valid for the skov,imx8mp-skov-recv-* and keep the hierarchy (although unused)?

You have to pass schema validation on the base DT and base+overlay(s) 
DT.

Rob

