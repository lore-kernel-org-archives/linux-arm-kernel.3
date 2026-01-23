Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFF5D778AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 18:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/ibubnls9mCRK/w8mG/X9Z5PtzpJUd/XcuTmOHqvSI=; b=jskBr9ioMbDQJ3J0zwDvRmapJA
	RHgy8fem3TP1eoHytnP1pwtfnqnPQfpiaGmOYAF+/M6eI0GxhtZK5BcIsrhK1yuf4NGko+zI6vqQ5
	qPg7ChXtVUO2w7OItf3sRysYOAutENEatwQmXyRlLwCnat6KgLx8MgZAigt57++mk21YDUaZrnY1q
	qwdLKwy/Wy17KOcxMfy2sqYwaVgnldpybPQUc1KKLAIKjPpU5wGHGsbX2i1XgiQhhR0F99jwr5q3H
	S8nWeMh9CpLyfSAO6ZgMC3v6F5hemLIXxA0atordMOA/9FtRIoe878Umi/9sZxgh11UOzSV/5yNqw
	I+jjSqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMKx-00000009N4j-1zAB;
	Fri, 23 Jan 2026 18:56:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMKw-00000009N4d-1F1S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 18:56:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58DF060053;
	Fri, 23 Jan 2026 18:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DF6C4CEF1;
	Fri, 23 Jan 2026 18:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769194608;
	bh=3jLGXGox4MZrx+SHfO34OvVQtWxyUAdZt4Q/wRaq6LU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NOM8EgWsvkdiZ4I53S7ypYxOkEaP3qgxMNqTan34yjNXQ6IdNAvfZDMjJGD4j5qdB
	 ccct8gX5Uj+urPxTX9DsIDQhcQSEiW0rIG3fSryf6K4shr+X4Q7waTBPpur3DtOBb5
	 V+5BBotFCTOMGTSsdKLNt3VMWo0tZcFsescFEJhvicF/Sxxx1oZj53/hcpiybVuRz9
	 94GlDJu8w1+qDm9xK2DHahTwb8D81Xf+UZBzS1V8rR6evsSDgh7WstshUcGFpT3pwW
	 XsOgWPvSpfxDTybuKvxrPqtX2yn1aVhQdkc7zEaWqQHBJya4fct9k9ff1xd81cpUFz
	 btKcQnLEbp6nA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: zynqmp: divider: Fix zynqmp_clk_divider_determine_rate kerneldoc
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 23 Jan 2026 11:56:46 -0700
Message-ID: <176919460602.4027.12516602174485090561@lazor>
User-Agent: alot/0.11
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

Quoting Krzysztof Kozlowski (2025-12-24 04:42:11)
> After renaming round_rate->determine, kerneldoc does not match anymore,
> causing W=3D1 warnings:
>=20
>   Warning: drivers/clk/zynqmp/divider.c:122 function parameter 'req' not =
described in 'zynqmp_clk_divider_determine_rate'
>   Warning: drivers/clk/zynqmp/divider.c:122 expecting prototype for zynqm=
p_clk_divider_round_rate(). Prototype was for zynqmp_clk_divider_determine_=
rate() instead
>=20
> Fixes: 0f9cf96a01fd ("clk: zynqmp: divider: convert from round_rate() to =
determine_rate()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next

