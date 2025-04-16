Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B944C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSKli9psSweFenpFgv766SwvB6pSxSKceg7FY865wEw=; b=SPhHBhITjF1ViZSmzWEAQSoZ9I
	vDx2mxK50K61x0NsQ+IJhTV7ltMbjtmtAmf+ro5uph5eYpzmSIHhln9NXDOq3H1bWHCIO6o+lYMAk
	QegZO+qCYFEvu/tEMLTFBcLLiBU0+36dLuG5Eei5F93Glxo/V2nndjJ/W4vUu+wPsIDMucurAQE1r
	0HsvPD42Bdl2DTh/iOgkYq3g8v5yLk8d6JNlwKIfpALM+j6Lx/0YGK8QQqq48gKMXgHDi34XxBQ63
	nWMaCLKkwp1jyDoe9RY2rPef7D4xEcSwtGYyoxTepu07AdLZecvRcBEQIpUFwaqwOoWw/kE0E1MeH
	L1v8dOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502w-000000098wk-2WKt;
	Wed, 16 Apr 2025 10:31:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yH6-00000008qbd-2tiA;
	Wed, 16 Apr 2025 08:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744792659;
	bh=SFK4utDb6BiPvIgZqYxn3f+Q+Jaf4K4/kobGg3X7CUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IeoBFVwX2ltZCXPMVn+ySHACWJJN4sHulUsnvMqFYeug52ZWQgBfH2WbnZxmR9d04
	 /1vKBKB0h0NCMJ564QZM5UyiWP1ffShol2DM2etow3w6kbHjEd4SSm/x3b5w7jj/J+
	 QKal0lkL//mqk0ry87XcDDbQe274ek84fv0ZG7n7NFw6LlAGt3ECgBrVqH37LZYUv8
	 i55EIOMaXkiecMwDgl0zp/PW+JIA1PlBdY9+LwZV45CtgJ06KgQqPeFDhuTh5egiEf
	 /P5bkayrf74kuMHao7+9NbOrswg/gppmm52kVCPYjdV2pvrlQ70R6QLQAagZ1BIYZ1
	 evRUB+1sVE8AQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5127C17E05F7;
	Wed, 16 Apr 2025 10:37:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, sean.wang@kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Pin
 Controller support
Message-Id: <174479265826.19309.1291310983060738038.b4-ty@collabora.com>
Date: Wed, 16 Apr 2025 10:37:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_013740_901153_C56A3696 
X-CRM114-Status: UNSURE (   7.40  )
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

On Thu, 10 Apr 2025 16:40:41 +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the pin controller
> of the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> AngeloGioacchino Del Regno (3):
>   dt-bindings: pinctrl: mediatek: Add support for MT6893
>   pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200
>   arm64: dts: mediatek: Add MT6893 pinmux macro header file
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[3/3] arm64: dts: mediatek: Add MT6893 pinmux macro header file
      commit: c0f1fd9eeb317ee57b62127c8da48b309da0525d

Cheers,
Angelo



