Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8863D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JfNy0ONZ;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=Uthlo9TW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P97ogRNwRirjbSwuVLSJWRY7wBV86JwHBN2vx2TWdSc=; b=JfNy0ONZC9zeD/
	etjsUF7XahN41xYrK+L/x7DdHeQ7IeTdw5VXOWKEm7TcJijG94soXo6Nvp7IrReP/RiCcqKw8y71h
	ZOQYWkO7c2kK+e0+RhBK2HoSNgdGtyYy6ySvB4hO3lLEYJZJ8jdWFt7M2wfkaq+VOqoj/nlo7rDC3
	hCRsB0D1Jfi/zGC0DkGc0+DTHpqPqaxygetQw2+qUqunmzCinST5AlBkaixMa5T9sLQyWF/t6rykT
	se0KKx9WOXzB1e4u5hVhPV3a68vStEgUd13DNp3/UQAMcALDOyau6I2x8brtPHQ5DNymFthB0Y+s6
	pZGegt5x6ME36mCcc40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0Sp-0000000F0y6-3Zgt;
	Thu, 22 Oct 2026 21:36:43 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0So-0000000F0xm-1Cq8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 21:36:43 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4j9fc95pRbzlfvq1;
	Thu, 22 Oct 2026 21:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1792704999; x=1795297000; bh=P97ogRNwRirjbSwuVLSJWRY7
	wBV86JwHBN2vx2TWdSc=; b=Uthlo9TWBjDilrIEqBx3alrWKMPDqs4KkIq3Ko6I
	dE76eGG4Nlnc3wA5ERZJrAI02v71VH1/YGdfssvDAO8Vi+mDaHiVO5sYcWlDjUcE
	nr6h8e3f4ENkPoRBYqylQnQqpJsXeE6DEBsDN4bBMMR8Pk4zTHX/C400BpHLkUTS
	SsS1ip4mXoOrE3WF3rWh4O0HgRu50vxt95z73Zau020xSuY2L6Aqpc5tTbOFrBgL
	yPVVVDGY+RZeMGibKy1X2/llPvJfwxvXtbPd/NqnLecC9/5kIF19vnr+wj9qOzZ4
	46CD7zvacY9yQS3nOvKkQm+E+vIPkTL8XmtgSVmBNBWFVw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id tkT0WH8Qat7v; Thu, 22 Oct 2026 21:36:39 +0000 (UTC)
Received: from [100.80.231.125] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4j9fc63vt0zlfvps;
	Thu, 22 Oct 2026 21:36:38 +0000 (UTC)
Message-ID: <70292f68-e61b-468e-b055-caa164e7996a@acm.org>
Date: Thu, 22 Oct 2026 14:36:37 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
To: Breno Rodrigues Alves <breno3011alves@gmail.com>, linux@armlinux.org.uk
Cc: James.Bottomley@HansenPartnership.com, mkp@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022183658.58090-1-breno3011alves@gmail.com>
 <20261022210252.80844-1-breno3011alves@gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261022210252.80844-1-breno3011alves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_143642_389489_31D73701 
X-CRM114-Status: UNSURE (   6.17  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 2:02 PM, Breno Rodrigues Alves wrote:
> Both routines are simple pointer walks that a modern compiler handles
> just as well as hand-written assembly, so replace the .S file with an
> equivalent C implementation.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

