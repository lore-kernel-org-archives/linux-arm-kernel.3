Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107E2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oaB6+n9w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=maDQ2WD6HiiRMLihh/6PlAJLLE5S+DKoSCvfTu9OXko=; b=oaB6+n9wxvEpMooTzwdnpSva5B
	5g9XCZ+bQ1mnF7wVq4KAKhw4d+9tAUhOt5j5IifFzjTIl1GfRAr2JPcvj+CCPBDzsJokTf3AGkJ9w
	odIkyDsz7Tyg8aIm1okRB48Ebbun3O3a9T7Pl/M4WidMvZ6Y7AwYe2Pv/SHJ0cQBsFsGWqnpC8uvm
	jeZBXSvgOC2CQqo6nT7JScOubIR2R8uNj+2QImh7Bjgfngvx1pzuoTAwxarp2AT042eSINy+pBIte
	1QEtlfeZxuDTPMT8qudpEBr2S1SJYPXDBuKh4nAjzvhwRIAHlVljQD5wBxRb5S4MtxtM2yTCaHHwM
	hOkfbI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObSN-00000005WcT-1kte;
	Wed, 04 Nov 2026 13:55:15 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObSK-00000005Wbm-2Nh6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:55:13 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so1068536a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 05:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793800509; cv=none;
        d=google.com; s=arc-20260327;
        b=C0X7feRVPRBVYTYRjNDmYl92B53fZeOmbn91TTSVxpB9bxfDj/biLpcpXEQ7jQc0f6
         3TQ36Ij/bv3BNvjuvIVi7BW3vqJxWmUuKlgbJSLOjMF/4dDS4fBDJuFInylpHJf+mds4
         X0zq0Rvz6Gsj7I8JSls1k2Sowzcw1eIk6zcxcjgpQGFxvCGLK2hs1OIM8D2yBLhXw60q
         /JLt9tinVjmBbalakXtTFlAcxPnkXM1UzVsINLqChXg/vkVpV9GPTmVfZbIbfpmS2iPP
         QS336bRHF8h+Ff9V1+wVgLxUfSp74/8lw7uFKZ9msLPLRz64oWn4ffhtpUUBIWkOnpJZ
         g8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=maDQ2WD6HiiRMLihh/6PlAJLLE5S+DKoSCvfTu9OXko=;
        fh=lx6zh1G8rQ29ryjlN2WgNyIng1pi3HJsZfGhn2rZ3jQ=;
        b=pvgZqW0vyeDQfM0pMaIm+dj8X7y/CjMxQZqY2ysuAI2OY3QFJ5C4mSG6bkt7ZAwApY
         phgqAZzyWp4Jg4AvgIZhV7CjackQZIkjo5R4vtRQATqqsGcPoX0ohrcm07cCllD+xps9
         rb1YsTseoih52GeKY7pKGSbqATdQb1DQyv6kOJU+cxzdyffnnbYDBubgqMdQ3S4gNZiW
         DypWrCLAgFP5sIdBzhZ5a7ZklUjnuNSsQnVEEyQu+IQoaaGaKgoV5Aa5DOwPPRjRIe1N
         1h7MkfnJu5br31hictlxsiXhP+yJzK5UxeDeeUVMwsRGR7s4aD1Bip2kszFQxgc5Emsb
         BdTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800509; x=1794405309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=maDQ2WD6HiiRMLihh/6PlAJLLE5S+DKoSCvfTu9OXko=;
        b=wBxRkXk40gIbY9yP7Lfzf6IRmYHP31Amgv4jWQ5sjSylkWkWVLQ+fS2ZrQI9draql4
         UcEetZVGlXv0YZpe7vvQGMCa899DOTBXz/+9ip8Sk2ZtASWbkIpMNdbowLQ1er+tL3sg
         n5lJ9ukmomGY298Km/yORc05IEA0d7u1TJ2LNw2ueWBlJH1UKFRip3WJJQ6kE7woi5TS
         iF2tVIF0y9/baClfQaYVLpNo6ndz1T3htq6g6GuUQW2KEvT5VI9EwsnqlpQInRJwlBBn
         7mYJ6V8IGKbYtDICdYpaiSwtMZOz9BfTSrMJKAyU9WygeXogD047SwYdJTYXxpteK290
         DkJg==
