Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8450EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 01:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC/z/4E/Ef+kmXVay18/hupG3zTwpJG1mTK3YvHMXFA=; b=Gs0o7ek+zJHhehqxYv6VkZUBF1
	y0fAePtYDhP7NC6fWEB6lkSoKpcxthlIDN6lk+M5N6MiDqYH6Ea4damFUYBOAdPQ0P0m1WXTPOwMW
	eDYOYhHQjSYRffPfSMhybmM4QjCUWS38RD/9y+NbhsXtsIAjJHsarF483Mj0jfe5KYe1EwODRTE//
	CJO+icBkZwKXzRhSDzU/DwF8hRnA7NWbnehDdjXXBlgJwHPIGtFyWWCgipngn0oP7pszYv2x9u5UY
	C4PYH/FvjNDtnQofKKHmVH8Kx4q+x0NzFqi+OC5j/geq7SqxLcisz53L2qg88J/E9GIPYIpDOXsRU
	ZNZtu0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72aO-00000005Wjv-21eP;
	Tue, 22 Apr 2025 01:38:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72YW-00000005WYf-251Z;
	Tue, 22 Apr 2025 01:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A218BA4BE8F;
	Tue, 22 Apr 2025 01:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A678C4CEE4;
	Tue, 22 Apr 2025 01:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745285771;
	bh=jaSaaz4fD7gmy5u/L+9Ywg1JbN6BK11zXKoZ4GqzkRg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gYQau24O5eGvmuufDN0rW0XBs9GPjVVDtpPYw/mZeJsyIofS5cjPRsvIhuiwoO3R9
	 B3k6pTHPt0XMREAyEL1xd1ZuOLIObVNsgF9vgDzFu3VzvB3WZuY50qo9blGBwBM+8+
	 FQpN8Hy/a6+wIkf/xMN4YI0QNg/VQb12oOJLk8E/cAyhJpyqx0ZGJdGF7xJ5fgN5VS
	 zxwWDsX7xCRIKCJocSEOYiDXm16TunVszZc6rZE2VcPkkp84Nit+meTPkrajJ42XGd
	 j3EgOGeCn/Ufuwgq8uWWXckstGmlqVZZQQ9tmEm2n8gTuv1LAar7ei9DkWPSS4kDa/
	 v7ZVSYrH7o9hA==
Date: Mon, 21 Apr 2025 18:36:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Simon Horman
 <horms@kernel.org>
Subject: Re: [PATCH net-next v2] net: airoha: Add missing filed to
 ppe_mbox_data struct
Message-ID: <20250421183610.7bad877c@kernel.org>
In-Reply-To: <20250417-airoha-en7581-fix-ppe_mbox_data-v2-1-43433cfbe874@kernel.org>
References: <20250417-airoha-en7581-fix-ppe_mbox_data-v2-1-43433cfbe874@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_183612_602908_8418802C 
X-CRM114-Status: GOOD (  13.82  )
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

On Thu, 17 Apr 2025 11:30:47 +0200 Lorenzo Bianconi wrote:
> The official Airoha EN7581 firmware requires adding max_packet filed in
> ppe_mbox_data struct while the unofficial one used to develop the Airoha
> EN7581 flowtable support does not require this field.
> This patch does not introduce any real backwards compatible issue since
> EN7581 fw is not publicly available in linux-firmware or other
> repositories (e.g. OpenWrt) yet and the official fw version will use this
> new layout. For this reason this change needs to be backported.
> 
> Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")

I'm not sure I agree with this fixes tag. The fixes tag should point 
to the earliest commit where any problem may be visible. IIUC you're
targeting net-next because the structure is not used in net. So the
Fixes tag should also point to some commit in net-next...
If we leave it as is after the merge window stable bot will pull this
commit into 6.15 for no good reason.
-- 
pw-bot: cr

