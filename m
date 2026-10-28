Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3268A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xfawh8U4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIbFyOUW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=; b=xfawh8U4Zi2Vtr0SUKnagUwZAG
	ogwuNyru937oOgG5B1ZzlIAbxd/oNvFu0lcHrOTgv+fdRO512JAB2XapKE1l4E791VSgqyRQqmyny
	Gee0fM9NA0yY++mL9BdqQfjbaMk8MWeuaRUb4hNCcN3P3wWRRQbTJ4ksqH1uWCxHPKluK0QQhGh2X
	onXpa1BuFzevjnfwfJyNAhj72YUWOUbwVbxtQndhMEHEdyGsbMM9s98+Hp4QxKFnLrPaS3S7rw8RP
	Y3joOWblo98pCwcl2RRz8adpiyOVXUdmYgn27jSOXUn/jRMv4etwB8L75z3oqvabIv57YAH0DnggG
	arDv7iFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM18v-00000006nC1-43fV;
	Wed, 28 Oct 2026 10:44:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM18t-00000006nBZ-3YVt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 10:44:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e5378b281aso3941125ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 03:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793184267; cv=none;
        d=google.com; s=arc-20260327;
        b=UU1mTRj0ToegTtw6SRxbyZdVP3uEb0XgAnnI5+B63nPM0JWg3uQIdMDNy6cm/xnzxX
         0/yWAf6mLg26aODnCcjWfoy1Cm1UFT9yFxoMwSfVOKA52k3XxZA87qa4sa7gRw/r/hDF
         W9TNT+ml1/4/eiyAK/p4R/xhWvZpL7UJAtJNxMmkGuxyh6fHqbRHJP3MkVbz5Uywxmyp
         zPknUE/v0SkebjV75M0BN7SGt12TQv4aWzPhTXAPmUd/+ow1+W/9ALUtKluQFVI7jUkA
         zVEU2YwH8ABWXrCVDtNu4d4d5XJXwMm0BF2hua9tliWuJ3rQAX4mE4CvW6rwTpxoBEkc
         DObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
        fh=4Qq2Uo/6ZBl5aCOhkWnscMpxtTzJzTYJXRf4sY67nBg=;
        b=JKi6aeHEL9TvdgAhkKhJcHCnUtukNi6VGbM/hKSLaPYH7RENtJTOY3RUiN0Nl3mbLx
         kWFNixapDG7dOeP5ken04fJPKltfCoZjIYbzeGaIyBLWOmgTqPyV+Ln0kqr+SB2aoAR2
         vPh+CfofcA71ra34lQC+WXyuZU1sTS8BUHi6w7IPyCH+dJUIYysmVabdR7JoCyZajcD4
         RYNmKVHhfToIVmuEsyboSEqgdEOCqBL4xw7dXwXdcSZPzu/kVCGiIfh4sNBp7QddfzSr
         9LEdWDP3NT7kmd3Ug/Hsh7aP/DjAOG53F/Li4bUwukavVz9znvSUkciGgU7yRCiqQy6Z
         bfdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184267; x=1793789067; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
        b=MIbFyOUWCFMO9a08Ds0gN1BmSRp6zjVWMcDo1Snri5G7ITC09IrSYQ7kra0OKmlwsZ
         yoqlcBCboGPEiWT04dLO2oS3GFaJ3zIg1dhmEwcMWGqWDMQyWXyvVKnkgFTPuNiBW6O7
         dqZxEs3O3SNvUox6H+m8krYOeLE99GNyyAFxyrAKyruC2XEJkWK8euYYA8v4N6tkNNUD
         c6d6mOQY4XK3Mnj5M2Sh9qxWOkM3JEt/ES37ws0XOo6spxnvM/NFgsZqocsEnkJJbNL0
         J+U/2OSnfNSRXnMkC9+EIoh619zStUcVElrJO+KuteZQBU9Wk7LywfCgf5B0xeRkqHfB
         qD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184267; x=1793789067;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
        b=WeVRvCH8v2FbT9y7FSRQB9ic0Z15SpNetPA01wA/ki22t0AsBhAOIv90P4Meuzc1B6
         tikF9Knli3K0qSDhIiHNWrUjmtCjreP0a0QD4v3sD3gkaSoHxivv9JDp2hC7utD4wDIi
         +dDAzf3vtEws7F5sDa0jW+/evsaI1kHDjnHcuSkeeQyhp/WN3eevgzddq7r/C3BPG8gZ
         Zdzccu2fPIsw7g9FXoY8urk0drFsR6ifze8UUPsUOWrHrlcDnz6Lt7mqldQIXy64qJgR
         k43ZwloA/6X0MT8FcW0f1XlIGSyuixOSAKzwjqqC2TUAQWX/KT3NkdNoYPu/f95JcC4J
         l3ow==
