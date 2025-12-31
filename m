Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9DEEEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 19:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sASNS75d8oeieC7LwzssKWA6/tt1IEz1D0H+agWml8=; b=dcaBqgLhF73QTvupfMJzQpZoO/
	vl9L14idvIzSerVNAyxQu4EuSz2wFeS6pahjb/3unii4WvSeLOws1fvyIrHnFqBLdnr7Kdl4VaX3q
	aTPnExjOb847W7REDBOcKtBh5xCN/pdHt+5gfUBlZs+I9IzcYVoedqibcX17u6uBaQ53eS0SKw4AK
	rcRPmT+fjAy/oyZgKyGSVLr/fY5hmUlZvgiuAfbu5Mo4OyE42HQ+adVdHmDrKHVw3FnDQq3DqJP1r
	mZaFj8ELsYGHjfs3aVDTJfkXnNOL+G2vDEpG35YR32jtSX0Z8nxW3QAQ8a7fwpfyNQ/qrG870/z8r
	Idp4JXnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb2H7-00000006HrE-3ytv;
	Wed, 31 Dec 2025 19:54:29 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb2H6-00000006Hqu-1OZj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 19:54:29 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7c6da42fbd4so6015089a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 11:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767210866; x=1767815666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5sASNS75d8oeieC7LwzssKWA6/tt1IEz1D0H+agWml8=;
        b=QJKdrx3g8txbzEpgZVmTNeRzYj/roa5rRJ8nmcVVgwJg/Xie/D4jMOTMbEirYG9NZ0
         U0OXWhaJVl6lqGngjNfxKGzE89yx8+KD31kzIAEw3CSdaxik9v1HH1bCE+kR4xHqvPDs
         ntShyYzEquIs8v6mx6lWOhIOU+B44pp2COqC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767210866; x=1767815666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sASNS75d8oeieC7LwzssKWA6/tt1IEz1D0H+agWml8=;
        b=qsY5QWVlxx8G7wUC/rF7qOKVxoA3qJl6cpYEFYumxreJ6b/OSPd17Ep62J8RwQX74q
         cV7RW3nvqdaXIooZ5v5ekOsc6UVjjkKpSURyNsMgmKGQmalRWODkqjZFJlssn3dgiURw
         STOAnZ1TZiZr+FTksuI4KXuBdNAxfl7WBP2ASBaMli4Oakb/H0ZPSH1rBHe2dpV07RKZ
         zBc1dMzMKfJg+LeypMSa/A6r2K+gLKN2Z0dQwbc8H5r4VF4L/IR+g/xiEqBKX+cvMstS
         GRKQUGg/noKrTltfeVUB8E0xiYFyonIGTzdODxpyNCyPSYRYHRWbqD//JzghyMSJ2VUg
         n6jg==
X-Gm-Message-State: AOJu0YyyaE7NslCdnQoUISkDzww4HUMnrc94Vy568tJY6IJjoBjVr8pk
	FtUTelDfdl6Kp5re8VVflFqLd4lbMRT63hdfmOfp4YlRVQ1BdGjTLKAYHErDh3YkOBI=
X-Gm-Gg: AY/fxX5S58cSemNb4K2rizWy6PCa1PULXiJXIKedPtJdm1lCXLhlogsvSeHO3NMI4JM
	N5d8hs+ruHxMxhRDrzQmIrIA/PCBRMViHtuZoIlFf5bCNhvBLEzoR32qrWZ+62LkDut4g9qdhCt
	nqGZQKkFGXnYGebXpfk89H/MjlquGia9kvNzsOTvIStyPAvdyWFolNU+vdHoK9DPBpaQoV3g7Ie
	fRH+viVfx3aFR+OfwlH/kMRa5MDyhOetWHXl2tslhfR8dG5MCX8VlYhsrcmqlfsnlCwqECL5NcT
	rEnzajnPfRp1l2wbyIi2xQvZ4xRBzz5kPbnRqMqpS19oNdTXJuFM64SD/i1gSPt1XVclmND20o/
	zaBiNKnmh8NP9JO7C5YeIpZH86485hpwyT7Ll2q3hHLxoEEOD11XGve7aPAzE4Bt4TkJC9B2Ycx
	X0LlZnlPAxTQ/H4rqjIeWj14U=
X-Google-Smtp-Source: AGHT+IE+MRCg7tt58ATHUniAPuuohDW64UNfPn61oT0N5rB88TRX79/V7dYpMCr3KNHiiFLrpdNG/A==
X-Received: by 2002:a05:6820:f015:b0:65b:579c:8474 with SMTP id 006d021491bc7-65d0eb4caa8mr16488297eaf.80.1767210866211;
        Wed, 31 Dec 2025 11:54:26 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f3f9d15sm23496900eaf.4.2025.12.31.11.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 11:54:25 -0800 (PST)
Message-ID: <025a3cd1-ac6f-459c-8bc7-79b336f10dee@linuxfoundation.org>
Date: Wed, 31 Dec 2025 12:54:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest/arm64: Support FORCE_TARGETS
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20251219-kselftest-arm64-force-targets-v1-1-cf72d6d27e99@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251219-kselftest-arm64-force-targets-v1-1-cf72d6d27e99@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_115428_408300_4728F9AE 
X-CRM114-Status: UNSURE (   9.68  )
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

On 12/19/25 08:29, Mark Brown wrote:
> The top level kselftest Makefile supports an option FORCE_TARGETS which
> causes any failures during the build to be propagated to the exit status
> of the top level make, useful during build testing. Currently the recursion
> done by the arm64 selftests ignores this option, meaning arm64 failures are
> not reported via this mechanism. Add the logic to implement FORCE_TARGETS
> so that it works for arm64.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

