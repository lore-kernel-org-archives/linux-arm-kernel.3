Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E601C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N2675c0NYyWhcFFXd7dcIQh7D8m+rztVPKsZ+SRxIk=; b=Af1EVuX3el6ghpnnyUxS74yB+z
	cftjEn2QD7JaW9ogUUx0dLBQG0XCtfcbCtC4bj4aCqkHj4S6Y+0Bf1cFN9iC7bHPpbJ70zakb1RYw
	TffqaIEJfakR3wOls+mNDDnhySs4kZyacMvshwrtuAhdEVE4gpTnnHBFp6Litvx6JvoMWfn5NiJgV
	wGOtSIgnyX+XlAqNh2LsemF+1JKIjIDxYvsvmwRvLH5jc/F37aQD0eM4S6xpE5CJV28jgt2h0fqS0
	BiiiHseoBYYCS2SJilxSkw4K0YBdxCvjMAwf1CnPzPx8r0As3y4/cEZLIYYaazzYzo9lItKC0p61L
	0d1TS1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmphP-0000000DqHT-0Rua;
	Thu, 23 Jul 2026 09:26:39 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmphL-0000000DqGa-3yGF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:26:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6D69520113B;
	Thu, 23 Jul 2026 11:26:30 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmphG-000sKq-18;
	Thu, 23 Jul 2026 11:26:30 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmphG-000000005eM-17jZ;
	Thu, 23 Jul 2026 11:26:30 +0200
Message-ID: <2c0d9173cb7a4c4f407cea51a24a475de3b4001a.camel@pengutronix.de>
Subject: Re: [PATCH v11 3/4] reset: cix: add sky1 audss auxiliary reset
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Jul 2026 11:26:30 +0200
In-Reply-To: <20260723090808.1727598-4-joakim.zhang@cixtech.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
	 <20260723090808.1727598-4-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_022636_207564_2DB6AC9D 
X-CRM114-Status: UNSURE (   8.96  )
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

On Do, 2026-07-23 at 17:08 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Add an auxiliary reset controller driver for the AUDSS CRU. Sixteen
> software reset lines for audio subsystem peripherals are controlled
> through one register in the CRU register map.
>=20
> The driver is created by the AUDSS clock platform driver and registers
> the reset controller on the CRU device node.
>=20
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

And

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to be merged via the clock tree due to the dependency on patch 1.

regards
Philipp

