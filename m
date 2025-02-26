Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA0BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aL51XAvqbmAaRTAhYPwzCYNsD9l11NBM10NE1tnuCcA=; b=kNYg7p4KjQ1XYCBAIi9cMdayjL
	Q7CVRcvYJiEL8D1jZIxVXT/TGeFssmNK68t+h4D/v5XvhFRcKGqCeRU/hb1xraq7WoHUo5dYgL921
	y1ZfslqC1aHQtHU9gtgJ9YVnXjNSujIbxFcaNLWSzOKkQk/KFuFdZsES95oxTXWAEuEgQwMZG76O/
	qlnV1LpHo/VPcwlhJmS74P+PXQbkIaUY5gA8hWkGVnL6ER0sq5v2d/yGFAc2EnX2nA07qTnR25vjx
	KZgAdZyl2VhDQgFowQS5R1weaYnTltd0K40nNrV1W1kguf7hHJ6aFS6JlM2BDbH6qt7f/jAAusjnb
	3Rc7g7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnK0I-00000004U0r-4Aaq;
	Wed, 26 Feb 2025 16:11:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJym-00000004Tn4-27eM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1538D611EA;
	Wed, 26 Feb 2025 16:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611D8C4CED6;
	Wed, 26 Feb 2025 16:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740586187;
	bh=4fr3AKLLBzkmgQNjqldIIllTzp1wJuSK/spkoGmZf2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cu4APmzBKKuG1yJTJ3Kjzvu1b/XV9Lgfb2iRpXh+ViZ4QaRYwFT8bgukcpTgTPW3w
	 t3Y9upodYRnbs1cyShcUhMo9PNaG3kTcymlYNiHJwVFAvSJSL6nf6uc6TtcDYPtb7q
	 RrQXfvcN47tfVix7Qb2POo5LbdEl+ZfzdbSOWe1F2z3GWn5fZPijM6KcNy7L4dOdBP
	 U4qMNBM8OuRRRqdxt0dz/Kx90tw0f4mVnL3iUYGIrA2IB72LjLsAnkHqVvX/oiInjV
	 jAlPo7gHP9ppOJx2UZN61dD7zL9u6Mc3VYHe2fVS9/MsFVHdRIsmY4KgKcOQrt8rEa
	 rB4CQG+OZLQaw==
Date: Wed, 26 Feb 2025 10:09:45 -0600
From: Rob Herring <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, saravanak@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [RFC] dt-bindings: firmware: scmi: Introduce compatible string
Message-ID: <20250226160945.GA2505223-robh@kernel.org>
References: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
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

On Wed, Feb 26, 2025 at 05:44:56PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add compatible string for the protocols by adding new nodes
> The current nodename pattern is "protocol@[0-9a-f]+$", the new node
> name will be "scmi-[a-z\-]+$".
> With compatible string and new nodename, cpufreq and devfreq could be
> separated into two nodes. And fwdevlink could correctly link suppliers
> and consumers.
> With compatible string, and driver updated.
> - Differnet vendor drivers with same SCMI protocol ID could be built in
>   without concerning vendor A's driver got probed when using vendor B's
>   SoC
> - NXP scmi pinctrl and ARM scmi pinctrl could be both built in, without
>   concerning arm scmi platform takes nxp scmi pinctrl node as supplier.

How are you going to handle DTs which aren't updated and still don't 
have compatible strings? Seems like that would be messy if not 
impossible.

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> RFC:
>  This may sounds like that adding compatible to resovle linux driver issue.
>  Yes indeed. current scmi framework limitation makes it not work well with
>  fwdevlink, wrong suppliers maybe linked to consumers.
>  I have tried various's method to not introduce compatible, but rejected by
>  fwdevlink maintainer or scmi maintainer
>  There was a long discussion in [1][2][3].
>  [1] https://lore.kernel.org/arm-scmi/20240729070325.2065286-1-peng.fan@oss.nxp.com/
>  [2] https://lore.kernel.org/arm-scmi/20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com/T/#mdd17c4b9b11af9fae0d5b6ec2e13756c2c6f977d
>  [3] https://lore.kernel.org/arm-scmi/20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com/
> 
>  The binding changes are posted out to see whether DT maintainer's view on
>  whether introduce compatible string is welcomed or not.
>  I not include driver changes, because this is just to see whether people
>  are happy with this or not.
> 
> Quote Sudeep's reply"
> I am not blocking you. What I mentioned is I don't agree that DT can be used
> to resolve this issue, but I don't have time or alternate solution ATM. So
> if you propose DT based solution and the maintainers agree for the proposed
> bindings I will take a look and help you to make that work. But I will raise
> any objections I may have if the proposal has issues mainly around the
> compatibility and ease of maintenance.
> "

This all looks to me like SCMI has failed to provide common interfaces.

I'm indifferent. If everyone involved thinks adding compatibles will 
solve whatever the issues are, then it's going to be fine with me 
(other than the issue above). It doesn't seem like you have that, so I 
don't know that I'd keep going down this path.

Rob

