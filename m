Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A266CD4A5E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EG1hY4Bj4RYTqTep9iIgJg/7syTPIFuY/17rX6gtjqM=; b=2olSCsR7nHw6/kc7EcOnmuGxdn
	t+YoHY4i/50W7bQ4Hh1SEqqCgeyY70fozRAlG5+nWx8UM02B2FqfdusQjL5UvPB6fQRE+Aoxyooeg
	rK7EN7oeSEef/vz3+Ej/MoKwpDhIoOTyyiZoszI8lvmuiB2aYMT0h5TELHsaybRHhQFK577DfSzYH
	MD3j6S2TdrbKYD7jp63uMWSRlhIRX1DFIoF7C+gZ4i6mb1ddGXZGB0LolvW8wRmfKSL4WB+LpJ8++
	yuHoPgBmg2fK0xy64msw6slbivp+k1a4UPeCBoLTl4ywJ1dPuacatOF4jEjk2+gEjRdPoppLY7ijF
	NWM6mJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZRt-0000000DSwV-0PgG;
	Fri, 16 Jan 2026 02:20:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZRj-0000000DSvq-27uE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 02:20:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A85996016B;
	Fri, 16 Jan 2026 02:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51492C116D0;
	Fri, 16 Jan 2026 02:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768530018;
	bh=EG1hY4Bj4RYTqTep9iIgJg/7syTPIFuY/17rX6gtjqM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WZnG4dTdOLUw4oTH5wlBwJrxGQDkv9wbhTG6chJsVQKfPL/fBhcLP+HcWvxqnMSGL
	 Bz0r+4bHtQQhUMzGIk/TAqiwHICLrOJv8hlZaJ7Gzagi2OU1y4xaG1OOfCmhAyFJ8h
	 nd55Oy+VnZJL+MRibGdirDMLIbk4k7rX1BvBYm8IpjoZ6YxMUt/d+GBEAtfGupHtGg
	 20YUghOK5FzG3mDbo0poYawJuerdqqlQvLnAMnViPVb7HNrffmpvavYRELx1HY7G6L
	 pYTMwW9fPJr0rQciKD0aXBBgmscJl3vgtONIRP+hiYFkefHZ/ot5QwWgJBgV+5Pez6
	 np9RqeS9kiL0Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251231-spmi-apple-t8103-base-compat-v1-1-98da572086f9@jannau.net>
References: <20251231-spmi-apple-t8103-base-compat-v1-1-98da572086f9@jannau.net>
Subject: Re: [PATCH] spmi: apple: Add "apple,t8103-spmi" compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Janne Grunau <j@jannau.net>
To: Janne Grunau <j@jannau.net>, Jean-Francois Bortolotti <jeff@borto.fr>, Neal Gompa <neal@gompa.dev>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Date: Thu, 15 Jan 2026 20:20:16 -0600
Message-ID: <176853001644.16445.12638081232487224512@lazor>
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

Quoting Janne Grunau (2025-12-31 04:41:32)
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,spmi" anymore [1]. Use
> "apple,t8103-spmi" as base compatible as it is the SoC the driver and
> bindings were written for.
>=20
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>=20
> Fixes: 77ca75e80c71 ("spmi: add a spmi driver for Apple SoC")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Applied to spmi-next

