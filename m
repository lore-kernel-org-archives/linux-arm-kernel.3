Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E10C606D2EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M61h2rG4;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d/aEna/I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=; b=M61h2rG4IeJKtw
	WGpINKyLm3eVGqGIbMDNubo3JRGPX+Wb+qI5ADQ2PfBUbajlcUbiJv1scRGwzTJ8OspkhSF2VXeGr
	9/gElQcxRgSqJqbkFTIpdg73FSQ76zdUu2Fu2ak+Kxz0Sj3+JRt8Hk1U3byNELidpqT1eAGpcZRV2
	0ZroDl/T76bXAVkgRtWnrZApn5vMxv1xjkR3L5me517bNVdVMSa5SSzPd6Ef6wV4HuMmRhjgaDCfD
	spw6Vc2WbH6NEmWlHfsa5zIA6v+gXsTTO+uNjAEeD2DRy6x0I5YduZfGADfrA79ze3KwvCg9Wf612
	JGIL5BPeur3qbLaW2rwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFzZ-00000002pJL-1yvf;
	Tue, 03 Nov 2026 15:00:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFzW-00000002pHl-3f6V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793718000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=;
	b=d/aEna/IqhxuAdRkL56DUGLT33MVPskmrVBKBPcZHPcKk43bZeB7SeuomSGeqEqmDGLief
	OKAECoTFmR1qi6iz1XThuvxJftxsUcO7BBw+QRkwxnzKe1CQOInw43o9thPuLjhfoT7Yl9
	ylBFNG+l+979ZIOzzgBnaFlWd+RRo2k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-dEqlFtbDOomdDbDQrtMnJA-1; Tue, 03 Nov 2026 09:59:58 -0500
X-MC-Unique: dEqlFtbDOomdDbDQrtMnJA-1
X-Mimecast-MFC-AGG-ID: dEqlFtbDOomdDbDQrtMnJA_1793717997
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so31167955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 06:59:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717997; x=1794322797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=;
        b=s3IhttfUFhHtV3gkEK6phde6Gg022/vgrHHxyOC89GintiMfNKhL1OdWXuqkAFtSjD
         8TSiQphK2CqhBpVUlp2EPKaBs/GP5xdBL64/o6QqLXWbBstIC/NWrenzYecJvaXuiKwL
         rOr8wyBuQ8TPVEKB7ODzHT5wqI7HWv3Cvw5KA7tA1+31JqA13KUv9pdwrR1g9zBndnck
         2O3PDuCcdGxaX5cDndt14BZjHGXzwf3sgfX4E9TeNt4DNpE4jWG4ksaXbOgSg+dn6VOS
         lkaYLXGmH5v+vQiyBLlHdCp2JCeAAjdGhvbADC8TOEt1G5oxJB4GjkXyP7XErUksXL7i
         xIxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwlzaPI5eSGQ7vvv+L1mCMg8NLN1c13DJl14cX2FJk58+KX+fAnlF+guTT26LezU7ANroQqXKMFkh/3TPSZWcJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/wCX1ieIZV6GHBbdpfMt452kVzWM0VIx83CfIB7on0BswXA92E
	oqLT1b1lT0tLYaz/RdHJlPi6XWLxPU/GrpYCprTs934RE+aHX+Z6gG6MiQAL23Om+wvA5oQIuTl
	zauvUTbjs0D12NK2Squ4MyET2pjDqxw/Om999HTGdUGd81alZ8U/i7El70sdAQ28OruzWKbO/Tt
	8R
X-Gm-Gg: AYBFou3e/uci97K1AE18QTctikMDDEglApNxXD899NClcBLjyuJHoB9NvliPKWXYVB5
	QBlO6oGlGzSzk7sYpvdOKucTvXSI2pG4h2u1asGFOlTiLEruwyuPt/n7WB+uwzVpH/OA8Qe0OTi
	n3grieqRNjs1EmR/xEe5PYSpHZ2SyRIKdeXf9sy4jdb1OSV4EexbkfkpwSGJ8pVqFBj6oAGUibL
	p5+eS1k1nG1FUhfNSbX1YhLeWA6+CdwnLZVce8MWFvVqnoDkYSfDmfX3WE0oDQGGnp2SG6ATo2t
	8P7bkGTIDC3qmwxxiqrF4VbT0pgBLt7ZZ+SkNeq5yPJyjDMzH11BeUfVxI0b9FtnFb0tBc/UDhl
	+u+/eNyDef96nsjJzu5u9YiT/fxULxrxQ0p3DdeEJzm83BzIyySMJP3FJHaLZaIO/cS6T/HpwlF
	bM7X3BnJBp6DDgZcLRNBrmE1gkvR45OQYvLstwXBzC/vI=
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr307788715e9.20.1793717997441;
        Tue, 03 Nov 2026 06:59:57 -0800 (PST)
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr307787935e9.20.1793717996940;
        Tue, 03 Nov 2026 06:59:56 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm464079285e9.1.2026.11.03.06.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:59:56 -0800 (PST)
Message-ID: <ff77c7ef-4c3b-4113-966d-3c46d5776cdf@redhat.com>
Date: Tue, 3 Nov 2026 15:59:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] net: dsa: mt7530: support EcoNet EN751221
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, linux@armlinux.org.uk, arinc.unal@arinc9.com,
 Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 naseefkm@gmail.com, b.larsson@gmx.com
References: <20261029184202.1859843-1-cjd@cjdns.fr>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261029184202.1859843-1-cjd@cjdns.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OzefqUuya5TwH_cPr7hOjbDusGfL0XKSDXiLw0lVRFQ_1793717997
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_070002_980192_5289A1D1 
X-CRM114-Status: GOOD (  17.95  )
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

On 10/29/26 19:41, Caleb James DeLisle wrote:
> The EcoNet EN751221 has a unique switch configuration. Every chip made
> with an EN751221 die has at least one on-die MT7530 that is MMIO based.
> This switch has 3x 10/100 ports and 1x gigabit port.
> 
> Some popular chip packages such as the EN7513G and EN7526G have another
> MT7530 implemented as a multi-chip-module that connects to port 5 of
> the on-die switch and is controlled via the MDIO controller integrated
> in the on-die MT7530.
> 
> In this configurations, the upstream switch is put into a "passthrough"
> mode in which all traffic is forwarded between port 5 and port 6
> without altering its DSA tags.
> 
> Furthermore, since the DSA core does not call mt753x_setup until all
> switches are present, and the downstream switch only becomes available
> when the upstream switch has configured its MDIO controller, the MDIO
> controller setup on MMIO implementations must be done before
> mt753x_setup, or else it will never complete.
> 
> Finally, the on-die switch and the MCM switch connect via a TRGMII link
> which requires calibration. In order to calibrate this, PLL adjustment
> must be possible on the on-die switch, necessitating changes to the
> core_(set|clear|write|rmw) functions to support MMIO implementations.
> 
> Solve all of these issues, add the TRGMII calibration, and add support
> for both switches.
> 
> Since this patchset will probably be subject to some discussion, please
> consider accepting any patches that are non-controversial since it will
> make future re-submissions easier.
Does not apply cleanly, please resubmit. While at it, please add the 'net-next'
subj prefix.

/P


