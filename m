Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6CFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+aH8Vkp+uMKgYBEzeWu9ULP2uz2ukYCauu+HrKitUU=; b=ijGVc7+pXUYz2yHzgc8ayVfQEd
	h4uUNzRekQWgLPT09TJ1dKJlCixEpgO08YZ8RNvhA3h/0hYqLfnKyMUWEEqQQUZUrAl4SkhzKkcUo
	iHXWTNDoXaXkDfTxIk6GGertQYsGsfkI1taDPkFEFtem8Eqqg7UsrW2zMyUvGkmTQ3Vg5fr+1ZE1d
	MgxTfiWo2xwctJyXAeISG178SqvSkhA6nr6ByTMsglEm/IbnltFrPx6O++W53nDbSx/OJ8FKl3nxA
	MG2NrCb3cUJLdeig2NG2PGeR2Mh2aPRTwYdHojndTkKebUNNsVh6S0k3uDZilaXN3GbXL6KmDNnG4
	mnDUlXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BK6-00000006qxu-0nlL;
	Tue, 22 Apr 2025 10:57:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ADU-00000006bxy-3IAv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 09:47:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39c1efc4577so2600711f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745315219; x=1745920019; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+aH8Vkp+uMKgYBEzeWu9ULP2uz2ukYCauu+HrKitUU=;
        b=IjtVi+t9nFwmyF+cWmXzhmWMoF2fTqu2l6PNnC9rTfm1+7A0aD+L5gMCmHYZoDDNjE
         WWrIF5ijvaLxHyNyYLW5uCLZBPRJqPcskaNB49weSq/72EqvK2b2az9QGcknLRZCBarg
         jRCXzlwbQnPBt6uSEITYc4EXVttw+NWPyY2CAgghU8cHXc9MUdDbiK4EPlU4v76U8Q7E
         CGdCcEr0O9pnohraN0NefdpMWSHJ+iDhjj3BVn6komC3tNDnRU2ewKMaKGn2BUQMrR+X
         RbPr2CkaN78t2x2zXTmWhT7MylAHCKXBQkfqeR2ZsBszM2die1ddcuz2RVeefQc6ke4c
         uVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315219; x=1745920019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+aH8Vkp+uMKgYBEzeWu9ULP2uz2ukYCauu+HrKitUU=;
        b=vbowp5eaa3lUlK8mMTLdbfoY3rP+8VuMbvzu4QghesSnHvw/aoYm+lz5Dis9rPk/PR
         Sq/6lCqFCsnq215OqBSN2dLdKwllT9uMUr4s0NmBvBwgQZHdFp31m98L26Q0JcEyUwMx
         urDjdNCg7g8/UE0BmQd+bQX4ge9bi0gpPCvAr7m6ylf8d1xtRntnJ99i3BJzpnsvRuvd
         DLASj4UcYOxTa1rw1l+K3VG+41rH+Tdry7IYb2yHrkXA6mPoGBcwkbIZEey/sH6ApSN/
         sVP4bYihV8ERjOSap22FJH8Y/aoRlqCoU91CWsMU7k6yDPoFQw9NQudYM6uEYjyWJE2s
         yBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsvORQywKHBGOo5DLS1RWwpMfLqeh+chkwjsMGiXa2vmypdPVpDWGgGE2lheMMAuCdhul/1kD8LQ13Ln+muts2@lists.infradead.org
X-Gm-Message-State: AOJu0YwqbaPCLsrIHrMOTIy4lWGWa1PcJcCdbl/RV7EP+RM7OpZYi6vy
	nulV6Nhw9jR8BM9FDr350Pw1MVeUFuUT3r2bmoIVE3Rtp0UCldGu
X-Gm-Gg: ASbGncthQPW/nQK6/FnXwpAc2yOHs+VVcEB0bDBHjYkdUa7XX8AWLcsTYaw5APxApRA
	BpFYunD3t9dn1gXKIM3j6s9YB3s/RViy5AF2GJTPAOs9nQvAd22sVlec6uU+isbrC6Py7kd5sPL
	bUT4GsTTsLcjP770MjIsx1ce+0ajIkDWPw0Qwc1P9F34q9XJrcrBDBMdP5H0pFM8zxczvSYJQRl
	15AAFP6Hz0PZwCTBkvP3A6lMjX27+4YF7dvjc+gNV2Av1ojz8sBbIQEMXXLSJaSJujIyx8waWwf
	s1zYxdqfw0E1uBtzKW+6HJQREhlz90SF2j/A+rk=
X-Google-Smtp-Source: AGHT+IEMUuvM8SEPdC7enDvmj1KSIpM8sQDJOmbbZ30nkYK0bXnH8XlvLfXljQ4jhhwjqFCSy8BcVA==
X-Received: by 2002:a5d:5f93:0:b0:39c:30d8:3290 with SMTP id ffacd0b85a97d-39efba37cebmr12005512f8f.7.1745315218520;
        Tue, 22 Apr 2025 02:46:58 -0700 (PDT)
Received: from legfed1 ([2a00:79c0:6a3:c300:22ea:3d6a:5919:85f8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d22esm14785563f8f.52.2025.04.22.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:46:58 -0700 (PDT)
Date: Tue, 22 Apr 2025 11:46:56 +0200
From: Dimitri Fedrau <dima.fedrau@gmail.com>
To: t.antoine@uclouvain.be
Cc: Rob Herring <robh@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/5] power: supply: correct capacity computation
Message-ID: <20250422094656.GA159257@legfed1>
References: <20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be>
 <20250421-b4-gs101_max77759_fg-v3-1-50cd8caf9017@uclouvain.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-b4-gs101_max77759_fg-v3-1-50cd8caf9017@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_024700_824563_A71D1384 
X-CRM114-Status: GOOD (  21.32  )
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

Hi Thomas,

On Mon, Apr 21, 2025 at 08:13:32PM +0200, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
> 
> From the datasheet of the MAX17201/17205, the LSB should be
> "5.0μVh/RSENSE". The current computation sets it at 0.5mAh=5.0μVh/10mOhm
> which does not take into account the value of rsense which can be
> different from 10mOhm.
> 
> Change the computation to fit the specs.
> 
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
>  drivers/power/supply/max1720x_battery.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/supply/max1720x_battery.c b/drivers/power/supply/max1720x_battery.c
> index ea3912fd1de8bfd0d029c16f276316d06e1b105c..cca5f8b5071fb731f9b60420239ea03d46cb1bf3 100644
> --- a/drivers/power/supply/max1720x_battery.c
> +++ b/drivers/power/supply/max1720x_battery.c
> @@ -288,9 +288,10 @@ static int max172xx_voltage_to_ps(unsigned int reg)
>  	return reg * 1250;	/* in uV */
>  }
>  
> -static int max172xx_capacity_to_ps(unsigned int reg)
> +static int max172xx_capacity_to_ps(unsigned int reg,
> +				   struct max1720x_device_info *info)
>  {
> -	return reg * 500;	/* in uAh */
> +	return reg * (500000 / info->rsense);	/* in uAh */
>  }
>  
>  /*
> 
> -- 
> 2.49.0
> 
> 
thanks for finding this.

Reviewed-by: Dimitri Fedrau <dimitri.fedrau@liebherr.com>

Best regards,
Dimitri Fedrau

