Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0862606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fgsOLieO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vb6nPdvs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=; b=fgsOLieOVeSyIV
	1xdJWIpMckVSDxEFbQ8lk+PRqUbBALh/ENgMt/TXqy6Gsae6iROUcA4kWCAHnAKbrv7xtBZsBbVNU
	JrBa7BfEmHFyDpG6IBStn0N2w2VTikzj6iAXUcFrXpQvFUEWU80pGzDRy60RcPWT7KdWuHVXKKvqy
	ii5jyYM67gApF1SQg5nNTR4Aw/kCIytsk5Gp0qk/+vD7mlYPHg7RPUiDWWStYriQJp60ZGRO5D06/
	Xhr+IGMNnHMkAPPXLzSTuFU3oCvG/hOjd5/9rh1Us0Ih1zlSpjPnB+jsiwa2CJo6YnGVFCunfKnkR
	/7VuGAWkC2UwehzPgsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMh9J-0000000B0Gk-1vtJ;
	Fri, 30 Oct 2026 07:35:41 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMh9G-0000000B0F3-1xlP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:35:39 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso60996366b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 00:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345736; x=1793950536; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
        b=vb6nPdvsQnJ/ZffF73D0TNmR7LpVSBB4tW97aKT+nLwVGoRcn/KLKJBtSMRplFYiTE
         yPqNoBMKtYtmqVlAoCnzd65auIy8dQwB6m5i+JzUlYS2MlLhzm+N02uo5h2eY1q35zH+
         NhbmJoUW/lxrri6zHzg2xY8b3KQMlx8wHk4uZwS4OLNZfdmLCWw8odzDQ0awFvTzeGBL
         MNvv2U8Yv4WTzq5L7dNrXliKXJ5tiA0NvQk+bBbTk4LBs6LV+74HExY1cmYosMOM6vbC
         nq5wZqjeaxXBIHzNH5jzNG6ekDTKzfn5afMpAl3xF14W7sJrdSxU47aK5PWFqamwRLTA
         o55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345736; x=1793950536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
        b=xGiP//+3Y5Uswo+VLBV6PiomelfX/hrPWsumzufTavaSa6x7dzVbE1S/lR2Ylig3I1
         3LbzuNE4Ze/gghI4wYrxvjA1hitd/88zsbWUATMohl54c/OYgjf5XPSwnnoRFRmKAcZL
         pbFCKi+aZje22Z0s7yi3h8njuKuo9hhPAxUd6HRGqoAKcRJrBbb2oUIcLdbs/MSvV8Az
         SdpwlfNA6ijao9I2CdJWxU9Z1y41+3DLpNjy0rVtk7S6f/s/NiBvdtby1MoG67e9EU3n
         RD7Srg1+GJANdgv22Zqeop+Rcm0NOcYwEfPWV1zMyR5r4pYN2LkgNg4rlEqOkCPINcV5
         HM1g==
X-Forwarded-Encrypted: i=1; AKwUvByP4VTrI/VkcQjfCwzA5OC8x9oc0MrZ0vsOKiPdDW170ezlOvbqbN2oVhsBMatG6veVCaCnLnTXcdIh4WZPCyf3@lists.infradead.org
X-Gm-Message-State: AFq9FYKXOMBHZN2iBNDsXIqfdysHyZq9gm8bamBY6jx3Ev0BsHbPTNa8
	mtWVLXyBxU1HFQEIt5gvdgLe+W11KJJcKUmSC4s15gW5+8R25tk8zbM2
X-Gm-Gg: AYBFou1jqAS2DzRmQxa8xEFqfq6ulZisZM2ltjBOlDnssCtDTTZyax0rvBNm+155QG4
	a68FCMhFDWwxqVbbIGs3Rqf6W/if7wgYuLT6BCapYzLi8wFgxLbwRzhpqPyy5ScjrNIKNC80+dv
	a5McVrv6wo7Aisi+TZuMgfb8RGq850pZ7dkkeziqTxw2/y59bcA6PTOpOLpJ4g2OTUNe1hbD3yo
	rDZRbR0R4eKDkKj/ZSwbw/mWiYK8QIYTxmk0Ei9xAZzU5uIj8Zt9ZBKmbwAo6yLxFUpJcVAdHsi
	hFx8uZhXwvdkF8UtfvkpTpI5VeYkS19V9RfX+twRitpotO837vKuVLDDU+NHK6+WXBvTMG31hvb
	7uH/jjFBhGCHBDBvUIYCvUzKdN/5eT2tisXnvzxTtDf2vKekR6+zvNoGRS6hMU+KbaO28aObhbx
	ciLwQpo64cRQfeGU3SCKSUJ/cPx6GuSPPk1ZnUeeumJjPtsoTeCboUyqwEIDUXjhnpPFCvX3N3O
	59MjyJOoY9dKcChaqzij2moZSVu61Kkwhxj529oA8zV6NBfPae0DZClj5WdVX8Xw8lOIgjxl193
	kje4wi/w3ytDSXgm0RkeedX2aQ2tHh9fc6h58YjH5ixDC7M23OEUtnzLELVtBLUPPwf3jLUVfI+
	zV9u1Fu25tioQ0rkRPdrSVm4Mzls1sePJsDI8Kpplp1tgwg==
X-Received: by 2002:a17:906:c14d:b0:c40:4f39:22e8 with SMTP id a640c23a62f3a-c4ca7acfb41mr120166166b.44.1793345735937;
        Fri, 30 Oct 2026 00:35:35 -0700 (PDT)
Received: from [192.168.1.229] (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1920csm34203666b.5.2026.10.30.00.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:35:35 -0700 (PDT)
Message-ID: <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Date: Fri, 30 Oct 2026 08:35:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029105908.22809-1-sn125164@gmail.com>
 <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
Content-Language: en-US
From: Jacob Procee <sn125164@gmail.com>
In-Reply-To: <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_003538_512858_E2E4129E 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 17:10, Martin Povišer wrote:
> Rewriting admac_cyclic_read_residue to avoid the race altogether would be
> best but until then, your change looks to be a strict improvement.

Hi Martin,

Thanks for the ack and the extra background info. I would love to take a
look at a race-free version of admac_cyclic_read_residue() as a separate
follow-up patch; v2 of this fix follows shortly. A complete test setup
is ready on my machine that traces every position read and logs the raw
registers. If you have any pointers on how REG_DESC_RING behaves, or
already have a direction in mind, that would help.

Best regards,
Jacob

