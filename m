Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA1DC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQrma2LURwgBlfZT2emMUrj5BCk1p1v6AScmI3ULZLk=; b=oT9x7Wj1P/N5J9/B95CeTH1fKy
	acWgiEXXf2M1tz43rfLfMx7H+lxL2vQUmUfXogwDHnHI5Ja7bV4Utxytfg7V/jxgFKEXV3/iWQi8W
	vTc37HFYDI8fcOnEmX7XE20G3RkPKPAc/tjG0mnVX3DHR+KLMVBDCAjYrlJyTkGt0mMTkxq05pFj+
	DmNgC8ALZUkwU482CMFqse9W/5R805gOPJAOeoTnitOm3GoZhrZNHpl0C2Eq2HsWZ6FBenLAq6umx
	yoGKNhGP90Kck7OUENbSMV2AeGy3dZCaSuXUDXvp5BN/IbMdHBymCMIshBouKrnWRfHZdIMTctrcb
	G3ju6ONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55hU-0000000HQ1i-33iH;
	Fri, 11 Sep 2026 18:10:12 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55hS-0000000HQ1B-14oj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 18:10:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C2BE10327B;
	Fri, 11 Sep 2026 20:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789150204;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=mQrma2LURwgBlfZT2emMUrj5BCk1p1v6AScmI3ULZLk=;
	b=G7jxFTOI+nFLXuX9a6xdxGOgwyMQbM/aKI4ahgSKjW53Dx/lLOw1bpLY4Sw4bpwlR5crDt
	s305K6iI67A1Skcf65juGH1OAM3PAYUYEpGzQsMo/Q+FTF0Z8bgZXnIvBnwbpinqBugUxU
	ueDHFhSLkPnhW2lWx4dEdu5GuVPnonPZLdu8P2YZ0wYiiwmLecndAGMt3Anw2Y5Z+wXgra
	uyhLEN3DwCgnRrq25l9JGAsFd71A6A/JbDF+4QAN2cODo0ura/rDYdYPDbqPsgTIGdKFJF
	HKeCELxPW16YxhKQssl7kYqsT1ZKnzOOTF4WOiOwCfoAGBdBsGamY7Ycp6YJ6w==
Message-ID: <40827aa9-e7a9-42ee-a004-96d530e377e0@nabladev.com>
Date: Fri, 11 Sep 2026 20:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: st: add vrefint calibration on stm32mp23
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>
References: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
 <20260911-adc-stm32mp25-v1-v1-4-cef26eecdef2@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260911-adc-stm32mp25-v1-v1-4-cef26eecdef2@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_111010_447633_2FCA09EE 
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

On 9/11/26 5:51 PM, Fabrice Gasnier wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Describe vrefint calibration cell to be retrieved by ADCs through bsec,
> on STM32MP23.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
You have to implant Co-developed-by into this , please fix globally.

