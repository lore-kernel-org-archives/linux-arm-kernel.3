Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EB5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 13:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bI8pLujwINb2xEn9T5kFhu/KxJQ/eT0deywxw8O6Vgw=; b=H+uuZxN/vxfsaCBOvsg81L5ODg
	gHs1NIvdO/6IbW4ExcgL61SDSJYUXw2OyAWK8SacQHeThna8kFBgZ1dS2dbrtYInyEKPdp1sTOK0s
	jTqcd11l4/wirCiLxWw0oEfOiz1I3e6si7QhgAmkhNEKDOKynoBgwUe/Wcljy4yfmoiCLo921ItbF
	TtJsGihNNQ6qU0ebdwCLbotpCbXrLSnSaAC/B4ffE1NgAyV+52gjX9qmOXHJ3YiQe5i3TVoAeMlA7
	HbG/CuXK9WMGGgbD+KsQ5i9ew72FdcWY57isJJnADpgcD4raRtKx8n1w9LRzCtfm6kz6MaA8Go2XK
	366/sC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNc5-00000008JM7-1zv3;
	Tue, 18 Feb 2025 13:26:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNYS-00000008Ihq-28SC;
	Tue, 18 Feb 2025 13:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739884947;
	bh=ZDfqbmocK+423Jahwe7zgbMnj1LWV19yQk0w9+HSXIk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=abA8pKcguLXGqpD8h2qV0xFL5ZHPK3oa0OpuBiAN60c5jK7mDFobcGInl23OnZ0TX
	 bro4OW8UmLxEovUcqpsoeART8iEfUp5lLDe9rZrXGOz0fhPWyVDFoh506x0SIcBtMc
	 vrVQ3/4b5VDXniuBluN/mt1BvKR65Ow+sTpa/fxe2aVG/q/F7p6P8uTmEq77MEF+IF
	 h0eX5pBjALlYhUtp7PHhNfwo/OK2Sh/DG1N7CX5o5Uort0b06Kaf0NwDv06okPIR9C
	 OzubKP1dIXeMcBR5KOCYfZt0ffLMjpwvi2fLo251wpAEUzPqZNJ+Q3y0vAAYy3BdOg
	 t/+vbzQ8mXfRQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 176C317E0657;
	Tue, 18 Feb 2025 14:22:26 +0100 (CET)
Message-ID: <906ed1df-3c63-4028-ae7d-97e086acca32@collabora.com>
Date: Tue, 18 Feb 2025 14:22:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek,mt8188: Add
 VDO1_DPI1_HDMI clock
To: Conor Dooley <conor@kernel.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, u.kleine-koenig@baylibre.com,
 amergnat@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, macpaul.lin@mediatek.com, pablo.sun@mediatek.com
References: <20250212100342.33618-1-angelogioacchino.delregno@collabora.com>
 <20250212-arming-gyration-103e42b94ed6@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250212-arming-gyration-103e42b94ed6@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_052228_695546_110D2F80 
X-CRM114-Status: GOOD (  15.46  )
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

Il 12/02/25 20:17, Conor Dooley ha scritto:
> On Wed, Feb 12, 2025 at 11:03:41AM +0100, AngeloGioacchino Del Regno wrote:
>> Add binding for the HDMI TX clock found in the VDO1 controller.
>> While at it, also remove the unused CLK_VDO1_NR_CLK.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   include/dt-bindings/clock/mediatek,mt8188-clk.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/dt-bindings/clock/mediatek,mt8188-clk.h b/include/dt-bindings/clock/mediatek,mt8188-clk.h
>> index bd5cd100b796..0e87f61c90f4 100644
>> --- a/include/dt-bindings/clock/mediatek,mt8188-clk.h
>> +++ b/include/dt-bindings/clock/mediatek,mt8188-clk.h
>> @@ -721,6 +721,6 @@
>>   #define CLK_VDO1_DPINTF				58
>>   #define CLK_VDO1_DISP_MONITOR_DPINTF		59
>>   #define CLK_VDO1_26M_SLOW			60
>> -#define CLK_VDO1_NR_CLK				61
>> +#define CLK_VDO1_DPI1_HDMI			61
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> btw, I see the mt8195 has this same CLK_VDO1_NR_CLK define in it, if you
> fancy getting rid of that too.

Thanks Conor, yeah I'll do that asap... one commit for each NR_CLK is a bit
too much... I should just clean them all up :-)

That requires a bit of work though, so it's not something that I can do in
a few minutes; let's see if I can make it for this cycle, but no promises.

Cheers,
Angelo

