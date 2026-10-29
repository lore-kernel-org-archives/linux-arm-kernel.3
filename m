Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3538D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g4mgZb8+;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=akN+cJ/Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0ua09dxb/+6Ms2fbyBUf/EPsfi1o/dMsdbIpjzPkg9M=; b=g4mgZb8+aJn/IU
	Jn/vXAJDaXhm6THQjW6CCr8WBqkR+stbDgr5mxrku/1wZNs45fJbuWaVvMtGvvUoAE3g8QkkesB/N
	ZOXVne1xuqJ+flpQiTM9S7qe78G2S8Y4l5qS17mXurnDOverV7WGieA6Ds3SQBdrecgSMnggKilRs
	Pxqz7U/dbjYTMqeOBw0hwrxqLf9E4Egn9KsBC8z1k4/ZPw/pORSzrdC8hUNFEbGg5FTryz3WEpKUI
	7RpDxMzE7WLOuWcXgezWOb9JzLcgGGqsBOnz+oZDeDvie1ztkPyx0/rOXBa8oHzwOhhpb6uPsxv3n
	Xnfnw4rjjYodiJZ3FgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXhk-0000000AQSK-3LXL;
	Thu, 29 Oct 2026 21:30:36 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXhh-0000000AQRr-3WE3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:30:35 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso25447a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309432; x=1793914232;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0ua09dxb/+6Ms2fbyBUf/EPsfi1o/dMsdbIpjzPkg9M=;
        b=iZdJvDUyeM+lI7Xu4FfwuyQUb9M/F+dXUGqf1dwmSe8taJodz7Y/PQ8DmKeTrmn43j
         yuwKfoCj3hYPbxTNUWmCV+2PmV4luPuobsB7iova7vzkqhOOMKCv4ebMlHMleOf2GH9U
         zoEs/Eh7y6ZhpFA3NnrJXgRHdTxTpUs5K5FtI7DrbXIajEdPvrym/ME3e8SeO1IHoY0v
         dU6ikqtK53wzQsMqr7LUZpBFmxdRO089pOeqU1nraEse/KPgW5frM5bb66BKG6XmC14z
         PTi1h79C2nbjCjWAFXb9TwSKpWebB8D6hCj35Yw5+cRS9bS6YKBvjPI/bNkK0DRRzZOp
         MQRA==
X-Forwarded-Encrypted: i=1; AKwUvBw22DQRB1aONHNKz/nQxg/xGLm2uycWjyQ7UHt0Osrqd/wLkRGCTVcMED9QVkQA5VY/vqTS7GDfOT2IjTLHQn/P@lists.infradead.org
X-Gm-Message-State: AFq9FYJOQ+ss1gwH2wOZrsFbi+ekXsxPXjqgLNp6TQOttBHFGmLKgzWp
	iegtTipn/Ou+YEh5YbtPflWuNBBBc2ly6ACBQkPyagJ00aElchU3wBbZ5YLIQASkuvHyhhMxsys
	wPvvD1DaGg1gIh0kHREx0K1o9e8s3p5WBv1yKTCoS0iBEz4fKshV8Hs/mQLers8MG7iyyZy0RC1
	2UkMBLeFuqFG6zKnQfZ0O+g7y2kLKiAhMytcNEUMkwExljAjWMuKNbggkODwNqYuVFTX7tDtMOy
	YkUfRfIlwWuBRHMVER7o4RS/2b8yJb47t+9wQ==
X-Gm-Gg: AYBFou2spcBzII46FiCY4qlhPYgd8Dtfpbkohqh8X2QC6toFq0eMJZ/+IP9ckMxzTJh
	eJYzB2pPc4QNWrH3zUAhbcBScA9P8zoqo5Iwb6NFeKxDhNZT/oBDzTcE/VZFP1Rsa7LhADEKCK8
	7PgevcUfhpmH70ISCldhAg0rpTP28PG6hW4Weohx7EUkfTEGWlZ85O08bXVD7sqklGcMy5d+KaY
	hxI1n280Mjsf8Qx+rUcQcbnNU0MU0OEok5AwbGrZJ4BhSdn2tMMhaAUwLB1dc3oW+U+MEBn03XY
	OaX0IBbO7rdlXLDrGK3ksOw8m8FJrmUi6q5pqwbywPz1trnx882CjiO1zd0Gs7yC9/wzP3Aoc+I
	WNi3JzIKe79apmCvkZpuB6uB7Y1w5fX4TAKArCe2XzYM42BG0lpvQx2X7p+2pA4WmGtGYQjZfrw
	+phJq8mvmP7Gaj9L/m9IbVtjFVK7vuwx9k+jnvVDm3
