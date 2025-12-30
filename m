Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A5CEE0205
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0W5Lbamk+njEHK9A6i62wmfawW6k35N4fB2QmSx3b9s=; b=B1FdSZ3LgO6EIbLWjApVsgSVv1
	VrYZQ2Wa978rj12pkD7hpCX45xmbzxzF9dIiJsOZx72rkG5aYBxe4FnTnNpHzDo7akgimKVDP6nfB
	abzisl9bB3k2TQkvYO9ktAK59z2waYooJDDKdyOgxyENgJX2q3yPICofOTgf/2eB9ahgFp6W4JvBs
	h6np92lncZE3Q3+feEN19xKeOf16Kwhr7TfKAKIAco2iMVPyZvBiUyFdcP83F0kZXSPlM5VoRSgL5
	SUHzfvzdSScGu+1LfoDGugHtjlVsy6yEQ/yxfdJ0xi1ZjLWN5TmDkGF+Lni4ad0bvqUHeIBfOnoup
	l+auA0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaazr-00000004ws1-1loa;
	Tue, 30 Dec 2025 14:46:51 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaazo-00000004wrY-35xw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 14:46:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56FD0103014;
	Tue, 30 Dec 2025 15:46:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767106005;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0W5Lbamk+njEHK9A6i62wmfawW6k35N4fB2QmSx3b9s=;
	b=X59Qmf8SsAl0xPTK2kQt1HSX6OZQugbq1DDTsOtn/Gd3gXsUB34V3WwVrGvOt1hgC7iqjD
	lUt7zMY9AFGX9XsOQWn+6FNe0L7cJKoYGWZWvjOIVKXlmzoF3lb8eMfEbtfMfOgB01l0eG
	3nwO1xW9NjDE0yfjX/tGQYIEwCYkSNcr8lfxrbmMcorLsd3WrRAVSH5HSqj8BWD+wODM8F
	Mwt3n9wQAC8ragXjQWsJPCobnQ8rYOO/qQZceq1y/t4kKzELsQUdeQkb35OAYFhnhxiRbK
	Qv2u6GQka+vMgeA/Eu5IirEC9dKAG5Dej2n3NtB0gOi3OjG5DAij5uDQM5ZdIw==
Message-ID: <dc29e774-07fb-4d0e-a88a-27d4ec49d060@nabladev.com>
Date: Tue, 30 Dec 2025 14:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and
 v2
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
 Christian Eggers <ceggers@arri.de>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Markus Heidelberg <m.heidelberg@cab.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251229193706.73564-1-marex@nabladev.com>
 <20251229193706.73564-4-marex@nabladev.com>
 <e3d305ce-cdfa-4a11-bd54-9648b12a013f@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <e3d305ce-cdfa-4a11-bd54-9648b12a013f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_064649_001722_4EE37395 
X-CRM114-Status: GOOD (  11.22  )
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

On 12/30/25 11:46 AM, Andrew Lunn wrote:
>> +&fec1 {
>> +	fsl,magic-packet;
> 
> Upps, i probably cut out too much context. This FEC is connected to the Ethernet switch.
> 
> WoL for a port connected to a switch? Have you tested this? Normally
> you would have WoL on each port of the switch, and not on the conduit
> interface.
> 
>> +&fec1 {
>> +	fsl,magic-packet;
> 
> Have you tested WoL?
> 
>> +&fec1 {
>> +	fsl,magic-packet;
> 
> WoL again?
I don't think WOL is used on this device at all. Would you suggest 
removing the fsl,magic-packet properties ?

