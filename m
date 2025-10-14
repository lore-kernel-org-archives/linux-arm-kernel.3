Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8AACCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3BLcmVUVGLpFJRX39w4eFwRPegwyahQOD0DU9dd3LU=; b=sedH2cViKDi2IB7hVqEF0LpehZ
	syyhXIW2mUpX5M7vW0YmLjRaBX04CWUM1Ml96e7ImwZby+HiPGRIzNHZENZDzstBsidYkeGnU5I0W
	Dj3dVgztE2AWmo4QxpTdUAStVcYPU518sUGBqwtwXHJlKHUwhVfurcpuV1MhBxvGgomIMy+LuwSYS
	xiGwY1/Xyz7FAlGDuO29XHG8DfEP9s8Zg8BOzoCPgf76+jCLThRPiABjdMEiWupN+tvIxOvollPOT
	v5H6tz//OxD+9AtEwKu4Rrzmpt+QtcHv/oyioVKW5dy8iA76QLZfwifJYa8aueggelWiq8JNciMLr
	eOvW/qtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dZb-0000000G9xF-3Kj3;
	Tue, 14 Oct 2025 11:52:11 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dZZ-0000000G9wR-3w9R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:52:11 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmCHp4c8bz9twV;
	Tue, 14 Oct 2025 13:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760442726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w3BLcmVUVGLpFJRX39w4eFwRPegwyahQOD0DU9dd3LU=;
	b=cNL5UimLZlsis2oIWIfiLbCo2w/5oP6hHGeuaEqAclU0/h0l571JrergmmbeF2eFDQpHgr
	gLQuhoqvqoea62NmAq0ufs4m7LgjpT6VshSnuGJdP8PAp8WoT9zb23olnX9EkfRNGINmRP
	BAom4KpXpWXaQhdfUmDsKgFT7px+ZRxyTssg9inIZ9xNz9WWllunwlB+f6hlHxKuXkvdBr
	+PREv7fSxh3Kw3YF711QVvObkRiWqzQJrXurwdJkaPpjrhJShQV5OmAfrABL8jFtYCppzi
	GH/0XrK0MDheq+MoZFw0ouWTy4DAMz2xGwAVMgdc+P04oTP5V2lOExkjap0IWg==
Message-ID: <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
Date: Tue, 14 Oct 2025 13:52:02 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
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
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 582067c29d1c33a4667
X-MBO-RS-META: cmy55i75tfkwaedpgnmschc4jpxirtkc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_045210_122609_C0A5AA75 
X-CRM114-Status: UNSURE (   6.19  )
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

On 10/13/25 6:49 PM, Frank Li wrote:

Hello Frank,

>> @@ -90,13 +102,15 @@ patternProperties:
>>         compatible:
>>           const: fsl,imx8qxp-dc-signature
>>
>> -  "^tcon@[0-9a-f]+$":
>> +  "^tcon(@[0-9a-f]+)?$":
> 
> why here allow no address unit tcon?
This might be something Liu can clarify too.

TCON on iMX95 DPU does not seem to exist at all, or at least has no 
control registers. Hence no address.

