Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854D1606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hIWsutE+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y7Mxpf4W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=; b=hIWsutE+hUM5hO
	qzy0Iy7m0g8hV366MUSr3T7RV0D+pCy9HtpcW8vkpWRG8PUmj5zsjy/XJxwV8Y4chpsNHQb8x7IyK
	DgZ7PuK1Kv05vtVdmi6CDQr5L8UK0A7GRKtvESFthlJDhR3Sy6F35qW2c9XGVwXMGwtR6r+6mH16D
	vQLCDD2Fo8x3p6NQLok+zmLOxLQLgvRmaBgc9CofU1/TSW5lX2B+UAgE0W56RAoCxbIqp2QMOTYFt
	K0KfL9aN2ekd+OKalsbKTAfglczKiETdt6ChCu86GdwUohEKhcQPMUYCErHNzY50rw7qhbwxaizWB
	xzhRQu+MD6WyFYkSGR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhuZ-0000000B6ca-1rwL;
	Fri, 30 Oct 2026 08:24:31 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhuX-0000000B6bb-1I39
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:24:30 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso4376791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348666; x=1793953466; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
        b=y7Mxpf4Wiu4EoVcpWsYMVRcLRSFO0xAla5P6yIldB3gXH9dTP0umP0rD3Otqro2L2I
         0ZtRkp7So889lxgRj15B8qbOAKYuzZ+9Ab2hUGaAamWA2iJbtQIxzdiY5vwfEPao6IcK
         3xwmuB1GYCC4e7AyVO19j1EKa6fXEQAIJ+uYZYhcuWE73EFJlhgEqPzdjsI7eIm5SwEw
         o8CL+7sA/PiDqO6zB2vGhCJaV7F6l4rFAd5AUZ78LH5JP167ulbgXP3TgS5pJkGYqqX7
         76UPaSThTIix/BZYxwuzjwO/12P35S+j3uF4H88C+IQ7YlsiTImx0DI8FnHOvs1Fq6Ab
         RwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348666; x=1793953466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
        b=PTtKWbrQuOcwukgryrjh5Xla1x/cDmVjbg5lPq1ziioDHzQPWEkbWIYicTScYrg5cZ
         swRSKJGUtGZaCs0+scSTWNTCRCy3bNUiWYKrUVhe2udvItsDt3InDdRy+yG3V1FCUaRL
         r06lWD3xLcqUHYXbiayB/R4TevfXCmsdgsZ2C64DJ6rHeGSKoVuO3Tml0bMgjBbOItAa
         XbdsgM4YCOmDrmjaTpkCBD/XOGgWHmOSLOk2SwsHgqoYu3I6/q+lvPG+5gEERqBMdJW0
         yA+/OHXQW04ahLW30ADUSrbmHi8zGE62hJmZfhu+uS0rkY85s2e8xPuUnZJY0dxMe63P
         ROYA==
X-Forwarded-Encrypted: i=1; AKwUvBwLHTTNqoQGSEqlTfwi1nBttjQW7hP/eRY7IJgF3JlrwO8Msz8P8SFg9P9avAzYfwn2Kx0vuxDpATlKnoJIrI7R@lists.infradead.org
X-Gm-Message-State: AFq9FYJHmEYx/EpSF70X9EtxRbiNGCD11TGwYusKStBlUaTTLGv49GMN
	F+8+cf9wFeg9AGGhFcascADX81cJC1iv9w33wvoRvM7LKxmBaIdymJLD
X-Gm-Gg: AYBFou3k01HIf9jyuwHw/4rNni4tN55Fx5c/Sa202lJrpbllamDdMgCj0tTCJaOzyop
	834KYO4f5jMfgaPxePM9xVU3abChG5iWljkeq3+lru6PcIgUHJdRNP8WRgiBboPeLKWGReawIj3
	VWIx/Z+ul4jx4ovFSd95ArxmsB/nkBKvqG2HSDQhfgch1vd7mVPsIzUvkH6L9tSRsMf0PZdoPZc
	0uCKVOl0bZf9AJRiVmrhUXbqouZkuMHEDV08Of6HWJYUeRUZp6F3+N8uXnNHSdpkWs41xWuIMNx
	AKcT7kLtHtMTvuFIVhJ3uEaOQRtWRLLZSRedjC0NDMBWYzpZlqljlnZTXECaPJbfwAyM2Jwqg00
	MykJSOsGS15ncS7iUpxzI3uXtWdpMwJaaI2iAbzHyMo5dHtChCqaKded1Cu/l6ieMk6IcdIoY0+
	H7ihJDlgg3dR36Ju/jBvUSZjQk/Rt0hZv3zFTqGKHuUZf/d/E1mzZrIoPZwxqQslYoDh/GKfff6
	dbbMSa1GwTojP/tMd5e5wCgRiWDQSBtOFGe8p4Gi/+5y44dpqmo5/60D5GDN50KjEMQ/nEFvXfV
	VE81n+W4DKpJdFtzo50rA7JrSXX4I4V5llnxzg==
X-Received: by 2002:a05:651c:1a25:b0:3a9:a2fd:5932 with SMTP id 38308e7fff4ca-3acb7a651camr3189241fa.5.1793348665744;
        Fri, 30 Oct 2026 01:24:25 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf3f762sm1753921fa.39.2026.10.30.01.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:24:24 -0700 (PDT)
Message-ID: <a83ade5b-b119-44a7-a5b3-3a7ef2d4eb2c@gmail.com>
Date: Fri, 30 Oct 2026 10:24:23 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andreas Werner
 <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_012429_372046_7782FE01 
X-CRM114-Status: GOOD (  10.69  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30/10/2026 09:11, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/mfd/ac100.c                   | 2 +-
>   drivers/mfd/axp20x.c                  | 4 ++--
>   drivers/mfd/cgbc-core.c               | 2 +-
>   drivers/mfd/cs5535-mfd.c              | 2 +-
>   drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
>   drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
>   drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
>   drivers/mfd/intel_soc_pmic_crc.c      | 6 +++---
>   drivers/mfd/max77705.c                | 2 +-
>   drivers/mfd/menf21bmc.c               | 2 +-
>   drivers/mfd/mxs-lradc.c               | 6 +++---
>   drivers/mfd/rohm-bd718x7.c            | 6 +++---

Thanks Krzysztof!

Took a look at the ROHM stuff. Looks great to me.

-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

