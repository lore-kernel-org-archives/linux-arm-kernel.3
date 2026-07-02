Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3jiJOSpZWo7w985LQh4Y0OVG7Wd0IptXa6TBfu7SkU=; b=Ut1Uddn544qee3u62EjGuQeRCN
	wE7GoiAgtFFe1uPuePsn3BpQzSNN1Cnl+tSMJGrf1XbSm381PxC6hEa55LHTH3i/AsdV63I3vQfZx
	4D538URTNmBh+COS9Iw0lf/XkTYk8/BTU64CUyyzILSup6na4n1aJCWPq51vJ7IbuoO++ZaRB1R3m
	kuNpJ84TY6G98jg9cxloz5alVDM5i/KIr0p0QMRYEoeP9TNDe3KZfd6Uqne6aQ/SPxnod1Oe5YEaJ
	k103t12SihX2C4ZaU1zTXNcEXXa5WeS5AQQ8b7KysQY/zXs5sgPp+W6McBSSSlyah5+SPUuCfNHVJ
	/Z/LL2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ7l-00000004mIq-40Sa;
	Thu, 02 Jul 2026 15:14:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ7k-00000004mI3-2pYr;
	Thu, 02 Jul 2026 15:14:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CFA7439FA;
	Thu,  2 Jul 2026 15:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A251F000E9;
	Thu,  2 Jul 2026 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005284;
	bh=c3jiJOSpZWo7w985LQh4Y0OVG7Wd0IptXa6TBfu7SkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HUo7JOYaEFRyzC9WdCBlCVlgDUpNNKf60fUSfKcmOEFfPx6Gx/TIWQAqNaTgJ6l95
	 s5d7UbA2rhO7yf1OJWfXmqRbEwUHh1HnVQAz2Y6AReUm2EsqWMUDsXogc1B/cSOmZT
	 b0ZygJ6FBQJf0LlZ+3TSRNuxTcyx0QQj47zR8yUANchvZx5BArgFp3liFOTvhrSvBu
	 mHLHeDFfxw2YKCn16UpvqX4MFOYxEGGYjCoJiYXpUXNT86DCanxssuXq+Ei+I/0B0b
	 Vuo9qq1SewwmZlNtoNtYxp6f91VkU0YZdAqrkBZ32Q7yEYqjzZM7VrbUzHh4AD2Vv6
	 yH01KvWQjWDFg==
Date: Thu, 2 Jul 2026 16:14:36 +0100
From: Lee Jones <lee@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 0/9] Add support for MT6392 PMIC
Message-ID: <20260702151436.GS2108533@google.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
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

On Sun, 21 Jun 2026, Luca Leonardo Scorcia wrote:

> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

The MFD pieces look fine to me.

I'm assuming this will go in via MFD.

Just let me know when you have all of the remaining Acks.

-- 
Lee Jones

