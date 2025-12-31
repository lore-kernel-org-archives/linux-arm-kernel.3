Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8B0EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 03:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujN3I3ZzaM00FRg9Ww6OCRFKTqm5Jb+lo1OmM/kHzso=; b=YgNtAhITrQ+ZuuwcHhvdBrZ4FS
	Z0IP7nBu9rfUz1P4EmmY3L4Vni9U+N4U85p0M/D553ddEgJXu1Ls4/24WTAiLs9OQTf2mKfzguwbk
	bHE0jBchbCPJ8oewCHldmWOGOozpqoZ99Sim10wVBUcpO2BH1oNEdThycigy+qkXhWNAtZGYp6KqW
	ci7TpAffeJuXSv5+3j3+r6l+Vf/6/PDDfuDS3nIQQf9dg4Jzkl2Xbww6LGbg/AUgGowTJb7WpL16R
	UH9qZgSZh3kDt9jMYm7uLIDiS8ibEIgu9zeRzlcdnp/gQI0jqTfLdR3CmAL4um0hj9xFId2ILI3rK
	1GQ4Roiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamWx-00000005cdf-0tF4;
	Wed, 31 Dec 2025 03:05:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamWw-00000005cdX-23IA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 03:05:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD35860008;
	Wed, 31 Dec 2025 03:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A276C116C6;
	Wed, 31 Dec 2025 03:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767150345;
	bh=MqHLvL68KAQb7SXagB6QkmhNElLWAClnQb+Cnw8dcUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ic8+St29FOOQ39l/NebKgSGGDd4gYL1qDKdxaJlLRa/olQXp5znmSRQDplZRfDYSE
	 CHvzYgwqXWJaaDyYvf/Gd3kpMjw/xJdHPjptT36ktjk+QcU3F6JpuUq5wXRswxuzeR
	 ezUcrlCZT6N6pOWsRSBmyAogQt7bkyDNLThLNQ6Aicu+RwcgIW0S7vPWn2lHRCqKNt
	 9040PxNjefVA4qXJ2O4v0KdOF3nR0b3f3ht/70gU5RJLleVqypeQmKEEbx6L54BD/e
	 ClXs49HiTYKfNuxAVNvyF6ozv3ORFaTUpxIpFl3kChhqZSQkqMfDw1S12prKt5SukR
	 xt9smCDs1CCTw==
Date: Wed, 31 Dec 2025 11:05:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Francesco Valla <francesco@valla.it>,
	Tom Zheng <haidong.zheng@nxp.com>,
	Steven Yang <steven.yang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 0/2] Add FRDM i.MX 91 Development board support
Message-ID: <aVSTARNDcNqvam1f@dragon>
References: <20251230-imx91_frdm-v3-0-60cac61c96ec@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-imx91_frdm-v3-0-60cac61c96ec@nxp.com>
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

On Tue, Dec 30, 2025 at 04:58:52PM +0900, Joseph Guo wrote:
> Joseph Guo (2):
>       dt-bindings: arm: imx Add FRDM-IMX91 board

Subject prefix "dt-bindings: arm: fsl: " might be better.

Fixed it up and applied both patches, thanks!

Shawn

>       arm64: dts: freescale: Add FRDM-IMX91 basic support

