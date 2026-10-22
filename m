Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA0B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 19:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YOJdbLU9;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=Ctr1fYd8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6wwXNu+Bc04sBeF05magzQmb3aIDtO2qxmFsPQee22g=; b=YOJdbLU9TZIvyi
	W1pbSi8p5L5EDdvxD0BEed66bMgdNs8n3Ugm2Yyc59joEfexZs0UcylbckVgs1/7edy5Bz3tRfcox
	w5xgtn5zEiUcbDphCO7w1lSx5pFoqIX1PiJqRdxIvYicOyxjfYRiePbFBbMPi9tQfitBnXK4IXspF
	OL/LP9P9tuGghwU8NIRjuSwKs2GW9EuA4tWXzvV0o3v5yMt17+jr/08rY8ZiTAvYEcH4GdZubBtPp
	tC3Ou8zg+mHMmPjwmPAFHbsgS9/1TxEcY07GImFb8j78KJgtAsnDn8BvWWyCuMym6D8pcb1YBZdxZ
	xwuMvoTuyfvN6ienlRug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyMd-0000000EoXh-2uSb;
	Thu, 22 Oct 2026 19:22:11 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyMb-0000000EoXA-0Iee
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 19:22:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4j9bcv4lzJz1XM4Tn;
	Thu, 22 Oct 2026 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1792696924; x=1795288925; bh=6wwXNu+Bc04sBeF05magzQmb
	3aIDtO2qxmFsPQee22g=; b=Ctr1fYd80Cq+Hm1eLtO1tTfVNdyhY28xu+XGilQC
	071c/tmnifbheiWvC+ixnfZ4GkFglYiJATKNV38Fc7rxgoQOSk8OCsG5IgTd2jSd
	E8C/Nok5w/ESVWrNn8wr80SuFuUP/0iX4TzoQOTmxFm2i8A68SSYVeV3UCVZ6+3W
	jtrt37NrDeG0N97cTSouGZVt7fVEVLfu9f76Eo6LtQCIAfcg0quAQUmk/k8eh6Zv
	gwDShe+CdQFjKcNq6jRqGcidSKfWOoSPVKE7I4pQZcO9TJjpjRQeHe6y4943ZN03
	tBn+UW2nebPmT8ow+h2gNkOw94jC+VtSWugxS8CSVrxbPg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id zONcWwz_23AS; Thu, 22 Oct 2026 19:22:04 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:356:46f6:e804:1d44] (unknown [104.135.182.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4j9bcq4Yynz1XM4Tl;
	Thu, 22 Oct 2026 19:22:03 +0000 (UTC)
Message-ID: <4e2383f0-9791-4840-a4d9-93fbe51b7a40@acm.org>
Date: Thu, 22 Oct 2026 12:22:02 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: arm: Convert acornscsi-io.S to C
To: Breno Rodrigues Alves <breno3011alves@gmail.com>, linux@armlinux.org.uk
Cc: James.Bottomley@HansenPartnership.com, mkp@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022183658.58090-1-breno3011alves@gmail.com>
 <20261022185224.60700-1-breno3011alves@gmail.com>
 <20261022185224.60700-2-breno3011alves@gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261022185224.60700-2-breno3011alves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_122209_269479_C1E2CB22 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 11:52 AM, Breno Rodrigues Alves wrote:
> +	while (length >= 16) {
> +		u32 w0 = readl(card + 0), w1 = readl(card + 1);
> +		u32 w2 = readl(card + 2), w3 = readl(card + 3);
> +		u32 w4 = readl(card + 4), w5 = readl(card + 5);
> +		u32 w6 = readl(card + 6), w7 = readl(card + 7);
> +
> +		card += 8;
> +
> +		((u32 *)buf)[0] = (w0 & 0xffff) | (w1 << 16);
> +		((u32 *)buf)[1] = (w2 & 0xffff) | (w3 << 16);
> +		((u32 *)buf)[2] = (w4 & 0xffff) | (w5 << 16);
> +		((u32 *)buf)[3] = (w6 & 0xffff) | (w7 << 16);
> +
> +		buf += 16;
> +		length -= 16;
> +	}

Why eight readl() calls instead of a loop? Additionally, please use
put_unaligned_be32() instead of open-coding it. Is the code below
equivalent to the loop above?

	while (length >= 16) {
		for (int i = 0; i < 4; i++) {
			u16 w0 = readl(card + 0);
			u32 w1 = readl(card + 1);
			put_unaligned_be32(w0 | (w1 << 16), buf);
			card += 2;
			buf += 4;
		}
		length -= 16;
	}

Thanks,

Bart.

