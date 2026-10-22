Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0860F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RHG+dSR4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M76WzVlP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOGsbHPV9Q6LEJI4bp7YU9lC5DA9e4STqXoDKb5ejb0=; b=RHG+dSR4rRNf4fxNKoEr0u0lrU
	ihoAHC3honUmaOdV67mroE/O9TN4whQVkK4VEsJMo8da+zCurbA9nIwHPRMq3kLvTTXiNgtgYR0Y9
	fg5rCZELVX+CvKoNkbZtQowcUOFR3TbiO8fV0wLYKzn9RgZoJFxXzk35z3OlU9KWxMHzpdU7KiJ9T
	gJO1ke19uDxYfsUSePmSdIjphM6s6+MdJHvU4S2oDf3P+mpiqhBsail45rcc1pSkkkoi5nunkWab9
	BUY9KYEo7DFNDgPBtZR2XIU3yJjaBFLMwrI4QQGlN3A7ohIUkpjPW9WHwcWCu9/pXq9oM5Tx/cC6R
	d9l+OpYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnh3-0000000Dblt-1Y1C;
	Thu, 22 Oct 2026 07:58:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnh1-0000000Dblf-1ca2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 07:58:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DBA34485E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FC71F000C7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655910;
	bh=DOGsbHPV9Q6LEJI4bp7YU9lC5DA9e4STqXoDKb5ejb0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=M76WzVlPBD5y4IqVS2atl7PqIsbChiueyPRFZxYypwtus+8TtzwLM94gtwqzkzIi7
	 Uynjkei/JU0SDmBsWe1Nk8I3NJSux6STZOQjVQ1eQfOQZz6HffJeHfd/TzpY15o8kc
	 8WhqCoOFQ0jxu+kkVBQNE/Yx7na5wbewb9gOJL1F8njrh6otFV4Qkg5psTGcxAq8/C
	 +zth5lBobhZL4ML2CkEKJIHNRBU6e0m6mO5QdVaQxiZpgQzE1zsViAQ+u4M5ONY3Mo
	 Uzi2d8bmao4mA3WvpxO2Ei34QzcdEAV4CGMARW/VfVP8A622QmeMYJgRcAo4DAgXmF
	 o7l9TiqPsA39A==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso14019391fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 00:58:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSCKGS0zgRu6y0XDVH+RPL5gUGbLRl3BFr90vCrVDE7wl1B4xStvB4a18Vo0zDin+p29HgaHLL7GAwKfFRmJEv@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+v3bUjngrULl/Ehuc3d5c71so+Gxf1yqcxdZyJzcOWIF0bcbn
	880+uwJr7QQPXgxLwTslgXkGhLpiYtblzTdfrIjpCQyAqUrUa5gtMWoqv7Gox0LlQskxY8pPNVW
	RELPDf/Yb9dConcPU4+Ym7pnnoJ12b1dYR9q7b7x9cQ==
X-Received: by 2002:a2e:a9a5:0:b0:3ab:48e6:6789 with SMTP id
 38308e7fff4ca-3ac4414620dmr13295841fa.8.1792655908769; Thu, 22 Oct 2026
 00:58:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:58:26 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:58:26 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <179261435862.92690.4559755086697722828@pm.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
 <20261013-qce-fix-self-tests-v10-10-57162a38a554@oss.qualcomm.com> <179261435862.92690.4559755086697722828@pm.me>
Date: Thu, 22 Oct 2026 00:58:26 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc1O-xSOt9RNTTF-ue_3skkNoQ4a0h7RovbCbQtexKkdA@mail.gmail.com>
X-Gm-Features: AclHuK-ddH3eyHdZmxCdnhGchR5nIcmlb3fM-yPWg22T-Acg-ykEAHgaJMn9PAk
Message-ID: <CAMRc=Mc1O-xSOt9RNTTF-ue_3skkNoQ4a0h7RovbCbQtexKkdA@mail.gmail.com>
Subject: Re: [PATCH v10 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
To: Birk Skyum <birk.skyum@pm.me>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 22:26:23 +0200, Birk Skyum <birk.skyum@pm.me> said:
> On Tue, 13 Oct 2026 11:57:39 +0200, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> The self-tests for this driver have been fixed. The crypto algorithms
>> are only registered if the user explicitly requests it with the provided
>> module parameter defaulting to false. There's no reason to further keep
>> it unbuildable with the BROKEN label.
>
> On X1E80100 the BROKEN label also costs deep sleep in suspend. With
> nothing bound to the crypto node, aggre2_noc and mc_virt never reach
> sync_state() ("sync_state() pending due to 1dfa000.crypto"), and on a
> Lenovo Yoga Slim 7x a deep suspend on 7.3 never counts aosd, cxsd or
> ddr in qcom_stats.
>
> I built qcrypto out of tree from 7.3 with 09 applied, which is what
> this patch makes possible in tree, and loaded it on 7.3 (with distro
> patches, none in QCE, the interconnect drivers or the driver core) and
> the crypto node as in mainline, with ALWAYS tags on its paths. It bound
> without registering any algorithms, went to runtime suspend with both
> crypto paths at 0, and both providers synced. The next deep suspend
> counted aosd, cxsd and ddr, with about 13.7 s in them during an 18 s
> suspend.
>

Thanks for testing!

> Herbert asked for the series to be split, and the resends since then
> don't carry 09 and this one. Both should come back as fixes, for 7.3.y
> as well.
>

Yes, I'm waiting for the fixes to be picked up before re-sending the remaining
two patches that depend on them.

Bart

