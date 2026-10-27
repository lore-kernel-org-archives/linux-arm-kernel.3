Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BB9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 05:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vf7mpMtb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GhHbrh+q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EhQnVDe9USo4MEDAt10lIRyoDXqtd5qy3HB/D8OuXxY=; b=Vf7mpMtbFQel86
	2USEvvrBZhA6cuYlqvP8K2TXFCbHO4CcECopzcn00oh6VfMrd64KjMId+c1N9mS21khtWpu/vuHSV
	10DWJguV9/czwHRaoKIAdiFuwc5ZtX4fBXdUQmU0S5MS7X75tch5TL34hlNEj+3YTcvmW8QQUaMvq
	gFqFWFEa2aRAg3S9QxzxB2nDDAbo4EyuDfDQUpoanZfouJiE5Jmfg0aC3ctRJ9ej7KrZ6KCWk+pQj
	GLR4nA7/vuiWiDzdXaou6hN3K9OxX8b9kCrkjwJyS/sC5rkN5Y5fvLBn5OmSgaEVZFuDYvgeI+QIj
	fHU/mqD63Tc/wd1Uz0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLZRw-00000003lRo-1OPF;
	Tue, 27 Oct 2026 05:10:16 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLZRt-00000003lR0-2Mos
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 05:10:15 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc502d509c0so1104152a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 22:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793077812; x=1793682612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhQnVDe9USo4MEDAt10lIRyoDXqtd5qy3HB/D8OuXxY=;
        b=GhHbrh+qCTH8thLcNu32DOhpZv9OJeuiUYDiklNyetLIAySvm6Jd1KnasZa85tZmFd
         wh8DlgfwrJpxMhhFfr/laFrKFqcoTkPfHNoXm8StD86q/+wyW3K54aE3gV4tRpoAEssi
         980MT/pRJe0uoo3hrR8/7l+kIQsjQg99tAgWf54aJfgePQjK9eee/M9jdvvpRVUtjK7k
         ttzsosTjxKrafysrgTWbyizlWHUMlvUS1WhzStk68PtRfMHTgPua4hfizY4y7wl1+oVv
         cjW359g9jg0biuFr2I8MtZZvUSEQ1T99I3OHNLTZ4iDtkFtHXqgA0Eo4DIhlm4W+Japt
         2UDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793077812; x=1793682612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhQnVDe9USo4MEDAt10lIRyoDXqtd5qy3HB/D8OuXxY=;
        b=B5YCnNyLmF0TjLFvqfjGo5PDCGB/V/n+vzbAP1DsS7n2wyzG4Ge7sQbO7gANEw6pVW
         9CpXPD8POTGfWyLENqXLdNCsIAIv5DjHrBKYM6HiiUyJCSf/RQd8D6BFMc+fnJ3P2PYi
         c/9xZ3S2o5NzjZ9/coFTd3fBXSQcUTK2glaOHY2oeKxwlJ352TzDp+msQK2QJqDVL8q0
         iUvS/Sdc8Ba2czVSncGUqGp5KhtOXqn6L0kLvUCupF5hNyW2e7TAt/XeN0zPT//UNcLg
         t3C8/4ycsfn9vsTcPjyP38ZDZ91A2VSRDl3vmmBlAKWhPFeQPRlxTm977l6d4W53UVnW
         cEiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyKKxbsvqLpz7qHZOaqfWbHyPK2JKFNV2RzgQjnZIZ2YgDlgjy57S5knZU5g/ad73DjOIvicRwZy3gURka/TTm@lists.infradead.org
X-Gm-Message-State: AFq9FYJsERjvk3lwgjATG0/A972U4yd6Adf7TYe+GsY0y9XGrtIKx5g7
	bM9dLudnzYLpPJw5gdgpbWp/Cq+OJ1DvNN6SJz+QEEB4g1rEgjVCa9XA
X-Gm-Gg: AYBFou3qayXmNaUreKOXQ2E4jz3SNg0kf/aE2wxeb/6dN+TJyPtY96MJLmcJH8NhyB4
	+20/2o+C0/8iRV12HKpiF2iMBw/bEmSgajQWvyKmPLFPDQxq6PY7rNs1lP7AzyATSw7kWP8xA3X
	atuhh14LggtdsAW4SiiHfEs06IdyyGV4HmtkXP27Wx3qjJpZXJaCDl6VsNkUjLmLqTpDnhZI8AE
	uXl6odUK+/6jl5cL4mTq/vC2Z4b2aaMxaoazodA3byQBRtEHmqfognUjUhcwbTn1b9uFkQtENwc
	dwzMSp0cqnNLlFRWefTLL+i6IdCxgEhesWDeQ44ThdVfnWnuh45o+xYokFTxCu5BS42UPRLVTpp
	+DSzb2OI+Hn5qPbCvgY2JMjFJ1ksloTUWRtNOQMNMggkf0sRl5qIN57CBiqGN4ac/JtqPoOnEKb
	1hk2PPjsKe3URKSWisv+uJKNORFyNH9tvmrpqJc6dHiJbzc1v/Pm1s6OEBnH4D8AznAC3pxJfV8
	lu2Be38bZ5N56eUbMgRI3bPecjflpLe+NXVTA==
X-Received: by 2002:a17:90b:3b45:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3ade9b2cff5mr8125294a91.1.1793077812053;
        Mon, 26 Oct 2026 22:10:12 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200::7be])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404556fbsm1893858a91.11.2026.10.26.22.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:10:11 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: lorenzo@kernel.org
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com
Subject: Re: [RFC net-next 2/3] net: airoha: npu: attach a coherent pool in the NPU window
Date: Tue, 27 Oct 2026 15:10:02 +1000
Message-ID: <20261027051002.3360392-1-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <at8FyOLeaMlpS7mR@lore-desk>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com> <20261024154150.45733-3-gilroyscott1970@gmail.com> <at8FyOLeaMlpS7mR@lore-desk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_221013_612605_5D9AEF17 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

On Mon, Oct 26, 2026, Lorenzo Bianconi wrote:
> nit: what about creating a dedicated routine for both firmware and dma
> memory regions. Something like:
>
> +static int airoha_npu_reserve_mem_region(struct device *dev,
> +					 struct resource *res)
[...]

Hi Lorenzo,

Thanks for the review. Sure, I will move both into
airoha_npu_reserve_mem_region() in v1. The pool attach then moves
ahead of dma_set_mask_and_coherent(), which is fine since nothing
allocates coherent memory in between.

v1 will follow once net-next reopens, together with a binding fix
from the Sashiko review of 1/3.

Regards,
Chris

