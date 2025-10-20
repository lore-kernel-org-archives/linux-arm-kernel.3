Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98476CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDlZJRYdimnRIVHlNMRHwg+YJzd0pv9ZGTDqzHt2hqg=; b=ZZZlHsoa4RejWYAXsxDCo5REqX
	30yh3EkiuF6xqicbi8TkbjIeRMwy9k98HDhA9XPaVRHTxyiUlQeZOQ156Q2FYnzHnxnC6AY33gwmq
	eGM9aTEpxVO8O4bq32tF0CgRpnb5StbrgtvNkTohquMMHLpbLnig28rO49hO5VtheiYOaJRYjI5Ne
	jACHADgzuVoCn/nyTImmritXjG/A0u40Jg/tDGYpBz0UAMMx83a8nwmNjSfCbo0afvERsNC3gd4NV
	ownx5DTpyIIIaxYhlwMyeXNv44c7Ky4AaznhYKkiwgzNv8tWLkGzoCpIc5qmvF8MzVexnIaylUzDv
	Me45NbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvL4-0000000Ekbe-3Vma;
	Mon, 20 Oct 2025 19:14:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvL3-0000000Ekaz-3egd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 19:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SDlZJRYdimnRIVHlNMRHwg+YJzd0pv9ZGTDqzHt2hqg=; b=Cax6ihyV5/VBVHUBEpKD9gMQVf
	ASFIa3Mheq/FPub2/Afla48tllHpJpqw8pAayyxZ9ZUaG+qA603lU9pVCpMouNa6wcFa7AywYvUYH
	JTVn3ii8D4bQzkY66YlEdxLVwNgAxRhgwEP3dJBoQtSMGuRbxizlteZVmriPYNeMs/PwdGGb31jaZ
	ZtXqXr/9t2uqwzIHOQQS+KEyJeQ43qXC+5OrTYXaP5BzzdAcGpoSrsSS7ZZlplN+qjPlx4K56qi0Q
	F4FTEwk6lO98di8REakogr1bRihSG/OVUaqtJ4fwP/A24EiyTj4a+vWrunw1ESxcb3TXgjI5RxMG8
	TA2CV+yQ==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuTK-000000008ji-0YEz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 18:19:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e542196c7so37598585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987672; x=1761592472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDlZJRYdimnRIVHlNMRHwg+YJzd0pv9ZGTDqzHt2hqg=;
        b=ZRJj0nMyzhMo1Dp0l8B/JcwIXdNrQ54iXpJakfJX/VAxvah6SCbik1iAPQ0sP/bBLf
         +tL69Y2uTnucdmp0IXPEPQ4HU8H5f3pcE9n9XoxOz1CoQEZwqFElYRdlMh4JskeFHSU7
         bUp3ftnyJvUJMe0H0xQkAHDYVnqeg89berh4vdr9dex5KRCtyAFtk3B8oOBtYCNv8vid
         8QvhB0Cp+Rkr15hfHkmL/LlXMRzbontr9xEme71FU/bKD0EEbF7XTjoRTtMgt23Ijjob
         i2dlHwPE7ExO8QXZHyuDf1+ceS+cO9nDvELcjTTVPrn2u/3d9ZQq5yImywCUM+Y+w+L3
         fXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987672; x=1761592472;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDlZJRYdimnRIVHlNMRHwg+YJzd0pv9ZGTDqzHt2hqg=;
        b=BgIH9thypm+JYoLBaBhI/CkbRzhuqPvcZVRlbWUBTP5zmNBr62L1ZYnOKWtiph4fW6
         wAyVsLtT/Vo5j1/94FIsxr9oxI5mhZxK3BPmBHcI/eEBuFyQBVOXMZRZtrZGhV0usyBE
         eXd3uIF5RZHjeF5WxjYEYF6oVh30bCE9K9Ol5gYPCfblU8TjkH3p1gTpLfWuTuk4yRcT
         XUuiJWVJLc8KFD8d692LAfxDMpFSgUXmnNupZRk2MnJyZmsnHuF0fJizcdExZpagE8CY
         FfM53QJKnQz84OchGPuEiXxBLF7fy5bUKoIKKoB9Jd1caNUjHi2ueJ8VlKhdUpzHJLm5
         4J7A==
X-Forwarded-Encrypted: i=1; AJvYcCUj3wVWX7gfUePYhZXmN4ZeuLlE2npQzSYUs3frkaGHJyjmOmuUI1yO6hTCMZ585khBO6BkkqB+c7oHlV3yT5Vy@lists.infradead.org
X-Gm-Message-State: AOJu0YzYb/FTDpqTf4qW10OTU2yyKfvGNSlNuWX/fIPulILk2y8TkaKp
	kYul+JPAvopVci8S7n8604thQN4C5TS9fmFSuJw/lykZxLCDcIgim5DK4FRvjOJJQcs=
X-Gm-Gg: ASbGnct1Dz+XrfZvBpQdhfe/rKG6x3sKqNQKCm0sb7HPZAMcOAXgrP+25rKlHCL4FX2
	R8t9x2umZMKINeiEhSOGT1SEAhDJs++mI5bEnpUnjwqR9IFLvG/hJeaXPtUKxmjqlbk2xNXq1pu
	KnVGzH76TOS3VK0UHvaTyAaXDhPTx8DNDQa9v3JN4q1snSXQ1rJ9riApD0E/hyY7ZeJkhrT+qCY
	8No7gGeHaNybDgGWsTwniN0ExF+/Jqc/Da4d3o09FtgCcUthagzaxK8CgNUUTVF7ytDNg47Ed4c
	UGqZZrSMKr1f0AsuYsorwAhCU3unftIzBxY+VK+qNKtx7Q0v+oSAHEGOjU9XLseYpcamAiGhLto
	PX/wlhBseyqezof6t5Mb82oNMltLuT+/hjPuVSdZEZIrfPKPrl80kdBgQ9rbSVhb3fDANLDrAGp
	LuZfGUJlkI
X-Google-Smtp-Source: AGHT+IGmMD0YHvu73+iykCZumpj3yIaAy8xwP+HHCSMQ83VbmXhKKiVZhRtq1rwRrVeYCqqd8gymvA==
X-Received: by 2002:a05:600c:4e49:b0:46e:1a60:c995 with SMTP id 5b1f17b1804b1-4711721a463mr111865765e9.2.1760987672296;
        Mon, 20 Oct 2025 12:14:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c82c9sm243199115e9.14.2025.10.20.12.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:14:31 -0700 (PDT)
Message-ID: <7f478e52-eb82-4cac-a11c-e0e4977b3d33@tuxon.dev>
Date: Mon, 20 Oct 2025 22:14:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/31] clk: at91: clk-smd: add support for
 clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <4e3f834e6901f7fcad0e697b56c85573c8e7ae52.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <4e3f834e6901f7fcad0e697b56c85573c8e7ae52.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_191906_300972_C917CB85 
X-CRM114-Status: GOOD (  10.22  )
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

Hi, Ryan,

On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in smd clock drivers.

s/parent_hw/parent_data

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-smd were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>

