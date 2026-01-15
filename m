Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A218D44C4F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnZ5PJc6Ut1/2tGt/CQMxopqWJdmZttT9y9QfBFdX7M=; b=WCaI5Cfx89VPDAh9eQh+8X1/a0
	HdQKN9D6jcNVJBFDV8v+kIjYGYOj5gfboRIQE+rRJ/nL8nnxTrFaEBRFVAluWZ8IZ8J/8bO+1uMQF
	wNR/niz6R1gpR3FAFq6BpG59HJhMKQqH0nDFfODbgisejt+hPOJK49fsl6S3UtcTmovu0m55wrty5
	2xk8t6rxgmXaO80Zaj2y1LN2IMPAywkP7l5pKfIJIFqClIDLnWTRqS9N9c9a5UtzLJJuzv/FsSeoi
	GeUqlffj4bAegg9ww9Iq4ANXDE1tn9lehXlChCUDqLh4QMNMcTzFOMooMOqfFFk7t5Y5sBHOQvbNp
	qlcXqNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNtV-0000000CRoD-25Ml;
	Thu, 15 Jan 2026 14:00:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNtJ-0000000CRn6-2qa3;
	Thu, 15 Jan 2026 14:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C208B6001A;
	Thu, 15 Jan 2026 14:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24BDC16AAE;
	Thu, 15 Jan 2026 13:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768485600;
	bh=OKBnnzXnv4roaOCQlDLWfODP62IZQc7buuvsINQqVPA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vBcN3NNR1lHLtbRSRDzfdWnk9KxjvbvUbAUGLCQnEUk/+5AQ/hr0Vlj1khcryohCJ
	 sbmsMwMF1Me5qzhV3ob5X+DAjCeVgK5smA1D9uqhqUmvtmEPeGh8pWBE3GE+0+QRhn
	 kPg6o2TrqCljqHbk0+nN6frQx/mz3xGMqoVM63TiQzGDcyJUPGYUcId0PMj6Y/SZLd
	 8utZqaMkWtIDv2176hg1uDV9HHVvtPZpgcyX4IHm/7gJfX/adpglSdnyZb9Qrc5BAQ
	 17bZcrl2/zIWoigVtmiknEPK6H2I8C+9hDp6EGCEPi4/W6/qAYr7E5lGpYUTryLN8N
	 TCcItHQYWo0Ww==
From: Pratyush Yadav <pratyush@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  tudor.ambarus@linaro.org,
  mwalle@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  vigneshr@ti.com,  lgirdwood@gmail.com,  broonie@kernel.org,
  matthias.bgg@gmail.com,  julien.massot@collabora.com,
  eugen.hristev@linaro.org,  jiaxin.yu@mediatek.com,
  shane.chien@mediatek.com,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  kernel@collabora.com
Subject: Re: [PATCH 1/4] dt-bindings: mtd: jedec,spi-nor: Add Winbond
 W25Q(32/64/128/256)JWM
In-Reply-To: <60bb622a-f88a-46ce-b835-bbefe47509bc@collabora.com>
	(AngeloGioacchino Del Regno's message of "Thu, 15 Jan 2026 14:55:41
	+0100")
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
	<20260115125624.73598-2-angelogioacchino.delregno@collabora.com>
	<2vxz5x93818a.fsf@kernel.org>
	<60bb622a-f88a-46ce-b835-bbefe47509bc@collabora.com>
Date: Thu, 15 Jan 2026 13:59:55 +0000
Message-ID: <2vxz1pjr7z8k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Jan 15 2026, AngeloGioacchino Del Regno wrote:

> Il 15/01/26 14:16, Pratyush Yadav ha scritto:
>> On Thu, Jan 15 2026, AngeloGioacchino Del Regno wrote:
>> 
>>> Add Winbond W25Q32JWM, W25Q64JWM, W25Q128JWM, W25Q256JWM to the
>>> allowed compatible strings pattern.
>>>
>>> This also resolves a dtbs_check warning happening on all of the
>>> MediaTek MT8192 Chromebooks devicetrees (for winbond,w25q64jwm).
>> We normally don't allow adding any more device-specific compatibles.
>> This list here is only for legacy DTS. You should be using
>> "jedec,spi-nor" in your device trees.
>> 
>
> Ah, okay, didn't know that.
>
> That's actually making things easier for me honestly as removing the
> model string is a 10 seconds change, so I'm totally happy with that.

Awesome! Thanks.

[...]

-- 
Regards,
Pratyush Yadav

