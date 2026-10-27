Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EaKmM8Q7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hc52RRWZ;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=LuaWo06y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Df7/tfGdKfRHftGQ/gC+HL2nvok6xw8ztV6Hfi9otaU=; b=EaKmM8Q7GuvmNr
	T+AjrtdM4imssmwv13GU79Aibc1Pgc7wpJP9YDNJNzWXqLtt691juOkWltVD+a8qp1DmeKMMDD1RY
	4iuWzoJGDniYSxyoGWTRZ+GXK4ltyK2DOOrPsNVwo+/rqWsyyR4XEShI8An+mPgyjYbH8scNmmGGb
	UER5A+sLpiEHYTenyZfEaQ0o4oQIsJFqgKs5lKS/urUPfUjuTRCUggA8j6vBdoHZmb6bi4/3Z324E
	FPDUBHkb9R7Kt3vcB4B++VR9Ksz+BV1Ffi3beSwZmmOTyCd5AnkQl/GF6nwv7bDQ6OBbkldNNH6aA
	42AKLIfXEELSYhI94nnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgi3-00000004j8d-0rIn;
	Tue, 27 Oct 2026 12:55:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLghy-00000004j6p-2GtY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Df7/tfGdKfRHftGQ/gC+HL2nvok6xw8ztV6Hfi9otaU=; b=hc52RRWZQitdiiqvoml913D4Yw
	kQWZ1mtHXTUjl7YwSfgUkYPY9m3CPGMVyBMZ/zwGvuSvO/pjuCfozTPbX8o559KGkI5mIQchFAlfF
	irv7671H1qGF3ab1J/AGVxuyuqJA9p3RvQMn3FKNCaFJhGWkV/7mqiNcaidzj9IrX7BqIftHa3F2T
	YfyTcFwuMmrHC2kvlM35sisxczJZY8Eq25Zh++TG1ap8sCELBOI7fEX8uTqiAtCrbQSQXTMcXaqAH
	nG12xpjjFoTl6sC+t+aoAKiLRJlJ7CJTif6id7ZwOt1DJW+c3E1wzrNAcEUWWah8z9F7yqigmgblU
	5HY1/NiA==;
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLghv-0000000EyWN-3o2Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:55:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 167B81086BE;
	Tue, 27 Oct 2026 13:55:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793105709;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Df7/tfGdKfRHftGQ/gC+HL2nvok6xw8ztV6Hfi9otaU=;
	b=LuaWo06yHgeJcci5b0mvXB7saV6QxpGuSXp1fv7vvtphCljN5G+9EPMdCACYrDNJcI8bWy
	JduBWnM9lvfWoIc81KsOWvnULaFhfVtIr+AdrhshBGFMkQ/o53BboeAO7pQpvaIdBkUA4g
	meTWPoO59hOWpZJ29BYmqAfdR16sxJGvlQRVhNk1DpmsHio4kaZ1u1b331Bd/ntLhjEmgJ
	/JyiD2reabKzP0sXHSaVuHax7Yu0lM6gmT51z0bfhJj6KgeYVMgUYkXKR35odSqGjEfz5n
	eoLMz/tdybhpsa+Ub+OfhEL/2MdIcSdNPKhyug3TQPdlIoojAMJrMpJMG6whGQ==
Message-ID: <4b2a721d-f333-4146-8e47-f5b38b378ff5@nabladev.com>
Date: Tue, 27 Oct 2026 13:31:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused
 SPI device
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-kernel@vger.kernel.org
References: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125516_052197_0541CA94 
X-CRM114-Status: GOOD (  11.49  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/26 12:12 PM, Christoph Niedermaier wrote:
> On the maveo box, the SPI pins are connected to connector X10,
> but no device is connected. The device "dhcom-board" was used
> only to test the hardware, but was not removed afterward. So
> remove this device to accurately represent the current hardware
> configuration here. Also remove the okay status, since there
> are no longer any devices defined in the interface.
> 
> Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Reviewed-by: Marek Vasut <marex@nabladev.com>

