Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1B606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 03:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EgZZrK1U;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHDgmGCk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=; b=EgZZrK1UaOMR2p
	tzMoprwPzDx3lpX3Lq64+DSZeuk0Htv3dmWbWAIPTKncJhJw3lVbwgqqbh/Bo79UvOSGOpOKZSfdV
	AACw/pnYxBWrq9OYPdCbcsuBPU9GeF79eojT5q2HSbhfVrEAhk1UfrvyibaK7VOA6Uo7qY10nsZLG
	2XxdJX3wyBmKogxpTthmsZfZnoFMXO8//8tM5tLo3Z4h/xrfn5njnfwRJNL+hi3YlZ4uI19qY+ZwY
	FbqNy+TjkftW/srpHOoSI9lSY3+8KLNwI8P+cmLl/WnV1RfcxGpdbAVot4kkMx/PNn8SVRi+uUX5P
	fHlpa5JwnEH06L1/bb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiz6-0000000FSwC-0EUV;
	Mon, 02 Nov 2026 03:45:24 +0000
Received: from mail-oo2-x00.google.com ([2607:f8b0:4864:31::])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiz3-0000000FSvb-0KSC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 03:45:22 +0000
Received: by mail-oo2-x00.google.com with SMTP id 46e09a7af769-84e8a9fae57so1388643a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 19:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591120; x=1794195920; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=;
        b=tHDgmGCkKr5ta3196OlhVskgLgePjSpkbQzKlQTFu2+PULt8XP/GP0tz/toHc+8MK3
         fnuQZ7E9GLZYXnvbdKONURRykE07/eFV075g///aCyccA9a8c/AVH+SqLkodOpFNvrEN
         oG+fL36NOvAqYeky0mwNKdZp795Zi5LBNgDbwqBbnfCFrTz+8v1YuwT62q3kjRq8nUZE
         72ktt9nPaAFjlNRj5OjtY/Xta0GW6avHUIXt1rq6aVJQFI8lf5X93+/o1jcPO3npsMqB
         teY0tV9pXK2J0cEF8ZQKrdtCHSTaG4KQg7yjLxBeTsOBt6H52GQtUt37luDEP1eP/aGq
         H6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591120; x=1794195920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=;
        b=AkECnrF+C9M4h5s1rMueIPNKzMRmLxdbLdCdcSqyLQnquCcm62QCEgCRdoJwfxTgGs
         uXpCx+98JRkrOyF27eVoDcmWEKG2hhr+8MrUCegUDOGVUVrc+wEtAn5ztWI8A6YUTglg
         8SAZM/C4XdhPA0ReEzS/gPKMe20E5zj1n6+nlB3JGjdASAfQrPJk5ZK7hTHEQB8EOsN4
         UtQ3UTkFnqIYiSrHk6/vtRXfpvKPngpDTPOzdp/eVzD83Ccb730BLbERqDlfT2jVOgi2
         nmTMboOijBnImiv0sjKG3IRQ2kxtr+bcPQXSyiZU7opuFBybJLjdJRlVgHpnEKIyu2H/
         LvLA==
X-Forwarded-Encrypted: i=1; AKwUvBw+bqWyoPHNltJqHfkTrAEfMUsscJWSEt1iFvcblnfQzRLgg2yRTL7UUCEdh2XySfYBNs8uVthT78Mhk1EQXTsS@lists.infradead.org
X-Gm-Message-State: AFq9FYJhJ2tA4SwWCNaKZcCLBOD83XPLO3rINqD840xS9pUmSbs3w2Gl
	3rEtWKXjY/+uKNNCsoSBXdx/T0eTTabStfPVdK/a7EDD4/YkrTdHNE2b
X-Gm-Gg: AYBFou3+EMSeZAGA/1ntILbbTd+0XO+Q+xao+El74oecDyqW9dojA+gty9rQdZuKHXk
	AvkbusakqkscYyoIS/b+UhnWw8QrIOKPfJrOg/KAVXUe1FVZ9adprbieAj4hFfnNruLDxpAEruj
	7o2MCID4VIe2yGpO+Il3szXwwklVGS7yLbmeKjSbDn/95Ag+UDtMPP4upZmZS5c2XHqeJDJGx+U
	+jsmO8JpUsByxsRT/r5XC/NHOoOWOLUGcO9DKzlpAmGN5Jg9JDFkNwcOjiFNP4ffLfeoBhFhLfs
	jZ4DUlww7pfjUuWsjkJGS3G7yWwxqPfxXvoi5PaeFqJJRIfUKsH3V0FOqqpG10PQeIQi3SliyXN
	cgvxG1xZqE+4Pz1uerbH+ap/THLwzSG2Liy8HX7HRBjatGOW3QZWt4stiozxsQCfOQ5B9w3mUqR
	E4U1ZquzbJIBHNceS/TZCHOnkUeP1hSW4nQ5tcweWOuD4aAEiRFGgEo7pUTzAkbVo7nPvxp8U2k
	eK/tv5HZeN8sXGyh+WZz2aZnp3T68Bf44OiBVowldVP/qXDQs98RZ+Tm0O8R7edhJtt7/gBO5ol
	5g7iIvcFu8+2KvdFroV0QFvnzZqrLp8Tfb782QjWb+P6
X-Received: by 2002:a05:6830:4116:b0:81a:9522:f007 with SMTP id 46e09a7af769-85d3649508amr6210396a34.5.1793591119902;
        Sun, 01 Nov 2026 19:45:19 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354d2059sm8172551a34.18.2026.11.01.19.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:45:18 -0800 (PST)
Message-ID: <b0c42b21-6b28-49fd-ac07-7af1456de4b9@gmail.com>
Date: Sun, 1 Nov 2026 21:45:16 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_194521_149969_6FA5C7CD 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Greg,

Gentle ping on this one too. Similarly has had no comments since the 
resend on the 29th of September.

It fixes the softirq WARN in the commit message, which any gadget 
function that reaches netif_rx() (u_ether in this case) hits on mtu3.

Thanks,
Ryan Brue

