Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B120EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXcplsjEW3cpGjdcAAQ17aIZ07N79jkY8b2Kz/u8DPs=; b=Hzj7LHCMbAM58Gazm/CdMCLPZo
	bAwpjvzLuFYgInEi3DU99tVN2gRC9Ys+MqVx7ZH6Rv9HTTz4+ml6NHvNcpW9zcQ9FSzT3hD8E8qsD
	wphOW8tdAoZr0v4iDSzixD//JXs/86At2fvvmEJrVAwFk4dyUJv5YtKFApRaQBiHY1iX103PFFiAi
	yagzvJb8l19SaDnxhlA+/bJgspWuLq8hKnGWzCKv75K5zDkgQlBZ+HEiLJNIcMqrtQtFhh4f4yhxj
	Enyr4qWJRLeoPidMos0d7ajtmNXUcNj8IeJPprynY1u9m/G+r8oVk0tIeGFaHphevDajQvGuddPih
	/jP9ygng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRxX-00000006dnR-1s8b;
	Tue, 17 Jun 2025 08:46:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRi7-00000006bhM-2mr4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Jun 2025 08:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EXcplsjEW3cpGjdcAAQ17aIZ07N79jkY8b2Kz/u8DPs=; b=GDB2lcCkF1KTwhadknmLSd/xdP
	TQwM/WEBMuypFQh7HwZJKqM2ZUMPeQevyBB18LpgIBmJo0qK6e3AjcRnWELsLbyR2AD5Tg1KuDGZC
	nPCeBCOzaGUc4aYCl5UVSpdmV0YdxJsWNj+KkA9ZIlGR8++HqZOenVUTo4xKueZbnr+i4iA/YT0AE
	8CPU/mQycdBG4U39fzH4lsYWX4c7/nW+RQRtNtGFoV/y9C/0xkNkhI+5wZz477X9XJnplHVhVx5e2
	diOzPiPdnsRDfzyCnBbLLO7L1gi+ATE+BWBPBr4O9Hgu3AUuJkYO6cw39t8SBLbFWi/izQ2Ziu6/E
	V0n+1wzg==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRhy-00000003kKI-1RZy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750148981; bh=h5DYFAuVio36yz2xdt6veVQ5MCUC5Nm4S8ZwBFwoY0Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C/JOA3glTSbRXGeZeqLoLH68R1plBk58aC5zMHcoksNNV/JUU4bj9C+2R6G8aKNWF
	 jA6ysYWnp70OXrZv6RE8gVfoA36DcMwkjrXxBI8V8tLLd0/mY/xzSrMBhIgLBsevFs
	 WN1sYLB0i1IwBQ50L2w8lJN1jKaT2ZPH7RX2lYH7oQmy5qhYdrNkd1fWZGiSuaXXj6
	 3ox0J3azzKkwywV2EfwuOs33LKMjfkMRxs/9ay7QF9lVbVV5fURiNaC7g50bTuzMcr
	 HySSy8ll6mvUchFt9KygO8PtMVd78w3jB9EpBvNgQ7e59xbkA+tu7ZyO+4zLWqgl5Y
	 xlddVDVjfAkrQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 54F4B3C2B97;
	Tue, 17 Jun 2025 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750148981; bh=h5DYFAuVio36yz2xdt6veVQ5MCUC5Nm4S8ZwBFwoY0Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C/JOA3glTSbRXGeZeqLoLH68R1plBk58aC5zMHcoksNNV/JUU4bj9C+2R6G8aKNWF
	 jA6ysYWnp70OXrZv6RE8gVfoA36DcMwkjrXxBI8V8tLLd0/mY/xzSrMBhIgLBsevFs
	 WN1sYLB0i1IwBQ50L2w8lJN1jKaT2ZPH7RX2lYH7oQmy5qhYdrNkd1fWZGiSuaXXj6
	 3ox0J3azzKkwywV2EfwuOs33LKMjfkMRxs/9ay7QF9lVbVV5fURiNaC7g50bTuzMcr
	 HySSy8ll6mvUchFt9KygO8PtMVd78w3jB9EpBvNgQ7e59xbkA+tu7ZyO+4zLWqgl5Y
	 xlddVDVjfAkrQ==
Message-ID: <804c0ad1-3ab0-48be-b58e-8c67ac92d12c@mleia.com>
Date: Tue, 17 Jun 2025 11:29:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Content-Language: ru-RU
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Roland Stigge <stigge@antcom.de>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250606164012.1363896-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250606164012.1363896-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250617_082941_376528_41F3FF3A 
X-CRM114-Status: UNSURE (   5.72  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_082941_376528_41F3FF3A 
X-CRM114-Status: UNSURE (   5.78  )
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

On 6/6/25 19:40, Frank Li wrote:
> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> warnings:
> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

Thank you for the change.

--
Best wishes,
Vladimir

