Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E665606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lLBr9H8p;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=N1Jev0D9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J74B2CGa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pVN1mqrOhYalxYFr7VReSIpfsAYguArpSUX3xTADh9w=; b=lLBr9H8pXLyvat
	6TN5J2EHY9eY0uwQE4b6RDdJdwRjUWHu5JLAkwzFY67UmOOmiBAFnfzWYrCMqWbUwaKfWNvnJr85u
	HRS7UCPMzZJ5Q6hSIaDwSOv2PI0Cqw2Ntc9MpRspjB5s6NMKrRW08imXGuLEjnKklH2YqAtks/Euy
	q8R1qR3whizJ3mLixXqS1UWNWYV7RE4N3V62aHaSoptUBSV93JIGpHZEqseHeygSnbY9Qq25EpSFC
	SYz+omw1LYwyIoveLXXek4Ox6DB4Qe98Oe83vjLyAlZl7wuem6PXK/O1DmgzbXB57VSxW2H5yYtKO
	1WwnAIzjUt0taNw/QMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpDh-0000000DqRk-1h0y;
	Thu, 22 Oct 2026 09:36:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpDf-0000000DqRa-1WMW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 09:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pVN1mqrOhYalxYFr7VReSIpfsAYguArpSUX3xTADh9w=; b=N1Jev0D9j3hYUEXAF4zCucT4VC
	pDm9ASfcw9SEfwK6XsvHkTCaGgjXSviyzXtt5szsGqn5AeIO/a8eR8GAHoSCFA/AdV0Hj2XNynCkU
	dEnnAi6m+2B+XrKzlT1hFekTzpICaDEH7Uu0at74YK32AW7yDVgcCwd2HyuwieyMqWc8yVca1bjjQ
	sDlDKOXWnpr1cNSx1oQypdDvGWwo9OPp6xbkwSDiJWWcEb8Du5IIl9XRX5VuI1PBUaSwiXZD1qoiC
	ldHvNa90EfM5nGdyovxRjr11RyllPQ+mkEkYnr3XZe2svFAlX/Xd+Ed19CIjOSQOeDbrl2ezxnN/I
	/or9WBqg==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpCF-00000006lqN-05lv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:36:16 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48b042c0759so1173113f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792661688; x=1793266488; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pVN1mqrOhYalxYFr7VReSIpfsAYguArpSUX3xTADh9w=;
        b=J74B2CGaiWBruj0UXipzLQp+NjfMg5Jvjbx3SzV4rgrTnrl6vo8q6WpMFdIKML4Ql+
         o5JAGu7FA5SoPFcQl4edcISRBWMpQxYKjWeNhNDHE99aIG7/ZTg5cjDE1oJUEw9hQQdO
         g9aCylnXgvgYdhoOKWuBwXJ5m3Kzgf+9bQE4ZyPR3t8DWy4/RwsX7jfMSTrYlyPH1ZuQ
         8qccVkNFewLUAenvsSctlrYteRjfXPgdgUXy4n1qUhbCFLR8iG6Oiw1cSHxaeclj94Gm
         QA5/MiOUyffqXFdXSCm/gflVSKtKizL6zk0Q0ebp+iJ27/B9hXLh7+24BP/EcHK+/JX2
         2Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661688; x=1793266488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVN1mqrOhYalxYFr7VReSIpfsAYguArpSUX3xTADh9w=;
        b=hES8nftSNfU+gO20yRdw46Oww8y+5vbIdYKx0n0D7YtkarWDOmXHl0FiMY1MpsrA/u
         /0zYyCu0OIPNOYAHMbd5oWAIGIWny2EF7ZucNu/bNmcKQeCRMIjgMcf7LvWSl82N+blK
         U9HvxE1RpCMAwXra4iLHaNuXH6YFMmSsylSgPBtliiEVQdZ0DZzbiGGdRbFj9JcVBIeQ
         jG7ZJV2K6o+hXEf9d97bk3/RRlvOgpEIXY3IoIxx5ZbBWy7B6CCQujKUZG+dJQ9I1ZYv
         rsw/MKpnH4XI7cchasro1U5EZRrvXsOQIXnA5Fw/y2Y+EB1nKzhfxJtRGboO9j6zimrB
         FGDA==
