Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD9D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dY324c3s;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XPn6YHW9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g6ZvoJA1lnqkwFVkrQz/iNNGer9RaAvDbUj4LHUnhUI=; b=dY324c3sRiaidY
	ajZC8Noq+bPhmFe2Iyhnpu27gfYsL2/UDYMxnphr2HWw2C4nBy0ZPnfaO/D6WrL22AIbqQzFfdq5b
	Dg+AKEBtDsUBoNqUwT5xf3Mvn0Egf0z0JNGeq+xwd8AX14ToyyGk2kxsRJpqZb2/JHOP8iDYhZDmf
	c7bw2zSzAtm7cyiNF0oVS2Mz9jzxde80tuUH074Ye8abl/7NS5K5ufMNU8857qKyYQNdKl/31cxHj
	bKOdQZ9hjPjknA1K90TPr8ZumU4Z28vY7BNiYy7UNdVP9UHOeGh/wEIP/J8yiw6zth2hf4dOyOEJd
	vQmWrjni4bpz7pzvWJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN9C-00000008wCn-1DCx;
	Thu, 29 Oct 2026 10:14:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN98-00000008wCS-3FbL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793268847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6ZvoJA1lnqkwFVkrQz/iNNGer9RaAvDbUj4LHUnhUI=;
	b=XPn6YHW9DhQDS2o01aDR7o0dCOnq6CquwPB4VX55o1hUbxdWsfheCQhMdnVytLhkeNBxIk
	qxRTdx0ETjekO7E/HdDs++jhLVLjz8XT7ZMHX3qZt3uC28+tjlBU03IFenZ2OHNlxssXhQ
	yTfS7NJGpImf7kTMHt/t+5gDhnQpfCo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-KrjhFq83PcegyVqa1FnZbA-1; Thu, 29 Oct 2026 06:14:05 -0400
X-MC-Unique: KrjhFq83PcegyVqa1FnZbA-1
X-Mimecast-MFC-AGG-ID: KrjhFq83PcegyVqa1FnZbA_1793268844
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4870142f030so1095519f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268844; x=1793873644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6ZvoJA1lnqkwFVkrQz/iNNGer9RaAvDbUj4LHUnhUI=;
        b=iuMsff+kMc6Dmoipf2326SNEtPbUwqhi7GjPwnBL2FpV19m+6WJnDx8OnmvRbXF1/u
         VaGSXGw2bCeyyX93Xdhff0tuxJgLIrpMTvWwxVYMMgFkbUd7YolJsGdH9dpD7VbTx56b
         Qt6UDtWfeVfL8I3tm0Q4LgAS3TZKN+jKMgrFR3vvDFSFAUNIIU394fiVteSpovxose2E
         oJea33Ue9DYf1mjw+pQ6iDPZfi+LmAnXjyav4i49XixQ8xd+SxfFwmfAVQh77qADbLQq
         T5VQdSsuPP+BZrs5FA9jciwxUf0LgcH4z0jqH5ekonX/3LWQx9vpjUG7FhXHVYgN0uCn
         PUFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6GNR2f2Th77cWDlwuEL1H66TOr9diVL1eHhFxRzP6WXfHpa8Nr6kLsHZgnt61MiSR/8DAoypKlFK/0E1y2CNs@lists.infradead.org
X-Gm-Message-State: AFq9FYJ07biZG7ourOcwfJ4aDSjvM8mP/gVmOAcSO8vDSwvYWF0PaLJt
	FZ8ARGF9fxT+S67iEU0+PbJ5yr8BaA3zg7JPNPlceeGzsgy2AV8Z4TiVf3/4NVHIe9kyVKbqcRE
	OBzhgzhW3Wp7yz7+kFu2+LfH8H/5fNTBln/IxamomrQsE0tr52YvbUFDJD06GKifOII5iMAIEWi
	ZV
X-Gm-Gg: AYBFou3bSrv6j9wsPvNNnHUCah83hjmWoWZz3VF8FXRSFKMwqh9Gln7TYgndu7Ar7Th
	ICkEfOpaVaFNEJ/IIKvki6HAI7zPNogukUvn2W32Ys645esMJyGUWTHONmQWkbbny5FkyhQWU6W
	z1uhdhTZCbVmYPY1z6vuzZPwOpbbNeBb2Ddd+C0u+G7H8+cK/SYaOfuDbK6VJMb2TIqD6AFanRd
	hbgrmt9FjNrcOG+vE/raqzQelrdvNJcWC+XGA5e3ihcEdMZ6hWaK2CgLRYe9Mk4FjSrxaEV+fjy
	5NosGvNxkHwVdV8NbyDlLxtZ8vszEPBtJ+4WiR+e9BUwwIC0zHOKqcwSYNYb6l5lFYTOumsziLu
	+2ZH2VLqlPY+stwfXGcxefmLuKAZUy22pdv2aS6VcjPgroCu825eBTvjpuni/Tz+E+fdL8S831d
	zFz8wIUVzyrQV5/F4eDBGWuBtkft34GjIZl1V7ddLNTLN/vJ0=
X-Received: by 2002:a05:600c:870f:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4a967f84822mr125620465e9.30.1793268844531;
        Thu, 29 Oct 2026 03:14:04 -0700 (PDT)
X-Received: by 2002:a05:600c:870f:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4a967f84822mr125619965e9.30.1793268844145;
        Thu, 29 Oct 2026 03:14:04 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm33496102f8f.53.2026.10.29.03.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:14:03 -0700 (PDT)
Message-ID: <bdc71cf3-5b16-4dbf-ac33-8f35b1a97d9f@redhat.com>
Date: Thu, 29 Oct 2026 11:14:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/2] net: stmmac: Stop Tx queue when
 (en|dis)abling XSK pools
To: netdev-bot+sashiko@kernel.org, kurt@linutronix.de
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, kuba@kernel.org, edumazet@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, yoong.siang.song@intel.com, faizal.abdul.rahim@intel.com,
 boon.leong.ong@intel.com, bigeasy@linutronix.de,
 maciej.fijalkowski@intel.com, nb@tipi-net.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20261022-stmmac_xsk_crashes-v4-2-15c0c750bb96@linutronix.de>
 <179299947058.3134.16617492920924670801@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179299947058.3134.16617492920924670801@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SisM6tPtF_nZZ9vlPinJ6Xg6cT_7zNA7SWcRcfBQkD4_1793268844
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_031410_914622_E104A3BF 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

On 10/26/26 08:24, netdev-bot+sashiko@kernel.org wrote:
> - [High] stmmac_xdp_enable_pool() (stmmac_xdp.c:59) and
>    stmmac_xdp_disable_pool() (stmmac_xdp.c:102) now call…
> - [Medium] The patch only works if __QUEUE_STATE_DRV_XOFF stays set from
>    stmmac_xdp_stop_tx_queue() until the ring is rebuilt.
> - [Medium] In stmmac_xdp_xmit_xdpf(), first_entry and entry are read from
>    tx_q->cur_tx when the locals are declared (stmmac_main.c:5263-5264).
I understand that the comments raised on patch 1/2 are sort of pre-existing,
as the reported races can be reached by __stmmac_release(), but the above
ones look legit and unaddressed/unanswered.

You can target `net` with the next revision, and please reply also to
already discussed comments, even with just a pointer to the previous
discussion.

/P


