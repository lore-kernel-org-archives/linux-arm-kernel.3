Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60154CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns09Eizq9gM2NnPJw5DNGALzDeb2i0DrDbvIrjDIWdQ=; b=AD0HtGmRO2A+t11K+EwgeOdG2f
	QQrvEdcq3ouPb2tKv8ct4Ognmg84meYa24+IS1ygfFDrJ2JB49p9DbL8lFXmAbMKVb9xqvgDMwNId
	WZKfY7SvmSfjQYZqD0/1l2i2XL9D4g25RRbvH08ylB7kVDQa3VrGph7tJ4aAjoKfxSdGaCyAYhyJ1
	awcXO+cLrcXMOVBYwKNaSwU+cAETpFE9j8xDveJggaivzHYKKjAgYt7Uv8HqIi1sNPipZOzMRdDNg
	TMkYUaaiTbs4/kz0F/MUwCXQ13FO8wsKL1wQE3/YxTOQuDlcjCLCAA0jtkl+pRY/IkYyuzDdqP6wE
	ZZZ4qo/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzO8-000000071ZL-28Yf;
	Wed, 30 Sep 2026 18:50:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzMp-000000071Cm-0pPU;
	Wed, 30 Sep 2026 18:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ns09Eizq9gM2NnPJw5DNGALzDeb2i0DrDbvIrjDIWdQ=; b=uDZ7k2T3nH12rjcCI6OGpnDxkI
	dF5BOvVgtoKzSK8HGsNy5x+K25IAkUINHrBX2PGDFmT7d92X7nMwiZTwVOFsqu1YAROMxIHMLFIRc
	0+HQhHeerEAfcSx5gVww5fUzHSVyALJ4jJmBrScGC/nnpvG6gzbC0UK6c+GsJq6GFdJVfY4dVSCT7
	XH1zzciEv/zzkqw9/P0nHlD5teNlzWu2vNNVno+g/+bkssyYS8UAc1H0JZxHgouvWpLAmMaUm+uXG
	+nT3I8/3VN+StF5KqLNjHq17AzNX0LyWOMYKfgFgfapKkKeho0aayLBB3cfb4XQypBgFNhrMOy9yE
	ccnu7Jvg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Adam Wermuth <adam@wermuth.pl>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] arm64: dts: rockchip: Add PWM fan and WWAN overlay for Radxa ROCK 3B
Date: Wed, 30 Sep 2026 20:49:09 +0200
Message-ID: <179079409724.2398180.1900201056909150214.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925080258.46489-1-adam@wermuth.pl>
References: <20260925080258.46489-1-adam@wermuth.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_114923_439113_77CE0EC5 
X-CRM114-Status: GOOD (  13.41  )
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


On Fri, 25 Sep 2026 10:02:56 +0200, Adam Wermuth wrote:
> The Radxa ROCK 3B has a 2-pin fan header and an M.2 B-key slot
> intended for 4G/5G modules, neither of which is currently described
> in the mainline device tree.
> 
> Patch 1 adds the PWM fan and ties it to the CPU thermal zone. Patch 2
> adds a device tree overlay for the B-key slot, enabling the USB 2.0
> host controller serving the slot as well as its power, RESET# and
> W_DISABLE1# controls.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
      commit: afcfb6982a13fb4b3e0045f96c7aa6d64063a034

Only took patch1 as the discussion in v2 did not seem finished
and doing it correctly trumps intermediate solutions, especially
adding overlays we might have trouble removing in the future.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

