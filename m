Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114FED59F73
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 21:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGdtDpmaaao5IF7crynmdu+8s797scL+LXhB55mJWsE=; b=Ly+mTT5xXTYEwIYDbxgWu8ilmt
	PkscTbRWn2uHCF6oNbltCmq5TBAO791HyvKHIcKU/3StKZL3FcoFTjrNMiBFFXp2GnIBrkFfwvPaP
	k6Zczd1KrrWM3mjTUHcqDsvYIq8Ytl8lDijIon3bWw/Zk7EBqbqTcYfU9XhvxoGHqSbzjI88aMU0o
	W+7KmDJL+GkdrcgW8pkrwHLhAx7PQNp8qC2vuXD2i5yq2QS5pjiDCtZPYffM4d/Cen5tsFpFfsg6T
	qoRbbdBJd/nw2sXALlnmqpaoW+RHjqtEg/ysZ5XdOF+BywaqeD7/RYl65pyW0EMFWxck6K/ntT9rp
	XevhZ71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8na3-00000004nkO-0MbV;
	Wed, 06 Nov 2024 21:28:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8nYI-00000004nT0-1fly;
	Wed, 06 Nov 2024 21:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730928415;
	bh=9g6T+MOclTYUgXeTrv5olCKGPoeDF0LBKeyubV2+kU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p8odjkDjQKL3CjEB/U5VkLC45YeQPK/nzseNlKYeMx/qPq5SV6KHAHgzMCMUmCZvq
	 dinnaISVyg5W2Jtn2s1stbJMk99KBvFAEkmME+h5xntihSxKWEPtmxwDEuUGunRJli
	 N9kjW44AeijTORTCNHmlkCepVttOKe+zT/tNSFPQ6QqcaS5NUu9bptnTKA6jupTCZy
	 xUMUJvpvQZFCA5QQgJQVzZNRxfl2kHw74HaxI2qSimdhvOsOq6r8K0ow6WAnh5Mpii
	 qrDf0I/Z5Q2XTPo1cepsm2CSXswdidZu2XlBZyZ9ajp9mvTw9JcNYXIG5lhnJLg/Hs
	 yJZ3xSWjJbCaQ==
Received: from [192.168.1.90] (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6926717E378F;
	Wed,  6 Nov 2024 22:26:55 +0100 (CET)
Message-ID: <fd2d2d7e-67ae-43a1-81ef-91e2852edcb6@collabora.com>
Date: Wed, 6 Nov 2024 23:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: Enable HDMI0 on rock-5b
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Luis de Arquer <ldearquer@gmail.com>, Alexandre ARNOUD <aarnoud@me.com>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, FUKAUMI Naoki <naoki@radxa.com>
References: <20241019-rk3588-hdmi0-dt-v2-0-466cd80e8ff9@collabora.com>
 <20241019-rk3588-hdmi0-dt-v2-2-466cd80e8ff9@collabora.com>
 <ZyvUsdc8ZhiD8-DY@desktop>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <ZyvUsdc8ZhiD8-DY@desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_132658_616590_1F9826DB 
X-CRM114-Status: GOOD (  10.50  )
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

On 11/6/24 10:42 PM, Link Mauve wrote:
> Hi,
> 
> I’ve tested this series on a Radxa Rock 5B using Weston, and thus
> patches 1 and 2 are:
> Tested-by: Link Mauve <linkmauve@linkmauve.fr>
> 
> On a TV which erroneously reports 1360×768 as its preferred mode,
> nothing gets displayed.  Only setting a 1920×1080 mode will display
> things correctly, every other mode stays black.

I'd suggest to try the following patches from [1], they should improve the
display modes support:

94b5c31f969d ("[WIP] drm/rockchip: vop2: Improve display modes handling on rk3588")
c33c23053987 ("[WIP] arm64: dts: rockchip: Enable HDMI0 PHY clk provider on rk3588")
6059245635c0 ("[WIP] arm64: dts: rockchip: Make use of HDMI0 PHY PLL on rock-5b")

I'm currently cleaning this up and submit upstream when ready.

Thanks for testing,
Cristian

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588


