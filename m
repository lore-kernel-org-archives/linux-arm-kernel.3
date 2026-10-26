Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C66E606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xYKeZ49h;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=h4TPHmHX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EMx0UqFgbDRUnMXk5gFL4yABiOYwefPK+nAKxnm2hdU=; b=xYKeZ49hW89gbC/+3v0VkdpBR0
	krIxVwQd3oj6DQRV6S/kuYhDr4gTJUSZRiQqrEL+EVbpAQalkKtxa4hbSPDt2pKuBS7s8YQiQFVAv
	Dk4TriAheKhAtM5ryHPTOMkO3OMf9ylEB5tmeWiCFPq0FfcZmktrVog2onu4ClHEBAUm8VW1mnqvJ
	tV/efkxJMHIU6td4dFUbRehxrYUhow85nDIGOPkvb7ahi/mzADgu9tUpEej7pQD57gkNUW4BoPdjE
	pjXWCyI8YM0ReWbdctjA+hrkUvx+qA4tA8FYfonKsKDDh+UcJlpMrtP5GvquYkseqlR6iYPAyjZB+
	Tim3B32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJHF-00000002QgI-2gW6;
	Mon, 26 Oct 2026 11:54:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJHD-00000002Qfo-3dXm;
	Mon, 26 Oct 2026 11:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EMx0UqFgbDRUnMXk5gFL4yABiOYwefPK+nAKxnm2hdU=; b=h4TPHmHX9RJu90VSZsNimFg7ns
	3Jzhr3hQMhcxA8gLFfGhGOvIvh9+Q2ybI4SzLgDMBXhYjTHO7SBN9GVFKb7O5bNL+P5MeLK9YihQS
	34NmFOqIT3DPpvmjl9pSfM15yvxEvwiUnHGX7mGv3+pn9pzakQz4mSAcM3G24wTJIro9AL2lpL7jy
	vC5GEAGAUQMNYgwekifw9aknEzCHRzAk+ralTfDjg7xeIN/Y39py0KOf5XOlwpP0t5616O5c/G09g
	X4UCcURat8BZo1n2rnY0VOrelLvPjXgZWkZzI/DCYFuqI3vi+oUfXKIKVefK9Co3gobQw6wIQhR80
	xpIOY9AQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: 1579567540@qq.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>, Ulf Hansson <ulfh@kernel.org>,
 Finley Xiao <finley.xiao@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pmdomain: rockchip: Add RK3572 boot peripheral domains
Date: Mon, 26 Oct 2026 12:53:59 +0100
Message-ID: <3329883.fEcJ0Lxnt5@phil>
In-Reply-To: <d4e92131-ceb8-4143-b8f8-21e7f9638bdb@rock-chips.com>
References: <20261026-add-board-ok3572-c-pmdomain-v3-0-70d614d3d921@qq.com>
 <18fcfe7a-e25a-4516-810f-d787b779914d@rock-chips.com>
 <d4e92131-ceb8-4143-b8f8-21e7f9638bdb@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_045407_922299_F73F2427 
X-CRM114-Status: GOOD (  13.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Finley,

Am Montag, 26. Oktober 2026, 12:37:06 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Finley Xiao:
>=20
> =E5=9C=A8 2026/10/26 16:47, Finley Xiao =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 2026/10/26 11:21, Cunhao Lu via B4 Relay =E5=86=99=E9=81=93:
> >> From: Finley Xiao <finley.xiao@rock-chips.com>
> >>
> >> Add support for the RK3572 NVM0, NVM1, PHP, and VOP power domains.
> >>
> >> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> I have to point out that the changes (the shutdown/restore
> rework, pending-state tracking, etc.) were not made by me, and I have
> not reviewed them in detail. Therefore, I should not remain as the
> author (From:) of this patch, nor should my Signed-off-by be kept on
> it.

As this seemingly comes from the vendor-tree, _some_ Rockchip authorship
should be kept I think?

Do you have a suggestion who that should be other than you? :-)

I guess as you suggested splitting this anyway, that authorship
could also be split.


Thanks
Heiko





