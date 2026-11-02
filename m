Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AE0606A338
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r/8L8sD3;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tAuGll0a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=; b=r/8L8sD3bPyQ8L
	TtIo+TmCRv7rQ67LBVY/ugWZiBt7wp+822e4jbzUNX4l/O8Ns5WEGy591yho5FnOPgM4zc3Qpy9L6
	gKbltkujf/dcZh0PNRFpAEHvxYpWcCxCy7eKpfh5p1l7mO22fF1byihG0Z7kfD/mVYz1pC9QXzwCE
	tUOjyEmpf3JTMfys73zjt479IBRMKhUu+q/to3LamJyxiQpiqr4c46wM6kaF24LATVuLfi7ghc/A0
	RvHXK7b6QvSsTAX1f30rsbbxbCVnWqbkE5AEDPy1D/ZJwTyVOwxeSqnsTe9ifLwN/Rj54D+rIdSrl
	59md65JT1ptEXpUxNhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzXh-00000000TVW-3wCf;
	Mon, 02 Nov 2026 21:26:13 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzXf-00000000TUK-27rG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:26:12 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-67a000ac7efso2890087d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793654770; cv=none;
        d=google.com; s=arc-20260327;
        b=XcHJ7yEz/J23q2sqxW4ykg9B9hCZa0s+ypaOnJas7vPA9kSfQa2XrlEw8QyLrVbUAz
         E7sXO/UpeVh8lnVYlvicQUvSH6fmk7sxXuiKDcwcIJGPyui9atfng0gwYxUPKk6iSRoH
         3b0kA7Ns1910gLZkdi0lIGULjsdi+NVUVUEWXveGoQmOn5tzwNpInjEnhxDhC6/b5Lg4
         6sVdid80vg/1UuhXBdL1xszmLyFADK32ctwGZV2CGDgBFmBDKc9dfHAKgngygBzJMU20
         3CSIFzSDAmp+32ttz/RuYvxK4vfPQ9iUv3Qj8rwttB+e/KIU7XivrAFFRYp5SpRsuzWm
         5Mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        fh=n0SVYViLjdRZuM9Sv4d8xQPrx+2ggi7knL8VA6Zweps=;
        b=GJP3bHMdQJrpTE6iL8ZOZKhASMWOVF052FjMb2l5q1E/w1fZhlhg2ee6C5K7WSNg57
         jBC0vM2lpJWw9GGTN6Y10b3QMtiYXbn+u8gTX/vheU46yjneTyxxi0RfUSA6iWq1PYmW
         ldfn5TcIelrLKJ+FAqgvjEPyan074U4niExOGC952xIGmR+QGSGUaTESPB1ef+b9zUKg
         Uk9iaEQmmIU3MtDKxw+1UBTm9y7tNVsMNMRVI6E/Ctzj3pA5YMjYzCLxGRtJRsts7K84
         Kw4WOWq8PqpTs/AdLWHiRorBrxoc7hhq9yzlbVOeBNURQmTdQVmDaynmElKyrEHdIjlI
         pTqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793654770; x=1794259570; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        b=tAuGll0a7svpkTkFtLQ9ORQ7MianvvoG/We/lDVkqXFmsXbOZAeaLkFVfJ7Oi7lJrR
         cp6r8XA7uQyy1QEnFUTgy4Wa9qhLXpCYncpcPd2x/w4+6xNleOYSJ3VHjhzmcLJ7lTMt
         7Nw3Lk39Mj3dNttZd8S94gIc065SSrXl6R0DmpOP0QFO2KT92/65sjuC4FxOpdW7n7b4
         uUAIZLsYY3VqSi0VniNNWHAQm09i8PbmxZGXXFD9bsvJhpv4xPgG+g2anPrTqKe24F7L
         3Laew7zk09cRPFIqrzS/YNFgiLmv69T10YDF2lVbQZiTPydvBm5QRIxo7FWO+dow5r57
         R+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654770; x=1794259570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        b=jZpim5nMXCP+wkU04+P87Z18L3yNddTdsNl7xg6JHrB+AYPwWaTz2UCPshVKBEweRO
         Lx/q+Mp81sJlkT9TW3YqRPjf04BbRaj3er0/DkoP7Pd8QCxG8d1m8UprwjFTMvKoY3I0
         6rMRgemmiGEV8aXNxC0/ctmP6xCXxBDznUMQv1bf6fQrtaxJwCJbnjgBqNUmuxqsGTnJ
         6unYaUd/EAAt2/sg6cw5khsp9Kfq3rH2CfWNPwn6M1mwxn0wJtbu0aKVKdg6UIfuCsey
         xhQnC/2GvgAro+zf7hbzCEr2ARheZ3sMn9lsyEbQAftv5bTnC5qOw713/nDTtrny/FDd
         HjEg==
