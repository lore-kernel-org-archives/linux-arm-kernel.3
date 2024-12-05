Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D58E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpUj2RpMCEH2fe+vWRY7L5prUOmWT7X7VzxvrSpVudA=; b=WapCrthebB53fXinL2tuchHeX5
	zWzsTOZmCdantz6iBv4bt6cAjrB+YQi8GNM6a/t7pnu4cSvRCxjM82baT/Vc9cokDxuB+HQiQPcBL
	UIDAzU5dsSM+Gr/j2eLgYixbX4tohGQKFC771NgsjjkGHgzto5Go3w7uDfWJBI5HZieTVPIIEszfa
	R85zZ0LI4ZgeKmmMUPo81PigriWvMAclcK5UhDqpit52tOrGKuLBDjSr5IaBQw8LzfYM596YcqY3s
	msHqEziuqLfRnBtmmpJQCMRCEV2cuT3c0Yt5SV7ZNhDxRI+KGgyuCCP89qGwfnHa+yQ+nkTy6IVWP
	wLKbbnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBGP-0000000G0x9-0EA7;
	Thu, 05 Dec 2024 12:47:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBD8-0000000G08P-0W2v;
	Thu, 05 Dec 2024 12:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733402640;
	bh=4yG90mzCMTRJtqSIZIR4ro8J6ULc6OoY5vicTfwZNck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JC7DJuZayYQk5WzBa7maDyO+HbiB042fPe9CFFxXJAWuwuZYH46w9Dih6rKt0esj9
	 Ua0S482ICB7DcU/ti+gjyhYlbhRoFTH31ZuynUoapBZA5kfILJOGQvtZCC2m3XuL4f
	 C+USkfwohlbzbvQNJvWfPzJS5cG5zCKSkq53T20ifbGXp7l/TcMM3sHT4hZcLdEgJf
	 +x6u7RvqBasD47D3sfB1PUSPSfhWeEKTdudboIEzvArHdn85H8HhyQIWpWb5bXrfO4
	 2QRiKeO8/ErLRZvczyFU050DgrUDdbY3B5dTI6C/XtOlMbsBck0lLm2Td2ukEcSylf
	 IqvWFPl1UknnA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ABEF417E3684;
	Thu,  5 Dec 2024 13:43:59 +0100 (CET)
Message-ID: <d95fcdb2-6519-4950-803b-20a60051cf3c@collabora.com>
Date: Thu, 5 Dec 2024 13:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic
 codec
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_044402_305921_526960B8 
X-CRM114-Status: GOOD (  10.65  )
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

Il 03/12/24 20:20, Nícolas F. R. A. Prado ha scritto:
> Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiring
> a dmic codec to be present for the driver to probe, as not every
> MT8188-based platform might need a dmic codec. The codec can be assigned
> to the dai link through the dai-link property in Devicetree on the
> platforms where it is needed.
> 
> No Devicetree currently relies on it so it is safe to remove without
> worrying about backward compatibility.
> 
> Fixes: 9f08dcbddeb3 ("ASoC: mediatek: mt8188-mt6359: support new board with nau88255")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



