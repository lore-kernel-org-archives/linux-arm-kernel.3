Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA8DCD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfQ1+50Iw0ZrpujhUEt7M89sfNI/lmJztfL6n2SFls0=; b=mUi15mnIuMXEBgsXxXqUZyuaC8
	sbMCTvDm+6FNwsJQ3LqHbybizXR+0/pkKeqyHgdrr0kyHERy2FWU1d9Ep3n1Nx1CXSscA29QEK0dm
	lTvnmMZPVkBDNGzBhUO/ltZ8USmSMis+Eol78MU0AiW/8HhFOSVFuydlBdAY+MS4ut0eKZOfsHLHx
	LOVf44gIoWArLdNlJDsPWsaR6BTNCnk7yHw57klfE0BYyNU9rpZb/U3kd0WnJPd/acQFGB4MfdmEX
	1biGvya5JD1keNbOLOAdhBRzWe72eXRWzjU5rFEyFotevLG3gsUVFLfjTTIZQXUX5cBljBGWniuZ+
	BZN1dbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwg3-0000000AVET-1jM3;
	Fri, 12 Jun 2026 07:51:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwg0-0000000AVDW-3wtx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:51:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1wXwfs-00079h-O1; Fri, 12 Jun 2026 09:51:32 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <pza@pengutronix.de>)
	id 1wXwfs-002LSa-1J;
	Fri, 12 Jun 2026 09:51:32 +0200
Received: from pza by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <pza@pengutronix.de>)
	id 1wXwfs-0000000GiV9-1DfP;
	Fri, 12 Jun 2026 09:51:32 +0200
Date: Fri, 12 Jun 2026 09:51:32 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-frdm: Add missing HDMI DDC pinctrl
Message-ID: <aiu6hDIMskukbb5q@pengutronix.de>
References: <20260611-imx8mp-frdm-hdmi-ddc-v1-1-b4e4c9bb0729@pengutronix.de>
 <airL0l3pgGRaPFVt@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <airL0l3pgGRaPFVt@lizhi-Precision-Tower-5810>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005140_975725_7F4DF9CC 
X-CRM114-Status: GOOD (  11.03  )
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

On Thu, Jun 11, 2026 at 10:53:06AM -0400, Frank Li wrote:
> On Thu, Jun 11, 2026 at 10:18:59AM +0200, Philipp Zabel wrote:
> > Configure HDMI DDC SCL/SDA pins to support reading EDID.
> >
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> 
> Fix tags here?

Fixes: 95d7d7d2ad27 ("arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi support")

regards
Philipp

