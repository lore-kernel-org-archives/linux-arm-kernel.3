Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E518C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjwCIT4/G6OsPqKKNi7etA9BwyZ290LnHAyZ+vvEmLE=; b=m9L9wtS4XSKZO5kfP7PhLxooNO
	zc0ILnoMxT4Q4k9P5NRcvSzJ3Uz6HD5bSlfq3aYrOHNDuxUllEw25qcYhIcUckZiZ3L5rbLNx57se
	NNpTE2td6EnEe6RDu8i5BcH1kT469ORS0PiY17ZD6l6t3uU3NAsSOTXlbbuXZ0bWBOtq0mLrLOJnz
	WYK7OslCJHHnzMcfaK3MCXa5Z6X2FslAfr/3UKtUkCvJQD/KMawobUX7BgSU1qSP5LoLghhlctEEI
	saK1cH6EyPZTM3g1LgWug6h0ILqtfQ9jmHZE2cyQSn8cRKNQX04JA4RwlJFHDAR+EBylLvrGglZtF
	/S3jgPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0yY-00000003Ir4-1A9M;
	Mon, 16 Jun 2025 03:57:38 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0ik-00000003HK7-0O6K;
	Mon, 16 Jun 2025 03:41:19 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso4360052b3a.2;
        Sun, 15 Jun 2025 20:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750045277; x=1750650077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjwCIT4/G6OsPqKKNi7etA9BwyZ290LnHAyZ+vvEmLE=;
        b=m7kHl5ruwwKGESdgYQt4Ut1iNcs5h9oRLta84fE+eNs1Z2F7348VguVIplxOUsNGU3
         A5e2OLgIDXLQNam2BXHWdsAONwf4vaXJ8vm8iMT5KUbiriDQmoO4Juokne2ucphFZtR1
         YZYxWysO5cI1CgUykAI84Ok566Sv6KR0gS1TW94opAgjulim7sCzS+UjT5YyUjpOaflE
         rUX4x4Y3R/drfHK6yfpUIGn4msMEU9gXJCyUtNDFmYGtxDb6NEe4szZGf5EfBomyIRcO
         7oA43UhQx2Bd3RRiL6yhxsd1akla49gv3KVodYsy2roVv8op1wOla64KY++/2O7gfd+8
         GqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750045277; x=1750650077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjwCIT4/G6OsPqKKNi7etA9BwyZ290LnHAyZ+vvEmLE=;
        b=kbS0yoHXd22Xi8jnxp0jt0QECeha94YZbe/5IxMitiwI3fcc3kMDC4FWVCavmGHDjK
         3cHAD7d53Ajon2aXli/BtIjtfMSojZ1eWpy9cko6/wdNHt4jwwJuvFFt4ipn/dNlOQdx
         iQ/2E78irldvXcFzJZZaScd/wNHKLKxsrq1g9CM1JbzLhl29VaWIyHeEyHAmPJ8EiLWi
         5FayTQgUtE8n/BUC6ddzglejZ3ck85AETmVT6nBJ+ozVXoa/jlFVSxRQhjdhY9F6fP35
         HlMpKTZ5PoHCnt546DlO+0qPPp3ytOXz+BQ8Sa4TNb+/SpBkDUaeTzLxhWGcfU4vnkSb
         FjEA==
X-Forwarded-Encrypted: i=1; AJvYcCUqlcEm6RklbfHrnBqSbdTE2i7/TgNBTbSiBI1XaCc5GeXppTfXJXNzgveGfwxIbLSywTd/IO49Ri3xzpS33v4=@lists.infradead.org, AJvYcCVg+lD1Kzg6P6CKudTOE3k0Boac4o/g0nmNVUukHPxr9xbosPn8ubNYyMDwoAI1X77ySHvygyXveWIdZGDJAvhT@lists.infradead.org
X-Gm-Message-State: AOJu0YzAdA5qbmpAIW8EJVjmczfPZzJjKyNwOdUub8AzFzU9Av4FdONG
	29EtHjhsuy3ziEF7iCH9gsJyD1029vUfe6nbSHeqQGFpf0zKRJYzJ2f4
