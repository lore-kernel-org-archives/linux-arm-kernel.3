Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BADC3ABA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hiI5QIZrrN15o0DUeYwvOScFEJsnyCdfLzYl+6Zgjs=; b=XbDsm78ad8LKWdi9oSwKzFldFt
	h+QH376jK2UTr7pTK0hRHgsKUhl17gLeEEDsXIxG4YHeYQr1ZDWcHxxXBeODU5oF9UMgsm6TQx0c4
	FbSWWiUTM59Wz//JR0XmaaxRGBRvEOmIr0NK5X5zY3z0jNclqykigSLISVbFGk7djFvw1sq8php3H
	myPHyjoeSRHSo1btgsWmCxqndN2GJzfnE0GRhMhv4X/bzXXiUdoEvaw53Ng+UGMS15Np4mm6OEnKC
	Ovo5Yoja5df4Zo43VEfem5NDMBpRWtH8BOCQ8admBn8hJ7h9UZPwmbgqA+AkEmsrr37Yxj1icGDUn
	wyEK5RmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8U-000000085Zw-0gzB;
	Tue, 22 Apr 2025 18:14:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E7m-00000007OT0-1ssz;
	Tue, 22 Apr 2025 13:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330241;
	bh=sRX4HfUJdU7lcgcSh/8xeDqOhZ8/zUxPhEsiu2cBQm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cky0Yhy2DIsuOtweyefTTMgSOzhbcOp9Z9JmboN5FQUCMjy2TZiKWIef9tcVIA1+T
	 /QoI4yEmASecn0JZsXuNEyvrGpBGDgbcqs5ihc+o69m9mR0EpeKG+8z1QCwpnagTAi
	 aEmARG91n8nfF9/tRas5SbBIntzpOYyPyLcBIrwoQL/Y98tBUc7kJTu1r+/v5AyLzE
	 mh27OR0WwbIFaKyWGQ0skmcB3uRWeVz2VBm5R3elvjzuLnZannrN8OsmCBdMQDtIdU
	 +lKkwKysIPevQxr4gR0AHW7A+7jwe5XENMV4lLCS8DAvsArn+k2HppHdFPWLbVzw39
	 GkM1VNXkHNf4Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C5F317E362C;
	Tue, 22 Apr 2025 15:57:20 +0200 (CEST)
Message-ID: <c0df9d60-5cda-4e7d-81fa-6f385bea7cd7@collabora.com>
Date: Tue, 22 Apr 2025 15:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 eKTH8D18
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065722_633441_BCF090DD 
X-CRM114-Status: GOOD (  12.25  )
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

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
> 
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
> 
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