X-Forwarded-Encrypted: i=1; AKwUvByvgabtiIvvr0XrULtmMaUt25zqZp4YV1iXWiDLvQc57AVIIQbvWS4zMrhc4ayKr0xsa3dRONyNc7o02dXd8dB6@lists.infradead.org
X-Gm-Message-State: APuU4Z/vgcCF6gsq9Jb7m3ShusH9ap48lSo/rdHBIC82rNZY0LBBKT/9
	iF8EA017+Q2KQEeGFc/JGYH7QcE4oCmNVE6Vi1N+fx8ukHcpw3pp/i8ZVqQrSQAbNUP6OmAZAvL
	24nuYzNUTDutZsXoIAuLW2Ykv1K9Pzic=
X-Gm-Gg: AYBFou1x5htrTDS1hmobcQS3HW4fPOI/oRii1JLD4S/+NEmdrQPvwDtXEsBLAllOwYD
	Y/p1Cofh++OMdBDTDaccBVYv6h5A3TGCE/lJaZPA+6iF+3IIUXreo4OTj9aKRSGTs4fumS331g/
	YrPJEXVW8T/SCuxFYbdE4v25WThwpDk0XhrF9l1EwoYDEkLVg3pGC6i4BNFmI1s/ncwaaKrUm/0
	oBWKCTDfOA78mAbr5Sj917ueybUVsU8oNpMeNu2bAVg0Yi4CLGJ816oySxrB8OcjewoFEX14J3u
	C+17+PWoOeWuTtQ+xkgEclMX84/p7/1el6s2yVk2FRn6jacTP2b/thXLreyYbuQXX5mp3wlg+XU
	C9sMaM9/Q3kLyQGqkriGB3GpRMqG+whCiJ2aiF1K/gMNi+5aTTTcGvRUX
X-Received: by 2002:a05:690e:4548:20b0:679:8af3:af24 with SMTP id
 956f58d0204a3-67ba4f07cdamr5305703d50.52.1793654770101; Mon, 02 Nov 2026
 13:26:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv> <20261102-ping-fan-1@iav.lv>
In-Reply-To: <20261102-ping-fan-1@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Nov 2026 22:25:58 +0100
X-Gm-Features: AclHuK8ZaSBmGhthz5zT-hTxTfEuu2AtIUbTr5TxRdgub1ai_FkOm5Oe-6lP88c
Message-ID: <CAFBinCB=oJO06YrBGxYBPTTA2HP-xoOCKCivfRSGGryGRf-DZg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
To: Igor Velkov <iav@iav.lv>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_132611_551658_E09572B2 
X-CRM114-Status: GOOD (  11.94  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Igor,

On Mon, Nov 2, 2026 at 7:47=E2=80=AFPM Igor Velkov <iav@iav.lv> wrote:
>
> Hi Neil,
>
> Gentle ping: this has your Reviewed-by from Oct 7, but I don't see
> it in for-next. Could you pick it up for v7.5?
I'm sure it's still on Neil's list. Your patch came in around ~7.3-rc6
which is when the batch of Amlogic .dts changes has to be sent to the
soc maintainers.
Please give him a few more days as 7.4-rc1 has just been released. The
normal approach is to go through the list of not-yet-merged topics
chronologically.


Best regards,
Martin

