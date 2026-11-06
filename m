Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBFF606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=COO3rUKh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TsS9tAY7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=; b=COO3rUKhfkHWtY
	I3UfP8xfHiZh9Ce2JG+PHLMrxwIIjXVblF8zOYaXXNaT09/Fa/c7LHPOiViYKXXceYf96F26YdRjE
	kYhmO0OrZVvCDkkuuc1wLc59CNvl0gKyrjOjZQRkTVf+AJkIvoS3RZOY7qdb+tzcvx1PftbcYKrVd
	6908xO6AZjRnBrwF0pWGUFtGLFHJk8O3rbhoSVHl5Ht3f6oDsDX/MDF3/CvTENN99ZpxVEPC4ng4Q
	S3HvE/4S0/U2w14fmu8s9q3mr3Ry6u2WgTClu1SJEB2Ly2kLMX5dApygQiIne+VIEL9jsSALHRBeF
	J2r6GHsOTfCFS2QY1F4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFJL-0000000BYlc-434s;
	Fri, 06 Nov 2026 08:28:35 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFJH-0000000BYjA-0rks
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:28:32 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-7cc91ddf447so144758137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 00:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793953709; cv=none;
        d=google.com; s=arc-20260327;
        b=RdjTqfCFwqhM1Oa96WXmXSBAUVRJ4QqZPYOj8na9ZT/AaRDXAaUU0Ma05CnQnrt6VQ
         Zx5+T19juVWfeqgq0cEO9lnn11f/6kLfobXxcgJb2sDFHmhIYXMdJZ+ex8Jqi2863rip
         PcoasKD9wf9WT1GmwuexG3U4QqAdXg96TDA9R9lCRttqEfvQCIyJd3iiOPdR2Gbzon/R
         rlEmRQaZwPKImPkPcNRNOYngHGvY1SywWGh/jcn02n5O8WnrzPZrEN6PKmyPTX62Yz+/
         yr7SJBwj6QJOMY9gk8oRV2PHbSf45fescwlym66S2zXMLfji3O6OqmjhutYtikdCAIez
         uasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        fh=cqZVm8I2uM8YGFSr05YlFQszhQ0cyuv28mDQoTdVcWE=;
        b=DiRUsMzBZD7YZgAYLXpib4eaCqaT9lqpflaegsJTLTc1cpXyfceC/4AtvWM9pdp6CL
         OScvAluk6hNoiwg1da2MuJuOeZa+C8XiBet0UnEYr5B/lEWjIx5tahp2BRdgReTuObhc
         wMYfsULd4UDMBsD5wtODGUgr9coiKJSQb6Ro1vlG1cmdzU6FgSCugZE5AVWUb+M4DIlc
         F7SGfGpTQJYraC6hfmExeGARp6rNjgl9dLt8Snc6X8yjJ+luSK9gxJ+d68tfXAY7uiQR
         uElEYr4E0LkJmyOZJ7GCn4/yc7+F0CjZUNzuOlqjlsDfrHZWRTiwzb48KlKf8eRttr1p
         6sTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793953709; x=1794558509; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        b=TsS9tAY7F0pviaQtkqfM1/Y+e8rhBm7b/AA1SjtPkLT5JpcLIi5W9XalwlIsEH3NZX
         eFBod5aJcZR8VvlDKAqf/hG4qrCwQRNeBFy/ipHDyFKFwOuY70p4hLsRB5ieS7QxX6OD
         HhCWH/bb/6t7iNv1afioz8Lf98UhLThbQ8MNF86WbpEfqg63rq+2Z7JCgFuwSwmJt9fi
         sXIgW3NsGCCCJdnKqkyoAqFU1gj9UW1dQWkm+2yapkP5rTKwa7RQ8DaInTLgVQxhNo2N
         iF4zMgz8eDbXf+s7Eh+bd+FsUoHluReh4aIcUq51Tzy3Y4/RJP54CDEs2mFZR+srbOkZ
         LKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953709; x=1794558509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        b=r0hSbnwRlUuskC69YjmEPqfiEhIjSKpZ9laM6EjwqH4wgJpeLsl+w1AaoFbtV21tKd
         eiXBk9VHbjzUlrz02vTiXUmyGPkGCCRxD+Y0fgcks+TDIeAInU5eBVAawdem3KUI5Lf6
         j14NVM6GxagzkI6IGvi2QmJuvJR2m9pCkrtHvCO4uRgG/+8kwCtSj5jgIGv4WjBBgMj0
         PoyT8P+W+ahPRR08T95+QjgDhyCo4B8knjr7cs9WDu8WyHvFjIEwbN/tEySW+EKJF1KH
         sBq9q5oAmKs8+0brJexqougtXdlzI1NK2b7PLovAAyYC1pgfZOf0CzUVYV/lVYc/oDhU
         MSEw==
