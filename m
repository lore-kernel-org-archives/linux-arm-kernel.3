Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1E6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E8ODCloz;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b2pKC2Ub
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xZzKTf//DQYIAN9VwQEvMddExwcCW3dbdXpAj0Adyw8=; b=E8ODClozqULyN7
	ssX/0QmkGQDJi40NQM2nocjQE+XoUND4xJIUiSsqzNENeHinKkCHClh5ckGk20yd4YIWt/UMHnryw
	k1UU3hLabFp8G0UCpBAxHSlRzfGU/zK2yCTthHgQpsE82c5NPHZ1uw0tqxeA7kSISa3Q2Ya0e0oFf
	j2Hb6pCNaP4rdMRrOukMcC6IanFii1S+lzPwmd1a3/wYQsGD3FR2qi9RdKKVQBtWeAkeQLJj9ikPe
	2ZiPoMUDOZXgYZ5Pp3Qm4vnyRv8jc/X0eiyCY0BKyWpuFnDkXt5fNMA//cC00RNlkGjxB+pYjPeAf
	1p3q0A/xqO9yToR7xzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtkS-00000008J5L-1qfR;
	Thu, 05 Nov 2026 09:27:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtkO-00000008J3J-0Iv6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793870821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZzKTf//DQYIAN9VwQEvMddExwcCW3dbdXpAj0Adyw8=;
	b=b2pKC2UbTlalxXeMydjDn4mD7Db7+cdC3bcjvHaiN4yUZZeoGNz/nLfZIn68iq+SSayXCB
	bP7ZSWCLCNWLJj+kBNimNPdwjzhXdSGKv4V3dvcg3NkDwBm349HGLonEt2FotdfA+5R5D0
	8bhGcr9YlrRqOQFka+6y2mSBbERyX/E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-03OYSAgSP0maZe6ydHSMNg-1; Thu, 05 Nov 2026 04:27:00 -0500
X-MC-Unique: 03OYSAgSP0maZe6ydHSMNg-1
X-Mimecast-MFC-AGG-ID: 03OYSAgSP0maZe6ydHSMNg_1793870819
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e011829easo1016869f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870819; x=1794475619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZzKTf//DQYIAN9VwQEvMddExwcCW3dbdXpAj0Adyw8=;
        b=dYdVFCTT35S3Vu8nsDIvUvYvZLWZ0HoHPJcrLenNG2uIviBTiEuxMYXlvETFQwJwWG
         TgbEVsRs7u2ipDCDsfG8Y1ThIyCIpDYqCs3n4icwV9ccHXTkfu6wks7hSt1tPwtIu8fB
         wU7AsW5qyhms9ZtlTQ0r1vJoJjLwxVhP0O0N9aSEzH56wmUbuQdXxhy1nULP0kzH1Led
         Eamw43ZYZJd3uow6UPFlr8pzTslYB60cqLDvD8mzefa+m+6utWzf6D2JW3Ur5sO4+9Ak
         Gp0rMysjZJDwlSo6f9RUHsD6u1rCopkVR//hZ3/Hfp20p+yHz1PCEyitFm01vfFEr/Pt
         2vvA==
X-Forwarded-Encrypted: i=1; AKwUvBwjfr9D/pN4nqEQ9z0l7Rn4g0TupuPgg/mzD9NzQr78B/2xNZnAgTeIv6Z/+V17IDCEGrErHO7sKnOCIwSYl/qB@lists.infradead.org
X-Gm-Message-State: APuU4Z+iIGccCJsMxP3WLG5ynOI5mwQgory/X9ALFIqPiwPOUPBgwzdM
	E0shNAYUQi4B7GeL/IkJ7j15Iqd5ghHPoo0mAeZPpGSKzK0CrZ+ECQJs7IH9Z+sHTOvzP/t3giV
	v1mxwYoo1UH4ZMpRBWclrXjgNq+f8MD4sbfzeobbo2XWuE9vT8bG0EiYuqJcF1se4RhQOEmTLUN
	tnAsCuI8kR
