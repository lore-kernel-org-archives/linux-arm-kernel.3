Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68777D44D57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5+8CEF8PGrkpuoZv09AoSuECiDMudOpJZwqH9DLQBI=; b=dPYm17MyEzN8Pr4mWYUT+ssnYP
	jxaZ1xT7A//LQ95BKQV3jDJpL+N3I/Y40U1sASIu9gJthe/CfFeh5275rwQqJxSdiTg/3MI7SmQ98
	WGDh6jt63STwsSXRzt/lBKB90y0aCd7c05xIj2F60dXXdfJmB6H6ff8PvL2i6KVX4S+Y4jmFou1EI
	5EtEO3QwFCBcQvuEElNxNFn4D8WFCEKlUa9NbgJUliEMz5MI8D5osGAKFQSCia6JuGY1FOXLY/Fmm
	MimyewjibvIhV/qtPFg+6wFz3lcwZ0VA0T2H4fLQ+jmkDHtvEwWyS4UYvxzdEVqRPIsf4vZ7VCfY9
	vbMISJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ery-000000037fb-1c75;
	Wed, 06 Nov 2024 12:10:43 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dwC-00000002spn-2jgs;
	Wed, 06 Nov 2024 11:11:02 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6ea339a41f1so56590877b3.2;
        Wed, 06 Nov 2024 03:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730891459; x=1731496259; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5+8CEF8PGrkpuoZv09AoSuECiDMudOpJZwqH9DLQBI=;
        b=FNysykbxWlHXDb/xvGNM/Ww0GIfSWsWR6Fk2z/EPBeHCLhCg6XaBCPJ/1xbw+zBHVl
         j/WXWAmr/cJpZ1F9FuK8rGCZWIbP9PLpj1/dcgWhgENAC5Uo8pA8I2vzgUrvy5Rhk1jK
         frqb/DRMtt360kWSwLAxnMzO0s/EqcBZWgT6BG1U8KTsGlFOJYKtE1x8DeEDYvgh21cX
         qb/cSLGi9CZq6aX9CuskehxQ44hNFdozS11euL5p1Pm/ORSV/jcigYiDuBrdzU9s8/Ky
         WV/Ia3djjhlACBLjZR0r8Bynt86+NfCli8T3mNfBOVSDyiv+pNpv97eBFyiILd4eueS0
         9koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730891459; x=1731496259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5+8CEF8PGrkpuoZv09AoSuECiDMudOpJZwqH9DLQBI=;
        b=gCgxG1uveU98q4tamfKZ5oSlmNJ2QptK8yF0fbYsR7ZeflTyo7sjmDTK8M3qGRZIXb
         qm+cMOrJw9r9PfgmD+LzPEzxHO5IN/7PsMAPGSjDLr55pJsmbQVf/Pg4E4Ypm9reHFlb
         TOLJZBpJRndJ5ANDgcRjfXOx2B98YzQ9tKAStLM0ZqG7qywHBpcpiYcgBIiNek+Q1BuZ
         w8ygtCNdRfSyCCJ+7cGyIa62EYfuInFf935Y9GEFq5zsTBSstNafL0eKPLObPkVuis7J
         gV/l23LDY/2GfCficvapyrLdl2sQrzxyYjA3H5G0yl4b5S/vu/4SesvkLRIl9N5EleeG
         tbpg==
X-Forwarded-Encrypted: i=1; AJvYcCWsKintg5B7Liqt41doQZ7Dk5+vJfEv6fxzRByQ/uxv0rktJ9b+cDnC+UdPs9YDMAWVuOzi47O3vlo3BIJ3HFs=@lists.infradead.org, AJvYcCXB8lSO1Vof+9+C5cNyvUT372pEnbB2XHN2ASR+3yZOyVeftbl8Y8KmiMt1o0CF20sXj6FRsEP3r9BZZFffq6CT@lists.infradead.org
X-Gm-Message-State: AOJu0YxG5BrnmdEVm/2SE63eAe/XdDaV/QaP1ofhUQ0LQ6pdXZcSfMCb
	bvX4ns/8TWA3wUrf8HDQq61WVbGO1pR5vac48scKwQbvV1fS3nUPGVai4A25xz8Q7ldx3PXYBT6
	I8Zkytk5dvyd6zEioAwi6H9D48Pc=
X-Google-Smtp-Source: AGHT+IE1sZpZbBwhB3vfOzE1oN0wLqnxcz1wrnDPvGC+Rpg+zy6pts2342ur4zYg+bx25KKddKleEKnBLApVYSKJgu8=
X-Received: by 2002:a05:690c:dd2:b0:64b:5cc7:bcbc with SMTP id
 00721157ae682-6ea52520bb1mr244627657b3.32.1730891459226; Wed, 06 Nov 2024
 03:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20241028073015.692794-1-wojackbb@gmail.com> <20241031185150.6ef22ce0@kernel.org>
In-Reply-To: <20241031185150.6ef22ce0@kernel.org>
From: =?UTF-8?B?5ZCz6YC86YC8?= <wojackbb@gmail.com>
Date: Wed, 6 Nov 2024 19:10:48 +0800
Message-ID: <CAAQ7Y6an8ZkxYpJehd8cBRPHjqyQofc6A4QdPzM_dhh1Sn0nng@mail.gmail.com>
Subject: Re: [PATCH] [net] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to 5000
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com, 
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com, 
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com, 
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_031100_712161_B9F64A0C 
X-CRM114-Status: GOOD (  11.75  )
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

If the PCIE connection remains in the D0 state, It will consume more power.

Receiving or sending data will cause PCIE to change D3 Cold to D0 state.

Jakub Kicinski <kuba@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=881=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 28 Oct 2024 15:30:15 +0800 wojackbb@gmail.com wrote:
> > Because optimizing the power consumption of t7XX,
> > change auto suspend time to 5000.
> >
> > The Tests uses a script to loop through the power_state
> > of t7XX.
> > (for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)
> >
> > * If Auto suspend is 20 seconds,
> >   test script show power_state have 0~5% of the time was in D3 state
> >   when host don't have data packet transmission.
> >
> > * Changed auto suspend time to 5 seconds,
> >   test script show power_state have 50%~80% of the time was in D3 state
> >   when host don't have data packet transmission.
>
> I'm going to drop this from PW while we wait for your reply to Sergey
> If the patch is still good after answering his questions please update
> the commit message and resend with a [net-next] tag (we use [net] to
> designate fixes for current release and stable)

