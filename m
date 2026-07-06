Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F40C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbNlnCUzmA8Q8RudJAiPNZWwoLt4HvmES37Xr8snSwo=; b=cyn8oCJ5a2Y5coJ+oala3JZhuV
	V9B7DBq7c2UFSiFRxQrHWYZ+Ci9VzuEPdbOI8mh9mpeP6inthCuCvSGbBMiq7q+qeYJy7cgAhNbth
	4D+sqlAYB34kZoUaKuGZevlV10Ca/UAudtrXBJ2IvJsGZ8g9HKgysKoHs7Ct7FkQOPV6TsTcxk36K
	4b5TKW3r5ezgNyWISGYZrq4XDSAtLZnDaP3MDEUMvrJDfgXnkFz1bSy7QanIvu4DkwHZc3ZfHQ8s0
	PnVFTxRYAhIHpuWg1qXZsSTGQndq/7q9FmygC3brogxP3xkuKSjpwSn7wpt0zRgHKx3eRR3mtawyX
	bHvREH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgefv-0000000BpAX-0omO;
	Mon, 06 Jul 2026 08:27:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgefq-0000000Bp9j-0fwg;
	Mon, 06 Jul 2026 08:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783326447;
	bh=NkIZmh+s/VjlejKVHahLAUu+YBVSswgxPaKaVGW3dvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KEmsYLTk8g2i1/b1AtD63hLseWnA7yL1At/puOH3wj17FmCA6Bn1HWvv5dQlt3GqO
	 CikRqyhgnQTISwAG/QoYTrvLC87QRO01vdkScdOuKmRaGNKp3CcFTqEbCHIOkeQ/oH
	 A+Cisw2qmt/WCpv6SJ6y++f0HjmNbnUVVq+Ei+VLjr0FdkYx1YYcfqBpkEgHBmXRIB
	 2XuGc80RjYTnoH+EG4+JAxi/wSeKmCTfHkeW/Ntm84oWqogT6ncUX0GxaHWRzdeOnq
	 Vc3CjbvHiCEU5GotgIJL518Ui4CF2kLHA99Cn3nPGWJQ1stE40DZ2LaxNI7nLiFo/f
	 h3nW+pIM3VfyA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2049517E018C;
	Mon, 06 Jul 2026 10:27:27 +0200 (CEST)
Message-ID: <efaffb1b-1084-40f1-8d32-2679f0a425ab@collabora.com>
Date: Mon, 6 Jul 2026 10:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: remove unneeded 'fast_io' parameter in
 regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_012730_357393_217C98D9 
X-CRM114-Status: UNSURE (   6.40  )
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

On 7/5/26 18:35, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


