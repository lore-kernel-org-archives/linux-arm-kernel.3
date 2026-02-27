Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95C6FD7F91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 10:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/l+Hu75/dpRhh8//mOqSIjQpgDqj4jb97P8ljVYmQg=; b=3r9HE3GaWRh8duUaixJ0hOZphD
	EVE93qFtPnu1A1vQ3I3rcpnj9faJoP/9Mo7ufn1SEf4HhUvzo+09SIY8QWTKDUAWm0v+MbdLh4RHa
	R+dL3AJ85aB1wKCOdK0rd8X7X12nuHNqTya5MiWTZ8pu+zH9S/pUq5NF/tJme0NSpKitrSL3TYgfR
	UNFqb1hF0AEMqhzTdItGdREwWnE9o3xkQ5mudK2ztqc1g6TWSf4xxVOzHz3d5GNuEuRyCUrBBPiKp
	xVpTcxc6PUUf90HgXuLvzYNdrBVuf/pEiIk+1j4/5sewC2D7Bg09Oh4EF/tRb8WCqSEeOYl8CaVGQ
	NDeF/f6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvGg-00000008Fcd-3QbF;
	Fri, 27 Feb 2026 10:40:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvGe-00000008FcF-2HAK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 10:40:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2A6241AEF;
	Fri, 27 Feb 2026 10:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEC7C116C6;
	Fri, 27 Feb 2026 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772188819;
	bh=S38SLBCjfp+AviharV2czcJGeaKtssqT1mwXbk9V334=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahFpxODvVhaoTXhINZ8PapWNjPNOxSGRKm1eBCcKgxQnM6cnWCcDgkJx4f0VydY9q
	 6upcZ9PnTHHoaQOkDDFrEIt6hyp5tWz/UyX7YvlV4AOi3QmvQFM6NyRFwpJYDtFDFj
	 n8QCST3EbdA9HYrQ9nsec//xdNTycPHzOi/KnSmz6vjaPJYsr+df4acus/GM25RiA8
	 FYmdeeQawkgzIIgDZqPFYrRKo6p8D6xKbwGOe3cgqVSmcSPnnxCWUWplzGwH3c6Pse
	 T43f+D3ASkb37c3zdVF0HtDRXvbNrXlkXnh7IJOdHBQNfZU+ughe7raKYO4hGJTru6
	 01vIJcwZFzTcg==
Date: Fri, 27 Feb 2026 11:40:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, mripard@kernel.org, robh@kernel.org, samuel@sholland.org, 
	wens@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Message-ID: <20260227-placid-rare-markhor-cfbdb6@quoll>
References: <4d6c13d8-fd06-4cf4-9ac1-0a3e595092b7@kernel.org>
 <20260226152702.42051-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226152702.42051-1-jerrysteve1101@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_024020_603532_234A1451 
X-CRM114-Status: GOOD (  14.90  )
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

On Thu, Feb 26, 2026 at 11:27:02PM +0800, Jun Yan wrote:
> > On 26/02/2026 09:48, Jun Yan wrote:
> > > TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> > > equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> > > WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> > > one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> > > infrared input.
> > > 
> > > It was released by UQsoft as a blockchain-based terminal and is
> > > now discontinued and no longer supported.
> > > 
> > >   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
> > 
> > This name and footer at that page suggests name "ultrapower" not "uqsoft".
> UQSoft (Beijing UQSOFT Interactive Technology Co., Ltd.) is a wholly-owned subsidiary of 
> Ultrapower (Beijing Ultrapower Software Co., Ltd.).
> 
> TaiqiCat A01 was released by UQSoft, with its product homepage[1] hosted on Ultrapower's 
> official website[2].
> 
> It should be noted that UQSoft's official website is no longer operational, and the 
> company is seemingly discontinued.
> 
> Therefore, I think it appropriate to revise the relevant information to Ultrapower, 
> if this is acceptable to you.

Yes, please use ultrapower in such case. You can mention all this in the
vendor-prefix patch.

Best regards,
Krzysztof


