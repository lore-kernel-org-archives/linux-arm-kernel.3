Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26DED5E376
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 16:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiyXTt78v6KIZQ1Ji+ZoKsI5Ur+Se/pukGeJe0h1QHs=; b=f9JKOALwNSkAArGlyexE1wIQzC
	Yd6iLmiHi/OHR8rQCB33fr+H2nsjlyJz9I69hLtkX9MxsQ45Yn3ZqEwmMKMc9iCBsfcIx3N+4yLum
	t+JLc068Ah8G6BQVpchg9iPG+mGk4+0AtDM9xE+let/dtEYcwOJTIBezGMkaH0RPSzPEXYmlUVCLt
	nO8h6CwtV485TlzZjrdhgD8Dxx9H8yhqjttDNzAw+krA4gUrL2jFgwKKlmc7wZvxm0w5abQDUuQDH
	Wy0ULMTfiJwkhFWD4JiEzW3zrO+irATIOaccdCfkM6h5tVbiSFmjksrRLeNPPJpDAJ5yu1N4SM2pF
	noYKJVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9oTK-0000000DefL-0ZnG;
	Sat, 09 Nov 2024 16:38:02 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9oRY-0000000DeTQ-3Zku
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 16:36:14 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7b15467f383so235530185a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 08:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1731170170; x=1731774970; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiyXTt78v6KIZQ1Ji+ZoKsI5Ur+Se/pukGeJe0h1QHs=;
        b=ItjD9O3rKIypZ6wqjatg2q4hLadpqzl3Y0LHjzqGPTykl0grnWgRpYfSZK45FYH5mA
         /1zMWeyzOLHNiJhumdDlX4/1lK+Fe7zbuwDnwlaz/tWDJKai+B5GLCLjxmUWLwKoffiP
         iCARzva2wtR9BXO1fVaDJ4fpbs4HP49O+rFto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731170170; x=1731774970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LiyXTt78v6KIZQ1Ji+ZoKsI5Ur+Se/pukGeJe0h1QHs=;
        b=C9XHCeR4PpnnNGjTESrLh8Ge7BiM6zGGOc5W3Dd7ascWUdeuWLgJastIcoHx1bi+DF
         Qc1ZSaeBGvikR7zgi0dkt2CquXoN6ZFNv+bVkV3kuVP3ZjNLdnYPF6QeOqAWHCMlGlKZ
         BL7wamTitH3TJREm4K674EAKAsidcRjR6JmVpwOpNHjRs/u846RavqPKBMCEK+oPtZ5O
         iEfk2jDQMX8Ye5ciS+w/JdYiJrrOmci8XXcpcChMkLo/WUYJ/Yh0NZBx+qrxedj2szbF
         Iz/yR39OdmMswweTZvnQZIN+4uTTwFYQISk19OLQEDxX2Bf+utTPhbE6/tB8NWHQtHSW
         mFcA==
X-Gm-Message-State: AOJu0Yyl6MshSk7XARFh8a/rhcIElPVfTVxvU2xH2P4/0M288qn3wZbW
	UP0CxWbqmxHlB6wWa43Ar7n6Chnt1M7nAW5R2/lGzze+s4jAN3qbpGzGpIuy5A==
X-Google-Smtp-Source: AGHT+IHR7LHF6bAJTfqfdMdT6vSoZ1qZIMt2KdNyCPNQiI/13HtKv9OHU9ir/QulbNCGPSOqD5aPSg==
X-Received: by 2002:a05:620a:24d3:b0:7b1:547d:9ba8 with SMTP id af79cd13be357-7b331d8c12fmr867466785a.21.1731170170256;
        Sat, 09 Nov 2024 08:36:10 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac63da6sm272249685a.58.2024.11.09.08.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 08:36:08 -0800 (PST)
Message-ID: <f89f2fee-35d9-4292-b2eb-b4bceda78030@broadcom.com>
Date: Sat, 9 Nov 2024 08:36:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mmc: pwrseq_simple: Handle !RESET_CONTROLLER properly
To: Stefan Wahren <wahrenst@gmx.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, Marco Felsch
 <m.felsch@pengutronix.de>,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241108130647.8281-1-wahrenst@gmx.net>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
In-Reply-To: <20241108130647.8281-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_083613_013227_6BE4B1B5 
X-CRM114-Status: UNSURE (   8.78  )
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



On 11/8/2024 5:06 AM, Stefan Wahren wrote:
> The recent introduction of reset control in pwrseq_simple introduced
> a regression for platforms without RESET_CONTROLLER support, because
> devm_reset_control_get_optional_shared() would return NULL and make all
> resets no-ops. Instead of enforcing this dependency, rely on this behavior
> to determine reset support. As a benefit we can get the rid of the
> use_reset flag.
> 
> Fixes: 73bf4b7381f7 ("mmc: pwrseq_simple: add support for one reset control")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


