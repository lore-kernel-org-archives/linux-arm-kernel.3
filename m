Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8B7EB3641
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 23:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8JFi69zK/ynYf7YiJC4Ed+hxjUhFeBq1kqdzcC2uXc=; b=Q+TTHTHFusnlak7wUBDlssc1Bl
	kCM5+lGKqewc/NP9fr7PnuRAVnRVERhL/gQuiMCtNd3uXf0wD3uGf29I4EbTx4PWnqpiTxVnqeyDL
	6NeIRH2YBtxqg+EuUHmwyXAAej1SCEN6VY/IO37aZr2hGiHJypczyw8wJYgJ7fAIthtYwrnqgSLZc
	JR56lMIx11lonlfWHZxdrcAtg7PtJHzATrx4XWTvmEzuckV2OXaTcjH8IqgyC16lK64SwATbwcmQr
	ldxwwrYhucaZQ58CRnEvDe89wAckJKP27clYrY/V5IB4GTsoQyF/7n0MVkt6BjOMABZ2u8hzFXqEe
	RO8BAukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCv8-0000000EDdI-0eS6;
	Mon, 02 Mar 2026 23:43:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCv7-0000000EDd9-14Vp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 23:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 133E5600AE;
	Mon,  2 Mar 2026 23:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EE6C19423;
	Mon,  2 Mar 2026 23:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772495002;
	bh=frEcAm5Sb1Cb7UDQJ6+oJvgem0+Bj3jNre9w1kRD5bU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZfF9RoqNtXK3zaSK0l/MgBBePdW41R0Gle86cjvmzgNhTjC1IHXCP+S5Zpl5Le1Or
	 CEosyRxgDnvdYPp4qRa3ywnxuehbw0G9dgZ6DZ6S7pHk7s/Ia2DSCroth055V9R4kV
	 a6XfrWTwYq01vB7ic9HNPvdDbqWQajs1WY2+SxnGfVS6OveSzDnEG5+4ZsH7jMAx2E
	 pV57efldAweLJHnekmOnODknbfHlxnmZ7+21S7WzfUQ2HgDBaQmcGgpIKztJQTwUNy
	 /F94rQu9QMf/4PZ9B0QpNlvkMYPW40yrS6IOQfKjVDd9/V379ag7FsKnaA97q9fsoR
	 +I54U/iix+BTg==
Date: Mon, 2 Mar 2026 15:43:19 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Aleksander Jan Bajkowski <aleksaander@onet.pl>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: Re: [PATCH 1/5] crypto: testmgr - Add test vectors for
 authenc(hmac(sha1),rfc3686(ctr(aes)))
Message-ID: <20260302234319.GC20209@quark>
References: <20260301155351.5840-1-aleksaander@onet.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301155351.5840-1-aleksaander@onet.pl>
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

On Sun, Mar 01, 2026 at 04:53:38PM +0100, Aleksander Jan Bajkowski wrote:
> diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> index c4770b87551d..91831b548062 100644
> --- a/crypto/testmgr.c
> +++ b/crypto/testmgr.c
> @@ -4136,8 +4136,12 @@ static const struct alg_test_desc alg_test_descs[] = {
>  		}
>  	}, {
>  		.alg = "authenc(hmac(sha1),rfc3686(ctr(aes)))",
> -		.test = alg_test_null,
> +		.generic_driver = "authenc(hmac-sha1-lib,rfc3686(ctr(aes-generic)))",

aes-generic was replaced with aes-lib in v7.0-rc1.

- Eric

