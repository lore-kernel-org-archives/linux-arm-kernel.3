Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5676606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V9Wtfdnz;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aXIrH1zD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vQ88d76TUq4k99QsUORpvk5GOBTjh2+OybJMDVnHW0U=; b=V9Wtfdnz8KSEZk
	q7dUP4OFu8HV0pkU6i8FlmkM9pDNJNMdAAzIjfnsCslnQeQ0okthdnwrApRoz0yWu4qXlTLfc8gNW
	UXv6PYMCFV3dLEba9al3ESo84zb+1XFFB/RZmz/toT3eIjr+Mrnt63eU6LPwwb4iem5aJL4qOPnGP
	PZVHTcF9HRxbpX8p7mbYv/tyKnyc5AeAtDAgYXGnaqG9C90iBPB/8PkG6XcmpzT44tSfnKyowpvug
	kYQP/irDMEj1VZMC68YKHD5BgCr9gx574Nd/E6pAYAa1s+DeI+5S2MnlXr1GcRI4tGQORx27gXKcm
	WHSje6tZ7DTuVs9Qk5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIok-0000000GiZx-11QS;
	Fri, 23 Oct 2026 17:12:34 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIog-0000000GiZc-1qp3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:12:32 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso429012a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 10:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775549; x=1793380349;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vQ88d76TUq4k99QsUORpvk5GOBTjh2+OybJMDVnHW0U=;
        b=LiO0cWy6Z7P8+iFLcThrLstKGKtzipHhsZVo37ff3BGutEDV+usWClOfHcRTevenyG
         WKaMiFnv9x3m7r+uHYpbsJgYh3Xz3VUzhJy4CqGLxwiaF6QT7GBn+qE7FieM/6ztsJcS
         Tz6QV8JE45TVwMP89Vcp7WJD+mKHC9Uy1WTo/E+xX+ZUMzPkWwNjhYCF7E11reahuI9D
         FPbAUrexQVPIkiEZ+MV3cVDLc1WuEp3gptKL8cMzYeYzSzxqzNXJRHyhBUeB6CWDW3wE
         tn2yzQD9qvD723LS2Ik0u9flc9B9We95lRF66elTeKdJQzcWRJto9fTLll/kJG2DBzf5
         o85A==
X-Forwarded-Encrypted: i=1; AKwUvBwLeFOEn0e6stkQg/uVpbmb97Xmhu/MPvC6qxJa9BwcT6SXQLjl/f26gxARdZh9ruXhy7IJwU8JIY5PKExaTG5L@lists.infradead.org
X-Gm-Message-State: AFq9FYK5SN4r4rJJ2dimiXWa1LzGxSJCtqoXBGbPxlduydPQzw7WU0DB
	Lz/PZpa1InTA6NhARRgmIGaekzBXjPa2A1hHj34sjnELIJUNCarVYiH9GrLbgrAyyQ4WE/4iSgs
	iObcyZkXyGkyr9b1LuwYLdu2sD7w56EtwRaroHpWc5YafDjObGAs5k7V0g0jpOHjfvMi7q6phLw
	A9NiIornGCG2uKXPmNAzIl9vzX2yb9aB5tK4lNUkMlRGMKiPr38srFD6OYM6iCrj4klFFBYWxn5
	LYjaBdwgMwsmq80SQhPKep/rxx9i8mvzqh/6Q==
X-Gm-Gg: AYBFou2i/FcTx0RqYfKxHgA7nz21KtZkyrKyzWAcqTKwKvRaizJXuoP2EYzGaBG1VfY
	EXyh8Hfthbxqu5bZ09v2ju9EbSBQV8CXLjX459FcnIBxt4PP6dbdPa9Tsv9vq4kvSha3rOihH+h
	k1v9yh40lAC84FgYe72UO3nAxsGXz/39tejVgmOpyNpkCdtoO21qM5M/tXY/U+qZdIRN/vjwW+G
	kw00bE0WovkapVtoN3buBqIXI37niUa5CdrU3VeHb6LIZfDjLdQ4TkgkIii5k35uTII+S9MjP/P
	TIExEiBzPPDKJDTj1akIDpXUfYKwiJ/GOOrrbrziYzx4V68HoZYCYPvSqwalFVSU9pGcFhVMPOM
	XyweTwL9I7hCcCKzIgjSXI21YVl2IQrFXjn/RcZiSkRonApihVHJshhB1GxaHg/DdaDTrDBZUun
	ooHlIj8niPWeE4BW7Pin0JX5b8SipgFCSVDUKHAtQNtrk=
X-Received: by 2002:a17:90b:4f83:b0:3a8:9db2:a4f with SMTP id 98e67ed59e1d1-3adce0d3db6mr2469623a91.51.1792775549305;
        Fri, 23 Oct 2026 10:12:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adde20c410sm487560a91.3.2026.10.23.10.12.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:12:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99082f450bfso962051241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 10:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792775548; x=1793380348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQ88d76TUq4k99QsUORpvk5GOBTjh2+OybJMDVnHW0U=;
        b=aXIrH1zDuaS3JqhJH4+febDXbwgEobOKJ08EhOhCGHSskEm2g2iZ0NmXvmCdlayPll
         NB6UJC/lvvMk3LKUDsRJxFiwQrM6jSVEY+1PijlHEE9pmLAgFmPf4QWoiQLaHmHmPo/Q
         oFafoYuzyxlKlOG7guQ+3n40mabDufcqmi7As=
X-Forwarded-Encrypted: i=1; AKwUvBy2xeL8Fe4sIFEPJuvtM56UPpOIHYTZQY1FL7sD9KMI0RoGGqAuQUvMRZ5pUK+QzW2cozCoqOa3ab5qGmIgbtRL@lists.infradead.org
X-Received: by 2002:a05:6a00:2e95:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8a2c6279b96mr2405854b3a.8.1792775133722;
        Fri, 23 Oct 2026 10:05:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e95:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8a2c6279b96mr2405838b3a.8.1792775133310;
        Fri, 23 Oct 2026 10:05:33 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a3395cedc6sm209312b3a.38.2026.10.23.10.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:05:32 -0700 (PDT)
Message-ID: <1f1260db-09df-4d42-bfc7-34f9a787176a@broadcom.com>
Date: Fri, 23 Oct 2026 10:05:30 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 49/49] ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING
 post stop_machine()
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@kernel.org>,
 Waiman Long <longman@redhat.com>, linux-arm-kernel@lists.infradead.org
References: <20261019130856.49711-1-frederic@kernel.org>
 <20261019130856.49711-50-frederic@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261019130856.49711-50-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_101230_690408_1AB233CB 
X-CRM114-Status: GOOD (  12.44  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19/26 06:08, Frederic Weisbecker wrote:
> Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
> all the teardown callbacks while stopping all CPUs in the system. This
> doesn't mix-up well with running RT or isolated tasks.
> 
> In order to transition smoothly from global stop_machine to finer
> grained synchronization between teardown callbacks and the other CPUs,
> a new stop machine post function has been introduced to be executed
> after the main one with IRQs still disabled while other CPUs can exit
> stop_machine().
> 
> It *looks ok* to disable the cache readahead globally while the other
> CPUs are running.

Yes I think it is safe given that b15_rac_dying_cpu() will run on the 
dying CPU and any CPU that is left will basically re-enable the RAC 
afterwards if necessary in b15_rac_dead_cpu().

The hardware to test this is quite ancient, but if you give me a test 
case to exercise, I can give it a spin.

Thank you Frederic!
-- 
Florian

