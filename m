Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB06C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjH4VeNhhFrelX2UAaZkMRjoQ+epfOIN+o7V75djCvw=; b=C83GnMcWJu43HvVjux/gK+ghQZ
	uY4igTZctpzW+Kk9ry7h76iaWgPDin84O7Xu6dC38I45eZDs1MiPDfMIWdKBsLfMrrveTvvXjIwyg
	yXVkBpJb+UYvOtcZ+6VQP/R3qGxZB5cbtohwhY55gWXOChLXnJPLqyuWbKOl8ABrjm3bTXkLiBRLR
	4MmsXZCtMeOyLyhOy2XJsK8hbyAYgiGbISa7wjDGApfcv4Z9eXJS4kZwtfaL1U+RkET7io0vkf9TH
	sgxprLHiPBdVg+zqgOxxyxv5Y6Jmws5Rapa13MaYl32+nFaaP2hvvc40u055IThs8E5i9B18ty6ET
	AeV5dCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVTq-00000005V4N-1L60;
	Tue, 04 Mar 2025 16:50:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUMn-00000005Feq-1Iec;
	Tue, 04 Mar 2025 15:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741102772;
	bh=XNKd2v8uqp65o4eYPqd9/AkIaqBZJDW9VbNhjyKEd4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bwh7dnkLm7MO6OafSvzsFiVy1bkg1q11osdsYvIx/R2c9QisLMpNjeKJQz3c1CMh+
	 LQxOqkVARMetyl/yi3R3jzABP47rrqw7R590i+0v0z6iQJHxEAvHmszfrCtc9c0Z1e
	 JzRPZbHdr1OUMI7u2CRovmjg4sQ+BoEIEs8fIzW1JLyFw3jXG4LmMz3qjDkV4GK+Rf
	 RyoffepXt8+VvCyNiT273FV79ZzVgebr6yt9sgvMoeQ4iXPc0A75BRF7xBhZdFf4iI
	 fU0IsjE+yHleu7G2j/PmRDWwK5PbSyuv2BRpq4FQMvxJzQDYv4BBDxtmvRpqXyMs06
	 spG755+hprhBg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 189FE17E086B;
	Tue,  4 Mar 2025 16:39:31 +0100 (CET)
Message-ID: <a955f2cc-16a8-48dd-958f-2f2f2a3cc58e@collabora.com>
Date: Tue, 4 Mar 2025 16:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: mediatek: common: Handle mediatek,accdet
 property
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
 <20250214-mt8188-accdet-v1-2-6bbd5483855b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250214-mt8188-accdet-v1-2-6bbd5483855b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_073933_490607_EC969AEF 
X-CRM114-Status: UNSURE (   8.89  )
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

Il 14/02/25 16:14, Nícolas F. R. A. Prado ha scritto:
> Handle the optional mediatek,accdet property. When present, retrieve the
> sound component from its phandle, so the machine sound driver can use it
> to register the audio jack and initialize the MT6359 ACCDET for jack
> detection.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



