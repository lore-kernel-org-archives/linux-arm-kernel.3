Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7478C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tKVO1/yFtKo8AxMa+9eBPIXNrWvUam3daAFVJ/GPxo=; b=4f5zXR/V77MUeyvbfCldEvJGip
	jbyai06eYGka/YE2P9YP1Wcdaf6P9i9Gzn1afHTvLLOz00xgEFYn7W2Zxv9kNltFXEXal1fvsh0ZV
	gMMawYtIC931T/0Ggsddl6+vgfxDCEpVtZvtIKwVXLTDEFd5cAeTzLafHpTxbgi6wIAbdKxx33J8/
	+NYbLYrInMJbQpz5omHP5HuzQVqLzHKWOSHDvq1T6gu5yuCCJt3qAYsnxTGlqW4tMRQH7dqnPcH95
	XwpmxtCN9vL4c+I1q+2bW35jj+ljg/D9ypRFeU/PLM1TXx5A6Y5QgkpVvuKg3bGHknBM7+ccXMEj0
	QAWi3pZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppGC-00000008GSJ-2A26;
	Wed, 05 Mar 2025 13:58:08 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppEa-00000008GHZ-11ae;
	Wed, 05 Mar 2025 13:56:29 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ab771575040so156048866b.1;
        Wed, 05 Mar 2025 05:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741182986; x=1741787786; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tKVO1/yFtKo8AxMa+9eBPIXNrWvUam3daAFVJ/GPxo=;
        b=evZYnlILrmVb4volYPj9OTKOnzOAb5RiM0YnnpMTbfeLd/7zMwQa62OVSRHp7Hw2IA
         rUl86R/91tPKCDow/Tt7b0MPmvzpQ3toBKmM/XMsTBJwjUmq/AYQuqIm3/4Dn2Zx+9uS
         b0+ANExJBl/+32DLwpypH0PqxsBRrgkiwc0yB4DSoPXHEFDc9LAnVbTz/HspPG4niAFy
         LG4vdO2TpPC/Ve/AMaLPQ97R1DXSUB+l6o5ZrmKQ1JpKMMFhQ/js0IPlhoigaWCNbTlV
         mhoFzs3leBLBREtiCgRD8V+3vW5s8wep3pYdWAm5MBVc7kl5E1O4c71BkzoU02KW2Lwd
         G06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741182986; x=1741787786;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tKVO1/yFtKo8AxMa+9eBPIXNrWvUam3daAFVJ/GPxo=;
        b=lzCb/ICCpSoIsP1t6U5n5R94AA/TkXsBVoX//+UdyOuj9SQdAv6yl+8C7DufHjb9BF
         yVMAF6DBXH3XLHA6j2luxwQkTh01GFqMKXeReNCegOsBgBZlobRl31NLZ2xpCUo6hP6X
         naU1bXwURoZHe5YfG5cDZ04mbaVCdL78O5FXJBzB8eXTSUa9cO7JgbCEnENkk8LDOHAF
         C4YyEVY1I/d1qSiZcWLkN2EmPNY7ef6O3m7uhCmoba6EKVT93wCLBf1mvEVoklBLJmVF
         dA9X3lZrnS1WaOMrb92iNoqPp2TXp71RSAnMw+kNii0sZNH2fuXYnI/SAlSP7yYmbGZE
         Avuw==
X-Forwarded-Encrypted: i=1; AJvYcCUeOOVJALZIPXPxLLDC2TdNDzxokhybSLDByOgBnAqnHnyMzTn0b1r70HLmS2+gvu5yBFI2CYLXRIu0Cqh3J+BW@lists.infradead.org, AJvYcCV09G6eIwL/X2hjGS0tFOZJT9Oc+6UD0jRhCkjHEBXBgq9zLaVcPYuUeV4cdVMr4mJGdGjmpj8sGBlrFLKpZh4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuQX0IV1FjfdarlnZ6BF7GewSp7yu7TRiFznnSa4WBprG5ASiu
	Ij0X32b2W5xsN5tXHbjgv/9bYdn2auMqAr3/4mnTkNTYtR8UpHzT
X-Gm-Gg: ASbGnctlMnoeaf17gMyr6a+43fLmf0sTe+uQXpFnLSreSmYEwhMHviNDeeVZMu3S+9S
	tJWdru9dGjZ/INuaySh3+OvstMbOb8DUMAJR9JkVdmTgBERcyH4AnTXXi8jgNFkCij001Z8A3OW
	ZYlmZQ5PxOUlF/JBpse5wY57jiDmkrtYlUlBOUC7h4L7u9cQlh3A7XMcaErvHmvzGqfxNhPRrhB
	XkWo3971OcTHeV4SDrBBbaPpR8uL5ltrRdoRN+fw8N0T1syHjuOHgtNVVQr4a8p2gbQlW0Ptxe9
	goFvWWJDgbJpAi5383goNjR3l5vNCbTQNpbzlIO8GNsNigtU9USFUBqqfBvHp1KlQMmml2dASWi
	utrruYnz5NKse2li/3FZAuhFwmQ==
X-Google-Smtp-Source: AGHT+IFPKwZUivV9o2egwM9HtqA1X+Wqp5ZNIRNxx/29F/9iRwcSuupsGjgksk9DPk6Csl6LQmklyQ==
X-Received: by 2002:a17:907:7216:b0:abf:6951:4bc2 with SMTP id a640c23a62f3a-ac1f0edc6b9mr612346766b.7.1741182985565;
        Wed, 05 Mar 2025 05:56:25 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf7663b935sm550196266b.150.2025.03.05.05.56.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Mar 2025 05:56:25 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
Date: Wed, 5 Mar 2025 14:56:12 +0100
Cc: heiko@sntech.de,
 neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com,
 devicetree@vger.kernel.org,
 hjc@rock-chips.com,
 mripard@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org,
 robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_055628_282135_132C502E 
X-CRM114-Status: UNSURE (   7.64  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
5 mar 2025, o godz. 03:30:
>=20
>>=20
>=20
> I only see the HDMI connector from your dri/state ; so it appears the =
DP driver hasn't been successfully
> initialized=EF=BC=88I think kernel dmesg can tell that=EF=BC=89.=20
> Have you enabled CONFIG_ROCKCHIP_DW_DP ? This is needed.
>=20


Andy,

Do you mean CONFIG_ROCKCHIP_DW_DP or CONFIG_DRM_DW_DP ?

If CONFIG_DRM_DW_DP - then yes - i have it: =
https://github.com/warpme/minimyth2/blob/2e267842b1033bbc4c2c5d80c1756a142=
e347cc5/script/kernel/linux-6.14/files/linux-6.14-arm64-armv8.config#L5024=


Kernel dmesg: https://termbin.com/uiup




