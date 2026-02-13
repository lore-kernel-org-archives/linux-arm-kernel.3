Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C940EDF175
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 15:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vXKv2WqRKNFkpUnXsXlv4VT3DCQ+ZQkUfP7arhJu5w=; b=nZWxd/pLPo8zyuO9QdbIeAUb0W
	Fg9RIs+QIIMKCdswnMmnHRvI5ATdzkAD65EQpdSvOj7UhabKNToxXwUo2u/6On+7yBrL8rePdr21J
	0q0TjJx0ycasm4vtYZbmAdN9v/8/JVoQgwhXfonZqMnfCtSmhplHbwc5xd2c7ALXkUiYKJtCEOD8p
	02cVtjyfByhkLTFDR4jHOmvJjAjh1qWb5EgR5YncsYN4RJX5g3svajTdHVDrsoMDVx4MJR5NkVbzg
	W3j9jl2X4mtCEWypNcnkNiekWnGu4iuajgCHQN+QoXBInVEGgeyxYDqf+Z3fc+rIKBOo8S2hqlap5
	GUomXPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqv4T-00000003buN-0JZH;
	Fri, 13 Feb 2026 15:27:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqv4O-00000003btz-1lgn;
	Fri, 13 Feb 2026 15:27:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADC09418EA;
	Fri, 13 Feb 2026 15:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A36EC116C6;
	Fri, 13 Feb 2026 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770996419;
	bh=TjKjfh4AHZJmJ5vSp/9BroQ96QAtgOr9pMqQU9yoiH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEI1wUKGJjK7Sl3xlVdZJj/Ctg/oXEKIWcZxXCY1nhdSwYQyolQ2ZAJe97ZfhSyge
	 Ntb8w5fI0zZovkQe2uiT8KnIetp/hhvSr35UZjp2ZQsT/TortYFgUGqwflkRMpU8ds
	 l7wSDxAy5BM62Qztfv8aHjlhg16+KLo/vS1BPi877V0PJg85G1JaJmdt8alGOFVjV+
	 xsA73BqfDstqxyHHhtNRfWN0NnrcHY/USi2xnlYlX8hhYeJTTpc12Nh6UkkRzHIk8T
	 KVX9nk6Z5FYqCdMfyzhsWcb4wck69oDsksS292ZX0ddm4jQY/4yGgwaNkUbfTJaWyQ
	 FCmX5P9G3THcg==
Date: Fri, 13 Feb 2026 15:26:54 +0000
From: Simon Horman <horms@kernel.org>
To: "zhengping.zhang" <aquapinn@qq.com>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH] net: airoha: fix typo in function name
Message-ID: <aY9Cvud7rSw_aWU1@horms.kernel.org>
References: <tencent_5F3DFF496EC95F5BC0D71C297D088B06F40A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_5F3DFF496EC95F5BC0D71C297D088B06F40A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_072700_503210_ED85A138 
X-CRM114-Status: GOOD (  10.52  )
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

On Fri, Feb 13, 2026 at 02:57:25PM +0800, zhengping.zhang wrote:
> Corrected the typo in the function name from `airhoa_is_lan_gdm_port`
> to `airoha_is_lan_gdm_port`.
> This change ensures consistency in the API naming convention.
> 
> Signed-off-by: zhengping.zhang <aquapinn@qq.com>

Hi,

I agree that this change is both correct and complete.
So please feel free to add:

Reviewed-by: Simon Horman <horms@kernel.org>

This looks like net-next to me material as it isn't a bug fix.
And it's best to include the target tree in the subject, like this.

Subject: [PATCH net-next] ...

Unfortunately net-next is closed at this time.

---
## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v7.0,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Feb 23rd.

RFC patches sent for review only are obviously welcome at any time.
                                                                                See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
--
pw-bot: defer

