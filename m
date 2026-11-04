Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF4F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 05:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Ssg7P8f;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KPPHPiA5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aAyOJH+/ySUK2zDeQ1iJyBQlLl9h4Z339aF8GGL69Nc=; b=4Ssg7P8fTzRB3L
	z2kmdo+RuBFo+4LTGvneDJO+8k1xDucWYi4BDQtAprEHhLzgqes/YGmuk+W64hRb08cGDXKcMywpg
	c6FDVytfJN8c0CYVVG6Lw+9T+5uYyPcHCvsAQHcn+BbQw+yUV/v9ZzR3tt00xwTIdpM3yccnEudpc
	Rj/9xkruCsPvFtJrtgwLXsT5B3LUof+2Hkh8M3AWCE4mO3BrjqT+3YQYWwxagV/wSxOWH7zGSn5g7
	cMSHm10UIc9UW8icWI49b+XXqnQDfeGg0sydGY9BQ7Xr/qIW/yy1HQiBwREwJirh+sgHm0+vgF5er
	99aMpCYvT18hSAk7EsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTLn-00000004KZX-3H8I;
	Wed, 04 Nov 2026 05:15:55 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTLk-00000004KYr-2n9b;
	Wed, 04 Nov 2026 05:15:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6D5010C77E;
	Wed, 04 Nov 2026 06:15:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793769346;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=aAyOJH+/ySUK2zDeQ1iJyBQlLl9h4Z339aF8GGL69Nc=;
	b=KPPHPiA5pbU96CImUfhV+zlP7ollSTQxoGH0hIQmwd2QQMNQXfYSNDLPNJc2EfpSbA+ZaP
	XpZ1pXUiygayD8zxhFa1wDVUz5Y4kA/kvgS69YV76OSSJtwnJFd9ee/TJggCREGUDnzdWU
	tuZrocCnH+wD3tpjT3WYsNadZn3NqImc2LEngdeoy9rTDbYkaUwax+YUP4u4DRHsqNqcKL
	iGTQA4DAETamvoxcyGm50shyXjuxOASraMZ+XVnNGZn+qIlrTOPhkpA6ito/XAj3F9AzhW
	Fv7E6iePpOmKluAsBDeYk6qUH1rHO9qVar8Y6jt57goCfy72Bv8cmBas/NRerw==
Message-ID: <c64b91f4-3f4e-43ce-ab81-8a233211c8ea@nabladev.com>
Date: Wed, 4 Nov 2026 06:15:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
 <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260902141312.649406-1-marex@nabladev.com>
 <20260902141312.649406-2-marex@nabladev.com>
 <bf8e7888-1917-4ddc-9a6d-20490835c742@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <bf8e7888-1917-4ddc-9a6d-20490835c742@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_211552_922739_27C64BC4 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/3/26 12:19 PM, Fabrice Gasnier wrote:

Hello everyone,

>> Add USB2 PHY driver for STM32MP25 USB2 controllers, which includes the
>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>> slightly different, therefore they use different compatible string
>> to discern them.
> 
> Hello Marek,
> 
> I'm not sure if/how this fit with all below tags. For all the
> contributions you've made, you can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Would it be possible to get some review on this FemtoPHY patch?

Thank you for your help !

-- 
Best regards,
Marek Vasut