X-Forwarded-Encrypted: i=1; AKwUvBzUtpplcVNrkBZWjTVFNv0gETFk95BRwaz/Ie+mENfpgcu292xkhiTMqqSMIiQfrLBAmjtHJui6aW3VWqspJaKD@lists.infradead.org
X-Gm-Message-State: APuU4Z8tcibTVSIGLkKbqPKQAZBFLfRbgR6SNP8UjIQ64oAMGi9nqZp4
	zsZovSS3dN8Lsx5bvBNs2+O+FaPuM00lj/cGgUmBa15TKPmQVbmVXflAYyxzBjV1MFgma4rNEna
	KBXZv+vEvdbUz7llSjKVmZLHlaHVKbeF3jgIV1PuZyg==
X-Gm-Gg: AYBFou1cqXqsYfU0V7hixGp11+swAUqTsCiFMuHAkSrJuFDltFyBcyC7Q4RJT9WJxKF
	K05ytCjhKZ9TDvDiKSl2k35B4vQlkZv7fVS1zsfKnnavGeYMtSpZrolJyBsLXfZpKEVWoZM8fOy
	+qCaflYKqhPxyxhwk8q5pjc4DoKbo4VeM7BYB75w3WnsEN0WInpIe2+PDbegWWNJRLPHikHwr6e
	J85/cbULWp4LAmHZSjiTlYVyTKG7vvgTRJl8DZC+L0TcJ7j+HmY3BjSOIMmy/B8IKvc34dvNfBW
	0ToEbCFsWtY+8iciEbCr4ZGybralaLMumnIkSVufqGDieZyA327+VVVy+289bSlFV6bdBGDV7do
	juVk/xk2YYcII+K5vMhAed8Ys/jZOxHwAtoo=
X-Received: by 2002:a05:6402:1851:b0:6b3:f7f6:649e with SMTP id
 4fb4d7f45d1cf-6b4d438aba8mr8776244a12.7.1793800508173; Wed, 04 Nov 2026
 05:55:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020190319.884375-3-opensource@grische.xyz> <179279532326.3134.8925339564776340456@kernel.org>
In-Reply-To: <179279532326.3134.8925339564776340456@kernel.org>
From: opensource@grische.xyz
Date: Wed, 4 Nov 2026 14:54:41 +0100
X-Gm-Features: AclHuK-Y4PhN7UgN6Wg1KVGHuCHUflIixbfP_eRM3Iuwj9ty4dhSxmMFdf4CmYc
Message-ID: <CALsH2cy0Pn2DFAjqb5H2PR6o+_Vr=ig7bbL9-RA82sC99wf50Q@mail.gmail.com>
Subject: Re: [PATCH net 2/3] net: stmmac: dwmac1000: don't discard frames with
 only a checksum error
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, o.rempel@pengutronix.de, 
	stable@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, aaro.koskinen@nokia.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_055512_614950_9A1E62FD 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,BULK_RE_SUSP_NTLD,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FROM_SUSPICIOUS_NTLD,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Can this mask let giant frames through when Rx checksum offload is
> disabled?

Yes, in threshold Rx mode. The dangerous case was a giant frame that
spans two buffers, because stmmac_rx() parsed its last descriptor as a
new frame. The same happened without this series for any frame larger
than the Rx buffer.

Commit 834ec9530832 ("net: stmmac: drop split frames on AF_XDP
zero-copy RX") has since fixed that in net, and v2 will be based on it.

>
> Should bit 7 also count as a discard reason unless IPC (hw->rx_csum) is
> enabled?

Bit 7 alone does not identify a giant frame, because on cores with the
advanced timestamp feature it reports a timestamp instead.
With the current code enh_desc_get_rx_status() does not know which core
it runs on, and it has no access to hw->rx_csum.

A giant frame that fits one buffer therefore reaches the stack with a
verified FCS in threshold Rx mode only.

Dropping it would need a new parameter that tells the parser whether
the core has the timestamp feature.

