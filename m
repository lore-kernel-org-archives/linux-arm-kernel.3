Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45904E92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 03:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zD+gmRh3Xh/HHJG0Gj0lXHT0UGm9c3ZSo29yikKKwhU=; b=wiYcRRGYWbSHJkaUrLwBAQ1zgc
	vhOCOrA6OMX+NNmVgiVZVdv+LEu4Mm+ZojaHGLh4WcfJk5+t9/hUspyqcMz9Lg6DDQ8w7fIt3tfOV
	0D9iRPGhhWkXjqpZcFjxuDAl5+5WeDxVh7WtRAcTrAAuNIZWgDggYgGKsxp0IOROfHfgTtu4nBT0k
	A8ORcU8aVaeZqcjxYOm26QbMsvuuJDINdHB8B2QpI0r+i0BrIb8y2/essOeDj/wsKWmA064jJySf4
	1gNcoxjvh6uQajruekFYmtVgjtvM2YJLcN+u/m+KlEn9QYvBpX15Y65GK0HehZbsuvMn99d3IvS5m
	/PnsuuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQGL-00000004MN0-1Z65;
	Tue, 30 Dec 2025 03:19:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQGJ-00000004MMc-0m0C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 03:19:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4507D43CE4;
	Tue, 30 Dec 2025 03:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495F8C4CEF7;
	Tue, 30 Dec 2025 03:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767064746;
	bh=O2r1KwYYSDALwqUvU7r3CqahDZShCtKWBjve35FT1yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MGYeLxOWYN/Zq1UplbA7ORcLUNaZVqIbkVkof0sen7rRVF20HpmHevaE3Whe96Ixi
	 6cwDUlwvfx/blUnoiWJYgseAEoeHysqVB3+bFYSTAMEIqDUG9muoDiiOPJAX/AkEKi
	 GspB300ck4WjNDWmvMp407nnK/YRUjaLKadyNVbJBDR1/rEGbAL5rsANgFJERG6SuQ
	 0KlLoUbkEBKvJkoLb6GCVTMY9359U7qNpYDKMNG8XmPzwr1O9l6EErDPPR9PD7Z4Q8
	 wQtP8WVpfkTrtE5bCqhJfLhFmJWOKRVwh+WvCwBkyWuoQisO/Yz/IFsvs4tQleVOJe
	 2COgC16X2L2Og==
Date: Tue, 30 Dec 2025 11:19:01 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8m{m,p}-venice-gw71xx: Add Magetometer
Message-ID: <aVNEpXM3XG8Dfczl@dragon>
References: <20251209205828.689999-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205828.689999-1-tharvey@gateworks.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_191907_236941_856E1933 
X-CRM114-Status: UNSURE (   7.97  )
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

On Tue, Dec 09, 2025 at 12:58:28PM -0800, Tim Harvey wrote:
> Add support for the optional LIS2MDL magnetometer on GW71xx baseboards.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks!

