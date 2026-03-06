Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E181F01835
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZRjQYItBA2DRAhsau54MVW/2ObSKsTdsjgSHQao8Yc=; b=P0QOUlBsFOGmN2o4eyu7hwMdKf
	PIrscNU+2ylB9lqm/H6BG8UG0aQt5uha9x44BavAs4YhhMvHESWEJiYntYz15umSBcbklpenDkJ+m
	W79gIpE+9RN2yDxQf2vQyHPHDl7TaVkO3b7EuozlgNrbda1dtZonGi8Vow4EVBfXM4cczQHRn//gC
	p4F9fVLpFCe4weh4L28OtyBakprAPZjO2j1Y2SeM3RXFT7iyF5fQ0F0LDDVq7CZzIVv6U/RUZ4WSB
	B2zUODKegZHBlN0Qb2c3+5pdHx2CSl1CX5ALgMRV3JzKhaQsDvjgUVPxM1/Du2gjl8Fuzy2zHEqrd
	rXxaGnpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVdC-00000003pUf-01Ku;
	Fri, 06 Mar 2026 13:54:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVd9-00000003pUE-0I9N;
	Fri, 06 Mar 2026 13:54:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B0E44445E;
	Fri,  6 Mar 2026 13:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A370CC4CEF7;
	Fri,  6 Mar 2026 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772805254;
	bh=vbb0ZDwFV8ZYPJsVeXVfnr4nd375ty8LMqoFu3YrUes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hhH1kgkJ6XdEDguQFaA484Pqw/xlqEFtRFwIEjMK7CHfvmCdbiAoswDlhv/6TTfgb
	 fov2CmxpniKD0hU8cM7bUcubpd9dvdG96lfn/laUEIwKbMWbBufBEXgwjY7ZPN3Pg2
	 g4AmLhfZdq9srZuc3yFWcooTgS77TdmooWMBWB4bhbTsKUZHyZTHVei1iu/RUxOr2T
	 z26ANScXRfZgFopSBj1ZjZ7lDqSI3VZAWGyGtVNNLzpaqYD2x6oBvP/1FC/6tw5VM8
	 aFOZoV31ndQGOMBy8VoOaSEVwJhWU+eY4HsJTG45/vA4JBkYaG6xNs6qozcL7KFezK
	 4PxvfpmJf6Dng==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 y.oudjana@protonmail.com, angelogioacchino.delregno@collabora.com
In-Reply-To: <20260302140045.651727-1-akkun11.open@gmail.com>
References: <20260302140045.651727-1-akkun11.open@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: mt6397: Properly fix CID of MT6328,
 MT6331 and MT6332
Message-Id: <177280525240.1050023.10810002029954904296.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 13:54:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_055415_128831_39E56B3B 
X-CRM114-Status: UNSURE (   5.16  )
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

On Mon, 02 Mar 2026 23:00:45 +0900, Akari Tsuyukusa wrote:
> CIDs set for MT6328, MT6331 and MT6332 are not appropriate.
> Many Android downstream kernels define CID as below,
> 
> MT6328:
> 
>     #define PMIC6328_E1_CID_CODE    0x2810
>     #define PMIC6328_E2_CID_CODE    0x2820
>     #define PMIC6328_E3_CID_CODE    0x2830
> 
> [...]

Applied, thanks!

[1/1] mfd: mt6397: Properly fix CID of MT6328, MT6331 and MT6332
      commit: f59b2bc3e6dbcd75c53f1881c1f08a6d3c2a72e5

--
Lee Jones [李琼斯]


