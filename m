Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13453E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWD1yxKAEOa4BZVU3SmpaQ4GGqSesWK0yp4xtOLXWZw=; b=T90z9syoABNOySd/DlcVXjYeis
	Vy5Gt2x+61RNzuRjnjiI5wr235MmGO6vjTzDfgMR5F/npa+xrcUX0/tprRCTwRp3i7bNbrmQNDhu3
	/sAKhJnlnlJxJAnb40S+jO533GPWphC/AqjXdkJrtYpMISdEU57Iv34BpndMsYijundPmAk4TvGmX
	2HRoODtVTMGe1tu9rQjfbFYlqg4akEmM3WruaiY73X3jOxp7//PtH+6A6kevBQ6nztunaHWx0Rjiy
	9FAv0bMbSY78cn2oQ26midrQLjWom15inBQwcip/8YSb6B70z41IBS7nadeHSxd+QRL7JFREz0voA
	NEdCI1kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcAy-00000007XmN-1zTv;
	Mon, 09 Dec 2024 11:43:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKc9v-00000007XZM-2dlC;
	Mon, 09 Dec 2024 11:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733744557;
	bh=9b45M2aLM/tuKaAynX20c6dQe6KEzHWb4VICIeqr8Bw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=V3DMr3smHOeMunv2y7xC+3oTzjuI+VIzjqhvPPOA6Zz78bLi2mdaWKU2hCjAZVj2S
	 IuCAZq3uaIpN5yTsjLxrERj5xdCEKkrKZ5ZznMZ5tPpR1Dr6UZalDnnw2LgZTn7yTS
	 1f42MvE5kucasAv3FnDsllunBjPC9E/LMazbsKFseY8VEVOb8bWYfvbN18+4TmRsKG
	 PHMNyo/AZOFY++835mwVSb59VceodefJ0LcqU8HQEpSrDILAZt1o0q5QiOwLhS0me/
	 XWmypPVFPK8AxPRNs4NfyIOLeWDK2CzM5cMt3uaaeqfmUmCaNCabpWKHpz6lv/HWSF
	 cDSWAh6/x9Dag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D04317E0E88;
	Mon,  9 Dec 2024 12:42:37 +0100 (CET)
Message-ID: <92328329-e1f4-40e5-b0e6-946a7500a313@collabora.com>
Date: Mon, 9 Dec 2024 12:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: mediatek: mt8186: Add Starmie device
To: Wojciech Macek <wmacek@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Rafal Milecki <rafal@milecki.pl>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241129055720.3328681-1-wmacek@chromium.org>
 <20241129055720.3328681-3-wmacek@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241129055720.3328681-3-wmacek@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_034239_840540_9769FAFA 
X-CRM114-Status: UNSURE (   6.13  )
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

Il 29/11/24 06:57, Wojciech Macek ha scritto:
> Add support for Starmie Chromebooks.
> 
> Signed-off-by: Wojciech Macek <wmacek@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



