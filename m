Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA45606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 20:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hvDfhMej;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=B9dG5wGE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMaByKpIrW0LSyYgQK6ZFp9Smoe+FCDXKYUFjdBbhF0=; b=hvDfhMejMRM1Gja3MWGgc+gzGI
	lCH6IwLaA/DDS3vLWtBRA1cNof0QPJJCY1l2oUTZpv9BYwEixwgk0NfIFRtOXSeSdFIdE2GGhQ77K
	Jl7ophYYZJxvcyIhseCVlgAxX2tDJm3k7i/7d8GD9byJk7qh3gBGo1cqXIgNoxZ9agp5EfOvhmCqi
	nvzQvS5NrnOt6cdIx46cBDlctH1HEHsI+pZMgUHDovkzOvveM5oBPySEYldV56tTKmlF7X8g74aq7
	YtBRAIUkwtub/8fDOFX4KvqtEWhHSSeC2h/jO9KHCTJoGTa+BMuHImjNz9loGP4RsX4m12EeVp0uD
	rfHpX2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJctW-0000000CpYd-3EI9;
	Wed, 21 Oct 2026 20:26:42 +0000
Received: from mail-10628.protonmail.ch ([79.135.106.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJctN-0000000CpWI-3vxD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 20:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792614391; x=1792873591;
	bh=yMaByKpIrW0LSyYgQK6ZFp9Smoe+FCDXKYUFjdBbhF0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B9dG5wGEQtC0HV+f+BE0KkdleNJlL7wLJR0n+SpH9ZopIwYCweo7qAU3OzkHFbeU6
	 ytYuEZK/8iYUOSK6mPffyJ326ARGSvvjL1GQoZR+Ayo5aD8gct6hHfIh+HB44d9ul6
	 JnVDHqSmOxnTVY9m8oLxaP0AsytHcQKbTKLpUORshFSXdb3xfg5RxZoxdbvNecx8hY
	 V/I8Y4x5B6zprJMhT4oOdjzxAU32aT4/X2TgiCg/CZkSkkM0xOPsz5NXDDltXrDuO0
	 WDkEgVhlPBh10rPedVuJirjuF/z709EE/hhKHnoXGy6MUpkg4esxXPT5jVhBc8b0Y8
	 Y2v3jjSJw833w==
Date: Wed, 21 Oct 2026 20:26:23 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, linux-arm-kernel@lists.infradead.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v10 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
Message-ID: <179261435862.92690.4559755086697722828@pm.me>
In-Reply-To: <20261013-qce-fix-self-tests-v10-10-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com> <20261013-qce-fix-self-tests-v10-10-57162a38a554@oss.qualcomm.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 26a209665153582a3536c663df4ec6c159407ded
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_132634_378137_8390EA41 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

On Tue, 13 Oct 2026 11:57:39 +0200, Bartosz Golaszewski <bartosz.golaszewsk=
i@oss.qualcomm.com> wrote:
> The self-tests for this driver have been fixed. The crypto algorithms
> are only registered if the user explicitly requests it with the provided
> module parameter defaulting to false. There's no reason to further keep
> it unbuildable with the BROKEN label.

On X1E80100 the BROKEN label also costs deep sleep in suspend. With
nothing bound to the crypto node, aggre2_noc and mc_virt never reach
sync_state() ("sync_state() pending due to 1dfa000.crypto"), and on a
Lenovo Yoga Slim 7x a deep suspend on 7.3 never counts aosd, cxsd or
ddr in qcom_stats.

I built qcrypto out of tree from 7.3 with 09 applied, which is what
this patch makes possible in tree, and loaded it on 7.3 (with distro
patches, none in QCE, the interconnect drivers or the driver core) and
the crypto node as in mainline, with ALWAYS tags on its paths. It bound
without registering any algorithms, went to runtime suspend with both
crypto paths at 0, and both providers synced. The next deep suspend
counted aosd, cxsd and ddr, with about 13.7 s in them during an 18 s
suspend.

Herbert asked for the series to be split, and the resends since then
don't carry 09 and this one. Both should come back as fixes, for 7.3.y
as well.

Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x