X-Forwarded-Encrypted: i=1; AKwUvBw2BruiT3VY3ZKB2i0Cr6lX19AA3cjt2I8P/9ZiuhhaE/2ZNe1y9G7X++I29/KhKxUX9ZjUsu0dGXmy1RYUWX4+@lists.infradead.org
X-Gm-Message-State: AFq9FYK7E6XpRHTng2t64M/WBYzbVrPs14iXkU50yh01IQfybD3m/Rpr
	KymUJR5W5DJhvJIENA534K+aiEy/64ZvpXnwb+GeNQ1odtdThkfKu9wU/+90uxAJGZB/OUO//DD
	J8mHc7IvbVrw2ypkHYtENUZ+6JONfiE4=
X-Gm-Gg: AYBFou2m7l6catxXXPI2Jal1m0ZIGYK+rn9UPlYBBHs6xjsXT0YinfjazAFjLQJBbTA
	2zq7+K6a86yUSuEn2RDiFXj/NUk0Nm9751jZHlskNmkBT6r2RAGQ074y1E0JM+Qv6klE2Gux/Zk
	fnQ7vlbCPlmDFug/jpYflviixsQPhkZPszgTuZMvX7Ig6oBz3Ip77J4XCA0vF//kE0WQgnunRdv
	Dh90eYsVNA1RHTwcmGzllmYIOjPQUWlDw7MNTUJbUsnGjGDlYX5umf5i30OaTVkaSzzrGxfp6jf
	2jipbP1gfordeGaO+ueYzRsuHZInU9nwPniMCwwWDfrB1KWpuz1TGBS6tFIRmwM89XwxAAllzI0
	UL14ONQ5htAMbjge1LcZaVJXMQwnKusmcZu4Lb8wiIrIjwdjJMDQrVEmbHvf9ExaBugz1zZs8ck
	ksDa+aVNQ/xL7vjPV77zvWzv3y8hM0UU9BiyDiK3m7Uy1uvDfG
X-Received: by 2002:a17:903:1b05:b0:2e8:3e5d:b2b7 with SMTP id
 d9443c01a7336-2eb003e9deemr18278615ad.40.1793184266731; Wed, 28 Oct 2026
 03:44:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023102818.523331-1-phucduc.bui@gmail.com> <57b8aa49-2b7b-4b2c-833d-893eff95134a@amd.com>
In-Reply-To: <57b8aa49-2b7b-4b2c-833d-893eff95134a@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 28 Oct 2026 17:44:14 +0700
X-Gm-Features: AclHuK_exAGUSFD09jwFsm5vTmTuUEGazo2C26fC_zaBNTIkZVwUtRamyW3Gft0
Message-ID: <CAABR9nHDSHmDwGSS8gdBp5mAwuVJnCLjK=_+9VrHjH4zqj7p8A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: Fix read-modify-write of
 AUD_CTRL in hw_params
To: "Gaddipati, Naveen Kumar" <naveenga@amd.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, Mark Brown <broonie@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_034427_906538_9D48566A 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Naveen,

>
> Reviewed-by: Gaddipati, Naveen <naveen.gaddipati@amd.com>
>

Thanks for reviewing!

Best regards,
Phuc

