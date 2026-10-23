Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oOXT8axO;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ku8vmCuI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=; b=oOXT8axOt3mFS/
	BUhD6w20xHJcBbXuv62F/DuTa/OkPDTMkSxjl9F7wEMJQdVuuRTViTLWBYC7nD7McmiObYJYbE8Pg
	mgS2KPkUkaOdW1ru7OpApS0EbM8IJaAcnxAMgVnRhLgByLGSIu5S4msXln3y2DWitoK3w9p9fxWeb
	1kNgCnkcNNLb5Q/rd8nu1/YtiHGljjn/BNJFqUig/8TeaRN7D3dMYR8W8xp/KGtn8Jpe1FcXVVPkl
	pQWYQGGwmxbAyK2EDwufvkTwXE6fl44y/SgLFhIjYDPDvra2rqCHOPxDU7a9GeMe89OfE37/Grwm+
	3+8bQl5ke2Nh+6JCLR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAE1-0000000FqUg-0bBA;
	Fri, 23 Oct 2026 08:02:05 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKADy-0000000FqTW-2Bar
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:02:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e9d7791b00so2293965ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742522; x=1793347322; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=;
        b=Ku8vmCuIyP+KKcF4wuwqYrNJh2FixEd9/qqSFAz2ymki8sAhdYmDZ3YXafzj1j7NR8
         G7p+4uEp1IaAZKuAySjP8KEZo6C6tv1HAGnjlWZ1DMyJtifuxPR2cvX2NGwYzbxh3byE
         Cg/7/6DoXIVJkOmfGpnK7/hLhFu6O7cvbw1Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742522; x=1793347322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=;
        b=rmT7d+uslmHOxu2JydHcZr70N9rzdIwSUZkuI+z6UwLeB9fkfBL56wrAN26usAmdlA
         iAByr7txtzL7VwD8KfM8OAFcO7Ku7hka4QXSI0n95dgVN8eLLJqp3R5rYiYiYEoSAShk
         L8AQ2AabG1n8vsHBmsGxZYglfDQFSCnQf9GKnHhB9x7dLsKFsQsmSOYOZyGqs2fGIkCF
         BTCCCT9z9zi+h1SvWnn+vJlILnBVwE2b438BbIlaouxe8seSQ2dRGRExFWofIlgmfWm0
         kt5drBoadom7QEoV72flqQMG7unG/OV4vLLsv2JeG26Js8VtipJcmCv2T9Ale9UHlWVZ
         T7Vg==
X-Forwarded-Encrypted: i=1; AKwUvBw/Jg2eH4cT3vdeP+tiIVsFSJjFnCrYBOMO16C30Bjtj+H90M9QmBaxrS/5tNYmpr6p2X+34RhMb9b/YAP5WOAU@lists.infradead.org
X-Gm-Message-State: AFq9FYL+Dd3W23Bmyon10oUqjm0NYp9afU+a5MqnpapxzQbKmjTyZDmc
	t11wyvELhyL4vNHqB3w3O9aMFBuZgsqJkmTlM93Bdtam9tNihns4j9CSquFMoSMSn7eJi4rQ+D2
	kIZr7DMEV
X-Gm-Gg: AYBFou1lxEplV/8wFCQv+XIAnQctbs5mPzdYoDgp+7IOMfXOZ/ibPJDq6dG02r/Q400
	3ZK/46d0iemRWt6pQlvcwzhc2DSptTXrLmqCDm8XRecSMoYqye7TL/aFUTnq2TdRJ5ZLA5W9z0g
	WWPVFgSNgcmccAtXuGqWi9FafvszN6//dw0SyhFIuzcVqm22trAF1iAKzjn4v7pUGznpoRRybwt
	gXbTvZF9THBlKQD9YONYMfpMdDDJ0tbPB/qOY7GGIZRf4W3/sLuy/1VftIp3l5nHL05j9is3QA3
	Sn2e8FTfH/SDnwHy+PWuOyd1jf6J6fjw7dmpeo7pnSzk8Dr0nwTQGOhR3z7Oqx8iAV16X9TzCJD
	wINjw7jk+jsl1Et912gYPXgemD4I8iH2eldiAEnR+Akj9IeuhSwJD8R9hPtHyWs3GvvEhEb+lEv
	fobXOa2/MCfy8GoXAfl9IDS08UFDr8FwHuRitj+hsjxDQ8lIvKJ+ynP3CLkA+j0Hu7bMl3Q2f0J
	ZaADSOqQSOWSiPG9oh59VzYVSdRk3s09rLazhJOGOpfPQsx3lYSffLWi9fbOFMZM/LBWO713Fhd
	CAXYdy20gc/2iTXXOQ==
X-Received: by 2002:a17:903:1b48:b0:2e9:7b4f:b98f with SMTP id d9443c01a7336-2ea7ce422f3mr15516365ad.6.1792742521634;
        Fri, 23 Oct 2026 01:02:01 -0700 (PDT)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3dd597sm6943955ad.62.2026.10.23.01.02.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:02:01 -0700 (PDT)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35b2c599f43so1473022eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGOKVf4GFXk2tG5UBjyIT+JCVzoZ9JBQ9Ok7MYZrC4eyiTSnAgVfkDwoznNglDqErDL3WBqtIqjZqEWr4dN4GQ@lists.infradead.org
X-Received: by 2002:a05:693c:41d1:20b0:368:6841:c4fa with SMTP id
 5a478bee46e88-369d97cba44mr2146857eec.25.1792742519525; Fri, 23 Oct 2026
 01:01:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019060825.4163770-1-fshao@chromium.org>
In-Reply-To: <20261019060825.4163770-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 23 Oct 2026 16:01:21 +0800
X-Gmail-Original-Message-ID: <CAC=S1niGn0omF1WCr3NbNvY6jZvqZu=3EOgrPEXR9ER7L+onfQ@mail.gmail.com>
X-Gm-Features: AclHuK-R_JeODaJVMp0e_2XshjhzldOiDGJ3AA99g544rt-KmJQNU86dD3TgdPI
Message-ID: <CAC=S1niGn0omF1WCr3NbNvY6jZvqZu=3EOgrPEXR9ER7L+onfQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: mediatek: vcodec: Fix NULL source address
 handling in decoders
To: Yunfei Dong <yunfei.dong@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_010202_568955_DA0E8FD6 
X-CRM114-Status: GOOD (  15.22  )
X-Spam-Score: -2.4 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 2:08=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Both the stateful and the stateless decoder workers peek the source
> buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
> returning the buffer. The buffer stays at the head of the ready list, so
> the same job is scheduled again and fails the same way. In the stateless
> decoder the media request is also never completed.
>
> The two fixes are split because they fix different commits, and the
> stateless fix also has to complete the media request.
>

I sent v2 to fix an issue where I misused mtk_vdec_stateless_cap_to_disp():
https://lore.kernel.org/all/20261023075642.3671805-1-fshao@chromium.org/

Please disregard this series.

Regards,
Fei

>
> Fei Shao (2):
>   media: mediatek: vcodec: Return source buffer on NULL va in stateful
>     decoder
>   media: mediatek: vcodec: Complete request on NULL va in stateless
>     decoder
>
>  .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
>  2 files changed, 17 insertions(+), 9 deletions(-)
>
> --
> 2.56.0.176.g3575e65682-goog
>

