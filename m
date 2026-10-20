Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C35606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1c4+OvU;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JEWtc8B5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bn3cWdwZrpBaWzYJtec/Ntiw0Eowff++j505Mm5iEg=; b=h1c4+OvUYek5afB+5YN4W6lCm2
	2U2sjIEH9Z1CuauCRBK6AV+VXpVYHFb5JQlNWy+Dm0cax/wcJT4Eth2bnKwH8nQWWEuZEqafaixdl
	bACH4OLsWdtfAmKLcb0BOwDcoeYxXc3E2ipRO2axFddSz8dkI+HuSkhPmC285rPiWoU0ksDGbYt2h
	YnMPUxlSnP/DBfKwNBlydkEB2vG5JycVoc4eG+hxO8RmIU3qPikSH8pDcxWeq/2AB5k6iXkBqA29t
	2CEthmeeEzRU0qOfiVPMfCOagPquD7o3PJW6WJhCAn6gyeh3mcw1BegztHs5KOBFhoCPdlCN9wU86
	uLRU3Udg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5op-00000009GMQ-3zYO;
	Tue, 20 Oct 2026 09:07:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5oo-00000009GLF-01Dh;
	Tue, 20 Oct 2026 09:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792487254;
	bh=oRGsM1bXUyoQFClOurpdXPfqoj3kEqrQ7E5LuNfjomU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JEWtc8B5ei7AdnCgumD9wkGPxVmZIML9X0/Yp+0gePGNvkKYFhQ6trIgjFIuJmcmw
	 +juMBVqWVYgBwBNztcO+GKU0qVKV5/YR8lmSZ8sKcjBG4hoaXh/X7/GJ2HFXvwiXHn
	 GQl7ZKuGv6Ni3JlB1R3rHGeOA6WlV+nKUZVE5vE5DN+bCw7T8Ir1IURKlvcvq8CMty
	 1ODove3DUBjKOYLnRfNmRSmyBOxkrVCRuEJz2gBQIqtS38KjLiyrA4GsXEUmbq2x2P
	 mbTUdVmwVjtuOuaWphb36gnoQ8njOl7BO7TmpxKu1CLiBZ5p2pj+Z0GzLlr9lq7p4j
	 sOM/TsMdMYt1A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1320317E05F3;
	Tue, 20 Oct 2026 11:07:34 +0200 (CEST)
Message-ID: <afc3ec2a-90b5-440d-9710-2b3892b01b6c@collabora.com>
Date: Tue, 20 Oct 2026 11:07:33 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <179239867012.642420.15110854236483587234.b4-review@b4>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <179239867012.642420.15110854236483587234.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_020738_199900_33B64B6A 
X-CRM114-Status: GOOD (  13.09  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19/26 10:31, Alexandre Mergnat wrote:
> Hi Angelo,
> 
> I'm working on mainline support for the MT6363 MFD PMIC.
> 
> Are you planning to send a new revision addressing the review feedback
> on v12? If you don't have time to pick it up again, I'd be happy to
> help address the remaining comments and prepare a new revision,
> if that works for you.
> 
> Thanks for your work on this!
> 
> Cheers,
> Alexandre
> 

Yes, I do have a new version locally which didn't get sent because of the SPMI
series (introducing the new helpers) that didn't get picked yet.

Cheers,
Angelo

