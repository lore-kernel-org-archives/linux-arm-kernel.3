Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B6E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 00:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eKrSLWxv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B55JhhT59YGsjYWJgV+XXad7EG0ayDNShVoZf8DxBWQ=; b=eKrSLWxv9psDrgVbO8mlTQ5n9R
	ycQl5PxZStzwr+ovYhw2/AE7/G9I14KBbEAJ4C5XbV17FCtAwBU89rDKVM/+GG1GZ2GoHE+5vzg73
	vNz3kNIMDzTusKrgtIc6ES78tvsHjJQ6420503p0GZbRmIe/36Is39onhYFq4NqG+W7TYcygwheKi
	LlpNqS3xqn9MkccDgPEkpBjgekH4LjwWSNyECwLv4va5xHlkvoUzbR+PjD3azWJTT10WncwYU/Gca
	Q2kd8O2dVHiZ3j0XkJLhPtddzQPDyZWWk3L2e5MdcQLaRbnnLcAoxOndxH7vZMHitYHqWSKynfVwg
	sB0e1BaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlRV-00000007MoT-1bRc;
	Thu, 05 Nov 2026 00:35:01 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlRS-00000007Mni-3tM8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 00:35:00 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso7827115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 16:34:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793838898; x=1794443698;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B55JhhT59YGsjYWJgV+XXad7EG0ayDNShVoZf8DxBWQ=;
        b=RKFeS5okxKaoj4yxz/I2E09hR3seXAS55SSl+4nVppIO+KOBm9KPUyt7dFrAB95hUJ
         a9cLxpnVPaKFz6PWTTm+0liyYWt3hycWV3KtJ9ikTEXt0N6JiYiQn/zaDc3Z9FRyI7Yv
         hYxV/bpaoP5CXTFRVvzaC71oLoLrnq1bEMQCV8nWyeHEe/pBnkfE3aaJVyYnOQOHUVSg
         Z+jwAgRberp+NqAoiir4HqRi3f9otuqNHuqhAOZKLdFbafMp9gY5bEorhzI2HjyteFqV
         AdZQO8z2HG1TMn/7GLgJ66zPFecxgG7bWf2AxBod+BYr7hjUR2IEEyczKX4GArCf3yip
         szuw==
X-Forwarded-Encrypted: i=1; AKwUvBz/z53IQAkmMIe0KPusnMeJfsPxXakUwm5QMCbJxC9QkgXtTRgD4+8DTlUNCmgfxs8eC7nUodG5DT6Yri4QNe6i@lists.infradead.org
X-Gm-Message-State: APuU4Z9soDmPevB3tS8rZmbPO/tDnTh13enGfOtj96HovyM9VorTfcZQ
	HuAHG0N9v8omB8FlcCRKeHavE/dM0vu5DKGxTucwwW8wizWvMOju0YHKHkkXDTSn
X-Gm-Gg: AYBFou2s/Orw4AEkK0MrbsH7aNCVsuwzXyEVoErLgqXT/xriHN3ycDi2DDHJlDLwrjw
	qyEmWj0IXYFpGUV+WdnQNuWbSdZb9uW2cgd/akI/SGeXoGerb6K6sxmIu2sAN1JlWnM3RSampQ0
	upRqeI3P4jjdpUlemefmeJrrg+ybqzWjFpoMlN1vMmRfM8/GQYGcHcdXrxA2ja8LT7rDjCRUCRj
	a+pfVVw+jAxFCyjOtsLjP7v4IsmBIM90yPILk6ojnBOFWnPt+/IdtE24MTcZNAgfOR9Pj74YU7E
	WXOyIAmobFRlXCnxEBPVw4CpPGDw4f9vQIiicw6xIJ7fjcHYav9AUovQmR84rXGi2r3edcFtrUo
	oCHRHstlas/X6upg9117Ht4/+D01+z5o0XZErPlOIfXvuEpWy+Pn61N9OSv1ESmbdTGXySrhGA7
	5oweq+qbiB0ZVviHCb513hW8BwKEtdAcjaxCz2gGSEG4BCReaQmLx5OwH6laoOz64NHBU8ztp79
	/TKHBivhmq8zlVrs/GBsFni6WiiIkOyJwf2B0Rjcu3W3WJARMNlowzsIIzlj+4p6x5rAI6bZ9mV
	uC18DU4vOhpURF1/7jlrlBaaexb8oFQYQI473MwS/Z8AJR8JxTDqp4+4lrhjs1X3oaWtkirVGrL
	x/sxa4Xec9ghNZE6HY52BZXxkH8ovE5WaYif+a1DAa+o=
X-Received: by 2002:a17:90b:224f:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3ae897c94cemr15322838a91.13.1793838897862;
        Wed, 04 Nov 2026 16:34:57 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31aacedsm1034389a91.12.2026.11.04.16.34.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:34:57 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so1741829eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 16:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBybXiMJDnpZ234beCC7xSvpS+e2M9SYU8s2sSu4SzD2+U60yhBviOvOXZwe3roY5rAGMTR54fqodZ0G4gXJ4NjX@lists.infradead.org
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id
 5a478bee46e88-36a4244dbfcmr25290212eec.20.1793838896251; Wed, 04 Nov 2026
 16:34:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
In-Reply-To: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:34:44 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4RRuZcsObkF5r_bDacR3d0yjP4e6GWESksDPKHxK2u2g@mail.gmail.com>
X-Gm-Features: AclHuK-1vO168WRWmJd07mz7tA0jKpT7PGyfi_yQuj1AayEjOBkR4gYRSMoaS_A
Message-ID: <CAPY4CJ4RRuZcsObkF5r_bDacR3d0yjP4e6GWESksDPKHxK2u2g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_163458_968321_EF4FFCBD 
X-CRM114-Status: UNSURE (   7.97  )
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

> They are the values the vendor bootloader programs, and I checked them
> against the hardware.

Correction: they are the board's factory calibration, stored in its
factory partition as 17 and 10 steps; the vendor bootloader leaves 23
steps in both, also inside the measured windows. The rest stands.

