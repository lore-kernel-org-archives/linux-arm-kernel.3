Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036B0C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oV9F+a884N+xaC28QLacb3BrnPMfcnJSbpQ7M1sZLFk=; b=oKF/3K6JHksPJclNs4sHEyUs8d
	8yAZFQfsKfgoPX5UU0a5vXwoI2f8OxpVpAU7Kv6WUjNHpFkxg0N5RQO/yYrdjXFqH1NAt0zqUZFAX
	TmbdRvbcybjfOpb8LAlvyw0AHTNIuG7QwSGdeCWpbEt59u8bHwMzzSQ8qf1+pJj/pUHVTbiY2+Ed0
	P/sY0UaMMSqDsNcbEhfWgYErCYk136ynUaXkSjlgBzqqt10eYZzRA6XsiuyCwAUWu9spr4nCrlEIg
	nw40q8MVdOzzDTRK6MWHbXo6YseZ3FCkxijSRZznmP7rgKEb5zCNf+w2jhqCD/6ON9xWgjSOc4pWT
	E568aE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBr2-0000000B91r-26zS;
	Thu, 06 Mar 2025 14:05:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBir-0000000B7eY-1yKb;
	Thu, 06 Mar 2025 13:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oV9F+a884N+xaC28QLacb3BrnPMfcnJSbpQ7M1sZLFk=; b=RYazXRyf4N1th84zVX9vDRiPii
	xTI6hqG+EaKyn+Kv8mu05/ud48DV+GUA06oAeneQaapMPzffsq7sOazpfDCQLXZoi7DLOdyKx2rVb
	RAmmX04me3rWJlLh2TENZgE3WzO4VpgznuEG3BaADqV2m8vPT8+AX51g1EcjFvzByYrD+UAg2pLRh
	JRIjOwl0Nat4fikc5JRA5erPkxFfbpne+PsPFRyJ4XrYF8AqiPwr5qx2/X8x5w1aWZLq+Gxs5sYFi
	ZxirRyy10jcCrHI0jW31ZIGCPH4jsNoj9QF0otVOqhj40zYG2DVl6lx23naYI/vkPFDC0OWiCPiT5
	RKYBYpsg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBil-00000009xat-3qMr;
	Thu, 06 Mar 2025 13:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oV9F+a884N+xaC28QLacb3BrnPMfcnJSbpQ7M1sZLFk=; b=ZYLN+D7X+5Wzty1yFojtJK6qrx
	Bpy2s2k1EvqZmxUugYeeiz1+KeKSjdq2spIR7VzN0kvnc7o4m4F6lhdYk020KR6N8nuzVw9t10a/l
	iA3wB57zrogFJi/aoAUvJRF/i6SajC68s2V9lVYZtb02vZfeRtg2A7xsaVmgK/SJjIclkjlOU1J1o
	wKnQBo5gSC6RGpi01zGa6E7xc0jMUBPNFpnxVjCefeE3cnXbE88PtYaM4VsGCwp8to08QUqVEx0ls
	/0m68679LrajjGB9XYKtxYqCA/d6Rkin9n2ZI0JHaJDtiKqzgg3eMLnbBZwAXQxy+bGQISnwfWmcv
	gxe+Nzpw==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqBif-0003YT-8p; Thu, 06 Mar 2025 14:57:01 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org, ziyao@disroot.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Thu, 06 Mar 2025 14:57:00 +0100
Message-ID: <3008437.usQuhbGJ8B@diego>
In-Reply-To: <b57e0930-c9a3-4c44-a740-a5623d6904ba@kernel.org>
References: <4856313.kQq0lBPeGt@diego> <7020561.MhkbZ0Pkbq@diego>
 <b57e0930-c9a3-4c44-a740-a5623d6904ba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_135708_308557_FCD3FC15 
X-CRM114-Status: GOOD (  12.89  )
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

Am Donnerstag, 6. M=C3=A4rz 2025, 14:54:04 MEZ schrieb Krzysztof Kozlowski:
> On 06/03/2025 14:51, Heiko St=C3=BCbner wrote:
> > Am Donnerstag, 6. M=C3=A4rz 2025, 14:40:02 MEZ schrieb Chukun Pan:
> >> Hi,
> >>
> >>> That sram is part of the soc (and has an mmio-address), so I'd think
> >>> it should live inside the soc node?
> >>
> >> But soc ranges starts from 0xfe000000, I don't know whether to change =
it.
> >> And all other nodes are 0xf..., except this sram.
> >> Any suggestions would be greatly appreciated.
> >=20
> > darn ... I didn't realize that this is not sram, but main memory :-)
>=20
>=20
> Heh, I think carving out reserved blocks from the main RAM and calling
> it a SRAM is a stretch.

yep, hence going with the reserved memory instead
and not trying to call it sram :-)

And I just saw rk3576 has the same issue, only that there
the mmio area is sitting before the main memory address space



