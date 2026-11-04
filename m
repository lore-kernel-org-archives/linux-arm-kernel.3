Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7492B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0QX/Bqlw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bKYL0tIwOuQrMDxrCyv61nKmyjjc86ptxINLaNUCb9M=; b=0QX/Bqlwa3eE24SeK5mD0XRtXn
	CcjyJt28tfSF1lcNZloOEt08a3Y8c4TuDvqt9MCluJogXk7RPjviv/aFOEXx1s7Ajx8p8JbhihSTl
	sOnndDU8Xyy4T+8ongxk4D1CN5ZvAf0Os1lhRLITCxYxpyRDGG18riP2ludJzjXyA4zHpiKglbWbl
	cAJ6nSiGZTdyrT36Nd00dGMdIhI7SNBNkNZ3nF9jvvWvFgemsWB51SA06MqfWr9aewuC1zg9df2jf
	PTHaDX+ZIIHEIg5xmgjZxtqbBuLbZ+DALhh+qCM8WjE/ABXpySqCxdN4d0uBNPl1lK0NfOfBiUdWC
	VOP5BRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWYF-00000004jSR-3Hbn;
	Wed, 04 Nov 2026 08:40:59 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWY2-00000004jQg-05nZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:40:58 +0000
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so273986a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781645; x=1794386445;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bKYL0tIwOuQrMDxrCyv61nKmyjjc86ptxINLaNUCb9M=;
        b=BSsPZBrltQMPafTJrPdmgzBlzzQ1xMWg/iCthFZU19vccsxz2yTdAMzkBGIs9poVF7
         ckO8/cUw6ISJyTcqen+7dsuFHJW5rBB5hL6ykiCdvMZemuGi/bshB6RgBHjc6brLYwYO
         H02reb2B1h/MGmLB1Uo2Y7GPoKlnjVEoDggRqzDmOBZ89QgvHMybigTW7g/Yxmj8T1kD
         /t1J+h+zQMR513o6ldz/SA6frUn17QaGPgjIFFB6U2SQoopA8y9sZ/GZS0oEqqSBBi9s
         Ep99FUplJvnRa9oi5+fCu9DtSl1vQ/ehBlCIWqsSGU3KYZ1OkM4A5vgxCrVaLzyglFiQ
         IZ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzr7NZa11RTgGupgefIz3LR/pfMoM4dxc0P18jZAoHfKarJaPpxpgrtF/opUSgv9tDbkz2p9/iaLQfku95biG8S@lists.infradead.org
X-Gm-Message-State: APuU4Z+DMXgSbPFkeDxxE/DblK0ejDJliMmEB5HFDgCHwuLkfeFeOlhb
	MmQDQdq+0NvuvUJDQnPchmPcQuXIPhCX3OUKLFamGPQGBkA5bvGsrPa6BE89Sg==
X-Gm-Gg: AYBFou2WX4F80DqsaNdsqr4abPOHo/chrrY9XrOzxGybahVSQCCA/9mxEnSs9Zdgkj/
	8qnyhprnG5Eq3YYJAKLpKiPSsllYmjtz8LSN7yAMlJ8CVQnAaIYKYvrPsJcSOGbBFZDeptUU2Ow
	XZ0nmN1yvU2BQV5JLcljdS5CjcxctbmSJD9a4zjt5Si0FZZDC4Ax3cp31ILE9L9dtjbIar4H+eo
	WxEdEi4b7kkghDsqycVhFqxZqP7YCxCMuspVhvgmF2CAoRRZ8ZtYcgNgJv79YrccunzLtuSgLpG
	wkKhsdmiP21kFzCcKaxuSXSOwsEpFiYEZNda1MJbUbp5u/rcPsJmDlsj/sUwx3762AxdiikhnRi
	RJb8ys24jyJAhWrkcyNPmPAXOPYXFCmeYNHL71TJhpNWMbVKvC3ng2dyOgOSxq09Se+wF/bG+KY
	og78GgXVJDOFbcMx9VgVPZeCBvcua/4t9rGrPcs3jkdPq3HtIkk+dYGwoe1Lf+HQzxth7O364P0
	HwtVQBo3OStlAYpgz0Gp0SyWlIhw1sQ9KeTR98nskFqMOKLVfEteTln0ohsYhmHyQd0d5vRiXlV
	ZJ7Z3UobvPVDvROz8ZfzZZe5/GjwNPWcK3SzXFPoKWcMYlTRLzdegs2LdTs9rPHcrkfLzqLRAYP
	u57kqk6fCPhs=
X-Received: by 2002:a17:90b:3d88:b0:3ad:370f:46be with SMTP id 98e67ed59e1d1-3ae8980ee00mr12478630a91.36.1793781645096;
        Wed, 04 Nov 2026 00:40:45 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8b1913sm8429402a91.10.2026.11.04.00.40.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:40:45 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so825096eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:40:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw+XVxZVLpKGtLtuWzY06Q9nATX9LRwGr5u246FtAARmP88X/MxKTKTmBxNQQGdZMRwciGa1QG0/gCo0DtAHKYe@lists.infradead.org
X-Received: by 2002:a05:693c:6407:b0:36a:7b3c:4e0a with SMTP id
 5a478bee46e88-36a7b3c4f8dmr7297124eec.24.1793781644445; Wed, 04 Nov 2026
 00:40:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev> <6e8d69e3-9404-4a80-874e-0133f942229e@bootlin.com>
In-Reply-To: <6e8d69e3-9404-4a80-874e-0133f942229e@bootlin.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:40:32 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5RZFkQh5G0BbgC7FesQQbQ53AJQv6pYoK+YEVo8k62bA@mail.gmail.com>
X-Gm-Features: AclHuK9Odzf_wS7Gr7Do7DU0hVIY-1521pU5hfzHYwAlyguOls_NqIQeDv60H-0
Message-ID: <CAPY4CJ5RZFkQh5G0BbgC7FesQQbQ53AJQv6pYoK+YEVo8k62bA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_004046_058931_2EC19D2E 
X-CRM114-Status: UNSURE (   9.16  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This is only used during the probe sequence, you can simply pass it as
> function parameters, this avoids using up memory to store that :)

Thanks, v2 will pass the device to the delay helpers and drop the
member.

