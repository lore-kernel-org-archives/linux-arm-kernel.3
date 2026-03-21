Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F801094486
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyLPzHFjpcZvY5yUbkGLDxlWa/8E3W4swHcKJUzvh/4=; b=TGAWoijnSweZ5TvzCJb5eL5PRO
	BZiIT0AlFuHqDW/WoOc742yM9Ww4NDioFaHeINVjIOJ8CMFzFPIKzG6u/uij5Iz5j6CoXzSVQp1gq
	OXZH/ly+tupcEj7dMydtlflDg6Nbo5noIMM1Uv6MFuN+tonCl3JqJTX4McAfFKCPb7nYiuW2i1qNJ
	ud/z/pCNUnLR72PQRe6ezShYBq6gi40EMcJuwmaNSqSwjPzxzw9sM5m7FLLCnHltu6B6MCgwQ25/y
	dKc7yws3WibjCowgxFXOP1Qt8G2KAjeragl0YPTshxhKaoth2SoopJI7o2i5ZN9u5C6F7pstxvjBg
	6WPhSeoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ypk-0000000EcgG-0o2r;
	Sat, 21 Mar 2026 16:05:52 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ypf-0000000Ecfs-2qlb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 16:05:50 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 28CC91F9AE;
	Sat, 21 Mar 2026 17:05:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774109139;
	bh=gyLPzHFjpcZvY5yUbkGLDxlWa/8E3W4swHcKJUzvh/4=; h=From:To:Subject;
	b=BWh1uIUtTNVHairbLOoWq2TpO/GD603aoSYt0EJD0EEFiM5TkQ5xAMLNNVA0zWnjn
	 5z3eYZylaqjpKA6kk/zl87ICTt+UJHdVXBF02vm7YE3FNP+EleJC/dQzrryzsxO+Ud
	 XEI62VQJ67EU6dxy5k94g1kFm/sLT1edfRpXvqG4SJ9MNx/dnTKmHYSR3mbA0O/AUs
	 hVWNmjvQT+ioEPgx27JBW7tuQvLR9AKh+rbm9xt/C0pUcZSHrZfoGS7pPIXd9/BvU1
	 qtBnJWPWe2ojsMbzsQ7VSAHxWGKvXZmTPkCqhlwHSesIvaViCqPvq+danB+PM1wRMY
	 fCxIAeNqj3PqQ==
Date: Sat, 21 Mar 2026 17:05:34 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: add initial device tree for
 TQMa93xx/MBa93xxLA-MINI
Message-ID: <20260321160534.GA6345@francesco-nb>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>
 <abwBoB29cns28PWl@lizhi-Precision-Tower-5810>
 <3410122.44csPzL39Z@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3410122.44csPzL39Z@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_090548_769015_47684DC7 
X-CRM114-Status: UNSURE (   7.13  )
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

On Thu, Mar 19, 2026 at 03:20:30PM +0100, Alexander Stein wrote:
> Am Donnerstag, 19. März 2026, 15:01:04 CET schrieb Frank Li:
> > iomux is not necessary at last one.
> AFAIK iomux being the last node is/was a common pattern for imx based platforms.

Correct, same understanding here.

Francesco


