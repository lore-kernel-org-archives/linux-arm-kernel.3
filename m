Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB95C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 09:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZBSp4l8TaYQbbpAeeyk8Mb3Y59RuO3+HThMa8fdvss=; b=iPljafRfY5bxlHxK6MywWtcvYW
	lEEN9lCzqiaxnddffWxdS4ZAUOdvNDeLfctYuQFglTUH7nLZm8byJeW6gOOnPVK2sZcr2WYRL2uf3
	N4EhDjrUNAvvGFMq1l1pCGs9jQqqDHs96hdC2ka6+LzLbd/GxJ7DgrElxRcehYDXTnLKJnEb4tIqu
	UXsKTuFt53nUrGgKIVvUs8ZaCeta0r4PPnSvOT2Z0J+WgTb8217+yrkWOD6lB2gQ2KRd8rR9j5Kcp
	JV2ZanxXIj78iT9+KOXj5F6gGS6CzPfDPEq5YPfTaqxNK/yiZHmDjGc8PkbxS76QNDzAZADdkcGT1
	Sp0xyegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teVvX-0000000DYBD-018E;
	Sun, 02 Feb 2025 09:06:03 +0000
Received: from smtp-76.smtpout.orange.fr ([80.12.242.76] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teVuC-0000000DY62-2qtP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 09:04:42 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id eVtytmLlOJkroeVu2tTSNQ; Sun, 02 Feb 2025 10:04:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738487072;
	bh=sZBSp4l8TaYQbbpAeeyk8Mb3Y59RuO3+HThMa8fdvss=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ONl1dZ8E1bTZ9viQhIuJ1pQUb7MTmrSs6Hy8KzQ9NXmvVe3gI4u2BXh3Wuj5HmIE4
	 hQKnH56s5IB0AfpgvLG49EVXA16w/nFNkxL9WnTJy4xPd4AuP6og86Bu2CqNLh71UD
	 +hd/ZZTq97tsD0rvhOXZ+Ws54cXIAbTpLqSwtVnGB1+CxIgD9eHzn8LrJTbtw/GNRn
	 0PNejG/xfjxbI1EPvhA2EcqgLTxmjbsevI5GzRq9B+13WmgApmWZ3yZoqI72iiIOU7
	 iW+IEqWX3FLQpnhKBPWGqvdkHITB+MVty3aWrKuumF+jQQ4zXUH266N3SYJ4NLVUHV
	 YeMxMxm0Ff7MA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 02 Feb 2025 10:04:32 +0100
X-ME-IP: 90.11.132.44
Message-ID: <7d9c2a9b-dfa9-40c3-8d34-92c40cea0842@wanadoo.fr>
Date: Sun, 2 Feb 2025 10:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: alexander.stein@ew.tq-group.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peng.fan@nxp.com, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, srinivas.kandagatla@linaro.org
References: <20250202-imx-ocotp-v7-0-5622ba16451d@nxp.com>
 <20250202-imx-ocotp-v7-2-5622ba16451d@nxp.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250202-imx-ocotp-v7-2-5622ba16451d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_010440_890126_8DBA73E8 
X-CRM114-Status: GOOD (  10.21  )
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

Le 02/02/2025 à 01:49, Peng Fan (OSS) a écrit :
> From: Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
> 
> i.MX9 OCOTP supports a specific peripheral or function being fused
> which means disabled, so
>   - Introduce ocotp_access_gates to be container of efuse gate info
>   - Iterate all nodes to check accessing permission. If not
>     allowed to be accessed, detach the node
...

> +struct access_gate {
> +	u32 word;
> +	u32 mask;
> +};
> +
> +struct ocotp_access_gates {
> +	u32 num_words;
> +	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
> +	u32 num_gates;
> +	struct access_gate *gates;

Could be const.

> +};
> +
>   struct imx_ocotp_priv {
>   	struct device *dev;
>   	void __iomem *base;

...

> +
> +	return imx_ele_ocotp_access_control(priv);
>   }
>   
> +struct access_gate imx93_access_gate[] = {

Could be static const.

> +		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
> +		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
> +		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },

...

> @@ -183,7 +308,53 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
>   	},
>   };
>   
> +struct access_gate imx95_access_gate[] = {

Could be static const.

> +		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
> +		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
> +		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },

...

CJ



