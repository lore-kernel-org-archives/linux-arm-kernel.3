Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AC2CCD1A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXd+1w5cvwDxWg/MvxbTe/pIUcBohLvdeQLeTekfpD0=; b=cb/ysO/vZMlEOYd+3sTQ8yp5g1
	3wskbjGnpCGHVTOX+JF9EGHTj8wVMykrWK2GTaMJbWHD+LAFiHTg6aDNnlPw3XgajzKv3bL+nAZMg
	q5N/X7o+UISIq0p9W4w4LvCkKNe75PJ3h7TR5pnOkiUG3uI2pQqDXY5Acq8eaOCxVYlswMCk8V33F
	SvFDP77GiI2eMyvjfohWXFfet3GO/wEfrmQsthiFgeOFym8y0nTqoYydycleBX5wszvhkHIr4G7kc
	+1jtaDg2n6bnd6E7kbiOefZwonHxptsrIZp90Yz7rvuU/kzzM6oJ/nlP/j7+KHQrewkQaXmpN9r/S
	IsP/Ztvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfp-00000008VA5-2zVO;
	Fri, 17 Oct 2025 16:51:25 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfX-00000008Uyq-3y8s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:51:09 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cp9nN3gTMz9v6q;
	Fri, 17 Oct 2025 18:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXd+1w5cvwDxWg/MvxbTe/pIUcBohLvdeQLeTekfpD0=;
	b=Z5SQVXJJxX/EEhr2Yrl3G2wPxuyeOIAaC5S7VeWMSq+9BrA8hFz0xgCDOjHD3p7irIA+Pg
	WJhXsRV/SyXA81YMwMVVqJb8VDkpPaGNqLiZ51wR4oSYlDDeR9rlV08jwg3vGg61mn1s9j
	HkAn8Jau6nDkA4stJSPc0tt9bA98b/xMDrDJr72dBjwkG2LsrEGS9WC9D8IjqtDpeTqn+7
	K6ViFHp010x0zKcsw9IrDn7xoGsiuO5JWQJsq/WIudbCezApPwjosSDjWG9N+zWCRAPDNd
	Gqom6rppjAC8KSYmHK5itXGihAMqcgDPPY8F6rBpau8bWO6ymqsRn8p+vsKnLg==
Message-ID: <5a725651-8f6a-4e4c-aa11-c68e1f1cb87a@mailbox.org>
Date: Fri, 17 Oct 2025 17:20:18 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 20/39] drm/imx: dc: Configure display CSR clock feed
 select
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
 <20251011170213.128907-21-marek.vasut@mailbox.org>
 <aO1JmAuSWn6BN6hs@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1JmAuSWn6BN6hs@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 3c5b4d362fc513602ca
X-MBO-RS-META: ju5ym6h4jbph7no9ndbcreg74e6gbgoc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_095108_131899_4E1A03F7 
X-CRM114-Status: UNSURE (   8.63  )
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

On 10/13/25 8:48 PM, Frank Li wrote:

Hello Frank,

>> @@ -119,6 +127,17 @@ static int dc_drm_bind(struct device *dev)
>>   	if (ret)
>>   		return ret;
>>
>> +	if (priv->regmap) {
>> +		regmap_write_bits(priv->regmap, DISPLAY_ENGINES_CLOCK_CONTROL,
>> +				  DISP_CLK0_SEL | DISP_CLK1_SEL,
>> +				  FIELD_PREP(DISP_CLK0_SEL,
>> +				             ((dc_drm->encoder[0].encoder_type == DRM_MODE_ENCODER_DSI) ?
>> +					     DISP_CLK_SEL_CCM : DISP_CLK_SEL_LVDS)) |
>> +				  FIELD_PREP(DISP_CLK1_SEL,
>> +				             ((dc_drm->encoder[1].encoder_type == DRM_MODE_ENCODER_DSI) ?
>> +					     DISP_CLK_SEL_CCM : DISP_CLK_SEL_LVDS)));
>> +	}
>> +
> 
> why not export as clock providor and use clk API to do that?
I don't think there are any clock operations 
(enable/disable/set_rate/...) besides controlling this selector/mux 
(set_parent), so using the clock API would have massive overhead for 
little gain.

