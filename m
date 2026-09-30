Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803C1CA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PMQbnd1Umh/ykCtK7pbq7KnudwFRJAJCgrnFGdJK4c=; b=JPeur3saRBcPV4cNFkNf2Ktl2s
	ng40u40TLyKeeaMMX7AX0FxplIHcTP69n0sSurdWXQVUI2F2N509Gb2XoDWWuJcKvzKj5qQVhP8ry
	8sOYeZu+T/B6jDwYfnO4LM31I3PkMvnqdAw3L5VBNHg1iJCuaa4cXOsuAgsFF+judOGFjVHxN15cs
	qkZK6zqcVturo4vpjkI3UKujnXR7rrt+8kWl2NDoRbbSEiII3j7TxJcjR+Hzs9lX6qw18sMl3OSKn
	gaEQxXKPzcfOOwybdUIrJJsGh4ARAiVOkdS8pklpB1lME9RKeXqYF/h77SK4yThaQVSZkYlT6WBEM
	mkP8JZbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzOA-000000071Zl-0rq8;
	Wed, 30 Sep 2026 18:50:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzMp-000000071Co-3W5a;
	Wed, 30 Sep 2026 18:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/PMQbnd1Umh/ykCtK7pbq7KnudwFRJAJCgrnFGdJK4c=; b=XLcAH7VESRih5oS83IYVQYVRRH
	GCyd4Pjd0IxFhdFF60HppLUJ68Ji9QZJLfHogmSrBHmFSBXyCdJAQdKTDkr7AW0rWJ7hphvFkCxHw
	LcDQ4WFXHGlOQ1j14TRyDCrroekkRmI+CS6FEzGRvFgc2Did2pn2voIuSaNnBuv0P2mBRaz2mWmx3
	66XHpB7YQoifucsdxA1z+VI4CM2QD7/zJyOAQo9f99Dme9BYieaIMqLwuufgu0wzQKntbhjkRSxSw
	77460R7t80RemoIBEQjQ7xq11ljvYU5ujYqr3pIkLxZS43BV70ql6TZnKTaZzm0av02AOO6DLz9mq
	KXiJmxHQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	jensen <jensenhuang@friendlyarm.com>,
	Andrey Korshunov <razor1702@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 0/3] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed, 30 Sep 2026 20:49:12 +0200
Message-ID: <179079409731.2398180.11671143856080790218.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
References: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_114923_907953_1ABB2428 
X-CRM114-Status: GOOD (  12.59  )
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


On Sat, 19 Sep 2026 18:28:16 +0800, 安容 wrote:
> The NanoPi R28S is a dual gigabit Ethernet router board based on the
> Rockchip RK3528 SoC:
> 
>   https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R28S
> 
> It is closely related to the already supported NanoPi Zero2, sharing
> most of its power tree and peripheral routing. Patch 2 therefore moves
> the common parts into rk3528-nanopi.dtsi, and patch 3 adds the board on
> top of it. The split leaves the NanoPi Zero2 hardware description
> unchanged; I verified this by comparing the node and property sets of
> the dtb before and after the split, which differ only in node order,
> phandle numbering and the two renamed LED pin configuration nodes.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      commit: bdcf29a379afecc02c3e99c0d1745363ad7a7407
[2/3] arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
      commit: fdb087806e808ccc4963e2e5225fe16581ecb421
[3/3] arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S
      commit: c1e23f3425c49fe22e9598f8eea2fcf693950d50

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

