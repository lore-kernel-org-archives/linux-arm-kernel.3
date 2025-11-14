Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9AECDB480
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 03:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/uU7DX6EU2lIi4ytJfKjCiE8gDcgmYB/Hmy17WbL7Q=; b=OIJjLQpgP1tX4jYdAmQLwd9xd9
	BFarfyWYWd8Hr94/MjTvqTydzuyol+gu4zRztodKV9xsVhMM+0Mgjo0zTIGvRnSACOo1eWXh6XDmA
	zXALOU0ayvB9UK4XYZsG+HkuBblu/CdYo0zkKlEa9oUZmzlX+TkJRWZvTm9H5luRFDmdbpz0tAweS
	X71n0LHKsPCJFJob18Dtgoxbt5HcdBTwXbQ9IVXOlXTa45i3KyJKzBlfm4SuPv33RbArM3y+WAAKx
	5ePHeEfA0/JHR/mBrB3SPlBwZKt3zYZ8dJm9c4xJweTltXsBRPp53obZX0RaoCL9EpN/wGlwemfDj
	nvzTxtyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkbc-0000000BUbC-16tm;
	Fri, 14 Nov 2025 03:36:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkba-0000000BUaz-0D9E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 03:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B8C86012A;
	Fri, 14 Nov 2025 03:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A53AC4CEF1;
	Fri, 14 Nov 2025 03:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763091368;
	bh=V/uU7DX6EU2lIi4ytJfKjCiE8gDcgmYB/Hmy17WbL7Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lbe2IChTiqge48WGtL+dveg6rDgNVC0my3zhrP7QwH/WwUEdLgUUqLln0Uiu/NMB7
	 qcZRceJY/7Jny9hsFodVqJhKemgtIWq4gApoArS4VPmXvR7nc+g46yvO+GySNXDwt2
	 wz2ijiZCLA41Z2CB4YXgHYCSP5Ym0XGoyefideW8xs5HaXPvkOLINsCzEZfgl4q40t
	 yy5G8EET7fta+k9Qwqa/W3SMFWG+RyYW+RskKgj+QnwRIw+EfnpUmGeDPwm4VHrOya
	 wwNId5PWB+9dNEtSVoooelqJmvVBzRrKbzbMttVdXmN0lEiYPH/2Mvj+5Hf9mpKGK1
	 3hp5CljL/+Cfw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251028161643.1727046-1-abarnas@google.com>
References: <20251028161643.1727046-1-abarnas@google.com>
Subject: Re: [PATCH] clk: keystone: Fix discarded const qualifiers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Adrian =?utf-8?q?Barna=C5=9B?= <abarnas@google.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Adrian =?utf-8?q?Barna=C5=9B?= <abarnas@google.com>, Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>
Date: Thu, 13 Nov 2025 18:18:08 -0800
Message-ID: <176308668834.11952.12771712972554296598@localhost.localdomain>
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

Quoting Adrian Barna=C5=9B (2025-10-28 09:16:42)
> Add const qualifiers to the pointers returned from 'container_of' macro
> to prevent breaking the const promise on const struct pointers from
> parameters.
>=20
> Once you have a mutable container structure pointer, you can change
> structure fields through it, which violates the const guarantee.
>=20
> Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
> ---

Applied to clk-next

