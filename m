Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031E2CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 06:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izvswgULjVKnMNc8RRs/u+xF9sef1u7J/UdDKN2xSwA=; b=AJFOCDH5+FQ+KyqmMK6l1F+PzM
	t1HwlKxDLYjQUCJKqv3yr5P4g8lowiR2ih5LOxxYHLIpw1ElJFvo7/mSQRN/VynqP2flJsT4nn3h9
	s/V7S6TXfI7yJ59fmknmWVNy7oy9sqYgd1fVcKuI9+StH+J+O4Wy+b6JQannENJa0jOEpPXBXCWj3
	sa79jydmR3E9cBNZup4qae1EfcmQs+PbUTSnDxy1sGkqJ+NIII+iZ/1JHz/m/sxB0lCw3g6QKGG3Q
	9c5iHIUssxbQ8GKHfDA/1EObaPRShT49MrocNW3IxCmbvavZBGm6iHmjJMn1VJ8fwNG63e1n8l40i
	m9w+mHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHC5-0000000DEnG-0RMK;
	Mon, 27 Oct 2025 06:59:05 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHC1-0000000DEmV-3W0h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 06:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=izvswgULjVKnMNc8RRs/u+xF9sef1u7J/UdDKN2xSwA=;
	b=IaT5bG8/Npswm9/cwt+6r5pTKpEdnOb/4ZzS398oWoPIqr8N1ljh55/QnVLNpd
	pq+47fW2DbALWK59ineCZBUfjecluVRrZ921mmhVO4QH4MCsyqEsjDZbwLHnxyl0
	Pf+s/j0hJSuiSPxEMrPMwe0gD830HgAT3KbNZByG9fKjI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgD3N58gGP9o0rg_AA--.50610S3;
	Mon, 27 Oct 2025 14:58:42 +0800 (CST)
Date: Mon, 27 Oct 2025 14:58:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: fsl-ls1028a: fix USB node compatible
Message-ID: <aP8YIIQG6uT7bLEA@dragon>
References: <20251020133754.304387-1-alexander.stein@ew.tq-group.com>
 <aPaXaFigEh50sdZC@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPaXaFigEh50sdZC@lizhi-Precision-Tower-5810>
X-CM-TRANSID: Mc8vCgD3N58gGP9o0rg_AA--.50610S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2b18DUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwIojWj-GCKfngAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_235902_196167_F5D7A5AB 
X-CRM114-Status: GOOD (  10.17  )
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

On Mon, Oct 20, 2025 at 04:11:20PM -0400, Frank Li wrote:
> On Mon, Oct 20, 2025 at 03:37:53PM +0200, Alexander Stein wrote:
> > usb/fsl,ls1028a.yaml says the compatible is just a simple
> > 'fsl,ls1028a-dwc3'
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Thanks, but it is similar with last patches of
> 
> https://lore.kernel.org/imx/20250929-ls_dma_coherence-v5-4-2ebee578eb7e@nxp.com/
> 
> Waiting for shanw pick dts part.

I'm waiting for the usb binding change in the series to be applied first.

Shawn


