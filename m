Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F613606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1i3QuFSN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nQKDmg5x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgcBWl0zj9yWJYZJtO20mhEVTw7e2l6L5r66HTPC7Zk=; b=1i3QuFSNZla4rbp3oGE6DBqku7
	D+ovqW5vR+sH0GqU81JccecC9XbAffff5+G7fn1GLdbWdJVv8WNBR1ZjuyX8iSgfdooRyMOKUDKUZ
	BDrGFC4yYZhAmlAzLtjCgKpffumhzDse70Xv2arGDh+nfGkeAe+7cqVUCcO2RB/a4b/lAtzKAEEaC
	/8SSsL7hMfBY9V/U5y9+KWfzvrjbDPU21VlC3qNsFUnH9dmDWx4CS+Yf3Qyumit+qfJ8o7awOdjxR
	5SZNhozd2LrwZhgIbLWcM2ZUbDLnyrHjhrWExQ+nsonCBFPBFD5gFKNFbisPur7GMpQ/ctO/JPq6t
	OoUQWQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIykE-00000008cgz-2vZN;
	Tue, 20 Oct 2026 01:34:26 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIykB-00000008cgQ-44Em
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:34:24 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6596191eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460063; x=1793064863; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lgcBWl0zj9yWJYZJtO20mhEVTw7e2l6L5r66HTPC7Zk=;
        b=nQKDmg5xQzNoFA67NlXgzyo6DswNCfrBTzPjwYiOq6zwuoIsawHeJflCzQpWzQASxs
         EhHwbM6lerun4XvBR6ki4lNp8ik5YAkjIBe+pr0uUWqJJnfF/sNaZztb2rLCte2NZYa+
         9a2srzWF7l7uqE1D7rGnK9EfBx1QjZTfi0MJJMqerS5eeZ2sUen70fuR+ZUXM0BkASTE
         dT7qKFMR0cdj0zB3ZK6K9yUpjQfQMrmKKCz9jcJMWZGTBSH2mwYbtBeVifFYPjZDwgOH
         dmHJyzGN341oiZYBSnSWxgqJ3ydBnWkEItwilQ9vZOsxACdkyqz3BPaK5Tma4V643Cs3
         40rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460063; x=1793064863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgcBWl0zj9yWJYZJtO20mhEVTw7e2l6L5r66HTPC7Zk=;
        b=JD5UXJ+ZMotG7BehIdAKBihaOc79UR30E+ttLIfkb9zyidZ7J2MRnFlGrNTcOHesma
         4ecOH6OafCmTVFEIqmbfl3TUSuATc/1A2K15cXSIqL4c6yK+h4F7PrV3yw2enp2mcB43
         fXgN2LB42DZwvV3a8w0CJ1QoyOIUO5PgQJihh7wJluvvMIJoRh/WjQwUl4jlGyftD1E8
         bkxotSXQQhbfiPhX693H6nUvTPIN+tNFJnqdVFMeH+FCG8RkHGE8pSoLZaG7tIo6yQNe
         bb0sFckU43ooV8/WsVxKiu01wiIz36ukjV8MDF1LmDMmXw5NwPcbiDlEWtjKO37UayQo
         qAhw==
X-Forwarded-Encrypted: i=1; AKwUvByJjgMP3HuCPSl8gDlAFSMu/zLUzeTJR77NplT4STFTtqdW0b04GHxYxduktIrt5v94EDKPJfmrq7tTGghJIMtz@lists.infradead.org
X-Gm-Message-State: AFq9FYIPz3Ie5XRQwtF2XPhVS8GGBNll3S8BP9DN/urFsV9IxrjgmYf1
	lYy+15fxmhPebNNP8ijvzJEU5k8Hk9RNdMrsDkEtiPo/7QBHXw2YdUm85CFsgg==
X-Gm-Gg: AYBFou2jOcqHTwUTcK5D/84nUECTK9zoK0sbihm16ZPKZgiKtJ9jcsuLvwqZkxysWAy
	gwMBZ8j+PHRYyHqSm5kZ4jdg5RsW6GeEB8uj0FAtvsTS/tKJQKNXuiO2KHM+ETjQsS3fzq4yaJ1
	9ZsV2wECN5mqtfwikx6fHZ/k3tj/4pcBh1pdkn86lUyX4tZxVIu9hy22JaUvNuY9Hi9zm3a0dyM
	VetocAhs1R+hD6uJB8hsKf/wzZ5m8g0DQ+CVJqZowOwWAKiBwlGMPUrv82ApIH6fHO0goOBLE2t
	PkPxq0YzC0u4orf2oaTdR8bjGmUizlanGs/tO1Wh388qTiJcqsGdBUWZInwe5akfdciwB2ESTo+
	jBoOWKewbrH9EHG1/ZZMNjGgm4L6j0Rzsin/cQAuuTq9JmoqAinGHILxvRb6UsN+OtI3pnPY+pP
	a94XiOV+5IPlkddp2PEAkZ1eFs6OOCrWK0eXUAFQ4CGT+h5tCsK1KUKzwwkQZLQaqF62s9xVa8T
	KdtRVT3MoAU
X-Received: by 2002:a05:7300:ce0c:b0:35c:7d45:c6ea with SMTP id 5a478bee46e88-361a2053aeamr13372981eec.19.1792460062920;
        Mon, 19 Oct 2026 18:34:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm36624354eec.4.2026.10.19.18.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:34:22 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:34:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Velkov <iav@iav.lv>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] watchdog: orion_wdt: stop the watchdog during
 system suspend
Message-ID: <1cce7809-dc7c-4ea2-b985-d3ece252fdea@roeck-us.net>
References: <20261012-orion-wdt-suspend-v2-0-f13cf71443ba@iav.lv>
 <20261012-orion-wdt-suspend-v2-2-f13cf71443ba@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-orion-wdt-suspend-v2-2-f13cf71443ba@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_183424_014939_9EF42712 
X-CRM114-Status: GOOD (  13.38  )
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 12, 2026 at 03:46:57AM +0300, Igor Velkov wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The watchdog timer keeps counting across system suspend while the
> userspace that pings it is frozen, so it expires and resets the system.
> On a Kobol Helios4 (Armada 388) with a 60 s timeout the board resets
> 47-61 s into s2idle, whether the watchdog daemon or systemd's
> RuntimeWatchdogSec holds the device.
> 
> Stop the timer on suspend and restart it on resume when it is active or
> running in hardware, as sp805_wdt does. orion_wdt_start() reloads the
> counter, so userspace gets a full timeout after resume.
> 
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>

Applied.

Thanks,
Guenter

