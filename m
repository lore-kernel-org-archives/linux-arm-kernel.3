Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FA5F30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V6UJw077IAW7fFljs10GktrEjxl71X9F6H8UzRhx5k=; b=YtBZ6C6fothcMsafCpwAb0sSTZ
	BPTTUtvw8l8THWxr596vs4QZvPFVabWv6TIJrQpqkqyddPbPoJksZYjgx0ReFv8k+BausMIhmnN6S
	P9dwD7jSg7fWOrfEx3++WydNQ+7roO02CV3o1+AtCngOrUeQ4uQ38n/CV1Iq0fI0o7+dxKSOP+bJu
	2Vty386i8tInyqgLoCmzVCQjiQCYBgjmExYYbARqKPHAHBwchiNTWTOASmOj+sXrOtl5a8ODUNZ+j
	tebpVrgP09/y5dhSH2LLqhKgBzao8inSayYIdWSO8v/rlk2eyQsXdU7CHwDqvRji9KEAE5XrkGAia
	72lG4U3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Ks-00000001S2s-3N8k;
	Thu, 05 Mar 2026 09:49:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Kr-00000001S29-2PVN;
	Thu, 05 Mar 2026 09:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9V6UJw077IAW7fFljs10GktrEjxl71X9F6H8UzRhx5k=; b=oWlEnD00h2dfzlrtzZzT4BkqNF
	EETPyiOfAWevOoqRzc0Aq4y1PiWJf0XSxlic6VUQcO3EmAV85O+18Bfp5jCJzI+SRhS8dDrTwTBBv
	l0kiHIUwVWQhI0FBGOEhb82zRQx2CYJ8Rg01J6Hu8tnLZNecc4XZeslyuCETzdH0ay/scNSUXVLJp
	OpQIVOLttq2sZbKNRhHpw8PmvhT3hNIcrCcjHFEkl5xegtgtYekxJAcaSsoQPpiEoYdff14AnF+Bz
	A3zxZyhF0cs4eq479P+lx6V+sPajbXjeX2csOXeM/yA9n3xyeHoysitgIIZ/KpcwIFNmso2K03APM
	7m+PlDrQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Kn-00000006OGU-29XL;
	Thu, 05 Mar 2026 09:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772704168;
	bh=5Xcl9IFRzjP/3Rjz3AW1FJUewvUqAGHuI2zzD0ux2VI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OeGWRPU10+rZvx1DblhD0hp2BmLkizHoDFXqZEh4qkVv8pXhocm27N8qRE5iOzXSm
	 XKwdlsNi8O0OBdJ/2MpGrMrZuek+w7Jc2CNih/4EZMQIsf0yd2hlOgUyRX7WtMoO6x
	 riOPG1Nj4Uk9m8Gno2fOIg8IUCriIfcdWz7XWGZ8UWOPultZsLQY3cv2EG72Uun7PM
	 ddpg4i4/jGrRM4Gk/R1Ugj9C5NV+IKSb8Ez73zmgFXYCvGdRe2ne34pFB+NiwKkBY0
	 K0wbt45oVrEJyUAWi9i5rrHeaiHDfa492RiAs4FjSqmlHkNUNMhRpBCh0CpTXfaDb4
	 4PF+HK3XWUs5w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6034617E0454;
	Thu,  5 Mar 2026 10:49:28 +0100 (CET)
Message-ID: <e8c587e8-61af-4ef7-b7dd-7d8da7b9aeff@collabora.com>
Date: Thu, 5 Mar 2026 10:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet
 8/10
To: Akari Tsuyukusa <akkun11.open@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-2-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260304192417.818211-2-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_094933_666028_FABA50EC 
X-CRM114-Status: GOOD (  14.62  )
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

Il 04/03/26 20:24, Akari Tsuyukusa ha scritto:
> Add the "lenovo,blade" compatible string for the Lenovo YOGA Tablet 8/10
> family and add compatible strings for each board
> (B6000-F, B6000-H, B8000-F, B8000-H).

You're adding support (a devicetree) only for the B8000-F though...

> 
> These tablets are based on the "blade" platform, featuring 1GB of RAM
> and powered by MediaTek MT8125 or MT8389 SoCs. Since these SoCs are
> tablet-oriented variants of the MT6589, they are grouped under the
> "mediatek,mt6589" compatible string.
> 
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 382d0eb4d0af..69dbe389515c 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -44,6 +44,11 @@ properties:
>         - items:
>             - enum:
>                 - fairphone,fp1
> +              - lenovo,b6000-f
> +              - lenovo,b6000-h
> +              - lenovo,b8000-f
> +              - lenovo,b8000-h
> +              - lenovo,blade
>                 - mundoreader,bq-aquaris5
>             - const: mediatek,mt6589
>         - items:

Did you really test this with dtbs_check?

...also, is the "lenovo,blade" really used for anything (bootloader)?

You can either fix that or just remove the lenovo,blade compatible... but please,
test with `make dtbs_check` before sending a v2 :-)

Cheers,
Angelo


