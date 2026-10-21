Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CE9606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 06:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s/zBw58P;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FGCcxA8U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=; b=s/zBw58P/X3+/sTRYN02VgodJ7
	UXSZDBKIJqIFyobtmUDwvjjCvqsrMpS6/6O5GfBlrVS2dJBkG7aXZnlu1AT4H6C8X0jEE7ZRLU/IB
	IEo4uDOyfXnmUoMcSzlJfkoT35ucf1qAEVfiqrEy3xPNNwpXDb0GoZjtYKmRryaPiOzqo5DFj4QHq
	l1SAhA79ZI2Z9d9BMciPJGrg4EJ2OR3NU5lP1NvUtnC1sQ+u///ye0Lz0himw25kvundPkezFt7RO
	fK47vKPo/jayLhzwzrmLpKykmI7bECs2D8Iw6osBtDW4Spb1EntQ3zu4FBFrg9fMygwC87AJ1JzMf
	60bP8b9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPvQ-0000000BB8B-26AZ;
	Wed, 21 Oct 2026 06:35:48 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPvM-0000000BB7W-2tLR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 06:35:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso419556a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 23:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564542; cv=none;
        d=google.com; s=arc-20260327;
        b=eEAzxPYadEYuKG96+HaLMQArDJImPtMG0zgzX9m10z2yD+BeX0pJs1W+Xd3Ii7agYS
         tAm5Q5EhCiUUTviwiOg8LM/CXi/bBl3X4oRwDkCXsrhRNgngKsP9yJNEs1TzQBXubmwy
         Dum7r9Qhl0QsBfNzNgDCY7I6nHs9WLOo7a0um6vZc0bOdimeYrIkGgIP5ugiiGA5Idlj
         avrHW1xoudvze56dd8ucJHzkL9Ls94g7ityLApxViPT0W7jc1CmuF0uQ5MF0ssr3qYut
         xJDm3BCiIwhxnd+wF7woG582AW3yRuy1jz4/KFZHjFdMbWcBPPfKp4RiNNmeOTHMsoor
         oP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        fh=v7A0IodkCCJZJVWDkkGIhXaNZdGl1piLYD5BTekNfFQ=;
        b=a++5n4+ek79U0i9tTQBkgRWQWKQpIp68XrmVVYzGFW2HztPKYpNsFMYcqbHkprP+qT
         4mTngznfKwB1wid+y+y2z44EhDmpRDdRRkVrEUb/UUUafAJk3Sv0ohV9rI9/WEVw4n4Y
         Wj5eBR/3Dup2FpneN8lm2Gc4LVWES93U9hhHO/BanIqzDUjVTovzvcir4E9vGNfiaJox
         5RDGAq6FSarTVtSEHiJ+UAt8c3EIw8NBpKiG1pHDcFwdCfrqexnMh/ZeTC30517Thmv9
         ugTYxiBCuq2OtMD2zpCGezYmqP4aWAHs5Cr597XfoGuIsO2g3BiZuKeK2aZihD9474rf
         MoWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564542; x=1793169342; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=FGCcxA8UiSXYqOWeh6qBYgSyCxjppjqjrKxLSLGJ2ZUzha85mb3034YgP9OtfMCzXE
         CdPRRUg0BD9bDk66Ph0pW6vfpn0+IFYN1aQtkOPzj9OVzXgAR8ONeYpRgbJYLqmEejbt
         vn5IqHznMFaTFH8jibfJzVP7L+QutFVgYPP9vGQ85Y7nwhus3eJHl0E9qxpSl9cm3n0S
         BVWYF9IcM2lER9lUfJ0HBWLEgnee7ywgaIuGEuA/HGWwhyfgEbaPAaatMRgl71uLLRIz
         5EGP9dDSUgj/13lh7wRJ5xrGv5CN+SSbC0vNg7FzkCfSo2Yqc/dwXhgeSfEWRQ/IfjaZ
         RNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564542; x=1793169342;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=o/qLiScP0vpXvGhudFmuMfeIwtnnVMfiE5K/6k4u9JWLG0uvh0xOVgvqq4bk2H+4v8
         7cM2fje4RBNhdKsOLqzNynEH7DqjV9gBeIyLd97M0JmydR1Y98qDiHNAtjopnRre2uHW
         rgftxt0qbrjC5geXz/rjkMKsSrDKaembfmc3plMHgfNFqwLiXy61qnAtwLnwKjPmZ8qa
         Hxdc1RVatjsGWGtQ6OrnVaGKFcoYC7GYksGebb4gEdJczhHLABgZpriOQbhEI5C97ZFI
         C2xEfW6O2oKrgDJaqb2zTXlqD0cWUwh89WjZdf6QIhdggTVRVMONoddHeMc9Clqoe05y
         Zjlg==
X-Forwarded-Encrypted: i=1; AKwUvByMTdq5Adg6XScRGAKEol2x10dT3qw1Kk2sesf/7437LAasBYLRh4HhR4Mu6vSNm7no5NCMhZKZQDmHgynJ9Phq@lists.infradead.org
X-Gm-Message-State: AFq9FYLhRulhxxuPGnJQZPFQTpjPIsSPk9z9COM2DW2XmfqXE3VDN0Lr
	R9vmILqkwC1nC+2LfLU1nGz8m6d949OFww8X2Xwg8kiQ46Du00OdYREvZ2+E2wFHktpW+WwWN3W
	NihnWWh/cHWrACu0jckDlK+mie2EXQ1c=
X-Gm-Gg: AYBFou0uAZzgV5Z6HDK/9h77UYlE2Ojc+H6bmarMzYIIbTQNjjLER8xL4KpteUfFJzW
	mZllgZ5+OfVuORH9jmn3IdNYyn6BuQ9PY7T0ykRIqsIPZioTHYbwTL7tejH32lszdSl5mNrfGNo
	qWhcZQKoou2IWLIQzCcNGBNtDOkfKzNze+XVwaLIBliUsMUacmOKrtlSZkucxFQiVZLAfCVa/eM
	Q8RrI66AU77tclyn02TP2UHejVD3dGv3VNNYVcHQfS6Llyz9CwEqDdeex5+U6nOMTH4ZD8Ejfjb
	Sy5lSc6oNk48ySGwlWP97N90/zeOs5RMCpPRUFbWA+v0RKZvHa3oHk64BSPb7y4wv0e3FYQSuNE
	/iz0HbmZzC1lo4kkMRXGe8312f5G1/Adrs3FePv5qmZr3rpgDWAd6QKho
X-Received: by 2002:a05:6402:2105:b0:6ac:5de8:ab5c with SMTP id
 4fb4d7f45d1cf-6b408ea04f0mr627314a12.10.1792564542175; Tue, 20 Oct 2026
 23:35:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <20261021023245.GA3650393-robh@kernel.org>
In-Reply-To: <20261021023245.GA3650393-robh@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:35:30 +0200
X-Gm-Features: AclHuK-lIJk49lXRNa98GE7gi3l_Bk4TgNu432VwdO696lfchFDIYtZnsg1U3Dw
Message-ID: <CAORyz2JS1vf7P2cQkzYse_WheB4xYMmywWi6v2pNbeFSkCO9ZA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_233544_769612_E6A2C621 
X-CRM114-Status: GOOD (  10.10  )
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

> Or drop the example. Is this one really different enough from the
> existing example(s)?

I am so sorry, there actually was a previous email by Krzystof
Kozlowski where he already asked me to do that and I thought I had
done it!
I'll send out v11 without the example.

