Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD169606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sBIBK5jb;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=g6Zg+eeM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OY9FTv/AvctWLZDApCrQmUFwQcwrOLKxAT1EsTTIWrI=; b=sBIBK5jbrKzWss6RD5watWyqM6
	Je3lGMLb1sskhF8W/6kxRTpQas8oXP7XE9gznyQC0lPwyPeV4r81TUi3WuM/HqTMPJ0lhQEPqRMfm
	g2VETMThpYWhr+YpNPi5FWvVVwCh2raXiOh7v7K/hXcNUHEpSdSIvgEc9J/7c4zWMmglxE7SdYcoH
	S2+xT8AmOe/OD6dgBmtjkfrDawA4/eX7jxw05SYNhKXC2gyqLjO4sZhoFPRgvxJ/leZ5kL3VXNkTu
	lKlk15OefBxGdolrgUK18m0+K8xqaYDd3btCN0vE/+wl2gCtJiZzdVBo8cxFWMpLigqFK0d8A/nt3
	bDr43qHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1CG-00000000ces-1GWg;
	Mon, 02 Nov 2026 23:12:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1CD-00000000ceI-46i6;
	Mon, 02 Nov 2026 23:12:11 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A4535E;
	Tue,  3 Nov 2026 00:09:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793660991;
	bh=vHySpEKtesQOMdSfDVj2G+Gyass7cQDAg/jsibHOdhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6Zg+eeMIaXrp8XSyh8WuSS61ix/6hpHi7PuCqm/H+/70991ng/qWD4iw/2D2gERN
	 IAX1kdED+CXE5FvldwjKICieRV1OVfBNe1kHlryUdOu0uBZZjtTsVgliqI6QFOtvx/
	 lDYNbDON1hnXguKZUkSNbclYzYw91+KM9XPhyzRY=
Date: Tue, 3 Nov 2026 01:12:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Igor Velkov <iav@iav.lv>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: Depend on PM
Message-ID: <20261102231206.GA3559911@killaraus.ideasonboard.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
 <20261102223316.GB3548113@killaraus.ideasonboard.com>
 <20261103005500.rkisp1-pm-reply-1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103005500.rkisp1-pm-reply-1@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_151210_185648_A535886A 
X-CRM114-Status: GOOD (  13.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 02:55:00AM +0200, Igor Velkov wrote:
> On Mon, Nov 02, 2026, Laurent Pinchart wrote:
> > > ARCH_ROCKCHIP and arm64 ARCH_MXC select PM,
> >
> > Why do we need this patch then ?
> 
> Only COMPILE_TEST builds reach PM=n, and there the driver still binds and
> probe reads RKISP1_CIF_VI_ID with the clocks off.

What does the driver bind to when running on a system that has PM=n ? On
which platform can that happen ?

> Nicolas asked to close
> the PM=n case per driver [1]; rkcif already depends on PM. If you'd rather
> leave COMPILE_TEST-only configs alone, I'll drop it.
> 
> [1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com

-- 
Regards,

Laurent Pinchart

