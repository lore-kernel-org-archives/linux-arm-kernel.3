Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB4ECD8CAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OesEzAfal6z36LgdXCq9SyfPK1un/F0y/2bpb/9BmA=; b=CkgJvrN/SqAodjgFII/gY5KN0B
	tfux70MCHT0mxS7SOnuNqGypwFO0Uj3l4+2Fka2Gu9jtJO+vKQIw8egxlFUA6MOwzxw1r17pcbeoG
	rfKbsBXlG3cypbcq/849hDJjJM+V5qVF2fENPBWRdeTZyu+BZKeR9gOgAllHXzQitGkkEHklvmp4o
	tHeb5PWJ+dXJ5g1BBphndb4/Z+Cde7pXoc5PMw7uBdFe8VMPKhTcMY4A/xWQ4rfkqbM08gvUo5T6e
	Sx4j2pN6NJt7oZwCkxhUQEu9IDR7eod20pWOGP7K0nQR+UFlsfxHFU7JFrtPElXEF7GkgWktG25xs
	fWu0VjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsA9-000000056c3-1Pag;
	Tue, 09 Jun 2026 08:50:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsA8-000000056bx-2ifV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 08:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/OesEzAfal6z36LgdXCq9SyfPK1un/F0y/2bpb/9BmA=; b=f5RqwBLdZRBwmX0lW24V6Cm+7S
	zbmMuW3CnMwdHiHPH426l7z7NnMGZrXgCzoVYY9I8utrwa4jy/WsZ0BEtQujFBrWS7f0bS1yIfXIN
	WjuV7d6yQ6V0JZL4Kc73+zDnVn33fCt0UXU4bpvDNp5GfmsDc62bJvNwut99xgf8JHcyW/WrnJY7j
	EvCsHfy9NytqlQjkykacoCHKNoSwgHb351cwWIWpaKGpw/rnnfnxFc3F+PY2PKQ6Wm/V5jEgMAab6
	7gMN/WR+2791wn6Q872tPJZCnV7BTjOReOcs78YnFkm/9RrDpxq0GiM9iCLfkAeymgy+3PQRwEOrH
	IrV9TE0Q==;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsA5-00000002CSZ-2bEG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:50:19 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68c201ec1cfso721810a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 01:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995016; x=1781599816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OesEzAfal6z36LgdXCq9SyfPK1un/F0y/2bpb/9BmA=;
        b=KZzH7Vmswxx744LSNgled+3GHq/vakufanLthezNRcs0WFe/AdsNO0ahjRye7KHjVW
         65VTC/c3AORpBbNFB9VxROn5z3ZX2dS2gEiDnFERD1m4HVjsTSnydxDVc7lMpwPRKCfV
         6EBMUrwtIU6ob/8eyvKZyNw5BHBtqqDFkUgPpuH6/XlMBIcNctSU+kiZsXVHDeKUxLN3
         jEEFbRQmrZbdVnxc4/TwnIaY2OYWbfSIQYTAG2JaCPi2KgP4zsYL1mGva5Z8UbzsReYM
         j59d/YNvFEwkBJqcNGTbssfbBiSwBhNqrVBM943I5+9y6+hOEqlQAxZTZtRPTHiHkPsq
         YfjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8WOb80jERlpu7tJsw3wHeXBae8bzyptLejY/ll+vC6KVFGSTjyZJJu94GkXYMJlKQ4syY0YBQwNIn5neh7vrR@lists.infradead.org
X-Gm-Message-State: AOJu0YyS/1Wy9I32kv1dvav2Ekt6qtIlMAa9QUW3Ekl91lcbeRL2ZUV+
	wTderPL8OWap52ATbn77wz/omEWC2Oi2GYtBCKf61w3gW5OpZjdhUhaN
X-Gm-Gg: Acq92OGlzlMadQ+A7DSODlZkCkPijC5z7DaKUXvbvmT+TBEScXmz/C21Iq9gJ+fe1xs
	iDgao7pogRFn1k/qiATjSvMp8gXk+XVvAJubazjN/bJauZv772na/31e6QZwvUGZO3Uj8/WkaNz
	osze8GaV4qFBMCzN+bM38ZKBe3QPh9ujyBzsHI7STqCR4Ao3faMESCB+YkRvWN1YCv0QI7CTJGd
	NNqu62KvGWUm16to8bVwRl7SSwStPckx9s5d/QeNmMvRpYFGUS1GFsDJBQhJP4BuenaIlfw8I+w
	DVWp/IVBk+KCuKSASeIUZZsdElr0XMzSlXzBsEIvn65i2sjB6DxCOVxFfgjWDj1fWBrceiE7zqs
	kxFSD63vEc+rTs+VKSXsP/UEiF+1z5WjBm0MbBYb6tNCcTYCPz+Lbs+nzVU+FCWg35JueKsuumJ
	N1YBwRhurm6cPljTSfnK3tUECSJC29WiLo6fIYMwM48lSnUdQLbPz+A/+sl5AOylbPU++Xag0Fg
	Ycc3hBX+gqlGcBSVAoa18uLkWV9ITPKD6sPTLe0OPXNUmyEb4KFwlBQOkGQUT6P
X-Received: by 2002:a05:6402:3809:b0:68c:76fb:7e8f with SMTP id 4fb4d7f45d1cf-68fa46b5608mr3785815a12.0.1780995015438;
        Tue, 09 Jun 2026 01:50:15 -0700 (PDT)
Received: from [10.147.180.168] ([192.176.1.78])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851d7bsm8185098a12.14.2026.06.09.01.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:50:15 -0700 (PDT)
Message-ID: <b5eecbd3-40fa-4348-8ec6-9f960dd969b9@kzalloc.com>
Date: Tue, 9 Jun 2026 10:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] Enabling CoreSight TRBE in firmware on CIX Orion O6
To: Yunseong Kim <yunseong.kim@est.tech>, Peter Chen
 <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>,
 Guomin Chen <Guomin.Chen@cixtech.com>, Hans Zhang <hans.zhang@cixtech.com>,
 Gary Yang <gary.yang@cixtech.com>, Joakim Zhang <joakim.zhang@cixtech.com>,
 Jerry Zhu <jerry.zhu@cixtech.com>
Cc: CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yunseong Kim <yunseong.kim@ericsson.com>
References: <5d1bdf6d-ed77-4de9-b788-cf04a98d054d@est.tech>
From: Yunseong Kim <ysk@kzalloc.com>
Content-Language: en-US
In-Reply-To: <5d1bdf6d-ed77-4de9-b788-cf04a98d054d@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_095017_930009_0E94BB75 
X-CRM114-Status: UNSURE (   5.54  )
X-CRM114-Notice: Please train this message.
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

I wrote the wrong output:

>      $ perf record -e cs_etm// -- ls
>      intel_pt: aux mmap: Cannot allocate memory

Current output:

     $ perf record -e cs_etm// -- ls
     cs_etm: Not found on CPU 0. Check hardware and firmware support and that all Coresight drivers are loaded 


