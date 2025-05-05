Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABBCC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 20:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ya7vbsAn1A+K5l6czmWC0xIMm4wUraE2ofw/n57tOp0=; b=BihiPQp+IJkZSjpEkfGC8VKN1B
	hsWDXP9baeQ9zN87AiIBCQ9B2MgWJtt+qAlM582CnmlQCsIBaO12ATXJ9qmvhrbRHjvv9IAf/hKEx
	pz9r1AcJpOfA3TLvv4jhozSJRmrylMvBEU6oJ+s7We5+bz9ZBjXWbAnwdqse3LmeNK+CQgW9OuehQ
	XHWF4xaN7jKj05FnD1Z2UcClt8aNhV1ygUHf7y31uwnzFaqS0LrnJFNNQ485sW7/NTuegXDw/eXZ0
	Vk2h2glXLfrKgDzC9KtTyf4HFg28nBtda/ZDo020DqZfIFqS7mDHsYr4mn88wm1kP+mMoLSbvR0pP
	H7UPMI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC2kT-00000008XcE-21Gy;
	Mon, 05 May 2025 20:49:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC2iS-00000008XU2-3SDW;
	Mon, 05 May 2025 20:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BF095C5563;
	Mon,  5 May 2025 20:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B18C4CEE4;
	Mon,  5 May 2025 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746478027;
	bh=ddICR0mNLi+4InQVuEWoff9w1rDtvhO3HLxEJlaCnm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icXJXNJkCkS3jEBYBORhYqhUxh4ijb8wCNsrwpLDigvQZTu34Ixq0g5KDz6Y+m05y
	 IqmJjx+isaC5GgW7iJRdYYT6lfi2YrQW4VB7h4iGBZi60Zrr86alt2rTnqy4R065IE
	 DAlm2PYfwlNhdzbYGhbx1834+Mpq301d8pDoy22ydcFvrQ2dy319Jm67hLwB7b9I7Y
	 fRmFaurIX3eEcL5osM5jAI7YpspBaSYGnDOwoNpCIjHyrormRj6zC9Letnu891gSG5
	 t/LP3UrJ2Cz0N0piHmmXkXoTw6D6crpEYCewgK10rnk6r66AHvjv+10TQEMqJXFCxT
	 eFNqc0vjXr7TA==
Date: Mon, 5 May 2025 22:47:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string
 for RK3528
Message-ID: <h4hpaadpeu2pnsbcfbg4iye7w5sn26wflth4uztdghafuegqi5@2xbtygdwe2hu>
References: <20250417120118.17610-3-ziyao@disroot.org>
 <20250417120118.17610-4-ziyao@disroot.org>
 <4864135.rnE6jSC6OK@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4864135.rnE6jSC6OK@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_134708_903450_61D7DF8D 
X-CRM114-Status: GOOD (  13.22  )
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

Hi Heiko,

On Mon, May 05, 2025 at 09:49:36AM +0200, Heiko Stübner wrote:
> Am Donnerstag, 17. April 2025, 14:01:17 Mitteleuropäische Sommerzeit schrieb Yao Zi:
> > Document I2C controllers integrated in RK3528, which are compatible with
> > the RK3399 variant.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 
> do you expect to apply this patch to the i2c tree individually,
> or have it go together with the devicetree patch?

with these patches, I normally wait a bit to see how the others
in the same series go before merging.

I now merged this patch into i2c/i2c-host.

If there is any particular need to merge everything together in
the devicetree, then I can take it out.

Thanks,
Andi

