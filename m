Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B532606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AtGsYGSQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=G3LODfbo;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GVhZfK9L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8TTgnEslfhmARTzLvGf2WXLm6wVd1Tp4w50+BJAZBOw=; b=AtGsYGSQc6TNla
	6HIvvTSfxanMeEWKBs8Y9fbjb39/VRo49IDSKVM3cNopBxzjIl/3ElGmcurC3Jy94bJAA4Dzuw40i
	Aw6Lp9SgE+jI9SLhB8HNg1H46wlrf7k7xg5ZhXNLqa6B+HnrM2K8FUi51F357vPdaywcolMt3kdXj
	ntk4PIzcx/p+ICNAa/G46QmpDH8u4WC2EEirJ3A58oc/Eon39CN/3trsWuXmvqb2SBs9TyEujXfZ+
	6dlsrZntfDBiRRjxw0Y8dXBL4wjbGHkueSnUXIAhkQlbo2Ix0fjzvICmeipHtgS2P22nHCKdAPgWk
	gSngqaNRBpPZ3RsUnBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP15q-00000009rMY-1UZm;
	Thu, 05 Nov 2026 17:17:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP150-00000009qn5-3l4S
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8TTgnEslfhmARTzLvGf2WXLm6wVd1Tp4w50+BJAZBOw=; b=G3LODfbo50QZF9/DxYLlnPbw2L
	89zvu3hEX4WybYrnL2MOfj/gimJgCEvZ080vf+m3uM8uq3lefpVg+DqgUsBnwxeWm0GEhrFrfFNYc
	4h7u2u4rodcIKXzhzQNcRg4RVwYBNGZb4Zpz4JEry4M4DganvRBIYTpvh5soSJMlolaAswQ8JYWLP
	aFjUxvfy+i+2MfJPg/0qSvcZ5pK8J1w/JFVQyaVhmjze0Lr/yZFXV4jmoeM8VcQkO8JZW00U9rnEu
	2/tL035ZddCrc9zYRthCJgH5Ik+3CMjvYARRDGpNEF0jluaOvHfItENHsp5698qFUAUn+chxzTrUW
	2C82FZ4g==;
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14y-00000003KWd-1S79
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:49 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-36d6765756fso2629093eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793899005; x=1794503805; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TTgnEslfhmARTzLvGf2WXLm6wVd1Tp4w50+BJAZBOw=;
        b=GVhZfK9LpJx6RyJvySUEtN5hUBlGoK6TIFfaarJ29FoCgHH5sK06lQZppmW74BLpHy
         vAO4KPTQriGUsVE984WTUyipmNyaf6B1Ux5b4CaGHCpQ8zj2hRvcDZ2XuqMHPSzOcpRA
         kZHJXrZrmC9z5NqbtSiYjGw/37DqzG12z3E8j2m4U5CJH8lR6Gp3kA1S3dY7GqKEdd/p
         PucYKkJ0/e3mbI0GsqXreUiZnnE4g5McGj9KlQRKlpJJ+eR5TbwA27Tgk8U5fYRnmyME
         vVi/RPI9WBiLpFLTTd+n7sPIJk5wX9OtFYahRPxB3a6PACnApfX7dygSNt1cn6bV8El7
         xdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793899005; x=1794503805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TTgnEslfhmARTzLvGf2WXLm6wVd1Tp4w50+BJAZBOw=;
        b=XF2XOuGFX24bzJs/TyUS49GihYjWh1Cq/D3lu8FwCD0HGKVkiS/olfR+4lKhOq2R0L
         c+m5QL/If4IBAukr04724fmqSgaVGoGxt15FSP2Xs9Xjzmjeu0EYV+5xbodoHWQ0oCdh
         ca3qw4t28vfYRUjr+vfCrkj7mN8H+BOvYDcFTy10Kp95+HN2LQANVkfeFLY/rr2Paki2
         FQfYxY7nJLzCCKTvSgx8iLq714wqfHm3okFeAYZ9jEc+XnBUfwCdX32uKz62C0zYEK9N
         Q/Y9RbS5U8H8brKK/hlO7P+wDfn4O+DMtSOEHegmdCTQGd3zKXtn6FdFSpiR23pgcfnQ
         2uCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy80mJhYubs0rD41idFgcX0tIx0CmQGIQ2PKzBYAon9vbojAcVQkYsWk1sHwlGTJl5/jCuCNrnd8p/F/GFn0Bo@lists.infradead.org
X-Gm-Message-State: APuU4Z/AdCeSosbcaGyL+ly+vfRdvC2o2onlVqGqRvXZ9i3v1PHIZdZx
	0K/1rB3FtcGiXq1gnxZ/El1qWq2hKCGolJSdjQ3ugFDUt/X5rxuoH28I
