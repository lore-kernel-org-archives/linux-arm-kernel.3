Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D98DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 03:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVsNu3y1SfXzBdfw48QrW2mnVPUuj41sgD9Q3ySf0jw=; b=dJHvF9bYgAdY8/07nmDZQ/mNvl
	eYBlsgf8jYmCl44AI0xBf7Ieg8LBFeV3JPDh4hb9bY2Xr+/llGorhB28J3LxfVc7EAzYOCRY6W4EC
	iikGAFBIlCkoVbvdF44yDk2rSY3QHVEow30afJX1zBEXBD+m5agDg9XkpGPgQhnS+6qw7mE1It64d
	wYYrJ4hwmcKbU9zeORGwddmirrAWM/A4OzXOiR9NKzZmz5tPCTtWBpLl3BmPdQc/eI9lSBRY7FSnr
	mxR72zDFwSFkmUUIQ6pKg7LP8KJgxpUjgA3SKn/y1wBjsyVVAJxp88/dtTpHMWWNa+1tm6f0fUNEZ
	v7h8q8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCix-0000000GbCa-2WY9;
	Fri, 07 Nov 2025 03:01:15 +0000
Received: from mail-m1973187.qiye.163.com ([220.197.31.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCis-0000000GbBy-3FwM;
	Fri, 07 Nov 2025 03:01:13 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 28b7d0bc4;
	Fri, 7 Nov 2025 11:01:05 +0800 (GMT+08:00)
Message-ID: <d9e257bd-806c-48b4-bb22-f1342e9fc15a@rock-chips.com>
Date: Fri, 7 Nov 2025 11:01:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
To: Geraldo Nascimento <geraldogabriel@gmail.com>,
 Ye Zhang <ye.zhang@rock-chips.com>
References: <4b5ffcccfef2a61838aa563521672a171acb27b2.1762321976.git.geraldogabriel@gmail.com>
 <ba120577-42da-424d-8102-9d085c1494c8@rock-chips.com>
 <aQsIXcQzeYop6a0B@geday>
 <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
 <aQ1c7ZDycxiOIy8Y@geday>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <aQ1c7ZDycxiOIy8Y@geday>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a5c42adf909cckunmd8a05e02f6b7ea
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkIaTlYfTkwdH0JKSxgYSE1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=N/AjtPdWxmqb/pFSs6gykwYAJznoZ8eog/K1ggyHgiHswHpN2h06IuYOiipUjuL3fkrH9tNI7iUErn2M+xn58GJHlBeesAuUuwLcF7xohvnZc6VYwGmJh+ip2Ox71RepKsnJaUNoX4XVoE81ZYMa3tVHxJcOI2tPNeo7AAFKCxQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=zVsNu3y1SfXzBdfw48QrW2mnVPUuj41sgD9Q3ySf0jw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_190111_329054_269A3CB1 
X-CRM114-Status: GOOD (  10.83  )
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

+ Ye Zhang

在 2025/11/07 星期五 10:43, Geraldo Nascimento 写道:
> On Wed, Nov 05, 2025 at 04:56:36PM +0800, Shawn Lin wrote:
>> 在 2025/11/05 星期三 16:18, Geraldo Nascimento 写道:
>>> Hi Shawn, glad to hear from you.
>>>
>>> Perhaps the following change is better? It resolves the issue
>>> without the added complication of open drain. After you questioned
>>> if open drain is actually part of the spec, I remembered that
>>> GPIO_OPEN_DRAIN is actually (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
>>> so I decided to test with just GPIO_SINGLE_ENDED and it works.
> 
> Shawn,
> 
> I quote from the PCIe Mini Card Electromechanical Specification Rev 1.2
> 
> "3.4.1. Logic Signal Requirements
> 
> The 3.3V card logic levels for single-ended digital signals (WAKE#,
> CLKREQ#, PERST#, and W_DISABLE#) are given in Table 3-7. [...]"
> 
> So while you are correct that PERST# is most definitely not Open Drain,
> there's evidence on the spec that defines this signal as Single-Ended.
> 

This's true. But I couldn't find any user in dts using either
GPIO_SINGLE_ENDED or GPIO_OPEN_DRAIN for PCIe PERST#. I'm curious
how these two flags affect actual behavior of chips. Ye, could you
please help check it?

> Thanks,
> Geraldo Nascimento
> 


