Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YztyuA/e;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=o639aX9p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Auw/ZO+OpjhP3TL54hi6n0qe9cpVdwdE8F0+MSdgCwo=; b=YztyuA/eKXAZqa
	h/RQ2pu+7+rIHtMNDleGn+k8xfm6QpnKFulA7dC1owQVLMJLzNMdTzJSWycupFcBYf7bqKL09Xy+q
	LADX2lIN/DMceyazFjf1cc8tGjzIzTJOmciUXCRikxuewt79pXN/8znHkG417dAtbsyJrrIaVqlXa
	tKWPVcZPDD2mjIBhAUT65q8IjoI79XqaFVyqxU/meZAT+Kp7e91Sb4rzXznVDX1HBW4cCsWY9ptmm
	DBhZq/7cZ0ZXNYLjJRkBTY7MaWGEUnUCC2G0yXcPXDq9yJbsXBIDGTb3bUTUibTl9P3SMsRgO2fjO
	4TxWl6/Zi9LoncRkdmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzjZ-0000000ExFQ-0IQh;
	Thu, 22 Oct 2026 20:49:57 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzjW-0000000ExEk-3Vui
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:49:55 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4j9dZB15b3zlfvpy;
	Thu, 22 Oct 2026 20:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1792702191; x=1795294192; bh=Auw/ZO+OpjhP3TL54hi6n0qe
	9cpVdwdE8F0+MSdgCwo=; b=o639aX9pVAaMwCCICHq4zQdt2loNZZMUMPpz84cy
	64MmyLnMNZKTxCWarFYES5wD7VMJ5zjzjg51OA6c4koc060sAD5Yg7Sk/ZpGqM7j
	aYxl/Fd4PciVtK5F9YZOWLxOhS4Pa/SNB+fuVkTXZr+qFGnLpuwKrFistM37Y/eS
	N6d4oYPLt5BUKutVIGeZvuCaSWFIaqqvLi98pst5Axn8Lw1ugGsqq266XbAuioN/
	Vj704W585Q4jLhmB+qO8mK91gAK3sLYcBTLkl4j+YHBe3jHQkdHqYKOzq/aQr3BO
	ctkhWKw6m11tLaBdsA+6+s73XE3vWxkgJ0Jpqt/MIqLJiw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ahxz7hEk6AAw; Thu, 22 Oct 2026 20:49:51 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:356:46f6:e804:1d44] (unknown [104.135.182.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4j9dZ70HGBzlfvps;
	Thu, 22 Oct 2026 20:49:50 +0000 (UTC)
Message-ID: <5fcd439b-4870-43db-9402-cf2425754db5@acm.org>
Date: Thu, 22 Oct 2026 13:49:50 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scsi: arm: Convert acornscsi-io.S to C
To: Breno Rodrigues Alves <breno3011alves@gmail.com>, linux@armlinux.org.uk
Cc: James.Bottomley@HansenPartnership.com, mkp@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022183658.58090-1-breno3011alves@gmail.com>
 <20261022203053.75161-1-breno3011alves@gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261022203053.75161-1-breno3011alves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_134954_921741_9E2A3A46 
X-CRM114-Status: UNSURE (   8.09  )
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

On 10/22/26 1:30 PM, Breno Rodrigues Alves wrote:
> +	while (length >= 2) {

Shouldn't this "while" be changed into "if"?

> +		u16 v = get_unaligned_le16(buf);
> +		void __iomem *cp = (void __iomem *)card;
> +
> +		writeb(v & 0xff, cp);
> +		writeb((v >> 8) & 0xff, cp + 1);

The above code can be simplified as shown below, isn't it?

		void __iomem *cp = (void __iomem *)card;

		writeb(buf[0], cp);
		writeb(buf[1], cp + 1);

> +	if (length >= 1)
> +		writeb(*buf, (void __iomem *)card);

Isn't the above (void __iomem *) cast superfluous?

Thanks,

Bart.

