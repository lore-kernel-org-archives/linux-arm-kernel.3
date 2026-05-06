Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA511CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TecedyvfUTmniLY/k2eJr9v3Als6x/0r+xUVafUjSnU=; b=Urq+gWjs1SsA8J5ZxYtm96heqw
	IGJSlc06mcOnQT1dTi8dUWa8nVLZ3SbQ6BeDnib8lvwMqEr0Y8TwvaQqhjAUuVXNS1H1BmvlB5Mhl
	8mY39FVgSi7JddcDPjlizhY7bgoPGQhSKy+zm38Fk6OepTG6x3bB0DKhTimlFr5fWiPqk8Hv6tLms
	iSHYYvkJBDxY2lbdLOTitvf6pAWQt0DB1B8rtM5lC+K2fOeFFGBPnb3OBXF6oQij/ZyJ6UjoSQ18H
	PoQAl2OQTBuJnQDEOmHY+qEHBjsmata7j0qkqmx0CEx7R6hLiTGMXpkij3X/jXMku75ed/5GQouTP
	hhIA1j9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdO8-000000017NS-1Beh;
	Wed, 06 May 2026 14:38:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdO6-000000017NJ-3hsr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 581AA60103;
	Wed,  6 May 2026 14:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CD9C2BCB0;
	Wed,  6 May 2026 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778078290;
	bh=ckTxYuVYS5Rz3zH0pIi1LUW90v3+Olkd4kOfbm6F23M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fGKVYOL2jktUhU0keJPgg7vbstw5G5EoV2Vi9772iwM1OIjJPOmBSC37RxCBi5IyD
	 5WyEyPfgEvkRX0v1ljxS0XvlmsxjBjjwkAYFn9Lo42auROoMkIZpX5WQr465lAAHk8
	 8I+bYyOCfOXby31r1+OvZpN54aYsCBuB7bghbwWrz1LZP8ax+70WTF9exhvO794a29
	 kDYq/UiOKbjwxNaDUFtkNZQEKyY7p9RHqPH0gGv8yVCsvxCNCj/8+CzFCta8ExzFWP
	 707jFuJzF0JVnLS/0CN1TTC1tNoOYh0tjqTprHXni55axwfKltzp4BFeqAehKVyg9U
	 tHHBmID+sZ7XQ==
Message-ID: <6f12536b-59fc-4598-b174-460a32aa275a@kernel.org>
Date: Wed, 6 May 2026 16:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example
 endpoint label typo
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Robby Cai <robby.cai@nxp.com>, Frank.Li@nxp.com, martink@posteo.de,
 rmfrfs@gmail.com, kernel@puri.sm, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, martin.kepplinger@puri.sm,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260506090124.2960477-1-robby.cai@nxp.com>
 <5ad1e2df-85f3-4f9a-ab9d-b6ae34eebed3@kernel.org>
 <20260506142155.GR1598374@killaraus.ideasonboard.com>
 <73111cb1-2019-4faf-abc6-c7deea603eb1@kernel.org>
 <20260506143036.GS1598374@killaraus.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260506143036.GS1598374@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 06/05/2026 16:30, Laurent Pinchart wrote:
> On Wed, May 06, 2026 at 04:24:35PM +0200, Krzysztof Kozlowski wrote:
>> On 06/05/2026 16:21, Laurent Pinchart wrote:
>>> On Wed, May 06, 2026 at 03:33:57PM +0200, Krzysztof Kozlowski wrote:
>>>> On 06/05/2026 11:01, Robby Cai wrote:
>>>>> The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out} endpoint
>>>>> labels, which is confusing for an i.MX8MQ binding. Rename the labels to
>>>>> imx8mq_mipi_csi_{in,out} for consistency.
>>>>>
>>>>> Fixes: 37255747ecbd ("media: dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller")
>>>>
>>>> Nothing to fix here. Otherwise explain the bug.
>>>>
>>>>> Signed-off-by: Robby Cai <robby.cai@nxp.com>
>>>>> ---
>>>>>  .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
>>>>> index 4fcfc4fd3565..71f79651dd96 100644
>>>>> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
>>>>> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
>>>>> @@ -220,7 +220,7 @@ examples:
>>>>>              port@0 {
>>>>>                  reg = <0>;
>>>>>  
>>>>> -                imx8mm_mipi_csi_in: endpoint {
>>>>> +                imx8mq_mipi_csi_in: endpoint {
>>>>
>>>> Drop the labels instead - they are not used.
>>>
>>> I think the label has value, it improves readability of the example by
>>> making the purpose of the endpoints more explicit. I won't fight for it
>>> though, I know it's hard to change your mind.
>>
>> Then should not have imx8mq in the first place. The only information
>> coming here is that it is input endpoint. IMO it is close to obvious
>> from the opposite of "remote-endpoint = <&imx477_out>;" (if remote is
>> OUT, then this must be IN). But keeping the redundant data or actually
>> correcting wrong redundant data into correct redundant data, is still
>> undesirable. Such patterns then keep spreading to new code.
> 
> Dropping the imx8mm_ prefix instead of renaming it is a good idea,
> thanks for proposing it. As for the Fixes: tag, I don't see a need to
> backport this, so I'd leave it out too.

Fixes is not only for backporting but indicating that there was a bug,
being fixed here. For example for stats. There was no bug, because DTS
example absolutely does not matter - it's example code - therefore
redundant incorrect information in label matters even less.

Best regards,
Krzysztof

