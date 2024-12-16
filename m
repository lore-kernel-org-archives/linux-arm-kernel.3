Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA34E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ec5I/i5T6YMMzAFEhHX+pcLiDVb9DWwowzQDPnk7xPE=; b=AIKYIei97tDZRjCy15skRlnWMO
	UguQ7N2XR8gsEB6IVbiVlm0lfNCh/IWXzcAqogkvRel3n+TLrAwDGWECc67tGbCIGadYAsRG4s3dD
	LQW9YaoVLCn//8XEJaKNZ4pWWvQzPZKzQ+QH+BgcvhKezty5UKxZ7E45ezcqsi4ohjGDKj2ty2D1l
	zkC5cTZyQmt5mVZhKtWHTLcBfMRKToeDIHP+7m0MW4EeXwU0wRhqETaKd70yAeeE3AjlXPIYZZ6m2
	OREi5Q6Rrdye7zQ4V9geYhuhc+gSrRpTRuSwJy09nHE3cu4bUNbo3WpDH1ikaWo1t/thRdL3ICx23
	PE2DcOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBr8-0000000ACUO-1qmo;
	Mon, 16 Dec 2024 14:13:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBnq-0000000ABJ0-3qK8;
	Mon, 16 Dec 2024 14:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734358228;
	bh=7BmQDn6Yuc2KbvneId228CgnxSdUyRhjp8eBVEZmStg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=in0zhueLaBy8Ehm9jZ+TwjGhOCva0+k4uCWrKmX/22p4DQt4V8jiUFow6sBSGHnXG
	 WYPpPP8tOYljRw9v1pW9/VX0LDOLakx+vHuW5xs6fNqRJ8WxApwH7cwYX3Ioa+6vfa
	 G3Uw8qPevb7KSRg7aKKUZWE16VJ3fvSID0alsDl3fLC/x9QNbBTFz6K94AB+7QwGEX
	 PdIKlDPhut+G5Zr2UL3MVhWV2hZ8Baoox9Wz84+55m1ebmLpYt2o8knDoQqIweSamy
	 m8TtR838Or/aQD+YZveYyUdhxJ5mNDZlvFBSwktaQY30Tk3tXcoMWzgqPv3yq2RAss
	 +XgAmzCorXCXw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C97DD17E3780;
	Mon, 16 Dec 2024 15:10:27 +0100 (CET)
Message-ID: <73431558-89cf-4ef9-a0c5-fb9209eeb040@collabora.com>
Date: Mon, 16 Dec 2024 15:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: mediatek: mt2701-mm: add missing dummy clk
To: Daniel Golle <daniel@makrotopia.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>, John Crispin <john@phrozen.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
 <9de23440fcba1ffef9e77d58c9f505105e57a250.1734300668.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <9de23440fcba1ffef9e77d58c9f505105e57a250.1734300668.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_061031_105727_58E84F40 
X-CRM114-Status: UNSURE (   6.42  )
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

Il 15/12/24 23:14, Daniel Golle ha scritto:
> Add dummy clk which was missed during the conversion to
> mtk_clk_pdev_probe() and is required for the existing DT bindings to
> keep working.
> 
> Fixes: 65c10c50c9c7 ("clk: mediatek: Migrate to mtk_clk_pdev_probe() for multimedia clocks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


