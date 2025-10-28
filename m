Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC5DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 20:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzy4tgUwmu6YlIs5UZ9dfer9rkkU2cDr+iv5TV7wdbg=; b=xySJvKX+sIiFiskAT74RemyPZI
	8Y1sYxZPMQ3mqMWRzcPUtfufCmdBC3v5f2lh0BrrI3T/Bmv34xmadUIWrThP0sqS32CjKFpwJjHWq
	2Wc/aLf4N9NSiz57Fft6iSjJWAP6DIHSjaxarOse2ezJ9wUp22rFUqIXxDarjOci5Hb0vXbPKJReD
	DjH4F5vKNAM1XOD0t06MCHfQSQWE1JOEjj38V+s9yZT4BWN+9waoO+3zFOBxRF1xhGHtuTof6bLCG
	nEetvTn/9tmMmpyABv93y+wlTC7AFO+5mZuD+XWdedhLNA8Jp+QPZW8fKPeKrszqZu3Dz7PXVnRN+
	VTA67crQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqPJ-0000000Gd16-3Z8h;
	Tue, 28 Oct 2025 20:35:05 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqPH-0000000Gd0T-2KZ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 20:35:04 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-33d7589774fso6176325a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 13:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761683703; x=1762288503;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzy4tgUwmu6YlIs5UZ9dfer9rkkU2cDr+iv5TV7wdbg=;
        b=Xd1cxfMXA7ft2Dzk/ZQPDlfFXlQXRblan0A0XdMW+vAdbMoAQWFJs1VIF0pyEh/cPG
         L8p3aGKe3/U5E6SDsu6k4EA/7nE4nYIyoi3ZFINoNlUi7mTV9QdFH1voqTebwSK7eJ3U
         tS4vUym/3vk5w4gAB5vwg3GTWhcR5z/SJMVK8ofbsiJmf02AG7DK0iqqHdYHbdifVz8/
         0smFQAZ9oEPcTwrifqBhgZTVoyphWb4JDSdG+AHeB89EPbvmjRzqWm21qmDCdHggnvT/
         3hADUuG316R3ZrnZVpLbrzBmFk4OeA4wNU8wCbpOtXZE5TnYPPOZiKuHccOeXoGl76YA
         mQOw==
X-Forwarded-Encrypted: i=1; AJvYcCUrJpQ7jOpDXic/oesG20Cd97qw4ygVF0Vlls7CVDl8tXaQw+eKGGGzrOiaKPcXJtnWkbsAx22iRLJR3zTwt3Vh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3XiOGc3OlvtdGWObdjLVTtzmpSHXUY4Re6VOXKO5Jo9bO3R5U
	W0d07q9LY6A1sdkNcblwr+9DYqGpWWknUnN6r1ma+fkco2sruIoX08f+aoM7J78VyRkyhuHGjqR
	vFi5NA+mcO06bULFZz/YfcNURIuWlC4qyH7hbCPkZwAG+uEw2Ah0doLypsG3K6qG7IyY9cFsBLA
	RGRqq3R1Ig8LOM7Jg3Y1RwqECPBlcf1O1WCBZ7F64uRzxYzFdXP0EFjwvr1C6thnVsvKGrBejjE
	aNVZ63ppXpX9gNLjclK7WGpJqKvbKc=
X-Gm-Gg: ASbGncvKsZIzPEgo22wvN2q5hD8WYNDxpLYzpI5Cfm5eC2MNEZlMJ/b8NS58GxANOou
	oUDZSGiSjyT//e3J3ZlcL6JKIqv1n5aSi6r61dZiiACl36yy4JjKKZajZfEZN8orHjstb4Lr91r
	mACNB1ZElZNMM64+UziMnE7XkmGrxS/MYCsCU0M46xOGlfNnmcqkWIS7+so8QCjQfa2lBwSGYAD
	6ryA/tGbjhYpeq2I0ch7keU7mgdRCu6E91sVqutiBe9JxxS9mN2eamcs6LJjVYg6I89XsWlvMeP
	jQhRHN0fPr55AUuniArXgYJwM2un3nplYKoRV5mMa70WqoKd9DCtiaCqHT1mX0trkgxfzq00fZx
	25Q8PeuWQi6xC9hJFmKMZbUO5c0aNvZwr6y6PvWfi2lTk3r1mvmWxjOyIzzXC084egSyRnSkZzN
	Vp0NLeiUemtsM/S9i0rCCyeu78nTmt71SgC0cOxg==
