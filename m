Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1760ED3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 02:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGiT+gTRHW6+vyeX/7XbiXkh9SWazVUy4G0tzPiSMOI=; b=ET2YMnwXINWWoWdDfJhz9zmQtT
	oZ9F6kFldSUVcGTptmWNzwzVmKaxAscX0ar8cYSoI5wKOFO1IynL51HmgjYp4fTtBA32lrraOyIhT
	peS5ryltsGtZoznqooWmizxMJHtlPB1KWjsZzYYZLZ6EN3GED34CZWqQZKK3c0JN2cqn3thhRPgcE
	en6jG33XxH7EtULHqe1ghIcv5UKHO8LG5RBtFyJ9a/VTEoeCFdacj1sPZO9Q8+0aYMVGL00fLE0by
	cWdejuNRXmEmqTQu04vb0NFwWE3zSlHIWWT7B3JnEvf8D9j1fs9hzKO+uLp8/4SeOXVimwMHUCs4Q
	Z6N1iA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDEQ-0000000BYnW-1hed;
	Thu, 15 Jan 2026 02:37:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDEN-0000000BYmo-2mYa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 02:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768444622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oGiT+gTRHW6+vyeX/7XbiXkh9SWazVUy4G0tzPiSMOI=;
	b=FB+ATXe16vKoUmbYHNMvM85fR/XaxoqymV0ja+kb7MTyzEHBuywNpPzs2tnGuC52pKC7CW
	VRFlBDgxomq8Qdlbjs+hpLK/mBpGeSsRRK0M6t7MPGLwWEU4FVG0E6kmC2WRykuHU1j+/2
	7gjAQOFPofTIMISinT8DNDm+D09SLaQ=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-Ol8RfnXgN9KNyY6QQ_Oszg-1; Wed, 14 Jan 2026 21:34:49 -0500
X-MC-Unique: Ol8RfnXgN9KNyY6QQ_Oszg-1
X-Mimecast-MFC-AGG-ID: Ol8RfnXgN9KNyY6QQ_Oszg_1768444488
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-804c73088daso292649b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 18:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768444488; x=1769049288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGiT+gTRHW6+vyeX/7XbiXkh9SWazVUy4G0tzPiSMOI=;
        b=MeGjOc0Pha7xJh7xknn9VI0Umxek7HYMvjkPgubo/djFU9kLU9D7TuzYDH6gvzlrAB
         CLcKkHs7MEaFmEgqPuFARbhMCTAdeiE0cQUk/bOLpXiDHhnAgkBFmGVZS8EHHbSiAj+J
         WdGR1nKRJjcQdBMaPem/yynXIB7k3+LoFk51dwrw66xVGBZK2ayOO++N7C9r8I3kxzNv
         R+7ZZoVYD8rUmdufzl4ql/+ztvR5CEwJB6UaM6nW0xVGARXpkM7GiAWDpxsSPwfPwFO6
         1FCAKADW1ch5rtpIfVC+xKZjxaAWZS2V+r6luufDVF12AD/kHLSQgQIszML1EMdOQiwg
         AcVA==
X-Forwarded-Encrypted: i=1; AJvYcCWjFd6v25w+YSEIJv2zaoxlR+t9iv8QYu5EwzhW3rdPBDfSuM+vhHhG7T1EeMuLzaAvU59qCBRxeRnq8gn0+NtV@lists.infradead.org
X-Gm-Message-State: AOJu0YxleT5ws0rnT7J3SYS7r0XDNcVyI66b7DYkfyNRnkCCVR3jmlAp
	4+z4Yy/SYIZu3Yv7u2jiEac0w61Pk08Y7BNGqx9ixHsZxoKNcCVigvmqWME6bMPed1qG3Ot9wtq
	/yVKzE+h5dOfUp8Ls8FZEwYeQTzyonNstFtMfORXCOCBfWF0JAsjJQJ7gA6U4tX6cuHa/a07UcO
	yN
X-Gm-Gg: AY/fxX4oZbVUUqnfdSGI0AP7Ne8cwjlwNbH+gswIrHL0Pu2z9XRH3akHA34dz7Oe+tm
	TfZ+8FdVvfOye6MprZFjh64iq3+ntpQxekwCbRK5r4N1LoSO1uG3DL5PkdGzEHZiKIoJngq7AyF
	XIebg4MPJdgA7eGCjQKCQ3aiIERzLHBn03BsA0Md+MFtRc2F/uIq2uOZ+U3QIdc3Z2QP88Rn8p8
	CK58SFGKEkaMg140/j6NO/LjS1jeEDbVCYXL04B8nw6uP8joReFiafSTf/j3s0JUbd4h3v5prh1
	dod0sfXXH5RbiH4bwTENp306/frD2M80eeB/eoMIl1m6kj5jDyfu6kZxffllNS9XnLSstp3we7h
	Fp5odjmcCkY0=
X-Received: by 2002:a05:6a00:1304:b0:7e8:3fcb:9b09 with SMTP id d2e1a72fcca58-81f8f187df0mr1395841b3a.31.1768444487910;
        Wed, 14 Jan 2026 18:34:47 -0800 (PST)
X-Received: by 2002:a05:6a00:1304:b0:7e8:3fcb:9b09 with SMTP id d2e1a72fcca58-81f8f187df0mr1395789b3a.31.1768444487478;
        Wed, 14 Jan 2026 18:34:47 -0800 (PST)
Received: from [10.72.112.168] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e6a71c6sm821559b3a.63.2026.01.14.18.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 18:34:46 -0800 (PST)
Message-ID: <f1ba964e-9d52-4942-bf31-906b88dfc87f@redhat.com>
Date: Thu, 15 Jan 2026 10:34:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/47] KVM: arm64: Make MPAMSM_EL1 accesses UNDEF
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-6-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-6-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6tu9kVlRMJgCUKupix9E2vWWYdt4MvlXjTpTspPmh6A_1768444488
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_183704_278181_7ABF9BB8 
X-CRM114-Status: UNSURE (   9.16  )
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> The MPAMSM_EL1 controls the MPAM labeling for an SMCU, Streaming Mode
> Compute Unit. As there is on MPAM support in kvm, make sure MPAMSM_EL1
> accesses trigger an UNDEF.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Remove paragraph from commit on allowed range of values
> ---
>   arch/arm64/kvm/sys_regs.c | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


