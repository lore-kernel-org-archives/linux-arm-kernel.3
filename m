Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A450E95A8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zp05ztYjirjg1FyuFhjYRrJruwnDi4XN3XPipcenTEU=; b=EB4rOL21fb1Y78VkZH1M372+Q8
	wbCGk7Y3/BuESqWYgc44YyRov82fJ5YNt9LHrAeVK6YXrSxSRpu9Umm4tUTsxFFuDEDwRqWad7TTR
	/NIk8Ur5onQaS95d1GSK4ecLfv7lz3MZxJ0hfLaiCkmiNlxeiLQqrXyJPjeZz2OZqlnh9I3grbj2i
	ihzpEFAw6bUYAgEW4jFx3N6g+bxKYOmRw/fLuUg8iqK5gYNYq8Ex+DRIK+UdPfHzcQleA+klHL1dT
	k1mJ9/V40hNC4oovpJrFEAwQQNYKBAJuoiRsUdHyfNIuEzjFk7gKidsdLHD+1sX2yyDEvER2dvtsr
	5Hs2B1IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZUG-00000004qgc-39nY;
	Tue, 30 Dec 2025 13:10:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZUE-00000004qgS-2FQJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 13:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0EA26000A;
	Tue, 30 Dec 2025 13:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D409C4CEFB;
	Tue, 30 Dec 2025 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767100205;
	bh=Eo5dgsZGwV6/FmS4NlK+vYQcotnOhMl1jME6+5g/4OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLGe3lq+mKTna7dbEhpE8X2VteRD0ym7ko2g8q+vAhQsnHl9moaxDk4ucw5U4a0Na
	 h3azPiH9r9v20bl9Oj7/EJWo9FsGmcJ7oEDoyrn6Q9uGL6VZG5z43c0znmZghlYscs
	 R5NB19XRF9FX7QwStCMa+Swuc/7feSh2ag20HGOXn13tRq4LEGSJhm2lUUlz+kOofQ
	 PTlvxaUSLbblmwNdkdqsLQ5eP4fN85exy2Wfkdi+anCKcGzw6Juze3OhfPwpRGA90u
	 OwkVYRoST3kZq9Xm09cpR1Fm40I9oRsW26bwG/zuqZSj0KQc8Lchm1VCGbO8Pw+YFq
	 8mjTMYuKUrhIw==
Date: Tue, 30 Dec 2025 21:09:59 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add xspi device node and mt35xu512aba spi nor device
 support on imx943-evk board
Message-ID: <aVPPJxWuJl74zoez@dragon>
References: <20251223-imx943-xspi-dts-v1-0-7c18e5b4f97a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-imx943-xspi-dts-v1-0-7c18e5b4f97a@nxp.com>
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

On Tue, Dec 23, 2025 at 05:05:55PM +0800, Haibo Chen wrote:
> Haibo Chen (2):
>       arm64: dts: imx94: add xspi device node
>       arm64: dts: imx94: add mt35xu512aba spi nor support

Applied both, thanks!

