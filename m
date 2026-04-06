Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D9CF46C51
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 15:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTqqo0bM2Xp/vABBfMxTtslTbC0nEcFdtU9RVWpzvC0=; b=sM24hVQB8pdhhi45NMlI9yEjvV
	EvjdPs+a23/zugQc+jU36dqcBrdW9tecnCioSUTQn+owzoA+ZsKPM69iHoNbFSaE3IEH0Ir2Kt2RS
	TfFBP9IhIlVmbmZ6XgCtH9dh687kQ/rxuxNVDeNbl7B/jt30n94qZIb5nfQMH07E99ED5PjwgOeZ1
	A1660JYpSkuoEe6KCR48UPVstaptZ0GVTMQVElIwg3tuUpqrrBPJbTy7reeekPYG2Kz7nuKndf8mU
	V73kxuzIQz/P0Qb+v8IuagngeKjtyCACkBrYz0IiOoyAbP2gXgFGAlaUdXjYaFhxQtW90xIww+Yp3
	N9s3cU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lv8-00000005GyO-45Ic;
	Mon, 06 Apr 2026 15:31:23 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lv6-00000005GxL-1E7Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 15:31:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B61A9112349;
	Mon,  6 Apr 2026 17:31:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775489475; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xTqqo0bM2Xp/vABBfMxTtslTbC0nEcFdtU9RVWpzvC0=;
	b=d9NfMqx/h4AterwS3pb9uaO184+AEpR9/8Mm0vRvs9yLYWBbiUUr0V5H+81Jdjoh0vbiA3
	A2J+qhLil58e1MlrZebVNYvehykoCA5MxzaQE8VqsCOURduIF3P7stxf0sodc2o3M7r1hy
	6WWmNSpk92X6H4x0dgjtkWbtWfKSk/DxPBFKIDtCNibREu0z3QJuK3eEF/JIcq9orKnxxY
	idfyFswFphl+FYR9vhGCb2/+4LKCM3e0QbCV36okK+Nt+ofOTmDsA6GBHFTvp1W2qWFRwy
	IFipw4+Mq8QhrdYPO+zQjtg71kprF/iHhTGmFJKCfkdjznlhTCPoRJofsT4ZWQ==
Message-ID: <41641a5c-8da1-4696-888c-454e6bf2eea2@nabladev.com>
Date: Mon, 6 Apr 2026 16:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: imx8mn-vhip4-evalboard-v2: Correct
 interrupt flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Fedor Ross <fedor.ross@ifm.com>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260406063810.25531-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260406063810.25531-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_083120_555526_6D0307BF 
X-CRM114-Status: UNSURE (   8.03  )
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

On 4/6/26 8:38 AM, Krzysztof Kozlowski wrote:
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning:
> 1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
> 2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING
> 
> Correct the interrupt flags, assuming the author of the code wanted the
> same logical behavior behind the name "ACTIVE_xxx", this is:
> ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW
> 
> Fixes: 5eb7405db99b ("arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Marek Vasut <marex@nabladev.com>

