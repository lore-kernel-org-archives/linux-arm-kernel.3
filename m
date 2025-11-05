Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B65FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFHg3ByH6NfpSeq9OUgxDYueK5WZDv0MpuCtTFRXn5U=; b=pzNWbJ1tuyAaUS5OewdNx1xUDR
	MVIQyf49cU3eoTeIQss2qjUAbZQAB5B0pC2gtKk+q5HEoLwI6G5lK7qgqFFocbBYwtC3+wNucV1Vh
	KfPaTKMzdQJYrKIUpHPLMfXWbgBW7hAZZ1+X9IRfpnODRunl2+WwERsls9wN8G05ORBvFqKlbAxvG
	aMz1Sc/+UMYUU8cScNHIgReyBwDEUivbVNGhuaP8uCfA31Xb6Q/MRjmMmYi4icRBqc6iaOu2dme//
	UAh5nTU3LHQFq6FG53fwO2seIga+ZTIS0hPqsszQdNVIbse/zqaIWRfMo/FQMzhAy6hERfUYY9R8G
	DXy8nwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYGP-0000000DEEy-2rxH;
	Wed, 05 Nov 2025 07:49:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYGN-0000000DEDL-21Wp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 07:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9A2041AEE;
	Wed,  5 Nov 2025 07:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11290C116B1;
	Wed,  5 Nov 2025 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762328942;
	bh=xCQ8qfR2KgLeEPbc/DYOmaDRKzViHmxTQ/CO8dMUAXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cr5bOEnC326afXGJki8yAreexH0F/CEDIWkRMy2+iyAjrRAdGqTFiA2VIu/Uf2zdZ
	 qEm27wpBeTazf3jTh9CFnGy38meeGGre9gKElxKp/hTh1+anvRWMAHpQs50ZHSNwzK
	 6LfEMdtR69e4oiAfdW/3QGPCVdja51QDw3srKfp0aVUeqdLSSeJyB/GL4rnRU6EXmb
	 a3eejQhAndCfxYz9ummeOWsMgO+beFpxnmYIVB9TJufbE2gPojB6BO9Y3cW56Rnef7
	 9vSSBM66h9skM6jURzGp4iy1bfFZBeqt4GJ+5XWMTkFSo+Ky9qq08/dk/kgZFGci+C
	 Jpy8MQ5cBSDFw==
Date: Wed, 5 Nov 2025 08:49:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Songwei Chai <songwei.chai@oss.qualcomm.com>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com, 
	kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
Message-ID: <20251105-industrious-oxpecker-of-valor-af17fa@kuoka>
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
 <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_234903_543953_EB7121AD 
X-CRM114-Status: UNSURE (   9.11  )
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

On Mon, Nov 03, 2025 at 10:40:37PM -0800, Songwei Chai wrote:
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 

I do not understand: You got review which you ignored and then you
removed pieces of this code to make it incorrect. Go back to previous
versions so you won't waste our time re-doing review.

Best regards,
Krzysztof


