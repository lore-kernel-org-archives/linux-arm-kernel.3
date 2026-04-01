Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BFBD35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVWopCz8SdbyHNeOF4Gzp1FvBN8cu7taYxU6mK0TEUE=; b=WV7HBg8RrpmZoitXtZ4gEtTL9w
	Uh3xH4AYjcqOvhfZKwBUEsT3QSj+99jar/VtS0NmkBNZnKCwmcBbP9ejmYBvakdPNB2ADWzYg1FiZ
	qT3oOB8mgiL+lmo/HLN3vwOd3T18pel+hM1R1N8v2gIPfNwZ0q3tdyETs/Mcm7iDTRrnybpTy05VW
	kGfdsQAM3WCo+vY8udjKLLYMEuL+8jbkojZxYlKp73Ve+3y42QNm0gLc5GSr7iXW9M9810SjkV0Ci
	W1CD9+NzvWzlX5/MIJJfhg/KONscgQghub+g6632wFstF3MKmzQsdnfmUmNYbZRLClzo+flJYFQqT
	EJgUr1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tpP-0000000Eebf-41dv;
	Wed, 01 Apr 2026 11:33:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tpN-0000000EebK-29k7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4B6E403E5;
	Wed,  1 Apr 2026 11:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3249DC116C6;
	Wed,  1 Apr 2026 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043220;
	bh=WP7aMfbv/ILGmqyI+0/9zkY2yavAid0gw/ITIKmxPF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tylho3wrCv6pG2LF2mwddsKlQBptnSsWn2JnykRidEfsQ8hwWvZ4SstQWLUXEPCqI
	 x17KikpghkeS34k9BGsUVSITbJ+BzO5VWcgHZ00Mijk5r1kdwgUoSkhUNjQYwvLrHI
	 9Wo23/uO/q12YyuEtlWoHXohdxeW+28Pzv6DggstihDf1s/lcqVTX02Ixtha6jdCJc
	 IxIv4Iq+QhYfIVHroiqz23yu0BJYZ/bqIbS7HNgVqZFgPqLdcPYUr0Tb4cE8Hgo3UW
	 l2pJFpI1Ex5m6oMm5ZfFPuy7au3mpfiYWwX9D9tNXFuG/IPwOcsPDvPr7dVLUSffjp
	 N85af9OpqAq8g==
Date: Wed, 1 Apr 2026 13:33:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] aspeed: first batch of fixes for v7.0
Message-ID: <20260401-fanatic-benevolent-squid-8118bf@quoll>
References: <4afeb8eaa663835725cebaeb8c1b6f50dce184dd.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4afeb8eaa663835725cebaeb8c1b6f50dce184dd.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_043341_594151_3031EE81 
X-CRM114-Status: GOOD (  11.29  )
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

On Thu, Mar 26, 2026 at 01:25:03PM +1030, Andrew Jeffery wrote:
> Hello SoC maintainers,
> 
> I've been intending to send out this fix PR for a while now, but time
> has escaped me recently.
> 
> Andrew
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-7.0-fixes-0
> 
> for you to fetch changes up to 7ec1bd3d9be671d04325b9e06149b8813f6a4836:
> 
>   soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching (2026-02-23 09:43:21 +1030)
> 
> ----------------------------------------------------------------
> aspeed: first batch of fixes for v7.0
> 

Thanks, applied

Best regards,
Krzysztof


