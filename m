Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CACC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtHYV0b9WDadltO5aBK+qs+bV4bIF+dX4kidc3U6uFc=; b=nqyBMJAkXaKG2YScZ/tjIcuiLe
	987y3ctzv0t/MRV6FG0fMNXsFF9awlHFoUFG3bqUD5g2oRtdAzQIyLjR2AweRjsp+bW0STDAM3EDT
	e7Hptp9R+0qQj0VXZSsdXCq4jomocTD9+YwNfqQALVaCB+UZ1I0psyEhKfXSUjBJKtZ2AQnCcxB9e
	VewdsE+DGE/BVq6dWc/anHD+RM99rMH7cbaZZvl6Owir4J/qDXEadopfhmcbsnLX1EQnAcLjcG+64
	ShLPdgHU1Spb25jiHd0NvUue4uDWgEsqHCLWYmjk2U5Q6IBCwWeeaCb6WXZMeVWud/DI1HOdhgafl
	mcxp67uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtr22-0000000Ejc9-1yWa;
	Tue, 11 Aug 2026 18:16:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtr21-0000000Ejc0-1tG8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 18:16:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9888D600AD;
	Tue, 11 Aug 2026 18:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7BA1F000E9;
	Tue, 11 Aug 2026 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786472214;
	bh=TtHYV0b9WDadltO5aBK+qs+bV4bIF+dX4kidc3U6uFc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=CaqHL5wa4t5/LvlQ81HYgEdoUtTMsYyA3TzGSf9Uv1UVettVO3+miK4lzzdMZAhw7
	 feY12Eb4oQsMz+6ownZWZpwZqm+KhWOeqHTSaYDxLXKxAUqDAowLeLiMISwBccfnyN
	 y7ZV0cq5LeZ/iUiCJ/sPYAlBQmW189/m2EAIL5MoHTC0prXLypTrrGsUxNRZaSDR/A
	 kypaiF+XXdFavMGjU2fAe0F1JA/n9J91h1/6FYpvFklUyhYhAXLxKgBk2B0uGq9vVh
	 YvmKRp8hcWenLNmYm6uuXg264SFwxWub18j/yb48wIpit/wGGbiGGCjopP8TbJr78W
	 lkXWDm8I6182w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260727172907.21229-1-andersson@kernel.org>
References: <20260727172907.21229-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fixes for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 11 Aug 2026 11:16:52 -0700
Message-ID: <178647221208.5862.16159159109767639506@lazor>
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

Quoting Bjorn Andersson (2026-07-27 10:29:07)
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-7.2
>=20
> for you to fetch changes up to 1aa4e2ed7caafbbbedff89fb226a982413469baf:
>=20
>   dt-bindings: clock: Replace bouncing emails (2026-07-11 10:24:07 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

