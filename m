Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ED4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fe08/qfQPQZoDkTmwGi4NLr9fr1hHVIqUL3BbD3l/v8=; b=WQJUzeUq0dQQgLWe7p+xKRTRYt
	OiBWgkLD/wydomgBk/7VzeQD2GyapnrjJmHqsanzTvAaK9VHApUxGzvvNRtEUQY7xS0JuLLZlvjnX
	6SUDyOAeFYHoFCaxDwhj79wG5LAz3kd4RFORH77jGy6nWQea+P8WdnCU98BRPAu6JF/fXUD5Acd79
	TxBcO9b9S5hWCm0iyyAMOruF2srqSqF4JSjXy5AYoa0FyptI7xh54Ku4P5YYepLqW/RrKxRE8y1+H
	OZyD6jzv8bx3uAvbrPCozc30kE+AL/Af2JsjaNRRA3a23KOeIocfgd4b/VmJKLPiel88grt1jJyCc
	ojO3I3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVE42-00000005zYU-11bl;
	Tue, 07 Jan 2025 18:12:26 +0000
Received: from smtp-18.smtpout.orange.fr ([80.12.242.18] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVE2n-00000005zH2-1NKx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 18:11:11 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id VE2ctVpn8nktyVE2ftbwd9; Tue, 07 Jan 2025 19:11:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736273464;
	bh=Fe08/qfQPQZoDkTmwGi4NLr9fr1hHVIqUL3BbD3l/v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Ri0qJUcJLvITLMHUtWvDDZIWvxaCRscvs+394esqr8aNJ/cBtbH2FjnF8krv9PjsS
	 SlrNC+k1jfNPetSNWLJOqju3DhZpaOoA1xkBkYFcNmMtAwLIUycs7lxhssENP9tJcq
	 /uJXro2/f3gZ4F4HnmeXRx22Syf0FCaZmc/xflCyKT6R/KPR1gGBdaelyVtqePA/7i
	 MN69q2u4jmu2Be2OfeHVef5hrxFMYgJPwu3mFkEO6VqZHI3shz8iXAn1PHZztxngZs
	 qTzNuuIP7fvhbMus0j9FYXUsW7kp658q0oyv/fgNBOItsmytOCvfwje/dwAjM+UoXZ
	 5ZWx8Y2K7LU+w==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 07 Jan 2025 19:11:04 +0100
X-ME-IP: 90.11.132.44
Message-ID: <6abdef3d-95cd-4afc-b5d4-880c58f60e9d@wanadoo.fr>
Date: Tue, 7 Jan 2025 19:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] power: supply: add support for max77759 fuel gauge
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
 <20250102-b4-gs101_max77759_fg-v2-1-87959abeb7ff@uclouvain.be>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250102-b4-gs101_max77759_fg-v2-1-87959abeb7ff@uclouvain.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_101109_502988_78808ABF 
X-CRM114-Status: UNSURE (   9.77  )
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

Le 02/01/2025 à 12:15, Thomas Antoine via B4 Relay a écrit :
> From: Thomas Antoine <t.antoine@uclouvain.be>
> 
> The interface of the Maxim max77759 fuel gauge has a lot of common with the
> Maxim max1720x. The major difference is the lack of non-volatile memory
> slave address. No slave is available at address 0xb of the i2c bus, which
> is coherent with the following driver from google: line 5836 disables
> non-volatile memory for m5 gauge.

Hi,

...

> +	ret = max1720x_get_rsense(dev, info);
>   	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to probe nvmem\n");
> +		return dev_err_probe(dev, ret, "Failed to get RSense");

Missing ending \n.

>   
>   	bat = devm_power_supply_register(dev, &max1720x_bat_desc, &psy_cfg);
>   	if (IS_ERR(bat))

...

CJ

