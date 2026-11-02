Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259E2606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xJEJ8Lgd;
	dkim=temperror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8RQNh4l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=; b=xJEJ8Lgd+a+0Tm
	Hi3fsLMtP5c36vGoHdo9pSwaO1wIIVRts+aV+KVFK5Y2dcIBSVsKGKDPFS9ZAxf3EtfWJ1GyxZcaj
	ok7IpyYWmpSzQL5T6JQIUE/8xQvpk6645uU2e1HE4phkVl6kfGUyQHO8Wm2B2xGtHwqfQlCQgK5BK
	lCqiCzn1BcwVA/CA946QRsyBDO+07rVrR6YdlroLmDFTAhJpxkAniebhRgTp9kTe5DekGU9guNwRY
	mXNJAnEeTQjqh8OEJkz0AohzFUzY1saN8cWSPPYM0ui+tv7i1uZRouhgyGJjnLfc0Hae0S7mBRnjt
	8IYd1c+oQ2LdQoXv0WKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNobp-0000000G3XR-2p5Y;
	Mon, 02 Nov 2026 09:45:45 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNobm-0000000G3X4-2ujw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:45:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c450ab1483cso459005866b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612740; x=1794217540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
        b=r8RQNh4l6LxGh/vsht2CrLvlz/tgKc9BewwH41141aNLRV+YLwSETYpKPZaZ0MayOY
         vNfXkn9Hpa8A7o2GN9p9wyeUzfdYWKxedBD6jOPocB0yChzz/HHA5Qdj0ujivLN/n1OP
         qPySSbQjJyP7FfrTeDDR1cRSfL5JfJ3vgs389YafdywD0Jw1/oQVH1kbT/08WWxhwpOw
         PZ1Ey92aEI+R6U1TEMflb4blqP/vXBXHVF67J7K/NzWy2UI9UeBoPo4KPlVV3vtYBvjJ
         cUDAesBgs2x6EAzZrj9lxb4puGQBPb8KQF7+K2HPzQkCt+r4AIo6BDZDJ9s+lSq32bjB
         CD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612740; x=1794217540;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
        b=kuxCDXSAw4odVli36HUOaYMSGKKSNdHUz9ewkIOVvt53xU4xO5521MEQpQiNSyI468
         mb9zsnROLv742XMMBEZFVQpEow0nRqdJKUW3xnpuJfrXVEZKvQEL1o2rMsr/lstVmxzS
         5X5hgdfUGsyRnSqtEQt8pA7fwxrnloKy8TZUMzy2Gb70t1kL3VjRL9tQQS4EMzFYK2gA
         rstDtMHnCoNmBVqREEBRRxsjqCyxh3gdszSkNFLp6fp+YvSEPsgMMDXqBOg2w8hOtmv7
         lWcQSUU2wF4iYCsENwYhh72vQabq5n6ZhpTQIMvlQhGKD8qvNiqO3CW720H2q2aky6Qu
         PP4g==
X-Forwarded-Encrypted: i=1; AKwUvByCdQzUM6W0YNTalRcqA13zgznFx2G8HuZZ8FVGlisfdpLR+snRCz423cxB8QWSpn/0oLN6bp47dJ30TJihlohu@lists.infradead.org
X-Gm-Message-State: AFq9FYKghdSeuya2StN2/KBwi+23u4+FTzuLQV5z2Kw19jzMQdWgFBBI
	x7++6Z/U2S2nTlomb0+uK9Gy5RC5Hb4f1zFQ5tQeC9hMj/tuBXzIA1Jt