X-Forwarded-Encrypted: i=1; AKwUvBzSCu/AWz+3S8BJ34LsksSQMxJljB6gntVfQ7jxk3tB7LFzhTiAGDopRClfEY6pkmHFpF2Fg7X4H5sXHYQlzEWY@lists.infradead.org
X-Gm-Message-State: APuU4Z8/lDPrestSg4ynexe1leEzSGqXxxYAu9T9FntyMva+Y9thg99R
	S17F5zSkbU8Tu7YnSQCoFH+YdeaYiKOnbBEJrDzCR2yvr7sHv080kxnV2k6hC7URWSlidYGMRfh
	5eQ/9s5sRdCzf0rz0wHfSEXUaQvLsjpM=
X-Gm-Gg: AYBFou3d7BshOe4iQg3guSMqygh05Jb1Qe/+nVwBshfQG+5iTxcJc2LM3XpIyf9wa/P
	KQzvZS9mPwqzGGCp0Sa2jS7nvnlpJjhXM7T5VDEtj0wq4OPvJsIhkn86Pyx3zIODdv5jkx00OXo
	9v4qfp3Ke7b+Q2jRKYY4UFkdoX8CIs9cY5XgHAqmtsodLKEKWUHlUovdfn3QtbthfxebGKqG6jb
	5CXhL6BHepFGHvov/V+ikbSYgetk5IIQ4YozYh4ShBKg2O8zV8y6r0IimNuWH4ht3lCcpe43iPr
	2dIVQGQ3EEzyCx2sdzlGKsFjA/4H1SgzkiSKzyfE1YlAfDXnQ0AJYICdPASEw/IDo3Rn88eORE5
	tdisCe+JcdOcmAXAuHN7WYe2gUNoVmLY5mHualJY39dWGDHElmamu8bXtllovrg9WeoF/u/JK5E
	iPQHtxeTV8p2zGLgrYD4b3AIu5awBJvy9NOCKyeKIwBm6u3NHz1Qg6MSvQ0W1N+ubi0pyhKq9yq
	plsqDSWkyHjRY80LAHmnvf1OP1CIQ==
X-Received: by 2002:a05:6102:4bca:b0:7c3:8150:83e7 with SMTP id
 ada2fe7eead31-7d2a154169emr1074240137.9.1793953709418; Fri, 06 Nov 2026
 00:28:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
 <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
 <20261106-crystal-flat-caracara-ac1b3c@quoll>
In-Reply-To: <20261106-crystal-flat-caracara-ac1b3c@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 6 Nov 2026 01:28:16 -0700
X-Gm-Features: AclHuK97Q_fmR3tCSb11vsNOkfJ9UktWDyo2C1YoKfEXjUnSy-Rv88kHCKF-O1Y
Message-ID: <CADvTj4rYG01pNxZS3FAKzHw9yOO79W-zMdBzaXvV_hrMs+sp2A@mail.gmail.com>
Subject: Re: [PATCH v10 20/26] dt-bindings: mtd: sunxi: require the H616 AHB reset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_002831_246562_1879C1EB 
X-CRM114-Status: GOOD (  12.87  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 1:19=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Nov 05, 2026 at 11:55:36AM -0700, James Hilliard wrote:
> > The H616 NAND controller needs its AHB reset to stop internal DMA and
>
> So was the device working or not? Be explicit, because this is an ABI
> break.

Normal NAND reads and writes worked. The failure was in recovery after
aborting an active internal DMA transfer: the controller's soft reset
could leave the first subsequent read displaced, sometimes without an
ECC error. I reproduced this through fault injection, not ordinary I/O.

>
> Best regards,
> Krzysztof
>

