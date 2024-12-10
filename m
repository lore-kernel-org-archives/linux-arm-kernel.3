Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676F2E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCSUmM6tJtHk1cryES3nVKP4N3a8/9+7aIRBtf/l8Mg=; b=RtzZfIRp41AtI0WFMqBb16tfXj
	Uvek4kv+W8hcUwmCBNWPOW5U70qZq0y09L2svvrLyxP9sLRyz2fVgIo/SrMY2uBba7JJC9dq5cWVR
	M/c10dnA5DcOdKkh32p4INgj3/K3qBw7BprdmXymgbMwwjwQ+42IFs34d7AsVGmB+uukZwXtHydec
	V1X08s6ORpxHiwq2sU5VoVj+5G9x5BIWaNU3x5QKAItyVN4jndOJ8eoosfZC02Gt4633sXLxRekw9
	zIEZ+Chmc+0ItjQRK0M0PyXupcxMxz4Mx572nVltrpF++EywJ0LeJcRxhHbq9Ytnmu5MxdN+ORwE3
	g/e5fy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Ry-0000000ClgQ-2eCR;
	Tue, 10 Dec 2024 21:07:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7QQ-0000000ClNU-33XI;
	Tue, 10 Dec 2024 21:05:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa676e4f36cso41603666b.2;
        Tue, 10 Dec 2024 13:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864745; x=1734469545; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCSUmM6tJtHk1cryES3nVKP4N3a8/9+7aIRBtf/l8Mg=;
        b=nXictbvstimug/X0/RkJ51DxClwSer51EAFjs4TB4P73Jx5Kk7LPXRVZcJI7B7uS/L
         KFtdXAkAefLQl+lCiNcMI7d1PztWRf9npqdPJ7qtsw+OBy3yV7yf73V1+as06xtkndhB
         9YLH1Mm13WQkfi0vcOY06rZ0qi8k3xzWpAxo51NFvwEoypufzfu1tQjB1T9pwp4ljJw4
         rZ1srkzJXgYUZCXvekk8wQoWbWp9xpB3IPrxskDdJAviTiiLya2avuBYqEbUPA8AlPB7
         8Sul7CMCzc/KDK1gO5r/N/rsShXGl1Va7CX1fXNYYS0uHhc0Qsk5Jd7GvV4uzuhK1JhV
         q4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864745; x=1734469545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCSUmM6tJtHk1cryES3nVKP4N3a8/9+7aIRBtf/l8Mg=;
        b=BOGeYDd3rKiXWdw3pMQNWJjgU1LSPJiNGSfeWBf22JGGWRlw61BAuoYOcRVJHQHmYO
         0eGDKwfzl+d/nnmx/3jxKysWN4GM9bkGsPR7g0263qWvWQU/uxsE0IdrsYcur9yEp7W5
         arf08gW6rAFhTjWVhihUN9Lm8XFcUlYoK4IsUgR55sw9UOCqO9GblLrvJLqP+VU27UNI
         QyxEQ1lkJ4T+WI8FLMRI1V2W2IQl5EfRHx4/81QSpBcsIjiMwEXzvZA0q4rYtYtRGBog
         To/Tmxdbybiqjx6+b31PO37XAYfKyTC1E6ESsMbJKHd2sSmSWWNDfDUy/oztK6sZDN1l
         LMug==
X-Forwarded-Encrypted: i=1; AJvYcCWUhgLYZGSEaG6SbWwvkEScLIDYUzShwm5NwGzhqMq8Q80YrzQFW9vLSH1bxVw3aephluTNnWWbBlNbwFJXgTAH@lists.infradead.org, AJvYcCWfByLiTpQvU6PRw3B9n3gs1cCt5cSi25OmyQETcYdLOq2/ZFwK/Ns8Yif7F16YsIdJZaGUsPY2bE9TWGVWVIQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywltj0r4BrdnGF3wdgzCZ191fHnfRC8xjyF+DnJ56ZFJvgFgGsY
	KGyH/UgyJo96H00N9VOBo14QLjIh9zApQKYOPmdB4ouVOBY2MNZY
X-Gm-Gg: ASbGncvNePiDsvTkm2BetJmSFQVl9K/yxMiYMyEjOhDPy0IcGm8hoZ+G5PpudIciwxL
	uXsJsf2XKc+dRaKwt2DN4hE3gIiX3ewPNJBX/9d+DqsznTOSZcYSc232GDAu+k8UzpjRpFRlY20
	cudYzN2yWRqcnXleIBpI6ujKqgr4tG+DTOmqLshG/m56BlPafUfBc1xv2um42aIuEc6tP6NUi/y
	EpPpy+IWpv9EgBGdss+o4Qgw+CtdcQINzM8oj0/9g==
X-Google-Smtp-Source: AGHT+IH6uzJqyl9gC3tF9Zg5rL20SJAzl4Fe1it808wM2vN5YRgy4x6E1uwD9tzrmWPmIFxFqiytkQ==
X-Received: by 2002:a17:907:868a:b0:aa5:163c:69cb with SMTP id a640c23a62f3a-aa6b13ad3abmr7899166b.12.1733864744607;
        Tue, 10 Dec 2024 13:05:44 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6a263efc1sm168094066b.68.2024.12.10.13.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:05:44 -0800 (PST)
Date: Tue, 10 Dec 2024 23:05:40 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20241210210540.jxhni4p2lrvdwoop@skbuf>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241209151813.106eda03@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209151813.106eda03@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_130546_799158_247349FD 
X-CRM114-Status: UNSURE (   9.52  )
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

On Mon, Dec 09, 2024 at 03:18:13PM -0800, Jakub Kicinski wrote:
> On Mon,  9 Dec 2024 14:44:22 +0100 Christian Marangi wrote:
> > +	regmap = devm_regmap_init(priv->dev, NULL, priv,
> > +				  &an8855_regmap_config);
> > +	if (IS_ERR(regmap))
>             ^^^^^^^^^^^^^^
> > +		dev_err_probe(priv->dev, PTR_ERR(priv->dev),
>                                          ^^^^^^^^^^^^^^^^^^
> > +			      "regmap initialization failed\n");
> 
> wrong ptr?
> -- 
> pw-bot: cr

Also, why continue execution if devm_regmap_init() failed?

