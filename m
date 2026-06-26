Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3747CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7QugsTJVRYqI5KzYuo8WC1k67mQy/4ShxoER+MIinM=; b=wy4I233uaTdefrqi4cW1w5CTGH
	YuuOgCE00UHyaVoEigzCENZWcH9ZQ3q4A+bXQmDwT0KTkP82ar963nTwvtTfM46mnTTbiK8patLuh
	6kdWwGeNdzrLLwTFGWzhPz6lRHmvOrzxmx4WGfLS9HLcnvMSGgUmg88gimzK2u5ydMNj1BLr9Gz+I
	d5nmfcPI0JW2q1NZj4ImJG4TFdq+VYrof9Vm5/3Kk+lMiyxuWd2pC5h4mr2fg/YD0NeFg4rNqw+Jn
	qoKDxOi6PZQcaZFz5GU1W3aqa3PBOSlhP3r1UyCuzcnoGBvIIkcfcXyox1U6u+VIqgSFHY7y+P6D3
	iKEkmocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1xS-0000000Arro-0rRT;
	Fri, 26 Jun 2026 08:30:42 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1xP-0000000ArrU-1vjw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 08:30:40 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so316814b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782462638; x=1783067438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7QugsTJVRYqI5KzYuo8WC1k67mQy/4ShxoER+MIinM=;
        b=Awb56LQfkYesxh0ocvKnuZOuH2y3B5WwbUCUCd0dKnVKJV5Y5ZvqVyvRm2PfGdR0wJ
         xXYdvK7G+IJbY06XU63gPpKiilNZsON81V1yjarvRA0gr6Get1X+7EN5X/W3l4t8ufj7
         s768P0EXH+JYvyy4/4thedd9PkQINK/xliZCLUZhqsA43yRIoq8NEuMqepQJdwrzYbGY
         7Z7eCghZ8W/bIwyJwkXVBy6F3IuoStcHsCvqaH3CKgZt712EAJSsTML1oX+C7rB1X/0M
         c7NQ2hQ7SeMfKgznAn+x5cygc65oJuxutc1U6iJ+Man5G+jkl/IMb8vWfOhVGkAVJVRR
         9XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462638; x=1783067438;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7QugsTJVRYqI5KzYuo8WC1k67mQy/4ShxoER+MIinM=;
        b=VWOZ1UofsY/uGDtS5w1zc0PrP0BLX27ILZqFB/a+At89L85+zaWLF47QlWpvFarelG
         nqoQ2m5Lryrg4x5o11LLL/QyDsTC3cd2MvEi5WmRTro8Qh1j081dQtmeVOvKNYwL7GfE
         qjXpt5DSbNg2Hu8kbCmOEXWIk8NUhBWgNt4e2O4einEcGMdKdsOQKLeN0ai8Dr/DYeEM
         St6fnVmg6nsLcnvO5j8NZWx05ztIyt1GnckDirzos+s4VYvmAGU+QutlLonJ34MZSHRh
         A7ZtDCsmk40H0dIbFZlv/297LUqN5wIVKAC4KWzb6yLVMzZjUQHwKWYbAZj7D2+U6PJQ
         A6Cw==
X-Forwarded-Encrypted: i=1; AFNElJ/iOrJ+4deNCrISYfUNor4QMbteZHxTEIXFZFgT3noDgzI4SL/pHw6DI0WRett5Kc/V4aS5FzgiImD5T3oA2j6G@lists.infradead.org
X-Gm-Message-State: AOJu0YwS8bzTvVTDJ2PZnpr2JODwGfzewC9vYzJ5VADpNhI0rWktT3W8
	WLl28w3LRwSquJ9KQ3visvwr+Irg31JVe3sissNpONjjl4W57j4m+U2N
X-Gm-Gg: AfdE7cnDpIugQD0STmvp+jPObIUpKojidmuDdvbToiIwoZbdd52ahe+OGlKIu57geD0
	OAHF8myJaz4HuWgnsUbS7ZhDlISOg3AkLt9kxoLOz5XpRho9BtH06aEbuB9ysg0xK1yTQo9+Bvu
	ZVFrf2gFidcmH9r6HVLjq+sWvpWHODU2QsfHFD6z1OOFr0aUHSNwSNUgD/2jTq8FiqxHZyFCTSQ
	lM8ushYzaz64q4n8f8MzQcH6HqD4eYJeJ6OKmb7uoC6Kiz2TudqCc91mastPxdSNi4pEqutO64s
	WLRTnB+ZLZK1u2gVc5OtC8BvXdr+mvhX6abRT9796Qi4136IzfbzP9ERkd3D07/REQN2ZQnh5vv
	XqGCH7Y28AB9SjIYhAIY3XfGJ9asIEyO+G2ysMMHhlEx8/DO37eUceafWK8oQ1f1KMDZi8kYjGP
	aBqA58dAasHnY8NQ==
X-Received: by 2002:a05:6a00:804:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-845b382ec89mr7443975b3a.0.1782462638151;
        Fri, 26 Jun 2026 01:30:38 -0700 (PDT)
Received: from [10.31.13.168] ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c104113esm1660225b3a.57.2026.06.26.01.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 01:30:37 -0700 (PDT)
Message-ID: <c21cd9dc-9bbf-49dd-9812-4db0733b0636@gmail.com>
Date: Fri, 26 Jun 2026 16:30:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: carlos.song@oss.nxp.com
Cc: andi.shyti@kernel.org, biwen.li@nxp.com, festevam@gmail.com,
 frank.li@nxp.com, frank.li@oss.nxp.com, imx@lists.linux.dev,
 kernel@pengutronix.de, liem16213@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 s.hauer@pengutronix.de, stable@vger.kernel.org, wsa@kernel.org
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Subject: RE: [PATCH v3 1/2] i2c: imx: Clear slave pointer on registration
 error
Content-Language: en-US
From: liem <liem16213@gmail.com>
In-Reply-To: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_013039_517410_1E4D5BCD 
X-CRM114-Status: UNSURE (   5.45  )
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

Hi, carlos!

Thanks for the review.
This is a good idea; this is a better way to fix it.
I'll fix Patch 1 as suggested and send a v4.

Regards,

Liem

