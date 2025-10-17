Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9C6CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKALYDlBuq3AApm7hJUER0vvZlNv/1hPEVn7ARgUxR4=; b=H3JQ5lFn/YKT5LTWEQLBDeIAzE
	c+mBdwxWgoQc4BHdD0/ZDbIRSiBtB9nvNMNFl9/R429fJ4p4+Qfa0QMrlx+NUwzek6CwQ9Us32aW1
	V0Yj3FgUYLi/Y8QG6egqfUpn7YDJtFqczy2tVLqAAFGoghNC9qLrwSK+9YVk9xD83PxYnelfeSRr+
	a0yvSf+ZHBV0wzZDxhfwnIAxy+mx3KosqECONTTdND6bmeoVDMIicF2y4koqxUqxKhZlLwc7M/CG+
	0RovskbEFMc4lHdAoxm9pBgzBlXu409+56WnZMpa2YKTuZ82A5GFt2wpuYWYSO3ExFSnN2jGioP9D
	FTlspX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfG-00000008Uq4-0Bhc;
	Fri, 17 Oct 2025 16:50:50 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfD-00000008UpK-19gJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:50:48 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cp9mz25xwz9tJG;
	Fri, 17 Oct 2025 18:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KKALYDlBuq3AApm7hJUER0vvZlNv/1hPEVn7ARgUxR4=;
	b=eyYDDBzaOLfNdca2I7KQdT7e1NK2NXZIZWRlguf6SJej6B3274WlX3ZqqSl9TQ9NfnXzZk
	Pb7rR3iY1xOHKd1YsBZPleTaH7i5VwHRX/hwXHoygO2Uw13PIaOmiWcP3NzaZZqFsCoJNR
	7CzPI/jIEEBOM6EJW3QfRZb+x4pWNlqXpzzZNVPlrmRBGAdr8NZJ7KLL3hAcoBFbcu+cZC
	zcTMsaRupUE4lrEZwZPSfG6id4vATlg/djF3w76VmcjMCA7efgt5IfGwOF0V8rjF/zyVfV
	YBpveuObA970laZ4iSSs7vCrqQHj93OZNBsIRS1wsm0BquPOrUCiX8tf6oLZJQ==
Message-ID: <96850d24-8b38-4437-bbde-2b4aede3fdae@mailbox.org>
Date: Fri, 17 Oct 2025 16:55:25 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 25/39] dt-bindings: display: bridge: Document NXP i.MX95
 pixel interleaver support
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-26-marek.vasut@mailbox.org>
 <aO1LkIAfErQhQ58j@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1LkIAfErQhQ58j@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 63emeuje8d1fpppi7rferinsd6qqt4yc
X-MBO-RS-ID: 7c53f1497155dd64e06
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_095047_459877_08332635 
X-CRM114-Status: UNSURE (   5.93  )
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

On 10/13/25 8:57 PM, Frank Li wrote:

Hello Frank,

>> +  fsl,syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      A phandle which points to Control and Status Registers (CSR) module.
> 
> Need justify why not standard interface such as clock, phy, reset ...

Because this is neither clock, nor reset nor anything else. This is 
really only a remote register which controls the pixel interleaving. 
Therefore, syscon.

>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
> 
> video-interfaces.yaml?
No, because none of the properties in video-interfaces.yaml are 
applicable to this port as far as I can tell.

The rest is fixed, thanks !