X-Received: by 2002:a17:90b:17cd:b0:3ac:9e5e:d195 with SMTP id 98e67ed59e1d1-3ae89851212mr165627a91.61.1793309431946;
        Thu, 29 Oct 2026 14:30:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae84587856sm626579a91.3.2026.10.29.14.30.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:30:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9440b27c1feso412347585a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309431; x=1793914231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ua09dxb/+6Ms2fbyBUf/EPsfi1o/dMsdbIpjzPkg9M=;
        b=akN+cJ/Y5TAwhXNArFrJN6w/VU+l7ckppwatlYQxF0LEe5bWKYMzmsxnkU70xjUetK
         P3emyEKI1flMcu6lmip+dHF5zG/Ie9d8QnAbS7vGyCND0lL7Ow6OVACq4lj8y/bvYqsI
         NtHzLf8ccimzCwCDw/E+S4m3qNM9oiBqe3iVc=
X-Forwarded-Encrypted: i=1; AKwUvByz/DzArgPO41kQ688VxGTb5woR8gGJpVpVpDDJo9LZ9RFUSkUEUPnJVU6RfB4kAJQiTCadq/HvXBxsFfe7tYCO@lists.infradead.org
X-Received: by 2002:a05:620a:2805:b0:93f:31f0:6a88 with SMTP id af79cd13be357-944217e9062mr80858985a.65.1793309430659;
        Thu, 29 Oct 2026 14:30:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2805:b0:93f:31f0:6a88 with SMTP id af79cd13be357-944217e9062mr80854485a.65.1793309430072;
        Thu, 29 Oct 2026 14:30:30 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-944210e6a20sm47317085a.4.2026.10.29.14.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:30:29 -0700 (PDT)
Message-ID: <441fb026-c377-4327-9478-b5ff6b16ea15@broadcom.com>
Date: Thu, 29 Oct 2026 14:30:26 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: iproc-msi: Bound events handled per IRQ
To: Eugen Hristev <ehristev@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-iproc-irq-v1-1-ebaaf027f29e@kernel.org>
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
In-Reply-To: <20261016-iproc-irq-v1-1-ebaaf027f29e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_143033_894436_CE035EA0 
X-CRM114-Status: GOOD (  10.99  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/16/26 05:18, 'Eugen Hristev' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Limit each iProc MSI parent IRQ to 16 event-queue entries.
> 
> A continuously fed queue could otherwise keep the chained handler running
> and starve other work. The budget still drains pending events and lets the
> next parent interrupt continue processing, improving fairness and bounding
> interrupt-handler latency.
> 
> Without this starvation avoidance, one CPU can stall indefinitely
> in the loop and not serve other interrupts, timers, etc.
> 
> While testing it with an Ethernet NIC,  when too many MSI interrupts
> come in, CPU might get starved:
> 
> Connecting to host 192.168.30.1, port 5201
> [  5] local 192.168.30.2 port 52586 connected to 192.168.30.1 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec   240 MBytes  2.01 Gbits/sec    2    334 KBytes
> [  5]   1.00-2.00   sec  63.2 MBytes   531 Mbits/sec    1   1.41 KBytes
> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  177.568497] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [  177.568913] rcu:     0-...!: (1 GPs behind) idle=28ac/1/0x4000000000000002 softirq=28922/28930 fqs=1
> [  177.569457] rcu:     (detected by 1, t=5256 jiffies, g=21629, q=819 ncpus=4)
> [  177.569870] Sending NMI from CPU 1 to CPUs 0:
> 
> With this bounded approach, IRQ handler will complete and continue
> to serve MSI events on the next handler invocation.
> 
> Assisted-by: Github Copilot
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

