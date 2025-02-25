Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06465C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYOkXGwlxEZMhLPV+HzMEEydZqSJTj0uAwMpbJqEqU0=; b=EXrrdWF9umq/zz/YUhsfdG7AjZ
	Bx9e/TuCwC8mLAIGPUkxfjuLMkEsI1troeMf2LZL1YTTiYvdETq3y9QyglYGRjM6YRCjT7CwIHsPh
	XVh1zJ/nDeeoKrSYaCNO8GMEtyRFUMnn9r/JXEfi1XsFnolJea44eGfqlGSJvR+jFeEzE5ronCWF+
	BFi2jb2uhB6PAc0osoI6heam9akyOl6vrIcg9EJuhkFA79LPBfO/3athxUUH7ORCT98GL02tY1QaD
	MBHcEBxKAy+3ClnWmNYorwmjuS3ondlx7bS1ASyPCxLAoCPzm6y94kuwe1NaD1ZqtVD7PZb6F7z3J
	2mVf4BFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0P-00000000KeI-3wRn;
	Tue, 25 Feb 2025 16:42:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw8H-0000000HZ0O-0Bnk;
	Tue, 25 Feb 2025 14:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494519;
	bh=gcaPxx33gCvP/niJ4vOPIJNgvIWqs9IFDJHcrkQd1pw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RW2DRtOdTVCrz6ss+KWXSej8BuwzJTpnr1kKFUJg531mER4IkAC+rN5natOMumAJI
	 wszSuut2qmdtZl5ACJI5EKhL2EzFPOS4bA3MOEXlSI3TJkjCO/RPQFGsvtBfGeBwYa
	 e2qGLe0JFvGavlL27lHsUNLS4Tpv/OZEu493hJ0YezJ5Vyn6dA5e6HvGJHCI3EXKk9
	 HEQVa6dYGRFSqpdZaAVc4FSa6Ukf45YuWxUF7RSLbGUYY+e+/DgU+We3CQwKvv0woO
	 LV2LiL0fZxb5C0SxlbgIKakauIOpAlwHxqBWys+5S3kVA4JQpwzwONLNWOFsjTnJUS
	 ezH5rF09l+npw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D81BA17E0DD7;
	Tue, 25 Feb 2025 15:41:58 +0100 (CET)
Message-ID: <21647057-8b08-4111-956c-4719d8002b0c@collabora.com>
Date: Tue, 25 Feb 2025 15:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] ASoC: mediatek: mt8188: Add reference for dmic
 clocks
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
 <20250225-genio700-dmic-v2-2-3076f5b50ef7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250225-genio700-dmic-v2-2-3076f5b50ef7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_064201_227154_7540788C 
X-CRM114-Status: UNSURE (   7.35  )
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

Il 25/02/25 15:33, Nícolas F. R. A. Prado ha scritto:
> Add the names for the dmic clocks, aud_afe_dmic* and aud_dmic_hires*, so
> they can be acquired and enabled by the platform driver.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


