Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0DB606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ImyqXWqb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o4EIHpxl57I6a94RuHg0e1sZQ5iF0hUORfBXfBn7tP4=; b=ImyqXWqbSvGe8zes+lhU1wSQu5
	E4lt3pU+gNlZsTzA7Fbn5U0XeHEYJCMbdpFtDRSGKCMrVzd6Slpxk7vnZw2sYvqJBMuMOrLPhL593
	hEPB25gQ+KMWcdqG2jV37GNK0tJYxXoi4hFm4CwKqYWGBcwCUxJqe7EuTNYcP9TxeeFUtMRGmudKe
	NxIebpAi9Y36NfBtITadOA1EHAZuizs7Mj7//Gz6cgJMmHTKtjuGAaGZoBwiCsubO99tvI95TLfLl
	gSaLa/gzH8SjsArRJ2ok3hIpFkHFi9cLLCvDhqT9LWATBKCJIyJlsjaTFlVAfSi0ZPEtiiZbdTkAR
	YDR2hhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObVx-00000005X6F-0AUS;
	Wed, 04 Nov 2026 13:58:57 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObVu-00000005X5d-3rvl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:58:56 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so837651a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 05:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793800733; cv=none;
        d=google.com; s=arc-20260327;
        b=CjE2mTYVpWqjKy//JpnoRvUCZKsIvddpRX64JyILeMUYzNyB+aYNm1SU+MtbMEqoRi
         X/PurNpQlOA2/68h2Nfhs6oMBcrSDGxqBGMgzX7/9xGaUnoc3qH9ZEaSXqxKAiAjdLlx
         D6OALmsfUocvDGkCSmnGjwo0z7ZbpyoVq/ZGzFhlbc9ZQj2a/c/gt2erDFoqRK9A6R1U
         lL6oZymF6Hpuz/Gxcc0Ot896Vt2NrUUpv3f3loE12UbRITbB95St/tY7gNSPqrygnyfI
         XjUClf9BxTHgnVktJl1KdyX9bSSuJ16RCXoS+rbup9zM6AFepZCsflvF6QQXTLWCk/pX
         Cg+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=o4EIHpxl57I6a94RuHg0e1sZQ5iF0hUORfBXfBn7tP4=;
        fh=uutVj48tJF4kYZsUZU7A/mPy/BEGD4MtOXk8rsu7nZg=;
        b=DQldrlT+jZ96hyKoDUG4vwzFGcUhtwNt7r+oFpsUzsMq6HmNd+qMoVJihcuAONQuhp
         +foC5m3i2t5OksNCLeyEl3iTSYtfHhtrYE2MhWHPKsBQXycp5vz/w7NJYPf264qkrzRH
         oX3liQ3YGuKLu4eJIs3/hJM6aPPyl9gBpMxZdR/k0X5m2TMb/OySheZDwzG9fcGloAGn
         41/fv3gC2hD2hOdgyFqwSGOuT9EmLcWNeIpbA2DneEcGXwOytM9IWckDmVRNpTicN+7K
         jBW/vkCzbcAQOGqldaQ1OaebeDTymsFlub67M2pB+ekpG+drvlNWRVOCXQjB8f0GXcyt
         IfBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800733; x=1794405533;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o4EIHpxl57I6a94RuHg0e1sZQ5iF0hUORfBXfBn7tP4=;
        b=BIvhYuYXFLGlnYk1zRvhpLBhOMgwn4Q+jvYchASe1ZvexfWZh0jm4GA0owr71jnwX3
         4/tiBAZRJvSoiiTKxMPUiPDu5IRO5BVqVg9/X1ukA3NwpxwQb5wd8V6455Ec6UCVBt9H
         VIZsT9hl2ez+pF6s8cw+Ll93lmEKTjuyz7ITfthdMzqPEpmNklpU28sXMF0Lk7kCgPdD
         qgQyUAXoY3/Zdbsdcv28WbgamqqjmFrmZUYDhIQopFaJqDX5XoeS3mfqgs1MmK1VAJsT
         xprEj8x84IAke0f7S20nh5EypfK3O/dOCaZCO2VKw/CpoqTqQwhxpNKpu5FjG2FPjsw0
         igYw==
X-Forwarded-Encrypted: i=1; AKwUvBwF+keetqM6GQjXEYegdZI/yClXxFt9T5hIwXBvCf6ERxdD4o/1htk7JKkzWakukCmrSc0DBH0lfcHe1XKSfvui@lists.infradead.org
X-Gm-Message-State: APuU4Z8UR0OE5WVnwoKPosXsZFnBEqkIJqk5F8yEa3b7R/jXgGjirYq/
	sgb61GcegzWDTwFtuedhb/zwunBrLLIvj/9oi1n8m5OibJphttxQGYbnpQAgsWTVfJKtYGXtsym
	jdTmUOL2mrSk7Q1cTY8ZYNJNspqzM7YIJBNKg34dL3A==
X-Gm-Gg: AYBFou1jnsicC9puyZHw4pIpGuCznjV949aW+itBkSPqnYIz3++7qUn/49YehkX5D4W
	AFBkEk8HoyXADVALK2USXrZZqVqHaQy52ziYETopXv/RI1wAne/e79JhSOrvmSnay8MUheiadKx
	HIoF+pDHC2kUaiO+tQs4ZZ9m/lYdEs4kdeayIfiO3XWjEvZwm18yAXYRH0+Yox290V3DF2ai9wp
	Ei/xo2Zf8hNgSqDVqJDrqT1rUmF8Slywcs94gyu6gqOYWeKCHxqqYKXZM4u8LEhDSB+dc5Vo6qP
	EEyX/CQDfFM0Ye4t3D+RtFObOxXCD3R0WARREmc+Iad1u3AzpgJJq17TFDSAvhHkTNuxoStkKJN
	MuYuxfkFNHkScTYV9dEIN+EzXUhIRX0NW9NcO
X-Received: by 2002:a05:6402:10c4:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b4d3374024mr8489250a12.3.1793800733137; Wed, 04 Nov 2026
 05:58:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020190319.884375-4-opensource@grische.xyz> <179279532482.3134.8732796861806998047@kernel.org>
In-Reply-To: <179279532482.3134.8732796861806998047@kernel.org>
From: opensource@grische.xyz
Date: Wed, 4 Nov 2026 14:58:25 +0100
X-Gm-Features: AclHuK_IvwAzwzvaVvW3vcX9pBmkxBHmo3ddDOqECYjDXhAMhYt-2sOn-aUE7ys
Message-ID: <CALsH2cwoB3P5Td3SgZ7ARTcGRLhCANSDU9dXake6ty1XAf38Tw@mail.gmail.com>
Subject: Re: [PATCH net 3/3] net: stmmac: dwmac1000: stop hardware from
 dropping checksum-error packets
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, o.rempel@pengutronix.de, 
	stable@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, aaro.koskinen@nokia.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_055854_962590_23DA2D41 
X-CRM114-Status: UNSURE (   8.82  )
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
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,BULK_RE_SUSP_NTLD,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FROM_SUSPICIOUS_NTLD,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Does this work on dwmac1000 cores that use normal descriptors?

No, this only works on enhanced descriptors.

> Would it make sense to set DT only when enhanced descriptors are in use,
> or to make ndesc_get_rx_status() report csum_none for checksum errors?

v2 will set DT only with enhanced descriptors.

