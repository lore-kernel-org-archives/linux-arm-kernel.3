Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F1ACD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Anlxq46sRXYYuRWlXg3XZ+DsLUIITVBT88hY/DBVTYA=; b=vfQIVeU7NIlXnnJDCWdGUagbBS
	DrTa/glmoetDZkq5w2PR2QlAQqYqNqsUF7eO0QObnL/45NOhx1YpTsueu6+qEtsrftnOaYBHK+eAx
	eedjhAnvuS7g0FM9ps355cebU6rFeOcvBlJ88YDRvA7G/WrdhWHxWEXtDB1lt4hCYehnLMzEHPIYF
	ntAF6DZfYnedM5DRy7QXRCjEOQBvvoGW500LXNJCIUkFKHzFXsTwUGNno/MmUXq5yARwzIhj4AKLv
	eOqlMk7pzC4Kuor0xQ4k17LFNcVdWn0QKRNVkVR3UzThog7F2lz9mc2kySCPa/WJPBCBfIC52j+dw
	FaA+Jdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM1EU-0000000AY8t-2wZz;
	Sun, 10 May 2026 10:17:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM1ES-0000000AY8P-1Ou5;
	Sun, 10 May 2026 10:17:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E23342AA5;
	Sun, 10 May 2026 10:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5861C2BCB8;
	Sun, 10 May 2026 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778408275;
	bh=XZsDjQQPi2HUE3hC2AtJyS9EK9Buo3smRbbjHi0dDEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjJ8fRZC+0tDaifneY6OTi/OkJWVQHW4sAB6uK3/77U8k5jom7BIm3ilGlIoIeKax
	 qPfFfbxP/LUPY+ovj1zwpyJa+my8Fd/RnrHJMUQeygopBfQQBINBRSK7aL8ai2XBCp
	 PJ2CozH8xdYfzSUTgoisKi7BvM8szPT9ADlGyl2GIO5GTOkQS1djX0JjMvbekdwwfX
	 2jsA8zYB737XWnZtU7Lnc3Px9W2F5hekpu1tPHFvQ1fSXwNJnjSO8cIbGiacUVJKnh
	 KWO2djTc+sVdOhMoZBGdWdlQbq+rHQ3fVJwzKsyst0ACh346qNUdzXPLDHEdS4kpm0
	 eL2biA3i8i8ig==
Date: Sun, 10 May 2026 15:47:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 13/15] phy: mediatek: phy-mtk-hdmi-mt2701: use
 clk_determine_rate_noop()
Message-ID: <agBbT6YF0qXhizpQ@vaman>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-13-f3f829fbacdf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-clk-determine-rate-noop-v3-13-f3f829fbacdf@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_031756_429685_6D2F4C01 
X-CRM114-Status: UNSURE (   4.70  )
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

On 05-05-26, 20:49, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

