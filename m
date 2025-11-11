Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2965ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 01:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6W2jPr8540SGRXE2UTsnrYLyYTWchfI5w6pM9R1bbE=; b=e6mOKBF0hWlOdubMbf0mAX1z+F
	whFZjIT6Ivita7LS8noNckQn6tg7dOkV4en1PD1Wck1aHWQhyw4/UdYhgjzWcEVCmBZlwoV0DcCKr
	wtnbrDZxGGEJJKnbwQAYffKjQOTSyEq0qKhNsHv9T6/8DPfVBEZhaDZWdmK6yaCBLJ282KZx24STj
	HszJQzZ7w6AgtWZiainreM3ZlfCHfMjFoXx2NHy4qPfbw8tk9ARgrdWr+6RdeU9jPS0METRQmuCLc
	WA7zAvMOpCOyAu7vKD7/o04opdcF4K6TRup51/H6iQBoNFJXoJGfV612O52g+Z9Z6vUAnreMD1ptz
	ZzIDQwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdCU-00000006Kki-1sxo;
	Tue, 11 Nov 2025 01:29:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdCT-00000006KkZ-1VFO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 01:29:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3531F60145;
	Tue, 11 Nov 2025 01:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27E9C113D0;
	Tue, 11 Nov 2025 01:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762824575;
	bh=U6W2jPr8540SGRXE2UTsnrYLyYTWchfI5w6pM9R1bbE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=S0CVJGNPBL3Pk3s6zhEH6PRwayDKVjniB3ozUH6Srol4qeRB1ImwzaCt+jIV3mhyM
	 3d9cNIapc98Y8VhJDppv+WflQIrVJFSkJXUMB45S3LZ/Y84J6DVxOwOzlKa8jzYs5N
	 uOvnVM7R3yd00e25PUL/Bx5dDFVKcvbBXz/wyOwEmC72MV0oq5SzXjiotucpnJUh0i
	 9fORh030bnWesZYo65JoUVrPqqufv2UDSPT+262E8F+K7AUXXl4YZ63Vn1xeS9rsmX
	 ncLe/HJA6Mneg0qlpw6nI+fukbxp6h0Eo+O4t02b98x3cy882SUgmHO7GVscfQ0dEl
	 WsJyACN/Elrpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251015090701.2049164-1-wenst@chromium.org>
References: <20251015090701.2049164-1-wenst@chromium.org>
Subject: Re: [PATCH v2] clk: tests: Add tests for clk lookup by name
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 10 Nov 2025 17:29:33 -0800
Message-ID: <176282457391.11952.211745741683699733@lazor>
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

Quoting Chen-Yu Tsai (2025-10-15 02:06:59)
> Clk lookup (by name) recently gained some performance improvements at
> the expense of more complexity within the lookup code.
>=20
> To make sure that this works as intended and doesn't break, add some
> basic tests for this part of the CCF.
>=20
> A new "clk_hw_lookup()" function is added purely for running kunit
> tests.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>=20
> ---

Urgh I see I missed the new one. Please look at v1 and fix things up and
resend.

