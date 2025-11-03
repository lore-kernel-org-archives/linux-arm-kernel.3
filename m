Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC66FCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 23:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGOoQVbgieRnz1Zi5mOVVFrbv65LoxKpvQB6dD1eaXY=; b=lqV0ZHSOXc7YKIYQOG+2ljSPYw
	VJEbFtSGLM5hwKF4iOlLYBGkE/oB4rs+dVatc8FNc46y+O73gMETwJikgkLELoJwcP0Gkw56rV6we
	hWUQsJU4ben9D+0alNgaq9LGIvuDy14hkRN0DiNE/3Mc79gC7KRsX7b7fweCfjKjSVCLJy8P0bQac
	bnOJiHaL7SYoGQmjFIW+FBUK3Yx0rrOkvgWqB2bp6Ac/dUPm1CIYKDnQVZLdxLRrDI+MtmaUcvMCt
	TIlU4T4XJ4zlg+sqIUyytLDe/jk1DQBYuQCYcwj8JbTqpfZw1oNokcUiurZzMlsqRn4jWsfVLV8O0
	W7BL2i5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG3Yw-0000000Al6d-3IXz;
	Mon, 03 Nov 2025 23:02:10 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG3Yv-0000000Al5G-0TRq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 23:02:10 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d0nCb37bGz9t7g;
	Tue,  4 Nov 2025 00:02:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762210923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGOoQVbgieRnz1Zi5mOVVFrbv65LoxKpvQB6dD1eaXY=;
	b=qvHnG+0WoaKQXtbJL5klMm80HXdEMR/yCPMt4cDpFjncDrFomRHYZgqTOWtdD7HHpCPG/A
	roSpkjXwDoikrh/cB549dRiyhdsuYBL0EvA6eiRDcxAw0/t/2LuuNFHVgwxmwOCZ6zdb2f
	c/Alsbxs8Sp3gmkGjbKv/s5b2LqhtRVnRf/+QIZP8SPqg+IaSSWIRh5wMTXrv2eFx64o9S
	de/cea7BYkx4eMELzz2g3aZbOHG1Z+OUS3ZRPJ13GLRaeHbmXrrty7aqQb/nSsx3XSc45b
	/PyTYk+niHl4yCs1eAhhJ4LvJk1p+OUgwx1mtyL+gR4lmEwP7sUDysBZ83XAnA==
Message-ID: <e1496b5f-2908-4398-8051-a136115c4a36@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762210921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGOoQVbgieRnz1Zi5mOVVFrbv65LoxKpvQB6dD1eaXY=;
	b=LG78fYJr85oLkt9Fyat0uzYqmNEbJtj/hmm8V3dsMQcplkLqfaHWqTvxtaoyAnvOvvRSfB
	ylc34n9DwlnwxKaJzfcG0be92Xyg1f9h5uB1GzQulEl4pjrE+7XVLv46sGexgMz6js5X9m
	vZbqjRxRb/1tbzvnZ+RC8dvObJELXhGwdwz4BiObU7ZyAdRGCjA5jrYHCayw9dkXI2KQdM
	D+W/Lzn2PiX1a/yQLIVaWgwhrLkCmY7BTCRqjwAyyUGqYKdgRaWGQU7aqehaJ/LEqNqBoQ
	SyesOL4YL15jJqT5UK0oJDStiGqaF3b5rgtvoaPfG7k+o0z0/w+5u7npNp0/fg==
Date: Tue, 4 Nov 2025 00:01:54 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
 <176220510312.151857.16110569802113794225.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <176220510312.151857.16110569802113794225.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 67fa1408053679d5025
X-MBO-RS-META: 1p8m3picy9e98qxgrpbre48hu7k1nnmb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_150209_298243_CD1347D0 
X-CRM114-Status: GOOD (  11.26  )
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

On 11/3/25 10:25 PM, Rob Herring (Arm) wrote:
> 
> On Mon, 03 Nov 2025 21:07:35 +0100, Marek Vasut wrote:
>> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
>> present in Renesas R-Car R8A77965 M3-N SoC.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Frank Binns <frank.binns@imgtec.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Matt Coster <matt.coster@imgtec.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:107:1: [warning] too many blank lines (2 > 1) (empty-lines)
I suspect this is already fixed in a separate patch:

[PATCH] dt-bindings: gpu: img,powervr-rogue: Drop duplicate newline

