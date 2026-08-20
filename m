Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9272C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PL0+TkBEAw/ljLIv0zv8/yDD3v/lKZn/hBCUcu+4UtU=; b=e8EFizxsn1Mcozad4lqbjCBdRc
	zwQGXbROaYkj7YOUW9PTku7Sv9lcoCq6/WlL3lnxs4XKRxkaJ4SfG2hw48ZFz5c26BmMNgSGfMvlb
	qq9dIbdFLMpiJWcuhCpMwB7t9DHcVsZ1Zn1bwCX4S9TPua6zCIH0XtuJhyimDD/rSfV1KULLrSZTa
	Yu34nVcHI2fkMr/HVDtDtRzssSYYSfnMt9nZnEp0raHwYjrdRkv4U/V61hXRIQ99BZfcRdlz6QoIg
	krmudthL2XCKwNP01i4hcvNANk79F2XzUg3E8bwNvml/Jn5UE4R+HrGHCjVRag7eI7y1sSNGtm6l7
	rohxk4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6n5-0000000Byrl-0FL3;
	Thu, 20 Aug 2026 17:42:59 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6n2-0000000Byr6-0iFK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:42:57 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hQrPP6QnwzMlGJ;
	Thu, 20 Aug 2026 19:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787247769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PL0+TkBEAw/ljLIv0zv8/yDD3v/lKZn/hBCUcu+4UtU=;
	b=vi+xYTZegipotKL2tNDLtKIfr4Q7NZSS5N0m7PDg/g8LrdQpp4i6KQfVK3X65QtNmBHIu7
	P/UGH7eS0JL4OYHymF9Lhp7YSbmWFcxzK/wfGtjMZ23pB6mka6/s8UeWaBkxFsgqBhkNdW
	shMZ5LHf2hOb8GoIJJ99oaQnNGYwd1cUwU9tI2GZyrFxuN3+MKwriStrZb+5IdPvZLfGnk
	N8FuBrs9NJqcHRld0M2/TbwNZk6+IKqjDjoqjjmWJsGNM1eOWlgDEKJSA/lswdK3t5F+DI
	mJDo/ZppsrTd+hWac4XKyeuydmpW00w22a+JK/Xdw07brYPWNDKTUAAsJxOEAA==
Message-ID: <ca696ae8-4d26-416a-aaae-1e54cacf9fb8@mailbox.org>
Date: Thu, 20 Aug 2026 19:42:45 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Document 10" Raspberry
 Pi Touch Display 2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>
 <20260817-whimsical-fictional-dove-89b3d6@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260817-whimsical-fictional-dove-89b3d6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ayciih47b1nm1gj34y6j84hzzwq7ik4p
X-MBO-RS-ID: 5080b6edc4b6540025f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_104256_383165_7625AA64 
X-CRM114-Status: UNSURE (   8.95  )
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

On 8/17/26 9:42 AM, Krzysztof Kozlowski wrote:

>> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili79600a.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Ilitek ILI79600A based MIPI-DSI panels
>> +
>> +maintainers:
>> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
>> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - raspberrypi,dsi-10inch
>> +      - const: ilitek,ili79600a
> 
> Binding looks exactly like boe,tv101wum-nl6, so either properties are
> copy-pasted without checking in datasheet

There is no publicly available datasheet, but ...

>  or this does not need new
> binding file.

... Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml 
could be extended instead, so that is what I will do now. The devices 
are compatible.

