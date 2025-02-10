Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5573C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYscmB7YBh9xCH5NiBwRVfVEdXQ0xWkSsd2V5FdpalU=; b=Ewl2u2tuvRqFianLyhlrJYyrtz
	KgE4IBirxADRBMJNv0Yd54obYbxDtEyq8Ny9mDQIQggGIzLCtTIXxjni0Hqu8v5Oa9cSApfbSJqLw
	tck9umFR3uwELqIgCAA+ikZ5NvqSVy1GPt3xXXRtIvxBTymuAV9ZckV+n5V2Bgghn2yPYEtNYig2U
	JsWhdo4wkjooQVW9RsBJA1+aTTR3bSf0+HVX5m39nx27JY6YjGVDIHznDcoeYSh0hsob+l+jzBKnb
	yZh0fSHXgUjaaoIU8guLarlwc14cwFdrFDjUGddgrCqwCK2oTv5mcWC8FRa1TwDrigw5iIoTbgV2B
	+wNq6nCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRRE-0000000H6Jp-2Kcl;
	Mon, 10 Feb 2025 10:54:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRCh-0000000H3Io-3Gfs;
	Mon, 10 Feb 2025 10:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EYscmB7YBh9xCH5NiBwRVfVEdXQ0xWkSsd2V5FdpalU=; b=PhDv8cYpqq3APzcwLUHJCid1uD
	v/7ixIhWf/z879eB+ZeOw5OH+aLnc/B/HZe7UJ06KyBxwCYYfrKoj8SpLRj/dLP1213szDWGpPUGV
	mJTwo7m4ClH4mKe5zfJkb7HVAxE8o6/rhFBjs9kDPaHH4MN+/9N9gHf0GwBwQQ8G5Cg1kBfR1suJL
	2DoU/bIIu8hVXSVmnZykFOVlstxQNFj/MQIbg9AiVzPhjMl8v7pWyaGiC7ySo0pwTxp9eCIVfwST0
	mjZi/a249sF3o7JfOZkXaG9GujpnKyQmsMYlxtKElNoGU39/7APLKO6C39do/HgwRg07JJUuI96yY
	Ymd2vT2Q==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thRCc-0000xs-SX; Mon, 10 Feb 2025 11:39:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rockchip: pmu: Ensure all properties are defined
Date: Mon, 10 Feb 2025 11:39:35 +0100
Message-ID: <173918381710.1055685.9023375516767645114.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250203213056.13827-1-robh@kernel.org>
References: <20250203213056.13827-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_023951_814751_62B33B45 
X-CRM114-Status: GOOD (  10.13  )
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


On Mon, 03 Feb 2025 15:30:56 -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add the missing child nodes
> and fix this constraint.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rockchip: pmu: Ensure all properties are defined
      commit: b921f66ccf5e8cf1b8a5052b35ceda454f19f5dd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

