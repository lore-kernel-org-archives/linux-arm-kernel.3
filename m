Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F722CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0PCGcbcebxEbmKkqUra8r/5kC8oKG3WtMDn0TPnQmM=; b=Vc5gP/BR+8pnM5YVL6myjlBRhe
	TbJmqw8DtR1iPv/DYRf//BvxyreGH7XlY68NPV63a2zprcO05QhXwBzdOtQ0tAh2e1l2FzERDLbAu
	0pn4r1TTERLLycFAD+L2AtTkR8zSLhYSysLvHm+pETBsC9GcYgQPh+hYWaPNJ1sKuz1tE9jIqKdLl
	4HJziRQVW+rgRZTbmkX/0Ue9WRJkz1/cQaWX63hslzH7Rumkuzz3VJDz0fJv6Xo/AxSkcGPoAXAsB
	XftxAdfCY3bl23yyyRt82isECmKACg7bmycTD/3YwDxw/ZgDgH029HOOqiMUcs2Xjw81Z/Gds2P+8
	+ReXeU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfU-00000008Uvp-18dw;
	Fri, 17 Oct 2025 16:51:04 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfO-00000008UsC-29z3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:50:59 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nC0Bw8z9t4X;
	Fri, 17 Oct 2025 18:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0PCGcbcebxEbmKkqUra8r/5kC8oKG3WtMDn0TPnQmM=;
	b=nvNb7JM/ergf992QdOb+HWiqFnAQbgApIg++mtkKrysn/7LHTAktGAsbNUyt9o1peDmwx9
	JbCJKkknxuVQp9LvVMuoxoNrYgtSoMJ0kwmIoDvS6eMUmOGAhxVO2cPEC/mGjmW7snTufB
	FK9jiVPosKPpk2TBBDDCI35epqEBQEQyhL14gYwOcm/rKqwTOn6ODv9fcwKBdTvMhKsqZC
	IoLrIMK6TdX5VKzFx9wo4uc0MHpaqg8XG98Em3cGn53kVXKBTvHne46ETfHr3N3pMSTL6n
	q3vzrqLJGarAL+HmI9iTRWNjjgS9526TTlwyrLEZ/U/VfREgBHrFnWqYLuLDaw==
Message-ID: <91a59c49-db23-425a-a728-b81c30802bd8@mailbox.org>
Date: Fri, 17 Oct 2025 17:08:20 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 38/39] dt-bindings: clock: support i.MX95 Display Stream
 CSR module
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-39-marek.vasut@mailbox.org>
 <20251015133315.GA3263713-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251015133315.GA3263713-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 9b13f95dc50aafe5c94
X-MBO-RS-META: wbuyjodo48czus9sqe6m5ubysagbd8jp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_095058_694836_E1792F34 
X-CRM114-Status: UNSURE (   5.10  )
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

On 10/15/25 3:33 PM, Rob Herring wrote:

Hello Rob,

>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nxp,imx95-display-stream-csr
>> +          - nxp,imx95-master-stream-csr
>> +          - nxp,imx95-mipi-tx-phy-csr
> 
> '-csr' seems redundant.
It follows the existing naming scheme on iMX95:

Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-camera-csr
Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-display-csr
Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-lvds-csr
Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-vpu-csr
Documentation/devicetree/bindings/clock/nxp,imx95-display-master-csr.yaml: 
      compatible = "nxp,imx95-display-master-csr", "syscon";

Shall I adjust that ?

