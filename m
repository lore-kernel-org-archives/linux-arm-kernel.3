Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FFB606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TvWQO6ox;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iWmFzW1o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QR7kILSyQV1HfB+rNJZZQwe28U+a3tmFcjkLHMatFZU=; b=TvWQO6oxzw8iPMB/XFd8LIJusg
	JvjyvMukuucmXkt6/VQOU0RQhHi/cs+OuwqulJEQBsEKdCkPlhceg/8UrEG6S6PD2PvnmLmJYRSJO
	m66DLgP2gwvbWZQwfgaTlgwvMesAj+YTNe3Dw7rZOF9Apo3gYG+uyJOQur7MswU4bNfMsEdWQESLB
	IuyGn8ipS7ZVNork42zh8jHTrx1Q6eOe6t9N4uzszoilW4jBriub7/8JWqYyxsRoG4Z8Mz/AvS/U3
	HIHlmHKw/1oJGVLJTVfVXur2XcHAPa3a7ASQDahTXWa4yO9MtQwqcCQnuRZ6Ku2U2XVTWnCKCfDDZ
	lqJibSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9g2-00000009lBW-228n;
	Tue, 20 Oct 2026 13:14:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9fz-00000009lB4-0rc3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792502085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QR7kILSyQV1HfB+rNJZZQwe28U+a3tmFcjkLHMatFZU=;
	b=iWmFzW1obbUwHPsc8pP9Hd56KiCDD5o2zB+MEoddG14mD6IOinDjuXT+HOYZTw5V9C2ULQ
	j0bZewU1yWjlEF7oXkf5aY2seZiXBVMwwcf31iAEVsLEkZX6zol5oS/wEg6pt9R/de65XI
	VtT8lisbNNCpLdkiJ9VOm03TlYu3N+o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-m5dD_GyoO2SMtwl-TEJe6Q-1; Tue, 20 Oct 2026 13:14:44 +0000
X-MC-Unique: m5dD_GyoO2SMtwl-TEJe6Q-1
X-Mimecast-MFC-AGG-ID: m5dD_GyoO2SMtwl-TEJe6Q_1792502083
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48afcecb035so371745f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502083; x=1793106883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QR7kILSyQV1HfB+rNJZZQwe28U+a3tmFcjkLHMatFZU=;
        b=eVjiex/ZzO4V28YPWC83Qy9cuk2MVj/HSWH/3X0G4C4qLmzbQ7M1t7TTB7B0jux4Zs
         KxukGw7GcQ31xYK19yD4ouhOPD3EYTAanYMGRTxLHwigaHMxChyd1DX3Tsj49lgFZlH9
         Ux9vARl8GTSItD218DXcR9qY4/T1uekjCrvCrz/3cvpmq55lcaVcOwfKCnhLx3+vOEk1
         LkmX74jlDs22RkUmiodGPOv6RYYithhy6q1VnCZadcf/6EKS6AvM4wdfbbdn9o2dIdWz
         8zEOhTgUzTFeTnOpC+Vv8oy3/2QndAwmEjX7EccKmzQ0ijWN3644xBzhIay5GINDJiw3
         +Jjw==
X-Forwarded-Encrypted: i=1; AKwUvBxSNYPV+9bIIxUaxdLWIqG+WWCgynIr2/WTk3oELHTTjcHVG3cOIsXOpcaQFwhL1UL8LPKJ499H+ojQnwj18RJh@lists.infradead.org
X-Gm-Message-State: AFq9FYKLfVdXcydred0Tg9sxFOk3HpbnvkVzdQOjegGHKG/WNLqza3W7
	vta8FYHMPT6j7UvQt00nzn+OB7Fwk7d7DtXapkQXJa+8C1Up/HxQm4UeSbjD3q63axTc6RBz8J3
	p+a7T1PA45QeVXX1E2Iv7Q6xZi8Lu3ZzsI/SQ+UmaPvRTvTaJDelYALHtpQLdpvNrrO6EBG1t2/
	ER
X-Gm-Gg: AYBFou2UeslccPSU/EtWBgqW9dikXtKsQUWTtwFR6b7v9lDgatw9S3x9U8F9jBedFdU
	pOVqb1Ine4T5DhV+ByPKckFFAMkO494pUWm6l3ehBO/vFo1mWU1KjTseHnHk+Dn/xKUWuGe0VFh
	r5v081fO+nEu1TEWVb9Oztx7Gu5dwyJkAw8X610vLQivUYbMzWFeRQs5SHO+HuyHuWYJRQctV84
	SxQsY1pc9hQ0ZvISpXBZbzp+GsgOhe1gWB7HVd92Ode2wmaZGC+24AOktsDsQlCnMN2Rl8rGDmZ
	bH5dXPsGHiQBpfvVF0Lk9MKfc9hByn6RAcCJicb0OGiamsZhTQAH42QUnZDqw+NuoF348R2Gcej
	b/PUU79D4o+vMA11++svWM5xNCY/Y+8kN3ielkeNjujRTqKCRbYV8qzY5/ES3GuwiVUSNvirsqA
	==
X-Received: by 2002:adf:e541:0:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48e1e77fb45mr4078408f8f.23.1792502083064;
        Tue, 20 Oct 2026 06:14:43 -0700 (PDT)
X-Received: by 2002:adf:e541:0:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48e1e77fb45mr4078359f8f.23.1792502082599;
        Tue, 20 Oct 2026 06:14:42 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbbb0sm6269587f8f.5.2026.10.20.06.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:14:42 -0700 (PDT)
Message-ID: <3e357388-9d7e-4ec1-b2cb-2d4d32bf4742@redhat.com>
Date: Tue, 20 Oct 2026 15:14:40 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 3/3] net: stmmac: dwxgmac2: add XGMAC
 timestamp interrupt support
To: zhu xin <zxyan0222@gmail.com>, netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com,
 muhammad.nazim.amirul.nazle.asmade@altera.com, rohan.g.thomas@altera.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261013033207.1684328-4-zxyan0222@gmail.com>
 <179195062971.434549.3907170504821168391@kernel.org>
 <CAP7veTK6NQtrweDVXsYyiMuru_Svtir5XvY_ATM8a6GWO=cqKw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAP7veTK6NQtrweDVXsYyiMuru_Svtir5XvY_ATM8a6GWO=cqKw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: guqgMQAnxiWmsN1E5dxZTSbQvGfVWOODQKQSL24qkF4_1792502083
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_061447_318720_F5AB2B8C 
X-CRM114-Status: GOOD (  14.95  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/14/26 14:49, zhu xin wrote:
> Hi,
> 
> Thanks for the review.
> 
> On Wed, Oct 14, 2026 at 12:03 PM <netdev-bot+sashiko@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 5 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 0 · Medium: 5 · Low: 0
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [Medium] The commit message says dwxgmac2_timestamp_interrupt() cannot
>>    race a FIFO flush because "PTP_ACR_ATSFC is only ever set while…
> 
> Valid and will be fixed in the respin.
> 
>> - [Medium] In stmmac_enable(PTP_CLK_REQ_EXTTS), the 'already enabled'
>>    -EBUSY check is dead.
> 
> Valid and will be fixed in the respin.

Please note that:
- patch 1/3 has more comments, and likely more relevant.
- net-next is currently closed, you will have to wait for the end of
   the merge window for the next iteration.

/P


