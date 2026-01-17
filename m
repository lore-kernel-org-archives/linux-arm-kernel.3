Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61215C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 00:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKRa8QawqDzIvt7NlwnnBTWgzNog8p4CKpjNhH/1PZU=; b=NP8Tzw7hLiP604RpBcv1jEBM0D
	4S1VbR+oV+8GVO5IBG2nLcPKZTjal/yJib3IRyz8oiO2knBB3WfD0M30CK9bRYjVuMOkFUQE++a4Z
	ZixHFI04sp7Tts/3t5ZLWe/PraO3RyV7YSI4kn6C0HBTTRBwlKS3k0wCnGHjH6lDUTyV2QYXme23Q
	2xJvYt/i34A2sKjqKdjHj++aS4JdbibQm6ou4khm8ywWMoAnEZ2kzzOvJad3LyLZdBlkLsxMcez5j
	HCDwgSIhnvObPjJGHV/37Ij4lmMbTQ9vllM4Tb2LC8r4ywWfbXPntoSAlQEDJZse23apt8Kai+BOw
	A0dapQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtow-0000000F2Ii-324l;
	Sat, 17 Jan 2026 00:05:38 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtou-0000000F2IO-2uHF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 00:05:37 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dtH6d2WbNz9vC5;
	Sat, 17 Jan 2026 01:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768608329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKRa8QawqDzIvt7NlwnnBTWgzNog8p4CKpjNhH/1PZU=;
	b=SlseDU4bBi5Mixp/2CUPctSORnoqKjW7G6NTe8NUczv47/TLpZJ3wSLsb0RXNXdcvCe8ho
	W80dT5gSyPaLPdDCwH5/e1dUQ8LPZt8/epqox+nvOUXgzuGP5E/W8w9KOfS86dOgbDcM4M
	oCOl11muFj5GcQ+9rhQnVEbH69iboRxSKq7Z0ZJXHVdL2wSwBCxIvnVjNbLdkjcEmoxXpA
	ja5AaeZV4y9tXQQszI3jY270IVI6ijnsXBOwd4njHFSfShLrRb6o1WAvJrWUI/30YxsN+a
	iE327eJwfjgLsVG+qaGImQz+UqnwHApRCW1VPvWaxBkniPZPyE9E/ClljNBLFg==
Message-ID: <7d2554e2-bc69-48c3-89c7-deb701d8a12b@mailbox.org>
Date: Sat, 17 Jan 2026 01:05:24 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <20260115174047.GA930768-robh@kernel.org>
 <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
 <CAL_Jsq+ELqDhPHeSL=Hybaihmj3QbXt3VmrJ2tC8iXvdoVFNfQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAL_Jsq+ELqDhPHeSL=Hybaihmj3QbXt3VmrJ2tC8iXvdoVFNfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: edcd393bf97bbd689c1
X-MBO-RS-META: r6q7zznwwkxqqc151rrxyqkmbmiaaqgw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_160536_897139_13E89095 
X-CRM114-Status: GOOD (  16.34  )
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

On 1/16/26 4:26 AM, Rob Herring wrote:
> On Thu, Jan 15, 2026 at 1:20 PM Marek Vasut <marek.vasut@mailbox.org> wrote:
>>
>> On 1/15/26 6:40 PM, Rob Herring wrote:
>>> On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
>>>> Move the Waveshare panels description into separate document, so they
>>>> can be properly described with compatible = "waveshare,...", "panel-dpi"
>>>> and attached to "waveshare,dsi2dpi" bridge.
>>>
>>> But why do we need "panel-dpi"? Adding that requires changing a DT.
>>> Can't you make the kernel handle these compatible strings as a
>>> "panel-dpi" without the compatible?
>> I can, but wouldn't we then miss the more specific compatible strings in
>> the DT ?
>>
>> compatible = "waveshare,13.3inch-panel", "panel-dpi";
>>                ^^^^^^^^^^^^^^^^^^^^^^^^^^
>>                this ... would be removed. Do we want that ?
> 
> No, drop "panel-dpi". Or really, don't add it.
> 
>>
>> The other option would be to add the timings into panel-simple driver,
>> then we wouldn't have to change the bindings at all. Maybe that would be
>> preferable ?
> 
> Why can't the "panel-dpi" driver match to"waveshare,13.3inch-panel"?
It could, but then, if I am already patching that panel-simple driver, I 
can also simply include the timings in it, just like many other panels do.

