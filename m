Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A482CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psZjTHIopw9a6IFu+CQ4yK+10MJWL8m4+o/esLc7kPY=; b=dqv6bGNQngB2rFYI7DoP6kGuwN
	JPiTbL9FMjMPUOkIxVtl5QU5OS1E/7B3gmcYDeg8KWLYIpqDR6rqumdTHLwK4Zz6A5HdWKdPsnjOu
	E+anuFIqvWOqsVBrwtuvBlmF/MqWsgCN4/lsZCNkLIIQbNtuV0CZx5zXPjN5axUwTXL1Q/DLtWeTw
	1E1dRBXGdJs1VJWz+qOXrqUhmVkhQ4jduX/keA2au2qGjwZU3wm0JbjRJgnyaJxDEnT7HJbZrMuno
	qj24RDpPJPOCg/opqU62Gs6wBoqGA1lb1tbLCG8kbUSjkOgUuJuC8u68KWzkGE+p+kKEPiQsV9U/K
	Yr4DxEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNAn-0000000Cz09-3nJp;
	Mon, 11 May 2026 09:43:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNAl-0000000Cyy3-2kgL;
	Mon, 11 May 2026 09:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492613;
	bh=yRisWRad3Z1sTyLfN1Qf89CUE4mBX1+7idpxxzAXLV4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Dy6RZcvEQz+N2xg+8J96IKI3Wh86vGsWIfPyzwn5b4rOrZffCMdtFXQeZQBtckrTa
	 tMqQjX+peub31FChPsX9mCTyJg2q3uUPz0t5y0j6fAWrOLbDtJEOq4jemBhbeMnC0n
	 +fwfJg14f9jxBDd6/Kezslc/mOKjwL4Wq1lX5HpBkmXgY3s64IxWjXX83w4D0nuJSa
	 B7mEwl0oHPqECLWBf9YEinoWnMbxjwZAiLLLiGtjukdxCUvWSvqg2QgkIpAXQWPmCl
	 4FpqFyHlLfnxcHMQK5N9LJnuWP5hVLVHdfb3XtWhYL/agbdchSuGbFHXjbEN9+peqX
	 +u5Tf7GKORtJA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DCDF17E040C;
	Mon, 11 May 2026 11:43:32 +0200 (CEST)
Message-ID: <a17c683e-bf8e-4216-8459-66eb85329b17@collabora.com>
Date: Mon, 11 May 2026 11:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] ASoC: mediatek: mt2701: HDMI audio support
To: Daniel Golle <daniel@makrotopia.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cyril Chao <Cyril.Chao@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <cover.1776998727.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cover.1776998727.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_024335_881302_52DAE414 
X-CRM114-Status: GOOD (  11.07  )
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

On 4/24/26 04:48, Daniel Golle wrote:
> This series wires up on-chip HDMI audio on MT2701 and MT7623N, from the
> DRM bridge down through the AFE into a small machine driver that binds
> the AFE HDMI BE to the HDMI TX codec already exposed by the
> mediatek-drm-hdmi driver. Bindings, DT and a BananaPi R2 board node
> are included.
> 
> In order to survive vblank or late hotplug of the monitor, the fix
> submitted separately [1] is required as well.
> 
> Everything here was developed for and tested on a BananaPi R2
> (MT7623N), which turns ten years old this year -- a nice occasion to
> finally land HDMI audio for a SoC which was truly ahead of its time.
> 
> [1]: https://patchwork.kernel.org/project/linux-mediatek/patch/a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org/
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I'll pick the devicetree bits after the ASoC and bindings bits get picked.

Cheers,
Angelo




