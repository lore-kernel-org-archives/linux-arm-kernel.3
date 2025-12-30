Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301B1E94118
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V34OE+e4JVGKUd3yC6ru2QJVpYwQyw/SEvblyMwcGuU=; b=pTLnV9gcYqo1xmGijkPHtnhGib
	MBPfSAQMdswxIym4P+1oA2oK6AiSRD7VZaU1Vh1qwIJvLjBfpCiUHRLSP4vNoirR/LZiIDvgD2IFW
	42O0MqIb+n+UQ+dPceyWkvbjYjUluMcX3X7ivYm3fhpw896X3d0PGY5b94B6u2vaEdg1QD5iRWz5b
	15JHQ8TlUumXvwr9+3yk9OWv+X6ENXWCsDSiL4WLZcsUiv0v75If5UdnyLKOolaYRow9UzcXVT74o
	/n6ANvgY3jKmmuzJNGtWz8KIPAiSi50rdF7rcFOYEK8nQhTU3eSK+qianHF8TMuckMk5i2AfZzTjU
	3sn9Tq8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTT2-00000004TZ6-03fF;
	Tue, 30 Dec 2025 06:44:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTT0-00000004TYw-3GXb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 06:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B0DF6000A;
	Tue, 30 Dec 2025 06:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D38DC4CEFB;
	Tue, 30 Dec 2025 06:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767077065;
	bh=YlfPbEKg4BgLwA9wZVE5FZ36J95JQk+NQTRFLrwjbec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRtzhNdwNn2JvTvxkHRgk2vBgWSgo70FYttSJPgwKbs7YOhFmKenm/NujH1xUN1Pl
	 ipNOA2MVvMprPMRwOqJ8Xig4Ba+JV4L3ucclU9Fovt+U8AM9dSuJzL6KKRQUiFa2WN
	 ft0RQzsM1aay6UnDJ2M68a4acba5PizHo/eEmblS/HJlvwjumKXjZxamhTfU4IS/E0
	 alGHUYKCyrkpW7iKsJGrtIs/3aaeEBFFLZj6f/1/qO9YQGFecII5o2WeCwFd/CIWHo
	 1rnZ3PwfAksupWYacMwHRFvWwoRgaVFSK5AUGdpkYi9B4jM0YTAt/WnvW9yhapOT4I
	 K4lTRDzqsHVeQ==
Date: Tue, 30 Dec 2025 14:44:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: fsl,imx-gpc: Document
 address-cells
Message-ID: <aVN0wfPKqE-iyYOg@dragon>
References: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
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

On Fri, Dec 12, 2025 at 09:58:59AM +0100, Alexander Stein wrote:
> The GPC power controller is an interrupt controllers and can be referenced
> in interrupt-map properties, e.g. PCIe controller, thus the node should
> have address-cells property.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

