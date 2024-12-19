Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4831E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opHuC7WJDnxN4K6s3O4Eo4IPi21mt85RpPoxCdIX410=; b=WIgnbTP4IiyR96KdSUgOacIuvs
	43D4Bx4suPriclj+hO2LGnjdWILOmP3/gQmhH8JRNVqpPSBaI+35XiQ3mj+enNI5ON4Hn6aaIg+PU
	+VMlTfMLb8omqOvSKSyNxo0Qk0wJnwTpWL0yb1ngU5PVdJGGrLmD6mcmXhcUAQiOywojMohNLk11g
	05SPAYfsZirT8Y5I8wL3eNEBl8LdyazeEPDKtdyxcrmGv8R9d93llcJk+NjkrJHk3yq+wq1ED/09k
	hBtWaNlWF4WeeB4na9H/UGX0DqvFYM8ZKF8xq9mxIrfcqR7S4TPvxIkAs1s/hAEeE12R9qPsNGlkA
	KSQW1+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFuK-00000001r66-11pC;
	Thu, 19 Dec 2024 12:45:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFqp-00000001qJR-2Uen;
	Thu, 19 Dec 2024 12:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734612118;
	bh=wDrACSxE67QlUQtertVzUZUXLm2imMYI+ZYK5RaLBLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l25unRnPqzQ9eRY7ufOjAlOAx6AwZm3jbmWEww1Eggzq9GhuwrNflP7v5zbC63r/l
	 x1oulzEAEYjvcxAbr0pJdwD5LXTjVWyeiGMbkdn6ziC4EbCfOXf8sjLVUbmXFmJpzV
	 INm68E014y8KxKsvdMfNMh6ZviK+A8x3USF7UGYTIe6twGOzXF8TLN6nMhf+ncnS0n
	 k896Sc0cwIReJEUCLVSU+FvLH0+hV28r5OZ1OWXXsgAd5/nbgPMwNmgsf5+vE0mwh5
	 qrkNvG+Zxg7BzaYn416dez0Vj5Zis+js3QB4dCxCdJXGSBMXjQ7TbfDSd2z09w4M0s
	 t/0BiSyPuv0Ow==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D54B17E36AF;
	Thu, 19 Dec 2024 13:41:57 +0100 (CET)
Message-ID: <e9fb2634-5b47-4f68-ad7c-26a4f52d0df8@collabora.com>
Date: Thu, 19 Dec 2024 13:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
To: Rob Herring <robh@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Frank Wunderlich
 <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241217085435.9586-1-linux@fw-web.de>
 <20241217085435.9586-4-linux@fw-web.de>
 <4ecfcdd3-3c81-4625-90cd-1d45f6d71a2f@collabora.com>
 <20241219123441.GA4016373-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241219123441.GA4016373-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_044159_780009_856EB038 
X-CRM114-Status: GOOD (  12.93  )
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

Il 19/12/24 13:34, Rob Herring ha scritto:
> On Thu, Dec 19, 2024 at 12:56:23PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 17/12/24 09:54, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> This adds bindings for MT7988 pinctrl driver.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> DT binding maintainers, can you please review this patch and eventually release
>> an Ack so that I can take it through the MediaTek tree along with the devicetree
>> changes?
> 
> It's been 2 days... If you want to know the status and where you are in
> the queue, you can check patchwork[1]. But guess what, you're #1.
> 
> Rob
> 
> [1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/


Rob, I was checking the patches to apply to the MTK trees and while in the
process I didn't notice that this one was sent that early.

Sending a ping after a short time wasn't intentional. Sorry for that.

Cheers,
Angelo



