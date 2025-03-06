Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D410C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 23:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Hz4rVSOPCLFTfl28e1lA4te8SstIFjzPVnzUbwvmJ4=; b=WOlJyeiiSo9eOJLKT8xqI4knKR
	GRdoGt6rRwwYCJ8eXlnoJTQp7kWQlJ/gKq1tBemIEVQaOdqQsgn0EnXuOoxC78F0naNepect2B1PC
	u7Z6WvaKe+8n0WqdLFJt/rhvnQyirMj1SsZCUDI1Or4+E/kWwFTJ02dYvDjx6vVsEEPJthDrTss9w
	YzMAgG4pN0yovp+nT0UyjVktpHX2g0qICARbV9mhtI56c+1KmCmCNSRMAj0Mp8mkvJCpPVNg0t/8W
	i9ClntE4VRh+wqlvzWgqFjKD+dSc/g3bAx5WxnZBY0HoPS9K1jKUItUfvvgEV7MGJakKmFdx3nN0+
	6znBZ+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKMA-0000000CSTX-0XVO;
	Thu, 06 Mar 2025 23:10:22 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKJ9-0000000CRtB-2FR8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741302434;
 bh=7Hz4rVSOPCLFTfl28e1lA4te8SstIFjzPVnzUbwvmJ4=;
 b=ne4RQggwaC5mwX1DBLO7G4paDJMdBSIJRmUVM0c+Z6DCoCVeXaWCy/IsyY2w590dvafMSH8Gp
 wbDBFeChJ6f3bgLDdhGZMgY9UsJt3+K6goLT7kAmh396wSmlLo8k0c7FxxwI9ImFNDvB644k6S8
 XQzmqFGc7nj079YlFh+bc/8L+aYeVVuQgTTSHdeCfibAVK1/fGzz6Mqi29kSM4358E9GPgI/DuO
 oFd0uZrEG06ZC12JAFdQjKuCEb7x1LPDHw9vx2GUsiKy7lwyyiEM6xFib0cnqSiQby2izQkwUmp
 XMHyo+zIxI6UPFBssTaBg2pkzegeFwIlBJ74CTiy7ezQ==
X-Forward-Email-ID: 67ca2a9ec1763851c065cdbc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <7fa480bd-9bc5-4069-a623-afb140455192@kwiboo.se>
Date: Fri, 7 Mar 2025 00:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3528 QoS register node
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yao Zi <ziyao@disroot.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250306123809.273655-1-amadeus@jmu.edu.cn>
 <20250306123809.273655-3-amadeus@jmu.edu.cn>
 <cdbc1556-4662-4078-a4d6-33545e2e2491@kwiboo.se> <117081043.nniJfEyVGO@diego>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <117081043.nniJfEyVGO@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_150715_705102_4B3D1AC1 
X-CRM114-Status: GOOD (  14.11  )
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

On 2025-03-06 19:08, Heiko Stübner wrote:
> Am Donnerstag, 6. März 2025, 17:55:16 MEZ schrieb Jonas Karlman:
>> Hi Chukun,
>>
>> On 2025-03-06 13:38, Chukun Pan wrote:
>>> The Quality-of-Service (QsS) node stores/restores specific
>>> register contents when the power domains is turned off/on.
>>> Add QoS node so that they can connect to the power domain.
>>>
>>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 160 +++++++++++++++++++++++
>>>  1 file changed, 160 insertions(+)
>>>
> 
>>
>> These QoS node are typically referenced from power domains so that the
>> PMU driver know what QoS to save/restore when a power domain is power
>> cycled.
>>
>> Vendor kernel only reference the two qos_gpu nodes in it's power domains,
>> do you have any documentation or knowledge about what power domain the
>> remaining QoS are related to?
> 
> I think the GPU actually is the _only_ fully switchable power-domain on the
> rk3528. The other powerdomains seem to be always on, but can do this
> idle-request thing.
> 
> At least that is what I'm reading from the pm-domain definitions in the
> vendor-kernel, combined with a look at the pmu section of the rk3528 TRM.

Thanks for this information.

Regards,
Jonas

> 
> 
> Heiko
> 
> 