X-Gm-Gg: AYBFou0EXvwwPi/h9nl2GiDF8OgidCP38YFX+8OkkN0G/btWMTJkj7uJmdu8PpfISN1
	kh2Cy6sZLS+IJruAMji4fl1AnxtDE2ujFtypReyR/FuuZF8o4+ek150vxJ6QcTn1W4h3LxpqZjq
	5mu1vLdzIpI021GtLLMQ5iffK8mNFIBFEyZiUUP6y1m5K8RPFMds088nWH1xoI/E0aLkn4Dj8bV
	omisS3+0zh4NvvNRdd7kPTc3psMVokwIp+o3vf0scI7wysMRDAghyQ4O6k8JgYJcXB8sbuCHkJi
	mNRHu9rM1Xv6s1fWps7kL4df8C4GEayw/z86P1iOCwUy+A2VAaC4yso/qJw5tOWNwUI9+BretmN
	53+pIvMHK8eKMrUKnEAOX67o0lAGPhLLWfW/bmeopN33dKBbgh/XCOnhnLzsruCLZ4l0f0D8Ceg
	UHWkqUbZ3n+IPH1fVsnp73B6dg5KIld1NhXQgYQKdUYs8ANkV5CS9+zS79fNlFJLpOfvtg1iaH/
	v19oHMfpG//mYsMtFqnicq+JC0yVk0GUgLR+EvgEK/UFd7lcteRG9+5NGviIQPNMXTxhhEDEgD5
	dHHHtrW33QIf4SLrTJcucDpQWe7b1DyInIhWb4MfFO5FWnaeBZmFqH+yvCCswKJIsQYZiDXwUVH
	12oFFpLyU3T6ElRfsNZPZ2FqG+YGIOar9bcAdTqYhmd1g
X-Received: by 2002:a17:907:6e93:b0:c46:7ec3:fde7 with SMTP id a640c23a62f3a-c4ca7aac4e2mr783350066b.31.1793612740250;
        Mon, 02 Nov 2026 01:45:40 -0800 (PST)
Received: from [192.168.1.229] (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm369796766b.4.2026.11.02.01.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:45:39 -0800 (PST)
Message-ID: <03f2dae1-453b-42ce-a3fa-e444906bb1bc@gmail.com>
Date: Mon, 2 Nov 2026 10:45:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
From: Jacob Procee <sn125164@gmail.com>
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029105908.22809-1-sn125164@gmail.com>
 <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
 <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Content-Language: en-US
In-Reply-To: <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014542_761309_BB87F5B7 
X-CRM114-Status: GOOD (  12.98  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 08:35, Jacob Procee wrote:
> Thanks for the ack and the extra background info. I would love to take a
> look at a race-free version of admac_cyclic_read_residue() as a separate
> follow-up patch; v2 of this fix follows shortly.
Hello Martin,

I looked into this using REG_DESC_RING. It only contains descriptors
that the hardware hasn't fetched yet, and its read slot is effectively
the hardware's fetch pointer.

Unfortunately, it isn't updated atomically with the residue reload
either. Across 1.49 M reads, I hit 126 period boundaries. In 4 cases,
DESC_RING still showed the old state even though the residue had already
reloaded. In another case, DESC_RING had advanced while the residue was
still 0 and no report had been posted. So I don't see a way to get a
consistent, retry-free read from these registers.

One could make the retry check more comprehensive by using three
counters: outstanding = queued + playing + reported, with playing being
1 unless the residue is 0. This would also catch the reverse ordering,
where the report is posted after the descriptor is loaded, which the v2
check doesn't cover.

However, I left the debug module running overnight (10.65 h, with music
playing through the speakers), and never observed that reverse ordering.
There were no XRuns or backward steps. The speaker channel had 96.6 M
reads and 15,483 boundary hits; the second channel had 29.3 M reads and
86 hits.

All 1,498 snapshots that failed the three-counter check were explained
by read skew: 822 where DESC_RING was read before the fetch while the
residue was already full, and 676 where it was read after the fetch
while the residue was still 0. The positions returned to ALSA never
stepped backwards.

Given that the more complicated check would only handle a case I haven't
observed, I'd prefer to stick with the simpler v2 retry.

Unless you know something about the hardware ordering that these traces
wouldn't show, I'd prefer to stick with the simpler v2 retry.

Kind regards,
Jacob

