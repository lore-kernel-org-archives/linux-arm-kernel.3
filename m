Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE7ECA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP8/xgXorWxZkfAWc5lJ+mhCSmVoL9S8Y8qJCHw6Jac=; b=RBnBuhBDfgn16cVLH+N29DRngS
	x1LLiTtuQpMD6VSHGOTaWO8e+j0D9I/NiOHdHW62FM6ZFv6nFHK4wsXBZ8Xl8nzygeg7j5V6ueNhA
	Zoqkl91p32DZ4d1+MbCIWZIbyjnFKGbjKLNmXSb9OJUwduBg4rcfW3I1hPOZMvnd4vZmIqjhZpqxK
	dY/tOe1TizBQeWr11NiU3JCeoA28AoI6LT987CnFy4sb+cwQrstq+vFs4ftVIVbYAB04MHpChD/Ww
	Q62Sdl5p+UUf5TucO8+aiwjpO3Rpr2p/1zpi3QB1PQwtKmhFmcnZxhTdBXqbF4luVmWcHZ1ZflprQ
	S4b3jUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpFe-00000005N0n-3vRv;
	Wed, 30 Sep 2026 08:01:18 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpFb-00000005N0E-4AyM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:01:17 +0000
DKIM-Signature: a=rsa-sha256; b=a444FESxs9a3t4Te4rw0LAWZ8KpDvKWCU8k0SiyFi01YsZi1paZ5DI19G1eSUwKLA7VILMOM3AiGWyUhPjMpibN9QPDOjvh4D41ZKnGXdVFdKSCeaEZIaXnOhh/T2gVkv88UFzehgqDgDyVcRX3e4zH+FBgr6YjcnBSqweRDChh6EEy4JNLe2GOkc185BksFqalSADo+PZwFp6pZJne8lkpH+DI7dxuZy2+BGaFlMjrQEmAmWRuK5kFTFClw+nxYkJoD5n7F6DpXw3J2AFfrffudhFa2fpyDDd+K5TDNoeZehO8/izlYkByrp8Kplb5lP3MTl2n6hujSyBgqzbjKhQ==; s=purelymail3; d=q-lab.dev; v=1; bh=8VvSOkc6y3rlTIlWLwAwwqIGp6vCW6cQopRx43uhKyE=; h=Received:Date:From:Subject:To;
DKIM-Signature: a=rsa-sha256; b=cAI5tOWHSWMdhNh1KYmkPHnuNpvrEAUs1dOw9uXE4BL8wmuDj48J1cm3hM9kmyAZHQVBTQB0d9KGZk+IXbX+c/lduRGGZcfRXGkjyvVlXOufTilUnyZcTxipOXK/92YK3ch+ZYT+3VaN5nyCSk4cPFvx1V5JuFvuWQor//88Iwwjf3YXGq5QO9xhH2tXy6LUJRdVboSyi80mwpA3NDNMNhVr0N/Iuv0cawJWHRQnHl/XeSlw+A7lAhswu34brPtrb9FUIV7Y+MW9qmtvJw6qYmpZmVqHIIC8NwrQFd81m0T9DziUVaEOE5cw1499yiw9rjezd5vZ0ds0IMjKBHrCdw==; s=purelymail3; d=purelymail.com; v=1; bh=8VvSOkc6y3rlTIlWLwAwwqIGp6vCW6cQopRx43uhKyE=; h=Feedback-ID:Received:Date:From:Subject:To;
Feedback-ID: 284201:25281:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2023428983;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 30 Sep 2026 08:00:44 +0000 (UTC)
Message-ID: <2fe4a450-f176-463b-9799-5a03f6448c38@q-lab.dev>
Date: Wed, 30 Sep 2026 01:00:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Quentin Freimanis <quentin@q-lab.dev>
Subject: Re: [PATCH net] net: sparx5: make ports inherit the switch base mac
 address type
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260928045012.30178-1-quentin@q-lab.dev>
 <20260929185936.687250f9@kernel.org>
Content-Language: en-US
In-Reply-To: <20260929185936.687250f9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_010116_130739_DF9239ED 
X-CRM114-Status: GOOD (  12.97  )
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

Hi Jakub,

On 9/29/26 6:59 PM, Jakub Kicinski wrote:
> On Sun, 27 Sep 2026 21:50:12 -0700 Quentin Freimanis wrote:
>> 0 is NET_ADDR_PERM, so userspace thinks this is a stable address.
> 
> Could you please explain the end-user impact of this?
> Unclear to me from the commit msg if this is something that broke
> your deployment / scripts or maybe you simply noticed it from code
> inspection / LLM scan.
> 
> No need to repost, just explain, I'll add it when applying.
> 

With a random MAC reported as NET_ADDR_PERM, systemd's 
MACAddressPolicy=persistent [1] leaves it unchanged, so a DHCP client 
gets a new IP address every boot and a static reservation can't be used. 
Reporting it as NET_ADDR_RANDOM makes systemd replace it with a stable 
address derived from the interface name and machine-id.

(this is my use case, and how I found the bug)

>> Fix by tracking the base MAC address assign type in the sparx5 struct
>> and applying it to each port's netdev.
> 
> Generally no need to repeat what an average reader can easily grok
> from the diff.

Ack.

- Quentin

[1] 
https://www.freedesktop.org/software/systemd/man/latest/systemd.link.html#MACAddressPolicy=

