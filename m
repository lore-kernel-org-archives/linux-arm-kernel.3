Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F102CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emw78z9qBdbJbPp/EQh1B0+OlLxBNj7DeALk66qoJtc=; b=fUapreBsPVhRdn7iZXb48IL+6p
	vLodqBRQEDFGnhTEvrea+60FZpMSTU1s82V01mRwhm5pP9hGFbt+TDc4Busy0jqSiB8vrJ6yGqCnq
	mVBiG8T8eJWnDDnip5k+J6EoU1SfETnEA64YemiX2+tFDtyKa2TLUBpkDvRrWLCplNLvM/OEJx+N7
	H367LYTPTsu9mWIwM5JsnHbDiqE4GUFwsvAf4PtT4ffqG0BQDfEEcxeCjHTZj3a5lYx1K2NuWwqPl
	ahN+zMOoCFZKR69FGCf+A2hh7t4Px3sDx+KEPOBXymsFWVpjASCBtSV/kjqRi9b9YhRQaXaX6u7mY
	RepyRPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGeDt-0000000DpTe-0qIg;
	Wed, 05 Nov 2025 14:10:53 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGeDr-0000000DpTG-2BMu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 14:10:52 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so4988524b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 06:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762351851; x=1762956651; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=emw78z9qBdbJbPp/EQh1B0+OlLxBNj7DeALk66qoJtc=;
        b=nZdys0YwofwlNhWjTfopnWmdNmiZbkgV7ITUQ1H+9Eix+WEwJNIa/jvMRwFIXfxmcu
         AKaizgAIQAGNMLiFYGMmhsnJaMAy33U7rZQz3ksbI255HVjHkEO6sM+KGMGtC43p0s8U
         7yyjC3nfSsUENsxycoolsMT4MnF1czao6j7kIVVX9TCJcMK90OwwaFbDAy4T6/wqbp7W
         I5CH3mgQ9uIFBD2C/0bLlU6v46DEdJDcK16FJuM9UGv0cvlp72SI2KzP11D4SNm2x1UO
         wS4R+5dVp2qQmLMZnxcis6PzszHriQ09m8t4cwDv47t9evc+phXpkNKuY8Oz+h+l6Lq5
         b30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762351851; x=1762956651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emw78z9qBdbJbPp/EQh1B0+OlLxBNj7DeALk66qoJtc=;
        b=s1o2/qLkS2ruQwNqfLUCM6QrADM5geAxFTCj189M+9jByQ2MRk1MDBMe8bkFccMPUs
         latNeEe9ygdLbiB+IhbyW4knGhz6YSQ1g+Tf043/eXofjZ4YCyckKF2ncEhuYyiJapdK
         o8qoEI2HQw9GXFYAkgyCOtJFVdCXXFg7AAKqucv7wVr6V1PipIbLvIucoVMQBkQhj0/d
         WtCbI3NGrf1lE9ssjPz4rUvpL+jJMRjpXxF86bJ4a8aUMMYyRHcofQZnCEWTW7F7UVPD
         HjDSIlLD4j5Q8IEdti1067HFPhal4enIFtS0W22Or4YbuV7NoL+7x3N/Fgu1t1AXAcuE
         kISg==
X-Forwarded-Encrypted: i=1; AJvYcCXdE7sQWjwymSsvN+xauTB3/2DEchRxwv3G5ghIL3JsNRVOekSTwkdlwK/T36ez+y6QlzD8po+Q+N7edZMIf7LO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7LWW5baZtkFfxVv+CaS+KvUiuUbEwaHA37DSsJh9/pZmrB1ie
	feyrKBf8uU7Xg5axgPkQuNkfc2DSJbjSBtRqlpypKKhZJwCbTCz28GmG
X-Gm-Gg: ASbGncvjHwXOXT8IjhOOx5qXKRyM2YJU0E2ae6YJSumnXdzIpH/LEtXOUSygH7wbK5Z
	h+fShjF2aKgY4DO9GUWAiImnZbBHKwzpMv/CvAvyfkDJrfrQodCbIYZBkg3HBZ8woI9uDQ/hxtX
	6HjpI6PMjBEnn8gcQ/CvKOvSH0YZfidmfd38j3Hzm7WInt5UjHQrYe/gepaYnXNNT3JRgqZ0xCn
	zYGXeuE/u0cMWjuqIP8N1UBXV1PokC3nXeT1gXusHv7tGF7fe6GZqZd+08tMPERJC332+kHRiIi
	wO+D2fZ6YQB6jBkVzc4DJrChSv0K1QIwC1kTvck5TJgw7Dw8y7IlI3P5Ew6GYXcFGhXGGyzHWmw
	gxhqs8AwCbYq5oXicUsQyCU9ZYoypb6fdB22ilJjVzNjo38BmUPewkHY1NonMNnjA9scNQtJPmy
	Fqw6NIzrfZtQGYiJy1AxoXTg==
X-Google-Smtp-Source: AGHT+IHL8owbIlMZhQdZY+kk5sY3XFA/9Cm7OjnUeEHELUCKbLuEvSBGY2pLYFJdOYYls17ySipyKA==
X-Received: by 2002:a05:6a00:816:b0:7ab:6fdb:1d3a with SMTP id d2e1a72fcca58-7ae1f294128mr4332619b3a.16.1762351850594;
        Wed, 05 Nov 2025 06:10:50 -0800 (PST)
Received: from joaog-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6dfc8f8sm6344428b3a.72.2025.11.05.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:10:49 -0800 (PST)
Date: Wed, 5 Nov 2025 11:10:44 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kishon Vijay Abraham I <kishon@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>, 
	Andrew Davis <afd@ti.com>, Francesco Dolcini <francesco@dolcini.it>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: TI K3 AM69 Kernel Panic when PCIe Controller is Enabled
Message-ID: <oawjd2mscz2untz6zc5mqn6ak2oxdul6pnaexiohe6ae3bow2r@afkvpu4izrvt>
References: <pod3anzbqdwl3l2zldz4sd47rtbruep72ehaf7kwcuh2bgflb2@y4ox65e66mkj>
 <cf751cf7-53a5-438b-9903-903bd8c39b23@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf751cf7-53a5-438b-9903-903bd8c39b23@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_061051_564656_E0043D30 
X-CRM114-Status: GOOD (  12.47  )
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

Hi Siddharth,

> The E2E thread above leads to another one where the issue was claimed to be
> seen only with the usage of an external reference clock, and it was fixed
> with the usage of the internal reference clock. Does this hold true for the
> board that you are using as well?

No, we changed to use the internal reference clocks on the current
hardware revision (sent upstream on [1]) and still have the same issue.
Please look at the PCIe nodes in [1] so you can confirm this. For
example:

//file k3-am69-aquila.dtsi
/* Aquila PCIE_1 */
&pcie0_rc {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_pcie0_reset>;
	clocks = <&k3_clks 332 0>, <&serdes1 CDNS_TORRENT_REFCLK_DRIVER>;
	clock-names = "fck", "pcie_refclk";
	num-lanes = <2>;
	phy-names = "pcie-phy";
	phys = <&serdes1_pcie0_2l_link>;
	reset-gpios = <&main_gpio0 32 GPIO_ACTIVE_HIGH>;
	ti,syscon-acspcie-proxy-ctrl = <&acspcie1_proxy_ctrl 0x3>;
	status = "disabled";
};

[1] https://lore.kernel.org/lkml/20251104144915.60445-1-francesco@dolcini.it/

> Regards,
> Siddharth.

Best Regards,
João Paulo Gonçalves