X-Google-Smtp-Source: AGHT+IEw/uZVwMiOGK6gvMss24e5gtlERn6Hv3morq5vrMlxUcl1v6hwwyruquJjxG44AdN/Mi501ABBigLt
X-Received: by 2002:a17:90b:224c:b0:33b:b020:595e with SMTP id 98e67ed59e1d1-3403a2902bamr379111a91.25.1761683702752;
        Tue, 28 Oct 2025 13:35:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-33fed7ce6bdsm1177179a91.6.2025.10.28.13.35.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Oct 2025 13:35:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8bb155690so85442461cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 13:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761683701; x=1762288501; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qzy4tgUwmu6YlIs5UZ9dfer9rkkU2cDr+iv5TV7wdbg=;
        b=QhldBhiavc/HOPKTbCns0pLh+VdzyOAvcGcHe2tdGFRIzfCQD4R2hie3o3hL3vt3tr
         qrrqLIrpc9XjxgPrfifIpHcWwTVpcK9ju2Ux8ODBQhDi3jXJ+qrPY0pUe7EtBWp4jNbt
         ujiKbms9jA4Rdt6MfDX0jlGkjWlpr9wKRlLf8=
X-Forwarded-Encrypted: i=1; AJvYcCXnQQbkon0AtbSnhqHzXoaU3r5XwbeZ/LiOYf/wgH0RxqZsym4nRYv6Wuhn9y9YJVODy+S1m/XM4gZTDsm+0TWa@lists.infradead.org
X-Received: by 2002:ac8:58c8:0:b0:4e8:9ade:108c with SMTP id d75a77b69052e-4ed15b7605dmr7331851cf.34.1761683701333;
        Tue, 28 Oct 2025 13:35:01 -0700 (PDT)
X-Received: by 2002:ac8:58c8:0:b0:4e8:9ade:108c with SMTP id d75a77b69052e-4ed15b7605dmr7331641cf.34.1761683700947;
        Tue, 28 Oct 2025 13:35:00 -0700 (PDT)
Received: from [10.28.17.173] ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc49c5e8esm86789936d6.55.2025.10.28.13.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 13:35:00 -0700 (PDT)
Message-ID: <78fda7e9-5134-4f75-9ac4-a4918878ad48@broadcom.com>
Date: Tue, 28 Oct 2025 16:34:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH v3 2/2] PCI: brcmstb: Add panic/die handler
 to driver
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251003195607.2009785-1-james.quinlan@broadcom.com>
 <20251003195607.2009785-3-james.quinlan@broadcom.com>
 <7efe5f81-aaa7-45b3-97d0-469ffeb35e5f@oracle.com>
Content-Language: en-US
From: James Quinlan <james.quinlan@broadcom.com>
Autocrypt: addr=james.quinlan@broadcom.com; keydata=
 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
In-Reply-To: <7efe5f81-aaa7-45b3-97d0-469ffeb35e5f@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_133503_593908_439C162C 
X-CRM114-Status: UNSURE (   7.94  )
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

On 10/4/25 01:06, ALOK TIWARI wrote:
>
>
> On 10/4/2025 1:26 AM, Jim Quinlan wrote:
>> +#define PCIE_OUTB_ERR_CFG_CAUSE_ABORT_MASK        0x20
>> +#define  PCIE_OUTB_ERR_CFG_CAUSE_UNSUPP_REQ_MASK    0x10
>> +#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_TIMEOUT_MASK    0x4
>> +#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_DISABLED_MASK    0x2
>> +#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_64BIT__MASK    0x1
>
> typo __MASK -> _MASK

ack.


Jim Quinlan

>
>> +#define PCIE_OUTB_ERR_MEM_ADDR_LO            0x6018
>> +#define PCIE_OUTB_ERR_MEM_ADDR_HI            0x601c
>> +#define PCIE_OUTB_ERR_MEM_CAUSE                0x6020
>> +#define  PCIE_OUTB_ERR_MEM_CAUSE_TIMEOUT_MASK        0x40
>
>
> Thanks,
> Alok