X-Gm-Gg: AYBFou3I/lrVzDvobCA13HHZWf4CSP5itg9mGDMePRIHZ2hoh60wxOXqlAX4Bg/oHY2
	x4mquuwS57lOg1tqbbcDjLjDJ3IEJnM1guZdAgF/TT3KgPjBif/l8NWFDCRQ0u1pJMSdlWudS+n
	P43UxWwiQLQXhShUAEuThyaMbZ7FggVlvcO2CgSa8T0bpNVXUorN5A0OCyDOGulLY/6bRGB3r7o
	cqBtyx5YhH65wyVEbweToMhrEK/XFPcVkzVO1m9mdpIRJOV178Y5cpSBcS5xG7QiOPdKl+PW0tG
	6GScVI8EH8pCHlKeopnbqGo4BDtR92mQlich1cLX1n00OZtojpBKTCyqTEHe9ZLG7KbBvcnSWmq
	kK5SwRC8ApCG78pJdlFymibV9nInvBcfAIQCH7A1vLyn/S/v0B6ghZ6vlw97/mKhLn7YmojrtZA
	KBdtPkPFuMeB3raHdsLXRgfI5bUV9qyv7YSOY/I39Uvqg=
X-Received: by 2002:a5d:64e7:0:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-48e6e4f5652mr39090748f8f.40.1793870819087;
        Thu, 05 Nov 2026 01:26:59 -0800 (PST)
X-Received: by 2002:a5d:64e7:0:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-48e6e4f5652mr39090709f8f.40.1793870818660;
        Thu, 05 Nov 2026 01:26:58 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece998absm9617108f8f.22.2026.11.05.01.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:26:58 -0800 (PST)
Message-ID: <679b8dcf-0aac-4674-a006-5af0156a82ae@redhat.com>
Date: Thu, 5 Nov 2026 10:26:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/5] net: sparx5: add tc matchall port policer
 offload
To: Daniel Machon <daniel.machon@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com
Cc: robert.marko@sartura.hr, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DAh6ydv7jX5Jb541_Z6C-JQm9iuoVc_CvuSj1YIEsr8_1793870819
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_012704_195596_8E462EE9 
X-CRM114-Status: GOOD (  17.80  )
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

On 11/2/26 13:21, Daniel Machon wrote:
> This series adds offload of tc matchall filters with a police action to
> the ingress port policers of Sparx5 and lan969x, which are both served
> by the sparx5 driver.
> 
> In hardware, each ingress port has four single-rate leaky bucket
> policers. A policer drops the frames that exceed its rate and burst.
> The four policers of a port share the pass and drop statistics counters
> of the port.
> 
> The driver uses one policer per port, because with more than one, the
> statistics reported to tc could not be attributed to the right policer.
> This matches lan966x and ocelot. The policer meters each frame without
> preamble and inter-frame gap, so the configured rate is a data rate, as
> tc police expects and as on lan966x and ocelot.
> 
> Since the policer meters all ingress frames on the port, only filters on
> chain 0 with protocol all are offloaded, and filters on shared blocks
> are rejected. A police action that is already offloaded as a port
> policer on another port is rejected too, since in software it is a
> single bucket for all of its users. Only drop is supported as the exceed
> action, and the police overhead parameter is not supported.
> 
> Patch #1 drops a redundant prefix from the existing POL_UPD_INT_CFG
> register macros.
> 
> Patch #2 adds the registers used by the port policer.
> 
> Patch #3 tracks whether the ingress block of a port is shared, and adds
> the per-port policer state.
> 
> Patch #4 adds the hardware programming of the port policer.
> 
> Patch #5 adds the tc matchall offload.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
I understand the following will be very frustrating, but for unknown
reason AI review did not kick on this series.

The changes looks sane to me, and addressing points raised on v1, but
I think nowadays we need an explicit AI feedback.

Could you please re-submit the series?

Thanks!

Paolo


