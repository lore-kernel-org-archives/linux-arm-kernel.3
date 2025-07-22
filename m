Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A294AC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 07:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lm5AP4aUvSzP6+iS++3IWKYJD1R8/KFmHM7lILbgnv8=; b=MAV668UslR5oH7fvu6qKA49AQa
	jIAQc5ZPiqU7We3TYvW08RTitK6n/VwgQXdUuXx5i53vu3ZDyXkmQjGNrDUq+fC0pp3lCbyEq6OF0
	w4yKAVcHZE4GfPCpAxanAeFQL4Od8PJp+/c8kaMiqbkf19aaKrvY74XNCHet6kR0OzOxCSk4RVE7x
	dffb1X+EcaqGmYtYVp9l3nXWfv6K4u31fI8uGw+GfgCL7k/LWDZZh7mbeFqIgrhakfByC56l1lNPI
	vT70FLUsTQHzNddQOUhJviIfBcIoh3RviWYoECMKB/NPfS7Vw6AQK7S2oAA7n+F5BCqQvI59IvLPi
	rELVPw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7OP-00000001dfg-1VpY;
	Tue, 22 Jul 2025 07:26:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Lt-00000001csb-3Wd8;
	Tue, 22 Jul 2025 07:23:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D5D4459F2;
	Tue, 22 Jul 2025 07:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B02C4CEEB;
	Tue, 22 Jul 2025 07:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753169033;
	bh=Lm5AP4aUvSzP6+iS++3IWKYJD1R8/KFmHM7lILbgnv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRgUNWfnwkSyeqXM1R0sXOHk11H/3/G35igUiJl91PUSWRX5PIM+qX11kf9ftOi1X
	 IIuou7OsliyeLWzOWYy2MjtLrD9rIw0M9wN9zGRpt9sKjQv9cqwxdKlPfTJmqYnfwt
	 5Gck9GgO/uJFmscSLNo4iStQNxg8YQLUUCMVZ5A37p03EoJwkj18/pwi00w97OHkaE
	 zC3CaL8xmtBheJOrIS+Y2FbWfehAm+fMDZu4zWX8fIlenl+fmaxUoKfLGfKkiaHjLZ
	 4KOtQ/TP5lJrq0niQ8jd9+tgOU/ekff1ca/+XjXSKnp+uN1ohjEwXRIZQ29RP7Wfsw
	 T8NOFiyGuy6UA==
Date: Tue, 22 Jul 2025 09:23:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com, 
	u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, 
	bchihi@baylibre.com, frank-w@public-files.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 9/9] dt-bindings: nvmem: mediatek: efuse: Add support for
 MT8196
Message-ID: <20250722-laughing-hopping-hare-03edb0@kuoka>
References: <20250721081459.16278-1-laura.nao@collabora.com>
 <20250721081459.16278-10-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250721081459.16278-10-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_002353_911015_D23CDA6B 
X-CRM114-Status: UNSURE (   7.94  )
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

On Mon, Jul 21, 2025 at 10:14:59AM +0200, Laura Nao wrote:
> Add compatible for MT8196 SoC.

This we see from diff. Describe the hardware. Is it compatible with
anything existing? No changes in the driver, so maybe this should use
8195 as fallback?

There are some differences in existing Mediatek efuses, so seeing here
empty commit only raises questions.

Best regards,
Krzysztof