X-Forwarded-Encrypted: i=1; AKwUvBy5Oy5gv/FrU0C08x+3Fstz4Np6M8by5GTy0Dujko0rS5v1CIoqd7YJX4dWgdSfqjMp2j+buDDAilTE8fs4DNhU@lists.infradead.org
X-Gm-Message-State: AFq9FYJB2nAGAKk1r2Pw8DunmFh9J9YqDDUVMFonyohCUTqOaVDNsWzZ
	aTfuDCxhDtpP2dtouO7J9OwWjwX9dXPKT6btKh4ODvXTalo9qCDPh7Cx
X-Gm-Gg: AYBFou2FzjYucshrsbA3PsWGGGbYEoqAsLiHgZT6DqL1454TRevd6Y9i7dVqK5Ien2q
	NZ15ON3WHhfMQwnJ9iNbAjG8QrEn7cCMs0xoqHkz0ihEv4VOoIkMK1jsS1Ohwfi+1ps1QtgCHlY
	mXv81MBpj7IVqltulc7MiIEbIH12/trWPhCMvDvbg3GFqbTEHIyrokFTqccOiOSWxagq5HAroAM
	keDMiFmKSHiMKhnzdwLniLAbGis5v1yNBTYUxwgpoTeQ4a1Cc/5T7fV6kFphkvQ3loGvw9vv+Uu
	RdHX90YdOIDrbdzSxzBHDgigzzEDnSiW9q5KCj2YK+iiULTydTTfuKrtphqY/3nBa5021Dfl4MY
	MdmHwKF4WXXqUJE16jaRt/pNz6G6YrZO6yTHTmEwa8OAR0K4QbwJlXbWtj05c+n15A+ctdOk9Tf
	sFi1I7Z8yGcSXbckfyGMZd7WbaeMt+ZcRAU+346EbSQwmS8a2ZEC/CKNUWEknH9g5mPRqfzkflg
	OO0enokt2Ryaly5maAm6/ouErOQ85fDPvpM9kKug8mCfWKdRX9/cZrl3loi4J6WonbiG/HVyW55
	KmhLx2r610s6vSqg
X-Received: by 2002:a05:6000:4806:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e264e2f10mr9528690f8f.51.1792661687521;
        Thu, 22 Oct 2026 02:34:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e72sm10420288f8f.26.2026.10.22.02.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:34:46 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:34:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: dma: run threaded NAPI kthreads with
 SCHED_FIFO low priority
Message-ID: <20261022103445.34cede9d@pumpkin>
In-Reply-To: <179259275334.35963.15413466304986880275@gmail.com>
References: <20261020-b4-mt76-napi-fifo-v1-1-ac8a24e2062a@gmail.com>
	<179259275334.35963.15413466304986880275@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_103453_186595_D3CAA0FF 
X-CRM114-Status: GOOD (  20.33  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 17:25:53 +0300
Fil Dunsky <filipp.dunsky@gmail.com> wrote:

> Adding netdev to Cc, as suggested on the GitHub mirror of this patch [1],
> since it touches the scheduling policy of threaded NAPI kthreads.

I had to fix the same thing for other NAPI threads when doing some
tests that were receiving 'silly numbers' of RTP (aka very short UDP)
packets.

There is a similar problem with the softint threads.
Softint callbacks drop form being the very highest priority items
to things that really won't be run in a timely manner.

David

> 
> For context on why this is done in the driver rather than left to the
> admin (chrt / sysfs): mt76 already does exactly this for its other
> rx/status and tx workers (sched_set_fifo_low() for the usb and sdio
> workers and for the tx worker), so the dma napi kthreads were the only
> mt76 rx path left at SCHED_OTHER. A userspace chrt also has to race
> the creation of the napi threads at boot and module reload.
> 
> Numbers from the setup in the commit message (MT7621 + MT7612E as 5 GHz
> client, 3 runs x 5 min each, ~200-280 Mbit/s rx with userspace load):
> 
>   stock:                  ~500 full-ring events / 5 min, watchdog
>                           resets and MCU timeouts, occasional hard hang
>   this patch:             0 resets in 3 runs, rx 276-288 Mbit/s
>   stock + chrt -f 1:      0 resets in 3 runs, rx 249-273 Mbit/s
>   napi_threaded=0:        0 resets
>   rx ring 1024 (stock):   800-1300 full-ring events / run, more resets
> 
> A similar restart pattern is reported on single-core MT7620 at much
> lower rates [2], which fits CPU contention rather than throughput as the
> trigger.
> 
> [1] https://github.com/openwrt/mt76/pull/1164
> [2] https://github.com/openwrt/mt76/issues/457
> 
> Thanks,
> Fil
> 
> 


