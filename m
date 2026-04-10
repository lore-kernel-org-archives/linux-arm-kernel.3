Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF111F459EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rdw806p54hv0WYSi4dT+YA4YfP2LywL8N5qs00NGoaw=; b=Y5a7sX+UpKJ8NWjhapFNE9qNyE
	txIJ/rpXY8nx/yOypj3RPOiB28TZshOLi5yZ0b/cLwY4riT6403LJRxXnWMU5IsAgW59fEoY/Ocnb
	66d3AHIdKVVoF5ZWyYUFpp0H1w6Ndsvp4VPiRICEEl2ZwFxPkJtBd6GlilV8NiJRyi+y/m3NTa+0p
	7npCgYTFbevt7uDSonxeVA7GM6dsN0cgPo8kWu8TzmtBGhpHe7kefSGG2IhezyLPxJaNHJS6lopVB
	+VXuYFImeyEFpN6BYqzSSxlw3dGXmnLSVBv5WVQV9SSh/8d/qZRHVdPK7MsOtwBWPqoxEgGCH7EXT
	sg6gsCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEMV-0000000CVoA-1BAK;
	Fri, 10 Apr 2026 16:05:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEMU-0000000CVnv-0AIg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 16:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Rdw806p54hv0WYSi4dT+YA4YfP2LywL8N5qs00NGoaw=; b=DwgkMciaR0w9PylWyWZy0Gxx9J
	aiqEZrxLZR2kTsRWG2alpmc477B5kOEPyxk01v6+VTgtRU2qlSq10qBYK//draVsyBkDv5omojhlC
	5lZd7zVH5GTxPZaYNBibHZmrHLdAivsGJiutFzpl8RlvMdwYG+6NaMn9mcktFdug7p/pdg+huIdVv
	cEG7HCOzzjIGTLVSEGtqDbfrmLL5SH9fuhn37ueg064c0f2nDPOSOKSiUbfH4B0K8G+uz6SeBEaDH
	NxKDHOifHnv8uH0XmRfFs47wx2J254LzbxwXrn5ZpSPfnOEX3+SWl2NsouNPWoLKl3yO8JO8TUwNM
	01TykBwA==;
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEMP-0000000Drqa-3be3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 16:05:36 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1271257ae53so9647067c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775837131; x=1776441931; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Rdw806p54hv0WYSi4dT+YA4YfP2LywL8N5qs00NGoaw=;
        b=HeqJF98r2CdGw14vrrwhbdn9l7DjBW3dt+5+RAYOuPLkW2tbpRSOPnhlOknvw1AcIl
         v8Aj3dSGiZw/ZGASoZIOrDQSKwn8ZrjYg7ozWQtoNlxNRL9Saw8sR1Ueeze5bJr+zc+Y
         DvAJLo2hWnJU/wPafQa3OxtFc3X0r1Rukd4FmAFIT+vXnyAPfl1sXgE8efDeJb+e8son
         yNbF3xutPrGmo8Xm5g9TyWnIsa+uBNxAq1SZH+P/SDqa/MmeXRTvBUwiyjjGAmPNrbME
         rj9qKvYa6tFr342wTMyujJ6upR/M920UTEnhF570sELPEjUpfTliW7v/DcmR9o027aCj
         GcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775837131; x=1776441931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rdw806p54hv0WYSi4dT+YA4YfP2LywL8N5qs00NGoaw=;
        b=Lnmig7JyWG/4prY4XLXn67shnL6cuAfyE5yYG9j+VYTIMhuFEOw9SL7eZJ2Vx+Vd7j
         5Th+gHm1YHU5ntyMciKanL33mw3dY7RjPWOEXzFkWKjP/zvsLJQfW5+B8LVUvfSofkb6
         +m8wbwEQDwANY4roghcf2u/jAN+2+Y3MFCd/KbydW+dXP29xkLFmtOFLbKskrl1qeSnX
         ann95mafmuNFjD4U6iWpXlp95YUe7jvW+8VkuBw7aSeioYgyDgY4r5mMf0wzR7jsoxp9
         BDflVJN3uYrGBr2ghNWJ9SUs1Th+cmfbKaoZQOtrkba6U03cCtw/DQa+T7UlD5G7CwKm
         RwJg==
