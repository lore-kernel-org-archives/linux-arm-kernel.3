Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07213FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pI/vt9ZUteLEOWc0n8LKJdOWRjxIlHE78+gc+gUT1Z0=; b=krEMkLv4E3jrIktz/rm8OKg2l7
	EKEfwFlvJqdnDLLFiZelrPUg4pDEiu7j4n9ZgrMBn6pe6752n0bh454oxtl6ShAgmP2afJiSJcebc
	IKHQrlw8Mvhehr56BqlzUu0aKyMX3ZtNv8XgE6PHZ6R4HGM9ED5g7wUsoRwD0BvPj5qSlmN9U/U4r
	TYyp29+dxeRchA7zO1Z2DSif0J3spdUs9zRyiuR4L1F8dzxBHWZZvFy95UvzunCgFGCdq1rcPBm0c
	IsR034pxw7CJ54/VcCKAQqWURi3w3A64B0w2splw+KjVL5Je9Mlo0ctIe4ee871xfPYtb6aqeu//p
	LFA5nreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvts-00000002sVF-20LK;
	Wed, 29 Apr 2026 03:47:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtj-00000002sO9-1CNn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AED9261330;
	Wed, 29 Apr 2026 03:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9B6C2BCB4;
	Wed, 29 Apr 2026 03:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434428;
	bh=pI/vt9ZUteLEOWc0n8LKJdOWRjxIlHE78+gc+gUT1Z0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=abAcyyXEey2FVctOuvFM2zwuqrP6S69F41kjSvSVvrrNuzUFueaFFwqaTLcdmZ5dy
	 Q7kz3SSOGCX7X7sdzFfCiR2BKM42RkRdKqrvqmWiYtzpxk+eNF6grAz5B7g4BKvpuf
	 Ey3fLgDdmKJdmxsBj3qSg3J2Dz4Qj2VVYElaixEfb2fHAiZR5nYmHRBoo06APGMMP3
	 TAdqCD84KpDptcWFTIlNeiNgjOzgVssx4eWkCxKanuxFqCKszkeeGICp3eShuZcR6G
	 ttJnMI7NVKM8Z1dXnBrRk4aTm4Jy5+kSvKzvFexnxAkJl1yqdKt070Reel0YD4CNuy
	 RyfHvFTaNdUmA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260414-pxa1908-clk-reset-v1-2-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz> <20260414-pxa1908-clk-reset-v1-2-94bae5f3a8cf@dujemihanovic.xyz>
Subject: Re: [PATCH 2/4] clk: mmp: pxa1908-apbc: Add reset cells
From: Stephen Boyd <sboyd@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Duje =?utf-8?q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
To: Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <dujemihanovic32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Date: Tue, 28 Apr 2026 19:08:33 -0700
Message-ID: <177742851348.5403.14276719468282572876@localhost.localdomain>
User-Agent: alot/0.12
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

Quoting Duje Mihanovi=C4=87 (2026-04-14 12:51:51)
> From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>=20
> It has been concluded by comparing the gate clock masks and vendor code
> between PXA1908/28 that PXA1908's APBC, similarly to PXA1928's APBC, has
> controllable reset lines. Describe these in the driver for correctness.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---

Applied to clk-next

