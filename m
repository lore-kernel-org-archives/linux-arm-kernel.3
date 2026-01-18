Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633CEC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 17:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsX0hqBvRXZzbQ5CGck8gVqJOnTT6XhLl8m14NJAUpg=; b=R9sUUuzJJ7Pfyg5DYDDH/ORGMs
	84EocRq81mEK+70P+PRGVilPoT9Y0NktWwpUmFDoiPe54+NZMxkawjrmz8kdtCAR0UcHHnXpMfkPk
	thVZzLjQCGc49ezEq8euS9Kw1FpjjnfhSlB/mtww8MB17W7dV0Lf1CtGx+vXE4kAGSr84rG6FVs/P
	1eaZOXVngX0ttAFSJH23SHyPLmn6h64fnX7ZNnaihbelUIc8wIjZmKHn0Yji9+x0sRlKE2o3YMHKA
	ceMIyiA62l54hLnctBUUjPOvs5onZEbthHNaYDSyO6j2AjBDepo2vHg5lV3XUtp2DZi1zYp8RlKl3
	i8RcKI3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhWTq-00000000aAS-3lNQ;
	Sun, 18 Jan 2026 17:22:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhWTo-00000000a9c-1zGv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 17:22:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWTY-00067t-Pj; Sun, 18 Jan 2026 18:22:08 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWTY-001HIk-3C;
	Sun, 18 Jan 2026 18:22:08 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWTY-001bBb-0b;
	Sun, 18 Jan 2026 18:22:08 +0100
Date: Sun, 18 Jan 2026 18:22:08 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, devicetree@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH v2 4/9] arm64: dts: imx8mm: add wakeup-source for usb phy
Message-ID: <20260118172208.h7yts2yuf2lkhd4n@pengutronix.de>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-4-0f319c7e9b55@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-misc_dts-v2-4-0f319c7e9b55@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_092224_534908_05E77BE1 
X-CRM114-Status: UNSURE (   7.95  )
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

On 26-01-17, Frank Li wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> USB phy can be wakeup source to support wakeup system from USB.

Was USB wakeup tested? That beeing said, marking the device as
wakeup-src is fine.

> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