X-Gm-Gg: ASbGncvxA02M62cFdA5dUUiHp2OAEb22IiZ1gyrzjPC9/5dnN+EbrUhHsVAofcclYpe
	9nqw2ETacbO2rEt4JC7bNxQwKOoeT5l3FhpwUGp/TV70PqWAc6oTEGp7UpncqoN9g+lf44pMzgB
	WsBBImZcd7g/gTnbYmEkMh9TlR1SX0k7f6feGl0B/5AfnCDZNPX6u2zszAg2nCOHp3RQ9l08QwH
	DMA9gWJNn0r0GlhZckUKNqKYbLB0jqCeL3gCfXzniYQhIcQ8b9cb0Qw9+vpgMJR1p6UOLIkG3w+
	HqYIMPkYY+GnjjaALfWy3NImBsOc8fGXWDeAmuj65xG4txFCZ4Ckr6Zm6mqjNOWYm4jibI1gwcB
	Zkyu3
X-Google-Smtp-Source: AGHT+IFoXXdADq54s1YJVoHHCyU6912PkQq0oVs1W/N3IeK6HcDSKJErbEsGyC7KzvI7wyF0q8jdCg==
X-Received: by 2002:a05:6a00:2286:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-7489d1999famr11297185b3a.21.1750045276897;
        Sun, 15 Jun 2025 20:41:16 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b37ddsm5809347b3a.134.2025.06.15.20.41.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Jun 2025 20:41:16 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: nphamcs@gmail.com,
	hannes@cmpxchg.org
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	andrew.yang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	casper.li@mediatek.com,
	chinwen.chang@mediatek.com,
	james.hsu@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org,
	matthias.bgg@gmail.com,
	minchan@kernel.org,
	qun-wei.lin@mediatek.com,
	rppt@kernel.org,
	senozhatsky@chromium.org
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Date: Mon, 16 Jun 2025 15:41:06 +1200
Message-Id: <20250616034106.1978-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAKEwX=MsP6LGjMRNyaHnO5MkE_ne-u-cKLbGfVQcSR-ALoxBwA@mail.gmail.com>
References: <CAKEwX=MsP6LGjMRNyaHnO5MkE_ne-u-cKLbGfVQcSR-ALoxBwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_204118_147658_4B62D8FA 
X-CRM114-Status: GOOD (  11.17  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Nhat, Johannes,

>> The way you implemented this adds time-and-space overhead even on
>> systems that don't have any sort of swap compression enabled.

I agree — we can eliminate the time and space overhead by refining the  
code to hook kcompressed only when zswap or zram is enabled.

>>
>> That seems unnecessary. There is an existing method for asynchronous
>> writeback, and pageout() is naturally fully set up to handle this.
>>
>> IMO the better way to do this is to make zswap_store() (and
>> zram_bio_write()?) asynchronous. Make those functions queue the work
>> and wake the compression daemon, and then have the daemon call
>> folio_end_writeback() / bio_endio() when it's done with it.

> +1.


But,
How could this be possible for zswap? zswap_store() is only a frontend —  
we still need its return value to determine whether __swap_writepage()  
is required. Waiting for the result of zswap_store() is inherently a  
synchronous step.

My point is that folio_end_writeback() and bio_endio() can only be  
called after the entire zswap_store() → __swap_writepage() sequence is  
completed. That’s why both are placed in the new kcompressed.

The use of folio_end_writeback() and bio_endio() was the case for zRAM  
in Qun-Wei's RFC.

https://lore.kernel.org/linux-mm/20250307120141.1566673-3-qun-wei.lin@mediatek.com/

However, the implementation tightly coupled zRAM with reclamation logic.  
For example, zRAM needed to know whether it was running in the kswapd  
context, which is not ideal for a generic block device — the role zRAM  
is supposed to play. Additionally, the code was not shared between zswap  
and zRAM.

Thanks
Barry

