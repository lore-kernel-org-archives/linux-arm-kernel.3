Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36054CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWJfgnj00gCkz7CXTr/d8e8qYHqPtAX3JIZh4ekkrdI=; b=4B5iU4M0jlSq38pt6/iMw/gcQB
	w4enfsHqEzZaSCrmQGC1F+NgZ5gHvdNISYLjlF8Ryj0ywCe3hzC+PP8OTF898q1faWmvjM3Yc9OGl
	mieKxBOjYTcEMndSG+Xcnp7DEUeQnd7dBic4f2W4+Y8EDGuAmuzCMLaQ/OVPv0tItHIRXn+pMLU/m
	tcMO/uzWGJm7vwL+qZ9FEju/Aj9QHV8mm4Snink1Ib/eNhbL2jHNHABCWgc/kSQZ3zEOytUfhYti/
	eawGjCGkm0BADgGKv4Gofnd+24g4o6hhqcbC3gfh7WABJO001iLKw+Mp4exy5MPqBjY9YnBmoLTD+
	mArsjd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXn5-00000003f5p-3FZD;
	Tue, 29 Sep 2026 13:22:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXmy-00000003f3M-0ts0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 13:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XWJfgnj00gCkz7CXTr/d8e8qYHqPtAX3JIZh4ekkrdI=; b=gCoDM+aqZ1kGtgFXQr8mWKSxuJ
	QH8u1yDDcHr9hZAXoqoSSzPFPUJH8R7MfygAKALsgjBqi3u5celVa56ntJ4FGN2MbqzLUDaeCVu1y
	/fBE/lfc4Lw3F6LHVzEmPUmy5eQDQUjQYs09Qb7+9uCxSn+v95ne/qgz9BYV4OiSRmfUB9RPQQN3Z
	iMNiEauUkc52GdK1b7ybiWV0am17rv66mNIw5oXAmK/NlohKbFJcc39nftyV5a8Z9CZ2tPn+A5jMT
	y0fh5QqNFyiLHxjHrobUDZlsPBu7xJBQ5Hb2G+ywo9EaML2n2II0Jc8b2L8BTnJTI6quAJvKglftx
	3+nFELQg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBXmu-00000002fjz-3LFM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790688145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWJfgnj00gCkz7CXTr/d8e8qYHqPtAX3JIZh4ekkrdI=;
	b=TCAEGuPqgarNGE2eEXtP6yLh93383WZhsl+CctoPo70TbuhmNMK38mDL775u0ICThkTuHR
	J+lqPqyqrfyWkOQ3SE7kVAt8PdlypWP2HEmQKBqK9rUXjySUFs9SXvDwSXrlQxbfw9A2cZ
	r0GpkhZzz6WNT7qmzV809Q91zEgCHqo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790688145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWJfgnj00gCkz7CXTr/d8e8qYHqPtAX3JIZh4ekkrdI=;
	b=TCAEGuPqgarNGE2eEXtP6yLh93383WZhsl+CctoPo70TbuhmNMK38mDL775u0ICThkTuHR
	J+lqPqyqrfyWkOQ3SE7kVAt8PdlypWP2HEmQKBqK9rUXjySUFs9SXvDwSXrlQxbfw9A2cZ
	r0GpkhZzz6WNT7qmzV809Q91zEgCHqo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790688145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWJfgnj00gCkz7CXTr/d8e8qYHqPtAX3JIZh4ekkrdI=;
	b=TCAEGuPqgarNGE2eEXtP6yLh93383WZhsl+CctoPo70TbuhmNMK38mDL775u0ICThkTuHR
	J+lqPqyqrfyWkOQ3SE7kVAt8PdlypWP2HEmQKBqK9rUXjySUFs9SXvDwSXrlQxbfw9A2cZ
	r0GpkhZzz6WNT7qmzV809Q91zEgCHqo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-Oy7pMddFOWSpIilb4d1-Cg-1; Tue, 29 Sep 2026 09:22:23 -0400
X-MC-Unique: Oy7pMddFOWSpIilb4d1-Cg-1
X-Mimecast-MFC-AGG-ID: Oy7pMddFOWSpIilb4d1-Cg_1790688143
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48af4046a3bso744459f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688123; x=1791292923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWJfgnj00gCkz7CXTr/d8e8qYHqPtAX3JIZh4ekkrdI=;
        b=BItniLy6lt7Ft4Rn879Eahuot5B+QnGSjYyVky661c5hxjBh0LWCIiJObzlXzEy0X8
         oHqTPbIVDXmOOPnBpaVmZOb7jROKxzDLG04vKKgKeFJe72QwbDWrvT8JaOAWli/XFlxe
         wSSiV9mdytVt6luX1chJHpjdsaEeY44W2SggedOHqRsRYKspUkCNq8hSDoptJGTAO2Xt
         4H6ywHR5z8md911kBf3uyZO9PWJtLHeEMQF/PCOAz94CqlXiMRGtSJ4UpTxss6rK6yBR
         zE9ZChmYZIHWzIow1eOtE0pBy7LL0Sl33lXmZPwekbisa9ULEqiXw5/GSEEUtsQPrk/P
         NnSA==
