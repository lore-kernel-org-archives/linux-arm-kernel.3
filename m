Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0DAD3B99E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 21:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KD1ytN9NlcWsEF48XCdj7FLFIzRKMxppVCxmJtdhTbE=; b=QB7ya4k7HhGQTl+4OZunsLxaJP
	bGNeBp6yc5Oy9FzT3oP9xNhJL/aKxtHgDYDQ3xELZwoIT49ZiJIFlHKw6BFFcRHhdhdWN3c3bNb9t
	qaRzMf8KKMLfkdYkKrakXGpD7MOVLCAt7xfm8eNgLMK5am09O/ViCPMJsiRVIiuu8uGA+UWAks6fL
	YTutrAZsNJpzpqtssyXFYQMLjXKODyn3xfynx35wqX6NIlCaH8eJP+CvM8vvPZrBAem2y0NEum9PV
	55CdyZv8W5okssyqcd9k1PCDwEZR4BQtdS5F31IOG4/7uPwk9G7HLAVZvEQkmYWvOZrwNpm+UzAWa
	13u74ThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT5hy-0000000EqDa-2mSD;
	Tue, 09 Dec 2025 21:57:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT5hw-0000000EqCz-1nnf;
	Tue, 09 Dec 2025 21:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KD1ytN9NlcWsEF48XCdj7FLFIzRKMxppVCxmJtdhTbE=; b=WkLC22huPb35rvvbQczIsGwyOA
	iNuoxToGS4MK7IjcWRKXbJdWSzj3JGYa/PX5dfhTov1nUhdFEeyL2dgq6RvpyV5hUC19NY7Lib4QN
	XYaTcsc6hlwMseahb6vqyFRIeCtVvjnKC8l2gizEuDUb0JlT2Xe2dU/mHTT8oqgz4SPw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vT5hf-00GVWB-Oh; Tue, 09 Dec 2025 22:57:03 +0100
Date: Tue, 9 Dec 2025 22:57:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Adrian Kossmann <adrian.kossmann@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add compatible for Ethernet PHY
Message-ID: <8e4607b7-8045-413d-aa3e-c2c1a74f52a6@lunn.ch>
References: <20251209210658.458506-2-adrian.kossmann@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209210658.458506-2-adrian.kossmann@posteo.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_135720_466210_6A2AFDB2 
X-CRM114-Status: GOOD (  10.16  )
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

On Tue, Dec 09, 2025 at 09:09:33PM +0000, Adrian Kossmann wrote:
> Without the compatible string the Ethernet PHY is not bound to the
> correct driver. 

Which driver is being bound if you don't have a compatible? genphy?

It is a bit unusual for phylib to get the wrong driver, so i would
like to understand this a bit more.

	Andrew

