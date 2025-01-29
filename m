Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAF2C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQicKR7qJhgud3BlGVCcnn187mxNFqKNWIX7iBGmkpQ=; b=MdOkbtD7tSh0H1Yr98i2bf5U3K
	+4PmT4uAU3k3tcTGLkJ6E/tbh7vA2XzUnj/GKLbv4HPIMHOGEel45ypoBcBzzJqSZfba6+QhQdhrd
	z8wJ0HlPrtHrFgRRib5vMhCBPeeyL7j5xqa0Vuji+wmBD++aLOAUPfkTu5+bYbxxIxiW9TmMljk0Q
	hS8h50o+INoVZnGRMGsp1Ek1prutVSjE0pgJDqBzRxF6wAkjdlszGR4fsrvN/HnLf4xsWwlwBGhL/
	sxZ24XlD3PNInIDfkoOTS5He1CWa4jh+iwjwN/9CeiJIfKniu7tpqrn62OO/TV5iSrHVL9M6YvJtv
	GHqUNQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBCn-00000007Ph7-2WqN;
	Wed, 29 Jan 2025 16:46:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBAF-00000007POn-1As3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 16:43:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F04791007;
	Wed, 29 Jan 2025 08:44:08 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B1F53F63F;
	Wed, 29 Jan 2025 08:43:38 -0800 (PST)
Message-ID: <af19e188-97d1-42a1-aa2f-4792784c701b@arm.com>
Date: Wed, 29 Jan 2025 16:43:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: errata: Add newer ARM cores to the
 spectre_bhb_loop_affected() lists
To: Douglas Anderson <dianders@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>, Julius Werner
 <jwerner@chromium.org>, bjorn.andersson@oss.qualcomm.com,
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Scott Bauer <sbauer@quicinc.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.5.I4a9a527e03f663040721c5401c41de587d015c82@changeid>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250107120555.v4.5.I4a9a527e03f663040721c5401c41de587d015c82@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_084343_362514_434804FE 
X-CRM114-Status: UNSURE (   9.08  )
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

Hi Doug,

On 07/01/2025 20:06, Douglas Anderson wrote:
> When comparing to the ARM list [1], it appears that several ARM cores
> were missing from the lists in spectre_bhb_loop_affected(). Add them.

It's a moving target!


> NOTE: for some of these cores it may not matter since other ways of
> clearing the BHB may be used (like the CLRBHB instruction or ECBHB),
> but it still seems good to have all the info from ARM's whitepaper
> included.
> 
> [1] https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
> 
> 
> Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
> Cc: stable@vger.kernel.org

Reviewed-by: James Morse <james.morse@arm.com>


Thanks!

James

