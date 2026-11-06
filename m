Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEF0606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pel6jZd2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqqtQl9/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=; b=Pel6jZd2AZKepRPsBOeZXrmeyF
	8F/s8GwAPPUfT8Z/EtBgerjofXhtou9GfoM961qj7vq372iOnqp2rxLo2oy0Iq8vko39CY1F0kgPc
	DWB/EXUevpqyPVoRoG1c9qy5tskbfTnIsKRakqyLhOkCaVItDuev05dqfGW0wW8HhW49FGj0UKm22
	1AZ0AW1/8TWQFVoUcxH+WVBNjjoYWhQRJoa4W4HBW0qfiFeI8rf8npSn7oLLPCVcTJ8q85NXSWSLo
	Azw2hcCOnaeD/PTRY1mZytiOkzKXH6q4+WTjln/zqzmownPIT8CwJKDwHEpKvSC8WQJzdbAWiPdpA
	F5DiOTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEs6-0000000BVoa-02bc;
	Fri, 06 Nov 2026 08:00:26 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEri-0000000BVjZ-0rMs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:00:24 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so84663a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 00:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793952000; cv=none;
        d=google.com; s=arc-20260327;
        b=kM2Ms3XwTctBDX2Tj1sCZB8rWx4yyyp64dSX1ypGrUfpaSlT77IyDB8jLIVUQGnKjY
         yqkeQhwsNv0u1V3st+wAdu8he7kGg9BRwfPAhMSlrFSaPxWczGtNeazN8gMVU577KbcS
         okU2gRtnml54XiE2Om4DvPZqgoF3Jq40kz6/zJuNU9d+s+khpnMu+zf9tnYIIRvJd+Az
         2wx0xzsGQ/ZSNX+xrCIx2PDXsfSgRamqNBqIVtWQk6KBVO78Bngqh6i1BzMMiulPV105
         JE0s6J+3zLGjPyBIXRJU7YJJKAQeAiNzKO3akWAnJvLcOOOLSMoOzDVWDM9v3T4ChTCB
         aa6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        fh=TdCqpDGmUqDFdRpzPDQOXHDgwOXkmpvTrIiKYOyN008=;
        b=KnFMtzU/OnmLr7h0BoADcs3XIQLhJDLwnthpNYkE20wTj5xwtXUNVUG7K4kDO4dRqX
         H01o2ouaGaXyhwWtdLMSaagcGNvU5/9POjAMZT6r5UK6xfqe9TdcikteNSURF8w+enO/
         M/RmctuGCBPlW5WA3A3bbqekoRam95qVBeiVyrtwBz6tqkFT6X28W79yLw6fEAgcGxfg
         wlbPDLfjS08SqVEfjr/lKE3yBWaKkPpvpsing9W7yxADNvPb/QNe0WidINf6BKZxDqRN
         e5jMsxjl3MdrfYMEe29Rn6z2p/nRXkM5lx9FYvx57gWsTf6wQAdN8fpRNk/wcFtQ2kf/
         haIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793952000; x=1794556800; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=pqqtQl9/sNC0nFWgcvY5XEjxVELpMPV3DcXqzYweC7rpnYhQ8H1mFbd3Ci10xc7gN9
         U2CKOAoRHt9svR0rYDGKX3htmekO2K/l9IkE0o3nRcuBZtyw0EDa9SkD0Fh2JpaF0TwI
         0ivr49eKcELRGtjg99aFzhvGo6rbsu5tGfXW3J3QweO59qE9IEpSy8a6IbJO7dFNd6lh
         vWTaO6/SmlVSkYXixnrB+iKEgUXko9c/BbaJZ/jXisTVHPw1Xmia7qjNkrnw8veHM9Mn
         BiHkaIY+fnH9KxqG62A3hJBsIKd01pcT1W+6RXwJtF4xpyriKp/WA5nYY9triBnJY3Z4
         N8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952000; x=1794556800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=thjEPIVmgoZFImELPB0h6gm3mLMMpX3VV+HVLfeyKnOHvR+d8TqvZgIHG1uTDjSj1W
         I4e/1woVwJQiWytY2+C2HahY4zv31UzQyInLt8IgAGvzUXhd/3AmSzBwTZUND05dddFT
         kQ3RjCtzqBZG0XygMG3W2Xo79FNAkAVbw/JogepmJ7Tx0PWvAAQhpsyfIrhjIqMo59Ax
         nVrAf8TD1fC/f0+U7mzL93Y6mhULCfJxYVJW3abnvKK6Mne/npeXX0q6gFtKRDU8f8gt
         z7305Mn/zp4v9+laqRwlRsvdqm5dUzMKtrpD+cAIMU7HzknAOgFOWuXLhaDgewFm1NXX
         /+IA==
X-Forwarded-Encrypted: i=1; AKwUvByUPscPTwnm4rwSkaI+f7VNHHRbaTGyOXJRAJJqlhO+BxgnmpkhkqbDkY8LrkOYe8EHLWY+rn314Y48jtxzUbni@lists.infradead.org
X-Gm-Message-State: APuU4Z9CYMgDJbMedgoaEIBifiWVozBcBrPxSC+LoMzgTJez8Ica+JvI
	VH3XckdPvae1VghOEH69c3umrQZB/F7nsbamOsniG8VXZtnDqvIreMkg27ioXRURw2rTjjdGCuZ
	qPU4te+SP1Lr/IJ/ZFXGPCT2R/kKZFf4=
X-Gm-Gg: AYBFou26Mw+SaBoylyz+6KibtFH0bL0lArtZigFIMRLiWZKHEtnKAm91PjsXrPNWLsL
	uUZb/p2awZOylA5YhLK8ieCeHcLglwYzHEp63LrEzgW2cK7VHylR4l/FwBKATCFj9dLAeu8sGlp
	aZSsQfUnYr6OugUEogn0AZKiVWVst28snWfYY+IIN4iheAeDwITqjY+GSra8TKlc5FxxlTBdKrZ
	qWlfdHXo2CnZvpFBrUYzB0LqDaFS/74Jax+3k0AU8k2nQPmKe5ap8Rog2pj//Ivqc6LdyJ69Txi
	+PDPMXsjmsasjmftjMbhGJANkZ1HGdsvE5V6XVhK+OY4KUEK7FyHMnK4qmb7gBFoB2LAezLAqtr
	YOkLO5n0r+p6xpuBywkacA0azKJFWL5sgA+lHODjUupKMNdX0rYnLs8xO
X-Received: by 2002:a05:6402:440b:b0:6b5:9849:e335 with SMTP id
 4fb4d7f45d1cf-6b5985927b4mr1117288a12.1.1793952000065; Fri, 06 Nov 2026
 00:00:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261103150936.GB792264@google.com>
In-Reply-To: <20261103150936.GB792264@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 6 Nov 2026 08:59:48 +0100
X-Gm-Features: AclHuK_yxwIK0Nk7bFmyEO_n6HuxXT4AJJgazikzKXrXwadabrKuwJfTV_QGR20
Message-ID: <CAORyz2J_J0dYtg2BMKq9cuzo7U0j-cMQoFXn+2pOTztHz8dS-g@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_000005_306348_0E719AF5 
X-CRM114-Status: UNSURE (   8.31  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> How many more Acks do you need now?

Still missing acks for the regulator and pinctrl device. Yesterday I
sent v12 of the series [1], rebased on v7.1-rc4.
Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105194426.1113050-1-l.scorcia@gmail.com/
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

