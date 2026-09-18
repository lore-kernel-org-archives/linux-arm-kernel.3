Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08FFC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKao3MMj7OIsKmp5BuRHN8lT+S4KY1F4hZJXEVjNn9U=; b=hX66OpdcYSs5eS5Ywe48hx6KDC
	qH6Wqf7MHvF+PLUipAdM0K1YrrpekbfaYVNYUnOCtUMpWYALkmzuKOu1cCXBCChtk28i00pWc8m0h
	k5IpabRoewAa5OZBVidIsotzCOT7iW+rUeHWzKnYZ9GSgmP0WJ4euOqCG3l8WUucq+C5p0hXQuPcE
	TSwZWmfbLzMAG2XgEE4lDvHTBphvYVCnb7Ba4/2uIK7ydZzNFY1/e3040pqS/0DkbnBqgPeoAihip
	ErU8EeDi6KlDNCYMdgJyTquIPzc9CFBQ7ylzv48Xc0gMWpp8cnQWZ0n+HMF46e6mu7VRpz9uR2f6A
	iwLB9NOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WmQ-0000000EDmw-0p5N;
	Fri, 18 Sep 2026 11:29:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WmO-0000000EDmW-3Uqm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:29:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B69240B98;
	Fri, 18 Sep 2026 11:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E00B1F000FF;
	Fri, 18 Sep 2026 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789730960;
	bh=MKao3MMj7OIsKmp5BuRHN8lT+S4KY1F4hZJXEVjNn9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bhl6f6Hh0h9EItl3T+aiAadMvNDmJLYQzhNd2Ju4vuvbCqKznD3TR4bDkYc74CVF3
	 ZvZ9iVUtkhr1qAAL2Pfp3Jk+hAQsCDtGhxZsAa6iDkkppZ38TzRknjA+0VCIGpwX0N
	 qavp05Lw9fn01hMRS20AU+pcimDKatNzfskNWUqu3aQHwUVPJugohi3QPZ/h/IOzgB
	 iAoZsZrBik1DXbac7gLJdbOc7D2ufK7V1P//QvX9Yx+EIxcH5ZNTa1GyhTzgiTdNKP
	 /0q47e6/FAHT1KQxB4sI1OOVLL2kJ5fURG1gm9fDVDdSqTag8LX7XkwBcei73Gd94t
	 hwpGCmFZfeWNQ==
Date: Fri, 18 Sep 2026 13:29:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	qinjian@cqplus1.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@armlinux.org.uk
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Tibbo
Message-ID: <20260918-noble-black-numbat-e5ecbf@quoll>
References: <20260917082632.626614-1-ag@ffroot.co.za>
 <20260917082632.626614-2-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917082632.626614-2-ag@ffroot.co.za>
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

On Thu, Sep 17, 2026 at 10:26:29AM +0200, Andrew Gaylard wrote:
> Add the vendor prefix for Tibbo Technology Inc., manufacturer of the LTPP3G2 board.
> 
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Wrong order.

Best regards,
Krzysztof


