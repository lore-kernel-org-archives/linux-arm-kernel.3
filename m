Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD62606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 03:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eETQzO7G;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+sQzHvq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=; b=eETQzO7Gc0WvHZ
	/Fh/upvcvXPONeBTfyiIxo+O/W9RXXrmRvieqdawP1tdWuAo1NXFHNyHD0XjxUrMcAm5Q3/uolYeL
	BkSWBRDhSs6fFi9uBxZHjQ+ATe7wrtCx+Pt/e14+p2qIcB4zo8GLQM0F6cl9MYp6zbxyXQr7PsUNX
	E+UKsigmoyD0gzRfeboOva/mJRsceAt9sZx1IG/IdD4OS83xWB00ZTYVn9KxXcanPwONhthU5zigR
	dNAbcKwW6SClkQSNhA5lwW5uQrTnXUlckdo//v+pxEahu7o+IXjIfP9fQ3y5PwlZwg3G35Q1XrmHR
	a4ZEL1L0/zQE82s2i3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNixC-0000000FSn3-3RqG;
	Mon, 02 Nov 2026 03:43:26 +0000
Received: from mail-oa2-x0b.google.com ([2607:f8b0:4864:30::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNixA-0000000FSmJ-20qY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 03:43:25 +0000
Received: by mail-oa2-x0b.google.com with SMTP id 586e51a60fabf-462dec1c4c5so1050519fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 19:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591003; x=1794195803; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=;
        b=Y+sQzHvqvW/Uk54R/xLxFfyYlqmCC9cTY+YI/dAOREEavhhBoBazY7Y+eFnkMWMLsQ
         FCCvUJDqsKrCdnjKBD/LElPXdCKZgQjbF1T8EplGaiyO4/eBEozr289k1g5tZmAX4fvh
         PMzSlFMcnNDomUOqiFfUuo8URBmBFIvJ8kdC9kOKlskNFTOGYQOOAKrWpGDt6eIPKgxz
         VVM+XQHAyVOGhtZBnq61wb3/rUl20b7FuVnCvLdJtxSZJgxLSEBrercxjaPbANm/sCEy
         tcNwqzKNeUYKuC17qBLEMoN8FlzHWGy7yHDN8CWa0Ipv2qH55WbZ5wZgrSQhuK1E7KO1
         SYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591003; x=1794195803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=;
        b=25Fl/A4+I4HUfdpsqCsFU0jbKaVL/dMHG5jbi68PH6r4SmFLySnfX/W+ELn39FNKYa
         TMbk2TnMpwdEw4oHqnXNoy7Q8Q/VCHpwHLisecHcANbhVjZejFuvAjXJFU9guoejdh1B
         s8haIznzh8jE1gRducK6ypPmYtfHns4aKe4S7n44LHMzWK3iyxg/OpeHDcc636d5EV7F
         fAAo5CWivJ6+JRwvQM2jRzf3mKUk7eZcSQk7x0D0CPNFY4U+VazG+ELV114QrrF9cLuu
         5rrjytMGNP8GkMHzPlhH3GqFConpv2vKJ+rZPUSXH5zw1Fn9uoIkBvRp+6tRDNZvNyXI
         ng9w==
X-Forwarded-Encrypted: i=1; AKwUvBzV5Y7gu+uXQbjwwY0xmqeIprOdyzg840c6Vw/V3we5ByNI6Ur66J5G2UUplch+s8dr20jEcWj6Vo1Q5P7e2KUz@lists.infradead.org
X-Gm-Message-State: AFq9FYL3z/fP70IJIAJdGGRjPyeT93wViifRrhEnMXJ1OW8BkWfiWXZX
	IDItYkPmdAAhqQjC16dfgwUVRt7+2+rSkMiMs/2kFPY1Nw3r2Cdjowpj
X-Gm-Gg: AYBFou3rn2nOSLbpqhy7Pi0zt093leOwB/TFjhTs2Ma1BjOIKxHDJKSpHfwpMAuVJsb
	08dVnWDmOPipR5QdbzOIGY35uEDZrLBSvumtrP3XnJNezSHLJ0qsRyHyIyDivWYgSDgRGEXPYHr
	Jyk/T0O7Oa+Cr8BKEzdlZRLQ7It90FchGGzEU0cRCMNOaKnEVE4E57nxvC866qOkms9qEYUckuY
	VbXScb60FaNKNiyxnMkHUaSgCAEVFtu+h53RuzkPc01V5vCJrOVrlhharPeZ4bZvQrMj2xHXSfu
	t3YRSlSn1ay310i2P6DjfErEOCPkFgMiydWSWmDWR1y0O0SPl8qpUTaZIwaINwCaVUeS26mYG5t
	SiH1b1X1TQ53BwzMmIsiXJ5orLlVpaq3t8C2AlM1I6NNLLb+pOvHO7i+CUyxqgft/zrjadsGZQ6
	s/MahDTOtVVu3cxDvKPQW2moms0ZqL1hXxlZi77MTHGkpSa0UUTeOTT8N2Ay4RBHHdiZ3Ilh1fe
	O9JyuiflbIqz4ksLDjJDRYc4pXK2zG12iJ2FXW8+MXRHG7NT1cgyvfCpvTOFqNxhlaiiXvNDA4r
	gRRm71qSsSAUkpBEQSHf/5O87H8oJbc3c9fV3vBHFTPK
X-Received: by 2002:a05:6820:f008:b0:6b8:ce67:77e9 with SMTP id 006d021491bc7-714f1fd628dmr4883384eaf.12.1793591003181;
        Sun, 01 Nov 2026 19:43:23 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2d16197sm7682911eaf.6.2026.11.01.19.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:43:21 -0800 (PST)
Message-ID: <416aaa7a-aebb-4129-8af9-e2895ac9f78a@gmail.com>
Date: Sun, 1 Nov 2026 21:43:20 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode after
 soft disconnect
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_194324_549020_5528EF4C 
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

Gentle ping on this one, there hasn't been any replies since the resend 
on Sept 29. It fixes system suspend on MT8173 in gadget mode after a 
soft disconnect. I've been running it on an Amazon Fire HD 10 (2017) 
since September.

Thanks,
Ryan