X-Gm-Gg: AYBFou2W08AACl4virhn9wBmiEQK3D24dwmYMvv0o7pe0Z1xGXo4O3KS5CyGhgFI3BA
	yzSxajkcKQwVub5W705F/V7utGp43xzB5GnPRDDqdEx0BztXI/91qNam/XjpJ+DoF/Y5YfnsFkE
	Oz++dj2YBtiJjd3i7KHLSPexC2Pj4pxMPxxWBSCleClt14QPGImPy0Z7IY+BfkqZZgc7WIUOKqy
	50FnwC88sX/twZ4NTNTBDaFPkEOO0L3p2japt6DfxVej7JtRtLvyo9MdY/nh+W1AnOaUZCSaqn5
	UmR4hPEmgbI5Qw4zWdsWMo72jLLcM0Pq6DyEsm2HykvynhAaZkWU5FkUnW1w/pWR2Syij48hvOn
	H0WUreU+ZqJdtwWulX8M6RGI5jUOG5Gvy1aHbla/etvWcpJZT95ClYKjENmeM/4SSOi/T2NIvQ8
	pGhrTM8U/HC4NsyGTRb7VHCSzPWPObns1SSIpouV+N3M/cAKrVvA2A900PB1DMZJkt14SBc+68k
	42ZruZH/r/9kUiBSmQhbJZ53TsRQhC1p0RCInMUgmFV2J617ikYqFM6OwsyN+k6AhmMpJHeuNRX
	TcBnb5bnNPjdLQPa+LnPCXWuk/CtEYZC5yscSWVAtiuqtDnjjM+TLfXNsE2aKwa2XQ==
X-Received: by 2002:a05:7300:cc96:b0:36e:b3e6:ebe7 with SMTP id 5a478bee46e88-36eb3f677e5mr2158998eec.26.1793899005312;
        Thu, 05 Nov 2026 09:16:45 -0800 (PST)
Received: from ?IPV6:2620:10d:c085:21c8::1368? ([2620:10d:c090:400::5:f848])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm24181600eec.27.2026.11.05.09.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:16:44 -0800 (PST)
Message-ID: <2376d06b-80b4-46d9-8540-8baf065b0326@gmail.com>
Date: Thu, 5 Nov 2026 09:16:43 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/5] net: sparx5: Drop redundant POL_ prefix
 from POL_UPD_INT_CFG
To: Daniel Machon <daniel.machon@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com
Cc: robert.marko@sartura.hr, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
 <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-1-b45a3a26bed5@microchip.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-1-b45a3a26bed5@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_171648_282974_526131EA 
X-CRM114-Status: GOOD (  18.21  )
X-Spam-Score: -0.2 (/)
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



On 11/5/26 5:19 AM, Daniel Machon wrote:
> The macros for the ANA_AC_POL:POL_UPD_INT_CFG register are named
> ANA_AC_POL_POL_UPD_INT_CFG*, repeating the POL_ prefix that is already
> part of the target name.
> 
> Rename them to ANA_AC_POL_UPD_INT_CFG*, so that the port policer
> registers added in the next patch can use the same short form.
> 
> No functional change.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>   drivers/net/ethernet/microchip/sparx5/sparx5_main.c      |  6 +++---
>   drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h | 12 ++++++------
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> index e039f5369b95e..68c80c63f9087 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> @@ -616,10 +616,10 @@ static int sparx5_init_coreclock(struct sparx5 *sparx5)
>   		 sparx5,
>   		 HSCH_TAS_STATEMACHINE_CFG);
>   
> -	spx5_rmw(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_SET(pol_upd_int),
> -		 ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT,
> +	spx5_rmw(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_SET(pol_upd_int),
> +		 ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT,
>   		 sparx5,
> -		 ANA_AC_POL_POL_UPD_INT_CFG);
> +		 ANA_AC_POL_UPD_INT_CFG);
>   
>   	return 0;
>   }
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
> index 1464fd1a1d447..219c7f0e516e9 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
> @@ -939,15 +939,15 @@ extern const struct sparx5_regs *regs;
>   	FIELD_GET(ANA_ACL_SEC_LOOKUP_STICKY_SEC_TYPE_MAC_ETYPE_STICKY, x)
>   
>   /* ANA_AC_POL:POL_ALL_CFG:POL_UPD_INT_CFG */
> -#define ANA_AC_POL_POL_UPD_INT_CFG                                             \
> +#define ANA_AC_POL_UPD_INT_CFG                                                 \
>   	__REG(TARGET_ANA_AC_POL, 0, 1, regs->gaddr[GA_ANA_AC_POL_POL_ALL_CFG], \
>   	      0, 1, 1160, 1148, 0, 1, 4)
>   
> -#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT   GENMASK(9, 0)
> -#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_SET(x)\
> -	FIELD_PREP(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT, x)
> -#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_GET(x)\
> -	FIELD_GET(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT, x)
> +#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT       GENMASK(9, 0)
> +#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_SET(x)\
> +	FIELD_PREP(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT, x)
> +#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_GET(x)\
> +	FIELD_GET(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT, x)
>   
>   /* ANA_AC_POL:COMMON_BDLB:DLB_CTRL */
>   #define ANA_AC_POL_BDLB_DLB_CTRL                                               \
> 

Reviewed-by: Mohsin Bashir <hmohsin@meta.com>

