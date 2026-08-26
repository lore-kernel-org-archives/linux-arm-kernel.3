Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7329CC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 12:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bp6YGE+7SBR9E9ISCb4FnjJrUlmaJNlhCUdcBy6XW0M=; b=RJtjnPvP1Xs2TEVjBMrz59nuju
	mKBffDxFDRdvyF/nPh0sZgzpRpcnw/hGXubgB9rZrtkquAyLkwm8hyVcqZMrLzYVBUGj5sFASrOdV
	i3zQYaoSaCA/wp2pgCRpEx8sXm3mvEwr/FVy3Hf4Rr5m6PzyqQkRE6ZjzjeRefeAR3ZasjtfHLQuA
	DjUTomxOdrzaG1OFCxkCpkeb1rjNrEcVGbr7UXO1q5dDm1UJ/E4N1+JjG8NTeto+Yk2nTq/kYLQpO
	aDlrU+h4FAxRsAg0bB7Vz82Y1IwmlFfNeez2t4xp8YTsSthubuulVn/us3qzlpcr0scMmlMz+xvNv
	kWPpuKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCxv-00000002Smm-34fQ;
	Wed, 26 Aug 2026 12:42:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCxs-00000002Slh-0ZdM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 12:42:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 285CB1A1844;
	Wed, 26 Aug 2026 12:42:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5886604EC;
	Wed, 26 Aug 2026 12:42:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DC8D11C78133;
	Wed, 26 Aug 2026 14:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787748157; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Bp6YGE+7SBR9E9ISCb4FnjJrUlmaJNlhCUdcBy6XW0M=;
	b=LemI+t6Gl02EuLwgM4WqthJR9G5PUktBl8kNfwXcMV/8nWLGaa2BsOt44Vkqbz6oplPPdt
	DdiFqkVnwrNOHgjAaAr+CQDy6hQkmyDyH6LTPU5Svvm0eAsmnUWvJ27Xoj8ZVtMsOKkcL9
	zwxXv6cLhzf/Sz1O8GC0laJQ2eQbQu4BMBYgQF6Ukfz2vQWZOWB++dpksI7MVgMoTnLmuJ
	H88vYk7W5+a6djiGjPyrDCVHfikhMaaTq3TnFkitjzKdmvtfnNu5wc6mtLZb7jn1Zo2BlH
	QDI6oFmvvQq6J6gn4zSGjlPCfxFPYeHU6IUHO5nEld/ScdEG1t1LeIcnXVgXyg==
Message-ID: <dc2ccb14-c7c0-402b-93b3-afba52df78fa@bootlin.com>
Date: Wed, 26 Aug 2026 14:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/3] net: stmmac: document oversized AF_XDP frame
 handling
To: Jakub Kicinski <kuba@kernel.org>,
 Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 aleksander.lobakin@intel.com, horms@kernel.org, magnus.karlsson@intel.com,
 sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, guoren@kernel.org, dtatulea@nvidia.com,
 witu@nvidia.com, martin.lau@kernel.org, yoong.siang.song@intel.com,
 intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 linux-csky@vger.kernel.org, leon@kernel.org
References: <20260819160535.1472459-1-sdf@fomichev.me>
 <20260819160535.1472459-4-sdf@fomichev.me> <aoceSoSFMx69Z9up@boxer>
 <aoeoJ6-njBxcWs4w@devvm7509.cco0.facebook.com> <aogpDsa8hz6CPpD3@boxer>
 <aoiIarzdjk92RkCN@devvm7509.cco0.facebook.com>
 <20260824111443.34bffe04@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260824111443.34bffe04@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_054248_346246_FB336588 
X-CRM114-Status: GOOD (  11.88  )
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



On 8/24/26 20:14, Jakub Kicinski wrote:
> On Fri, 21 Aug 2026 10:28:47 -0700 Stanislav Fomichev wrote:
>>>> I do agree that a better idea is to probably do these checks during control
>>>> paths, but it's a bit more involved (and not sure if it's possible? if we
>>>> have a bunch of xsk sockets and we change that max_sdu, do we go over all
>>>> sockets on the system somehow?). My main motivation with this patch was
>>>> to make our LLM reviewers less chatty about preexisting issues.  
>>>
>>> I hear you, however I feel like we do not know this driver too much and
>>> probably we don't have a HW to test out such changes, so maybe let us try
>>> to fix existing behavior?  
>>
>> Let's definitely fix it properly if you have better ideas. But since we
>> don't have HW, I'm not super confident doing anything sophisticated
>> myself :-D
> 
> Let me take the first 2 patches and leave the stmmac for later.
> I don't think anyone involved care particularly deeply here.
> 
> Maxime said he bought a bunch of relevant HW. If we finally wrap 
> the AF_XDP tests into driver runtime he should be able to help us...

Indeed, I haven't started looking into the AF_XDP (and XDP in general) on
stmmac, lots of fixes lately on the subject so I'll get there eventually :)

I'm currently plumbing the driver selftest on my setup (ethtool -t) and just
runnign this uncovers lots of issues al lover the place, once this
passes I'll get on the kselftests and see what we can do on this.

Maxime

