Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0681EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kFHK6z+bpULeMhGwjcx+ba0mINBF+orggGX0e7FfZ8=; b=bOSDhbSY59UEhohu7H2HwOgq6A
	UtcA48DzhO450lWQ43opRQmP7qYJfR8SoaIM4mF7yaVEhJfGuYSAMIKApeiVNEPG67Jx36c53teX6
	XV0I8DQyOVQD7/7FTB7R6YyBekTF9kpaZGQuOagzrPrEQYR8kerGILXpE+0Oa9yWy7ddk8ayu2vgD
	UTZtTaV0FhtgEPyaQCLogrtg0HNgmjfRqK4XGLXsYroHMfqSllYV2GbXS3/9sg/XyGG3tpey4J4LM
	sTxbS/qhFhBrplcuSZ7ug5zCuCPVMTeWxGDUHRPgELzhmv9OT7I2MwI+AVlYqOeWOfRcjI96ttn5H
	wImLVfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKzV-00000005L9v-3Ifx;
	Mon, 13 Jan 2025 14:00:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKxx-00000005Kyl-3QnL;
	Mon, 13 Jan 2025 13:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736776731;
	bh=Fxot0/yllsfFV5MpcU+4oD888BMjMbr6+B9CyzdSk2A=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=dGb0uA4y3MK0iODtk5hcPqliinJfUVu12AvzbkKAuD8ezo4OmZyvS7IqIolui1RMS
	 fHnjAGS1j66g3CZbVWjyVxp1QVMlb+ZsFnQGBdKql1h6Z9IJVcHciM8fwUQm1GikTs
	 r+upWgRknwrFxnxkrjvsybcMpVV17TJs4oBAR330FbfX3hZefckL0goxO/nJNV0u0t
	 2BHDmKYRr1Y87xF9ohjzRcuhH/0AZU6kCVfqU5u0jzDHi14GEV1IzcQjx2Fcv4ESTs
	 jGQg6mJ2XTwxzklEDB8arc/sIy5aDexGFU7rypzRxKmf61eSpHaVt/O73ylf+98xlI
	 oz1oKPUYaFQJg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E245117E0E64;
	Mon, 13 Jan 2025 14:58:50 +0100 (CET)
Message-ID: <fcf8ebde-46c9-406e-b4d9-933623a9786b@collabora.com>
Date: Mon, 13 Jan 2025 14:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <516d16e3-6fc6-49ba-a0ce-f451b65a6c1a@collabora.com>
 <fef6b198-d916-4b71-86ed-0cbdd55cb3c4@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <fef6b198-d916-4b71-86ed-0cbdd55cb3c4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_055854_003206_B3DFD2EA 
X-CRM114-Status: GOOD (  11.23  )
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

Il 13/01/25 14:05, Krzysztof Kozlowski ha scritto:
> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>>> argument.  Except simpler code this annotates within one line that given
>>> phandle has arguments, so grepping for code would be easier.
>>>
>>> There is also no real benefit in printing errors on missing syscon
>>> argument, because this is done just too late: runtime check on
>>> static/build-time data.  Dtschema and Devicetree bindings offer the
>>> static/build-time check for this already.
>>>
>>
>> I agree with this change but can you please rebase it over [1]?
>>
>> The same code got migrated to mtk_hdmi_common.c instead :-)
>>
>> [1]:
>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
> My is 2-patch cleanup, your is 34 patch rework and new features with
> existing build reports, so rebase is not reasonable. It would make this
> 2-patch cleanup wait for many cycles.
> 
If adding the `#include <linux/bitfield.h>` line to a file would take
*many cycles*, that'd be a bit weird, wouldn't it? :-)

Regards,
Angelo