X-Forwarded-Encrypted: i=1; AJvYcCX0JMwPGVoAOGWukv7W1oYNJ/Dz7iL5g6u6qTM1WhLpdURvWXSqtEy9P34HbMkD2mYDL1sQqkV4IiHndwdde7A6@lists.infradead.org
X-Gm-Message-State: AOJu0YyNaJtVCjRUk3fIufYQNYKTvFFejIi6ubIYQUTFR5vGpFgy/z47
	mfav6YZzW6RFMykrk/rQFpuq2TNDcQiAdfuo5XuKnii1qaZlx1NwhAL5bJqBNA==
X-Gm-Gg: AeBDievRNJ/++V+iK5JfhVpCW84x84Tb3dAOWNbCYj48JMaNCv6F8LPE87l2sTKd2EI
	Zx8ELI8rPM/ug31OO0PcXxOAk5SvKsVWLY/LGKRPq3IZoTLQ6P/d0fXSGAtz+1sqXS5ifJtj7zV
	3l7Z/lCOQ42on24jsRYuVcz6r2XgWEI1stFivWBbprf35BYJ9H1M/ud5sCrf3qukEKw1/yYXg97
	x9Xw3DaJDN84+zs3EUwMdDGGZ7wmkbnV7N1qI21Rq0psDrXR5mFyO361amTKbhKxkhj/HvZfzDH
	tdXnSH/FBBJtQqWGP5NCIR1M+hxVBmPuxzkVtV39pFcyAxlUzdBX6wl9zp+LcJUlQI0RDpRD2Ct
	gJHzJaCmHdmv3k8yyOolvpIZHJoCm2HKPB/Rb2mUaMopiDU4B796g5N1AG1JnaHjNcCkyqxsCge
	X79K9rNLgFKxfXqHTPGkqY1w5IkKjPmA8VbG41Szo/kUUbrq14Qp0jmklI58b8q7Y89UsTJod8P
	GDvwOXI3HI=
X-Received: by 2002:a05:7022:492:b0:12a:6c7e:bef2 with SMTP id a92af1059eb24-12c34e68eb6mr1904050c88.7.1775837131226;
        Fri, 10 Apr 2026 09:05:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c69b3sm4849901eec.1.2026.04.10.09.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 09:05:30 -0700 (PDT)
Message-ID: <54fec616-3cc2-4d73-9ddf-aadcf41c924e@roeck-us.net>
Date: Fri, 10 Apr 2026 09:05:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] hwmon: emc2305: Validate fan channel index
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
 <20260402122514.1811737-2-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260402122514.1811737-2-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_170533_988306_24766BF8 
X-CRM114-Status: GOOD (  16.05  )
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

On 4/2/26 05:25, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The fan channel index is used to access per-channel data structures.
> Validate the index agains the number of available channels
> before use to prevent out-of-bounds access if an invalid
> value is provided.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>   drivers/hwmon/emc2305.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 64b213e1451e..0b42b82c8e22 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -548,6 +548,12 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   		return ret;
>   	}
>   
> +	if (ch >= data->pwm_num) {
> +		dev_err(dev, "invalid reg %u for node %pOF (valid range 0-%u)\n", ch, child,
> +			data->pwm_num - 1);
> +		return -EINVAL;
> +	}
> +
>   	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
>   
>   	if (ret)

Please address Sashiko's concerns regarding channel index validation.
It seems valid to me. Feel free to ignore the other comments.

https://sashiko.dev/#/patchset/20260402122514.1811737-1-florin.leotescu%40oss.nxp.com

Thanks,
Guenter


