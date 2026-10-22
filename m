Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC25606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qf6RWjLx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oWnPbAqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KckalmaIjViMDWQxTjgX00osy9mL7j2AOuEfTdMk044=; b=qf6RWjLxn6muIV
	v/3GsHFnvbqFp1KrwB+WF+9oCEjuaWP1w7eJLabEk1JUSoC3tMzEFlpdU6FFbmN8Jl//8wBIz880S
	7GVHlYqvmS/A4Ep6PSsXoj2ZW1Bixf5YmDqHbQVNTg0Ct/PmuSHZzLrYIkxBdAlFYlLla2tVDtDmr
	S9AHyacmhMP3jJSHItYCNdhI3mx0b+BcdwlkRepeDMDYwUcblWqnoiAbaw8KAZteEZldZfBH3HIdx
	uWw5vWjwGrxvlYN/wmL8LVW4zZ3YaegkWW3ZVCz4BbG1GsxaV1er61lDQXcl75tdWkxBzTcRZzr5A
	N1ewR+37Poytyrg3kBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzvb-0000000EyXC-2MLF;
	Thu, 22 Oct 2026 21:02:23 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzva-0000000EyWu-0DnG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 21:02:23 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso186350241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702940; x=1793307740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KckalmaIjViMDWQxTjgX00osy9mL7j2AOuEfTdMk044=;
        b=oWnPbAqpNpboh4HjWP4zAqH6EOHpj0Y3B6GQFwj2lVqp9FX1H6Zma2yQ4MG8O4eWxo
         U8nl+yt2Q7f1MU7AwbNB1OfaFPTdRH3cotVrw3JdBbPSIWGoZVJA+iPnxAhL7P2dDnXM
         Oge7vqx25fXFqoBk9LlrS4/mT/bpsyMmsHnwNkMC4/Ec/okuPCd8RvGM5i5a7eFutwB9
         +eY+REEKEUDA5fdt+RRZRoZNEwHt5GevqQirI7mKHlnpC848/t2r7abWfAqYTB5wT5HS
         v2UsAuJJz2/7LdKBIL4YAfaH/F+RP9c37xWU5xzA8h6si5yZwtPsS3Tpj9Vx0t94XNK6
         g9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702940; x=1793307740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KckalmaIjViMDWQxTjgX00osy9mL7j2AOuEfTdMk044=;
        b=jXHqX+ey7EXQiJZHTti5SJeGhFcrMefBIKqDgJ2rHVTNuC2djLR1SXsYz8MJluWP+8
         9UUeuyhUY/D0aIJxily3AAP3MvaBXrlHTmbFz9uYVEpelkGn7D/QbviUtAbBB0QmWQZL
         mXO244BZSizrH8UDrQFO6Aw0kGKSClJjMwTNwV6QOvprUb/DaBYm/08ykvx+oDNjUE9o
         mKE0hNpgYI+XDz2wn2+wrS/cSaWZNuWfDh9FyDofL4aQOko5nMPjI5uVLQY57cY3dVoS
         JSGoY0r09YLKuqaXp2WNim1xGytRA09CbAG2/O9pnmG2ty6ZgzuZIXA50Ifsetz+myZ4
         xwmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL40GDsHbQEJ1A2iaLwvjUWq7V6uEHxq359+V4ruxiEKkKP0vUIg7M4to9EBnbFcgYHlLnWcwlIyQJyZQCzlmQ@lists.infradead.org
X-Gm-Message-State: AFq9FYL2D8mVtuVZQ/p61qruvOaRUpFkRj9Q5BM1Lwl4CNwVfe+6Umnq
	LpDEGC+AHxvsT9NA0XEVBbDzr8ntTaQ/BdUDzgECvzAnExBT36t1YAkh
X-Gm-Gg: AYBFou2tUEV8YoXL5lvDaz2VuTE9YRK64pwQj5kgwm+zoGzjDSgoqkJHI08cXg4oxXt
	n8wkcdsYj0Y/XTLr+LfsYX8iltYicAZf5GMMNgEdrYjheybY0kffjnW0JX6FYMOrP4SHiiptk+W
	JDJw+8uE23m2zS4+QA3BwwTRo6zoMUHXFB2frnhU9/73xBMXKDqbq0NUCTkeVw9iWXQ+m5wWOfy
	2M3b1Xojugxcx1u9ZU7/7DkLGrTJW+tWmaQ4bI7/t86oCbAHIz6GcF3C2etlmwK2+UTFvOrNN3X
	5NMSx9Aaka6DUztbduOmJJKbBJY32IdepImZ/ARnL1z9tH0v6y8OiNL++X+u81i6opukoIxZO75
	koEfhgGKa/IDwuVyk8gHOqCJ4zZO2WM91UHjw4HatCI7R4W9EXjmrFSAuiK6lhfs47n5pne6jTE
	J4IHWBNb4PGFYp8f6FWmNei0LA/SNjhwOI28AoaU5RuILZHPij4GBXZwhGXFozth8+HOt3AyV1h
	gl8EyoqoRzXiknuJbHSMdA+MaKVv0qO1efIsj+HXQppnr3dDHbupRqqf0ZGyX6uh1ECE1F1DotM
	orA/ltIeHOC+mwSIwm9E
X-Received: by 2002:a05:6122:4909:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5ec14a6ff12mr25880e0c.7.1792702940525;
        Thu, 22 Oct 2026 14:02:20 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f061cfsm303526e0c.11.2026.10.22.14.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:02:19 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: linux@armlinux.org.uk,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH v2] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 18:02:03 -0300
Message-ID: <20261022210203.80641-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4e2383f0-9791-4840-a4d9-93fbe51b7a40@acm.org>
References: <20261022183658.58090-1-breno3011alves@gmail.com> <20261022185224.60700-1-breno3011alves@gmail.com> <20261022185224.60700-2-breno3011alves@gmail.com> <4e2383f0-9791-4840-a4d9-93fbe51b7a40@acm.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_140222_125300_5DD7D52B 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bart,

> Shouldn't this "while" be changed into "if"?

Yes.  After the preceding while (length >= 4) loop, length is in
{0, 1, 2, 3}, so the trailing loop runs at most once.  The same
applies to the corresponding loop in __acornscsi_in(); both are now
'if' in v4.

> The above code can be simplified as shown below, isn't it?
>
>                void __iomem *cp = (void __iomem *)card;
>
>                writeb(buf[0], cp);
>                writeb(buf[1], cp + 1);

Agreed.  v4 drops get_unaligned_le16() in __acornscsi_out() and
writes the two bytes directly.  Note that __acornscsi_in() still
needs put_unaligned_le16() because the bytes come from the low
half of the 32-bit card word and buf may be unaligned.

> Isn't the above (void __iomem *) cast superfluous?

Yes.  u32 __iomem * converts implicitly to void __iomem *.  Removed
in v4.  The cast on the earlier 'cp' variable is kept because cp is
used for byte-level pointer arithmetic (cp + 1 must advance one
byte, not one 32-bit word).

v4 follows.

