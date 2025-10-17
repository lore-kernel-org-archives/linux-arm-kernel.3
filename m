Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1061ACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XooRrV+35GMQDIPae+kH4PQdJPSO7z6la9Gjhfk5mw4=; b=d62f2lLiW4L+fjMcHrh4ysbOPm
	EqHLL518I1qY8j5KbrH2oYQJKKTzQaeVYF6JKcaT6SGr9ltgVRUTqCmgBBfobwIebyqTFOEVujI17
	N0glVPr1dn0fctRrxXl7tzKHFBytgYGxz6pQwOmmb5L7mZU72lWBqKd6UUcUFjoPFBq5VfUcu0R1Q
	i7BWu7YJ7Vi30YzBBDNH1uxk224jA3awfrHOaRUY6qDrHiRj+kt8PF9RxxAzDMXTeqcvduOTfLX7Y
	933rI9lEPqjk5X2izS1n2YAVOi6nJiYUcqKaORniCiiFVFXzwTMx3dEnf01n3+Ea/LABhA72yzoVj
	M8ZeIhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfT-00000008Uuv-2l1U;
	Fri, 17 Oct 2025 16:51:03 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfL-00000008UrW-3Xat
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:50:58 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cp9n82JH2z9srJ;
	Fri, 17 Oct 2025 18:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XooRrV+35GMQDIPae+kH4PQdJPSO7z6la9Gjhfk5mw4=;
	b=c9qIF1x4Hhov0glv1MzFHn4lKsmQsK/AUXn28bTHfPtfrwrOht6y2EPOh+zieNKveBpmUC
	wxo3u3IauhAE+ftz+pcOOjMdpyjKXkznAkX+ESdwIXZqtzv1ye7EV4XG6OiC6sltyvNwUM
	Z0kx8hEamvvfbrVI/Xz29wE4Tm4ocekwqAA/kJygEuUJKuntkKJTsXl7mXPi/+50G0Zmi4
	jM/UpHtiXFneBvD3Z4KkqLHEq64MgxPaFnbaZxWtg+GG1FSxmfZswFpS/vGlqzgFbP+ftw
	8N3vT0dWLjmqaeaqwu+e/Wgz6nUQzgGZVjtIoGpxf62pmiBN69rIkI4wKorWqg==
Message-ID: <fc291eb5-c352-426c-9064-78bad2d9d742@mailbox.org>
Date: Fri, 17 Oct 2025 17:05:50 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 38/39] dt-bindings: clock: support i.MX95 Display Stream
 CSR module
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
 <20251011170213.128907-39-marek.vasut@mailbox.org>
 <aO1SaKbfPnMEl8SI@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1SaKbfPnMEl8SI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: pn6fyroioe5ds3breihbhnzb35t5xbqe
X-MBO-RS-ID: 2d4ad38cabace14face
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_095056_613601_885F8080 
X-CRM114-Status: UNSURE (   5.35  )
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

On 10/13/25 9:26 PM, Frank Li wrote:

Hello Frank,

>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nxp,imx95-display-stream-csr
>> +          - nxp,imx95-master-stream-csr
>> +          - nxp,imx95-mipi-tx-phy-csr
>> +      - const: syscon
> 
> why need syscon here? why not use standard phy interface.
Those registers are not PHYs, they are aux control registers for this block.

