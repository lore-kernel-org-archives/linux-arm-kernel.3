Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1468CCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cco+RFdkzD9BWRwgoYoN/A4dN8BWg8n/rXsKjM10FzE=; b=dJZbJDtds+mIeAjQf2dLCvLs0G
	/iEBDgyK7LBLbGqsuVkCHm1xadlcnnLq8InsNx3Evs/4QIl3cshyVVyjP1BjhEOyrCN2F6GZH7Kj2
	HobAXuDlIFyxh9xvuNme/00tVq3HvzZkRkJc2kf38ppwn30kz8N6KeqHp58i5PLU9bxCnYTq1D+gS
	RB98Y8hoDL9bhQ7cDlFwQBj95QNW87CvHStGak4q9ZAKZSYCbwSaKHicaicUBnLz6pM40WK+SbDbU
	F1tNv8Oile3RxKbDqCdyB8yQ1iWQwnn1KxJK7wl+/SQZ4iWELS9UVZG/T7QYFtqsjnCxtBiXglP55
	1J6zWX+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9eu-0000000139c-3XWC;
	Thu, 18 Jun 2026 10:07:40 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9er-0000000138b-2mkC;
	Thu, 18 Jun 2026 10:07:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1EA6F20098D;
	Thu, 18 Jun 2026 12:07:35 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9ep-003PyD-07;
	Thu, 18 Jun 2026 12:07:35 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9eo-0000000060M-3qHW;
	Thu, 18 Jun 2026 12:07:34 +0200
Message-ID: <56178c185c25cbdfdabe6df6c6028f909fbc32df.camel@pengutronix.de>
Subject: Re: [PATCH v8 08/10] clk: realtek: Add RTD1625-CRT clock controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com
Cc: bmasney@redhat.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Thu, 18 Jun 2026 12:07:34 +0200
In-Reply-To: <20260610080824.255063-9-eleanor.lin@realtek.com>
References: <20260610080824.255063-1-eleanor.lin@realtek.com>
	 <20260610080824.255063-9-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_030737_868636_577C9AB5 
X-CRM114-Status: UNSURE (   9.16  )
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

On Mi, 2026-06-10 at 16:08 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Add support for the CRT (Clock, Reset, and Test) domain clock controller
> on the Realtek RTD1625 SoC. This driver provides essential clock sources
> (including PLLs), gating, and multiplexing functionalities for the
> platform's peripherals.
>=20
> Since the reset controller shares the same register space with the CRT
> clock controller, it is instantiated as an auxiliary device by the core
> clock driver. This patch also includes the corresponding auxiliary reset
> driver to handle the CRT domain resets.
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Please split this into two independent patches, one for clk and one for
reset. Same goes for the next patch.

regards
Philipp

