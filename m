Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8578C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 05:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWEi5PcIiH/HVIy3Rj5t6X1UxIOq14w3/MzwNCqvHzQ=; b=JRmb/bkWSPWoqW+6kO2V1F/Vbp
	ngiObik8d7QfHMNTgUi6VpD257xGRzGVn/lu0KQXC6nj9k3h/NO/nVvLV07BZxjnQanLj8JEygMZ/
	AZjBYZV4FOqUfhfyMdL1DljBj4bgeQievW6WsBGc6ajaVQfbRYEJha2m85Z9wPmik/Ms89jIWVznu
	juIyl4dk2VIEUMEd6oYYAKl2Co7wXqKKc6wcaNSCtJxacp1W6FXUO++hUhFN2WMyrwdFcWrqgH1ps
	n8hti4ZhiInlei4OjhrczJqonRroVZngB/ywtniupge2LGX4BGIeadABPW+JXwUBXIyT4aKEUXpNE
	LGAu5QEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wukcQ-00000001z6n-3cmj;
	Fri, 14 Aug 2026 05:38:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wukcP-00000001z6h-38my
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 05:38:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A4AF600AD;
	Fri, 14 Aug 2026 05:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AC31F000E9;
	Fri, 14 Aug 2026 05:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786685891;
	bh=hWEi5PcIiH/HVIy3Rj5t6X1UxIOq14w3/MzwNCqvHzQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=L6msycHELII2rG6nfk54h6Gv9u09I5Zpy2CcF5QQOUJHqqqe+4TZU22E6rHnfQPG9
	 W/V/6dZWLtrelNMcoKrfkWoIe6jozrh4GtLG3e45w/X8PFYbOioq9MJZ21VeCjL0V0
	 FnanYr/eqiai0sDepKTg0/wwQvLD4s0dth5KRFy49yfk+2XVHfPkisAKcc2pbHK6ZS
	 J3agoEO/yMUiRFsyrfGKMBroZMHmi/fIU4OeMu29yUPXwI9P4rsG19pWlJmw+vWq5V
	 FJY5A5L1Kz626pFyo8hCun+J6geeqcQKgH6DvVT77yja6O3uJxCBJu3YJqZoNtkWYI
	 Az/nkUmithz/Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260803063126.7-1-bbnpreetsingh@gmail.com>
References: <20260803063126.7-1-bbnpreetsingh@gmail.com>
Subject: Re: [PATCH v2] clk: zynq: pll: Fix kernel-doc after determine_rate() conversion
From: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Michal Simek <michal.simek@amd.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 13 Aug 2026 22:38:09 -0700
Message-ID: <178668588985.5897.17245910889427329297@lazor>
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

Quoting Babanpreet Singh (2026-08-02 23:31:26)
> Commit 1547747b55d5 ("clk: zynq: pll: convert from round_rate() to
> determine_rate()") replaced zynq_pll_round_rate() with
> zynq_pll_determine_rate() but left its kernel-doc block behind, so the
> block still names the old function and documents the removed @rate and
> @prate parameters instead of @req.
>=20
> Retitle the block and describe @req. The Return: line described a
> frequency and referenced the removed @rate; the function returns 0
> unconditionally and the rounded rate comes back in @req.
>=20
> No functional changes.
>=20
> Assisted-by: Claude:claude-opus-5 [kernel-doc]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---

Applied to clk-next

