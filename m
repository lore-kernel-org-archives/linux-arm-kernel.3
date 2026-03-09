Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CA1FCA19A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 22:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=; b=IX+ktWYZ7Fd83Uw/uu991AGLT9
	YhBmokNJr5F3BD3RXAUaWTpqCvp7OjkoDjhPY4PitcdYy5WAmdD/cs+yIiufjzfdShDMpJzq4shJp
	Z1VS345VN/bTzVtyenkYg75SiRrv8ju931tbWo5rflhTJwn4RWPG2t1FsMD7kqP7ckcqxLNzvgIUD
	8zEfmSgo80HSOsEKYCzMG2+QFm14U2VUOwODhlN5MK1uvw1MrHFnaWGe3m/QTfZjwg/SVGma4X0jX
	fnD72Pn7n7leArTtvNr861JRybtiMGMs8s+fShyU0gJILywI1BcPV0O0mhaTpLnM5ZeJWp0Z99tdR
	EJ+YswxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj1M-00000008DcP-2KGv;
	Mon, 09 Mar 2026 22:24:16 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj1J-00000008Dc3-0yMc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 22:24:14 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7d750eeaec3so449581a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 15:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773095051; x=1773699851; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=;
        b=EZUOr+u4NwMoKKocHPrbeKjsIjt4wSuPbuQczDzeSg8AXehLpKnfG9WC81kyjBX1wG
         1rhcU7a84O7f8cZP6PHv/hbuMJ4v7uAos5Ko4n50fPY3zLJPh+UDhO3nCfPAvrPzjYBh
         kOmp76PSq1m8baAqIGVNYRxloNVqoIgh8lzgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095051; x=1773699851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=;
        b=IWlOXNkWwAwQgRO3pCzXDsDZNnKeuz07RxUgcZAyjzVcW2xiiQrcvIO81wlRiKKnRX
         40XZ44wUY+AzOTKZs3jGPTGz13gb2t1+RGNgRBM/fjhmVnhrKN6NUbY3h0VPsJDCezis
         futVBlXQJLtpBJ5E+BijwM1t36yfM+FmRoOIjI0Vf90qWp/vvd1fclqp4GJuYV6egESW
         sFGPSspINZjTDsjcNGCV+kx88HW4XZkdvUM7cLHMNDoahazcrIwgzfk0NEZHQai31VVU
         0g67J61ysZM3etfCSccClwNbQstY/8SJZM6oGKhRePyOGHVWks3n/m69Kbi6TnhQvb+t
         hT7A==
X-Forwarded-Encrypted: i=1; AJvYcCXhM6jFmf/ZyDNW2SiO0wE/zLmiE6zlq/m44AD4WZoShlfdBUbzLkRbHsnhVLnbfm8IgCjE+FEFBqlG8WRInV7W@lists.infradead.org
X-Gm-Message-State: AOJu0YyQRykdYphYDJQo2+/+efuSR8BrKxmN1dwz0rM7oYwm8b2+zQ64
	tT6n1fH1+7XYc6peFHnWhaFMNy46AyT5YEUUTMrP6UCK7Srz1wD/gTJ0k//iQc7z2Xw=
X-Gm-Gg: ATEYQzzwaOvb/Ls+q+5GyTVdPkVvA2JzcSOyT7IIkHVXDbLZ4qODXPcJb0C7/wcFzU/
	/1HOj3E64Vq9q1CNFQFznJFMIQVYzMHvYf+VST5tE4Kx8wPLzwA8CD0tLoB0PwDvaTM46/XQ84p
	fcIqRXhBqErNp61Bx099XZ6NLqg19QW5Tws/B4Jqs3H0ODpPH4FGUgENcrX8QV+L/w7W0FhWQQj
	Im4PbggU0AxTPemyduzF2JJkH2khYgP18cnkD47NfElky78aT+Tkt69LQ5PX9jJuS1QJx5CmbEK
	NxT45rnygnqYNeNz3AlPDzKHUw+ZScbQV5CU5B9JpWlnnSA0JNqK8xpJdLiLv2+THgLT/mPZQew
	zrs0iy4VoSBG90p+TAe4W2ditZVJiuZZ1slRD3U7pLOXmLGUTQWQfz+kOns1JGCwkbykQi2YbWu
	1/t+DpOICAIRXW7Lud/GWf7ahxYDs1fx5+6d8=
X-Received: by 2002:a05:6820:151f:b0:677:d91c:2e26 with SMTP id 006d021491bc7-67b9bd3a2camr8004764eaf.51.1773095051333;
        Mon, 09 Mar 2026 15:24:11 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67ba42709e9sm5372733eaf.0.2026.03.09.15.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 15:24:10 -0700 (PDT)
Message-ID: <03136b99-1bcc-44a9-bfc8-bb4ee96c5414@linuxfoundation.org>
Date: Mon, 9 Mar 2026 16:24:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260309205532.1794202-1-shenwei.wang@nxp.com>
 <20260309205532.1794202-2-shenwei.wang@nxp.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260309205532.1794202-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_152413_584003_B2940D7F 
X-CRM114-Status: GOOD (  14.21  )
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

On 3/9/26 14:55, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the remote system and Linux.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   Documentation/driver-api/gpio/gpio-rpmsg.rst | 266 +++++++++++++++++++
>   Documentation/driver-api/gpio/index.rst      |   1 +
>   2 files changed, 267 insertions(+)
>   create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..0f0a3ce3806b
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,266 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG Protocol

Let's expand RPMSG for the first time. Looks there is another
RPMSG acronym that is completely different.

The rest looks good to me.

thanks,
-- Shuah