X-Forwarded-Encrypted: i=1; AKwUvBxTb17D2sZdSwVcyMRCPTdwFNEPl8sHEt+GQSCE1H1+0jvJGybMvBuMUT8y0RSPDfBAJN2E5EhaUBoHsfGHFzNk@lists.infradead.org
X-Gm-Message-State: AFuF++kxVjD+O7jw6ZdL2j02TFy0r1eelSyLWWSGnnMorlzAeJxR5OV6
	I/U+vDa7XqjRDZd6JRi+Oi01CECKJPHlrs0dbjrqpArpWGqeANmsxqoh2wlbDH+Z28UZ4EvvYrg
	y0IprtCTsbM3Nd2BMPFA92baS9FQIM26pbEhAoHg34fBzxF6D4YfjfyFUufW/JH3+1qFi67iD4I
	fe
X-Gm-Gg: AYBFou05nMzxRVbY9OZvmXOYzGO6XBPLt9vTesBa/U8p/cWdTx80RnaqAeg8nY1Zhgj
	yz4xWu/LJ4HFNlRTNx6aKnsvAtxWWelD88cMMv5DSdzMiORDeNJ3tos/SBf/7yG0YvFUqVAQ723
	WgbznqUJz7qaWjC7PpnoWoLS46MpJXDyiNsK20dW5p//nOG1kz3nsa4jmWfU3aal5ow+CpdMWbU
	YnYb2RkXNrvkn9YIOYTYTaPSWratxSV3BKhPiaepn50e/86xCzxqLT5YZ7lXZPFPcrI+VLAvbqn
	uFwyERdsyaiayrVqs2aFvP91DZKj4dA0b1I1I/eZkA1jVchYizWhNLIx14wbNMdE2hdPtXdH1GW
	dttRUpfDpGgNJGQ62bNLluHGvUNEm/+NDvGB6j0H/stOSnPsD3T3Lnq+JxSod4o2Zjze+7b/gTQ
	==
X-Received: by 2002:a05:600c:310b:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-49fe66f4c72mr283832975e9.19.1790688122623;
        Tue, 29 Sep 2026 06:22:02 -0700 (PDT)
X-Received: by 2002:a05:600c:310b:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-49fe66f4c72mr283832245e9.19.1790688122023;
        Tue, 29 Sep 2026 06:22:02 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm93471735e9.0.2026.09.29.06.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:22:01 -0700 (PDT)
Message-ID: <a3275288-1eae-463e-ba9f-dbb2d715d1b4@redhat.com>
Date: Tue, 29 Sep 2026 15:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: axienet: bound TX completion cleanup by the
 NAPI budget
To: Sagi Maimon <maimon.sagi@gmail.com>, netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, michal.simek@amd.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 robert.hancock@calian.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260924135052.185129-1-maimon.sagi@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260924135052.185129-1-maimon.sagi@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VkbEKxvZIaLd0NVXARxqurIxvb5Edm9SKrYwLElNHfY_1790688143
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_142229_044710_177C1F60 
X-CRM114-Status: GOOD (  16.23  )
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

On 9/24/26 15:50, Sagi Maimon wrote:
> axienet_tx_poll() passes lp->tx_bd_num to axienet_free_tx_chain() as
> @nr_bds, and @budget is only forwarded to napi_consume_skb() as its
> bulk-free hint.  Nothing limits the cleanup loop to the NAPI budget, so
> the number of packets returned is bounded by the TX ring size rather
> than by the budget, and the poll can report more work than it was
> given:
> 
>    eth0: NAPI poll function axienet_tx_poll+0x0/0x180 [xilinx_emac]
>          returned 96, exceeding its budget of 64.
> 
> Returning more than the budget breaks the NAPI contract.  It also makes
> the "packets < budget" test in axienet_tx_poll() false, so
> napi_complete_done() is skipped and TX completion interrupts are not
> re-enabled on that pass.  NAPI reschedules the poll, so this recovers,
> but the accounting is wrong either way.
> 
> In steady state fewer descriptors complete per poll than the budget
> allows, which is why this is rarely observed.  Triggering it needs more
> than @budget completions outstanding at once - for example when TX
> completion interrupts have not been taken for a while and a full ring is
> reclaimed in one go.
> 
> Stop the loop once the budget is spent.  

Napi can process as much TX descriptor as available, even above `budget`
see:

https://elixir.bootlin.com/linux/v7.2.8/source/Documentation/networking/napi.rst#L68

The solution would be capping axienet_tx_poll() return value to `budget`.

/P


