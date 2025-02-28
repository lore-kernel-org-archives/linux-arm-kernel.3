Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28106C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CdXt1sb9hF/qYyFIBouuUvILgc0/orYH3chQLK7vwg=; b=n26c8SuKBFJ7dmeiMQ6zIMbJBL
	xSW/UJQbMlXhfIszN2lOT0JOnBos7C0BlcyEh/U066stYCAKVYcqjNWGyjj1aeqnG3BgaiiRPJP7a
	inbDR5/ifxiSTv6cMkoSX0Jzr462ihjlsz2or4Nbq93AH9a3VcvQLkNHKdIxXyyIv6wi0biGC8qrn
	c9bOmV5C8pFjmk6MY0zbogOisocgIar3zFux0nATxLRdK7e+86AaCIxqRkbCcLoSTtsDUz8MO9osu
	3L7kCAokvwjpckCcnzVf1f/ATOQAIYpnztgYnOk0la9UWhdsE2ePJzqkEj3Y9vGypqFw2vh9/t4kk
	Ymw567yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5FK-0000000CBXN-0bp9;
	Fri, 28 Feb 2025 18:38:02 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to54p-0000000C8Fr-3KI6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:27:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7701102901CC;
	Fri, 28 Feb 2025 19:27:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9CdXt1sb9hF/qYyFIBouuUvILgc0/orYH3chQLK7vwg=;
	b=eyjUPMFJu4kjE7nYaUGe20Yi4pGLvofEGSGrl2a4zZ+qOpdwtlKK7OYWtHit0AQxK/HRqW
	ozBA5MxABrvrPpKBXm+/w+s0q/UK8o04Dw/AobKVUe02mD+QsLplvF1ZCLHpXNyaUaquyL
	SYIKM06o/qT+Y7e7dTZJjFYQjAmHKQA8ZisFc/LIlxKQrPqkZgMK+KAk6dFghkNmVTWZEa
	gwxChUGoL5Muj2rnO0cPohjYWeEc4l+vy6MwqnnRJb87FOTb+naAW52MZYqjv5ea99IkMG
	ir3tVFvuzA0EDKKuK/zM0G0Vjayrocw/hNCOGyGKJOSMm26UTbeZCCVQNuLLqw==
Message-ID: <39351f48-04be-4659-8b3b-9a4ef6030efd@denx.de>
Date: Fri, 28 Feb 2025 18:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/panthor: Implement support for multiple power
 domains
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-6-marex@denx.de> <2848587.BEx9A2HvPv@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2848587.BEx9A2HvPv@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_102711_992879_8784C712 
X-CRM114-Status: GOOD (  16.03  )
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

On 2/28/25 11:10 AM, Alexander Stein wrote:

Hi,

>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index 51ee9cae94504..4348b7e917b64 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -75,6 +75,58 @@ static int panthor_reset_init(struct panthor_device *ptdev)
>>   	return 0;
>>   }
>>   
>> +/* Generic power domain handling code, see drivers/gpu/drm/tiny/simpledrm.c */
>> +static void panthor_detach_genpd(void *res)
>> +{
>> +	struct panthor_device *ptdev = res;
>> +	int i;
>> +
>> +	if (ptdev->pwr_dom_count <= 1)
>> +		return;
>> +
>> +	for (i = ptdev->pwr_dom_count - 1; i >= 0; i--)
>> +		dev_pm_domain_detach(ptdev->pwr_dom_devs[i], true);
>> +}
>> +
>> +static int panthor_genpd_init(struct panthor_device *ptdev)
>> +{
>> +	struct device *dev = ptdev->base.dev;
>> +	int i, ret;
>> +
>> +	ptdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
>> +							  "#power-domain-cells");
>> +	/*
>> +	 * Single power-domain devices are handled by driver core nothing to do
>> +	 * here. The same for device nodes without "power-domains" property.
>> +	 */
>> +	if (ptdev->pwr_dom_count <= 1)
>> +		return 0;
>> +
>> +	if (ptdev->pwr_dom_count > ARRAY_SIZE(ptdev->pwr_dom_devs)) {
>> +		drm_warn(&ptdev->base, "Too many power domains (%d) for this device\n",
>> +			 ptdev->pwr_dom_count);
>> +		return -EINVAL;
>> +	}
>> +
>> +	for (i = 0; i < ptdev->pwr_dom_count; i++) {
>> +		ptdev->pwr_dom_devs[i] = dev_pm_domain_attach_by_id(dev, i);
>> +		if (!IS_ERR(ptdev->pwr_dom_devs[i]))
>> +			continue;
>> +
>> +		ret = PTR_ERR(ptdev->pwr_dom_devs[i]);
>> +		if (ret != -EPROBE_DEFER) {
>> +			drm_warn(&ptdev->base, "pm_domain_attach_by_id(%u) failed: %d\n", i, ret);
>> +			continue;
> 
> Is it a good idea to continue if a power-domain is missing? Any access might
> stuck completely. IMHO returning an error is more sensible.
> Also some dev_err_probe() should be added here.
Fixed both, thanks .

