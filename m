Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC90E77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4HEJRNkJsMuZWEEvbh3kE/ls8GrPrXfh0AAgq+OuT4=; b=ncQmRqVeRyK4dwIxWT9rVWDgQA
	pvL89DIaOrvxOjLwnm3DsfCVpS9YYULpQBtH1V9Xt3dWxkFbz3N7u45RWTwwvOXN//+zE+ys2EkvE
	tNub5CgUWlA0sM8F+FHNzZ198/J60N12iAwpa/O0TyqHFy7OxmaMgI6eAAwHcytcYdG3mRgaGBEkb
	Rx6Hopyw5eAOVm0M/cLerTFjm90PXfAKpRHOzmlY9Ab17PrmVqLY2g9Dr6AGbV0fp0NTsAquTcO8c
	cSxEHXQragdLcsbCXnCJ3iSabz1CnfizjFO0eHCwIRNvdXg8DdF/t0Hxg4E1tDXiEZVN9mPS0uXjB
	e4/fD0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBow-0000000ABkw-276m;
	Mon, 16 Dec 2024 14:11:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBnn-0000000ABId-3Oms;
	Mon, 16 Dec 2024 14:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734358225;
	bh=9BMq611RSXimAJ+Nd4yXmLpN4KwHNrEW5UBvFhxngaA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=glWcTs8SLz86Y9sW9NLV7fe4D7IiBZoL2azvS+FTKDl0SO1vgDkOEoODHM/+65/xW
	 6JzAxgEy20rAmA4CCmxCHGbMB+uOH4aRgLjqpVXBnIZRs1ZKd5Ud0nwlrFm04i9Nqi
	 50YtPCScf7X9y6DtbarvMVN+8mPLJE5A1+4KUIT4U0O2WRarHF021l/Hq+WOjEbE+d
	 U3aacBdYv1mEOClv0hJBnWk4VJ9ZNbmXWS5ipj1U1O7XRtcazHWomPYf0ac1TIuVq2
	 b1bFPofH8FGNIYYPYaWLIl4iEbabKoDO50deZ3N9vhjHx7mSY3Q+vZ4P4AkZU7UWR5
	 PRN1RSx3v3Srw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DBC617E377C;
	Mon, 16 Dec 2024 15:10:24 +0100 (CET)
Message-ID: <016f8f1a-e408-43d7-9a76-1a025ba159e8@collabora.com>
Date: Mon, 16 Dec 2024 15:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: mediatek: mt2701-img: add missing dummy clk
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
 <d677486a5c563fe5c47aa995841adc2aaa183b8a.1734300668.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <d677486a5c563fe5c47aa995841adc2aaa183b8a.1734300668.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_061028_038260_05F3DB5D 
X-CRM114-Status: UNSURE (   6.48  )
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
> Add dummy clk for index 0 which was missed during the conversion to
> mtk_clk_simple_probe().
> 
> Fixes: 973d1607d936 ("clk: mediatek: mt2701: use mtk_clk_simple_probe to simplify driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


