Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB23EC1EA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1eaUYSNF0+TH2h6q77uDHh+EOOpdDgoImtYH3i54PE=; b=M2dqFqR9iFUFnxvotNu3Uo+521
	vn34n74XUpVlLidQM8ukT5dgHKiu8lQDxUdBelJmpojM0moRq4Gs3a8BOyYZ+hbfs2SROizpZPjgn
	Kew+ROgKXUzGEC3FZT/GeX+IZNBjze3zRtYy/wArbVEJO4sJFHyRQbr9HG9GKBPv3xeBf1KDjd7Hm
	+Pg2QdJCqajx9q9leRobX78B9aHKltI/QkeYNopDXQ/8KbxhU078ANKMHUadZQz8vVykxODFRuyhB
	ErluDWaMk9gfaffrM3DefWBnKyT4Wpqa+zkUmMAP29qj6q1Emup02i93jIwYvcUWIFlUhnlC/X3nX
	B7m0Bedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxTz-00000009pXE-2bv1;
	Thu, 05 Feb 2026 11:25:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxTx-00000009pWf-0Y5u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 11:25:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 941C8339;
	Thu,  5 Feb 2026 03:24:58 -0800 (PST)
Received: from [192.168.178.73] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E9673F778;
	Thu,  5 Feb 2026 03:25:03 -0800 (PST)
Message-ID: <445035bb-71be-4751-a014-9ca67b1c0cb4@arm.com>
Date: Thu, 5 Feb 2026 12:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: zena: Add support for Zena CSS
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Debbie Horsfall <debbie.horsfall@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
 <20260127132206.036892e4@donnerap.manchester.arm.com>
 <c1259bad-be4d-4489-840d-4ab2f4e466f2@arm.com>
 <8c343e6d-14f8-4f55-8218-bc3f0813e8cf@arm.com>
 <20260130-light-piquant-termite-fcbec4@sudeepholla> <aYHmDTboOtkgac00@pluto>
 <20260205-intelligent-intrepid-robin-df42bd@sudeepholla>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260205-intelligent-intrepid-robin-df42bd@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_032509_219175_F6808009 
X-CRM114-Status: GOOD (  12.40  )
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



On 2/5/26 12:08, Sudeep Holla wrote:
> On Tue, Feb 03, 2026 at 12:11:57PM +0000, Cristian Marussi wrote:
>>
>> All of this madness was the best way I could find to address the problem
>> of supporting such new unidirectional mailboxes in the SCMI while NOT
>> breaking backward compatibility in the absence of mandatory naming from
>> the start.
>>
> 
> You can attribute this to my expecting an overly ideal scenario with
> bidirectional mailbox channels across all platforms using SCMI. At the time, I
> did not anticipate the range of configurations that rely on unidirectional
> channels.

Would it make sense then to add mbox-names parsing to the code, to 
accommodate new users? There is precedence in some drivers for 
introducing xyz-names for clearer and unambiguous resolution, while 
still falling back to some legacy, fixed associations in case the names 
property doesn't exist.

Cheers,
Andre


