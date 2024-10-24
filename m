Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFDFCE8E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nsKQ0vBO3a8ldzVPWx+zyqI9NQ5yWQfjiyulFQipYQ=; b=qTznCuYYZD5MAlfK5lN3AGOA2c
	/EH7IUmCxxccVRWdC+14ffUCxoSHgyi5V+DpyOL5h8ES+fePbE4lAJ/nJi4/r5+fh6USdcxuNWcpE
	0CW3naUS0A9i1MaCWaRdDjiM7+w378+1zfSkbi77/oo2Q5SJScxZU4T6RR0hU8B+Th/OktF70qQGv
	bMRIsb2pFiw9i5wGq06BuR3d+YFHTgdDu64ruZ99trQSL09q3bJFCLusof8feGTF0S0I0u3LE0rTE
	T6CSaetnjkAeaIypKyfeGEXwke2Gd7eWRKws4uzCHQw868jmR4DojSpYX4AgN755jPXCiDpBqDZzy
	CT6LSKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wzX-00000000LIo-3hiv;
	Thu, 24 Oct 2024 12:31:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vi2-00000000AeA-1uAf;
	Thu, 24 Oct 2024 11:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729768133;
	bh=MnKSyhEsyEdO5LA9IJjUNtWEaFpz4mZqpHKbzfWsJ1I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h4v8fwlnqIlVmTuT7OQfJPxDVKa/3JPBK3JfgdaYs3MZCS/G3QecI/lZYEq9/wIba
	 qTjmlX1IkxoCd4p4Sw0bBy9VxyIJCt5RBvVntUrx4Iq8RQTIAyiN6z/mGYcEJornZ8
	 0K3dWHQW7LbOU1aYtboaYQWZ17CvzupuZ75/P6sjP8yEtAhssTN3MowRIarmhTByyi
	 bzMlHzhmE7LAlWDxW/Hvl2lOT89lMqTJA0hPEP/d5Z9jNIvqzzUtD3PleUAuo2xMYF
	 /s0MMvQugu6AJ65TaCbpk9yRIKU3V+RnM2SKPDJjoXmrr/8UmHBrPjbRlj7qtDrog5
	 43gfwNGTELK2Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 904DA17E1541;
	Thu, 24 Oct 2024 13:08:52 +0200 (CEST)
Message-ID: <c2ed4f4b-3f02-4de0-820c-04640cd2cfc4@collabora.com>
Date: Thu, 24 Oct 2024 13:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: mediatek: Add apu-mailbox
 document
To: "Karl.Li" <karl.li@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chungying Lu <chungying.lu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241024092608.431581-1-karl.li@mediatek.com>
 <20241024092608.431581-2-karl.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241024092608.431581-2-karl.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_040854_677910_0425E394 
X-CRM114-Status: GOOD (  15.77  )
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

Il 24/10/24 11:25, Karl.Li ha scritto:
> From: Karl Li <karl.li@mediatek.com>
> 
> Add apu-mailbox dt-binding document.
> 
> Signed-off-by: Karl Li <karl.li@mediatek.com>
> ---
>   .../mailbox/mediatek,apu-mailbox.yaml         | 55 +++++++++++++++++++
>   1 file changed, 55 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
> new file mode 100644
> index 000000000000..cb4530799bef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,apu-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek APU mailbox
> +
> +maintainers:
> +  - Karl Li <Karl.Li@mediatek.com>
> +
> +description:
> +  The MediaTek APU-Mailbox facilitates communication with the
> +  APU microcontroller. Within the MediaTek APU subsystem, a
> +  message passing mechanism is built on top of the mailbox system.
> +  The mailbox only has limited space for each message. The firmware
> +  expects the message header from the mailbox, while the message body
> +  is passed through some fixed shared memory.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8188-apu-mailbox
> +      - mediatek,mt8196-apu-mailbox

In addition to Krzysztof's review......

oneOf:
   - const: mediatek,mt8188-apu-mailbox
   - items:
     - enum:
         - mediatek,mt8195-apu-mailbox
         - mediatek,mt8196-apu-mailbox
     - const: mediatek,mt8188-apu-mailbox

should be like that - I haven't checked if this gives any warnings, but anyway
you got the point, I think.

Regards,
Angelo

