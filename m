Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3214BC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnlKsyG4fMWCQaM8lEHdPX48UNrwNSibT67INrhosJg=; b=pfnqJWvT96hHWHghY+/rxyZb8b
	1CpJWJbYamNZVBx2rVJ0fj2JF3qflHDkR6BIeYPrwUDix52x9nUL6/4fNzfBFoBfxLn1JLdSaBQIG
	YJVntFgis+eB1eORk5vMJTSRBxYu1o7gXLzIj1NKdUy5/GKrk3RjY936w1i21v13Yof3B6xLuyFwz
	Wrf1Q5cl6SCH2t0m4Nt790K91j0BR6R0N03VjCOAvxg0LWYWbzdbTobJqWbMOfOC2zVwxxqnMTis0
	VFORHkrIiM7Iz6Hu0Fu9jbfiVfQIzXtpfsQmH0AjcQBh3piJcbRKE6o0wheQRHhripGJlkYjOjXRa
	EbisquqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwdA-0000000ArXt-0lnb;
	Wed, 18 Jun 2025 17:31:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvkM-0000000Ajue-0zSV;
	Wed, 18 Jun 2025 16:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MnlKsyG4fMWCQaM8lEHdPX48UNrwNSibT67INrhosJg=; b=bTry5vSGReg0fSd/S00Wejr22W
	XsBdHJdQXB8cIr1GyS/T/YKfh9yOUVmHmEnwALoYaRA3ZLWByEVtH3M5XJTeEqtzxzh8xmHfVbz4c
	Ccx9L2iT0DvUjhuA2Q6SS70uuvN5SMRM6DXkWiRpG7SFsBV/DwXEIjWxTGn1CG5TumgEbjHPlXM4D
	LF73o8Ky1cgVPa6sByCJhEG+QacZ/9phcpqowXknhK5OeF1pBhErUozlGgOEjiG+LXGJsH6tXm7ww
	LMLnZ47f+AQR7zv1coYRMec1YD2wGUmGJic9uKNAUUGA+Gjirap1aFAmPgwBUkcaNkUGErSGMsVcO
	Hm3l91RQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvkJ-00000004C25-2ZG1;
	Wed, 18 Jun 2025 16:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DC7CA51B33;
	Wed, 18 Jun 2025 16:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D14C4CEE7;
	Wed, 18 Jun 2025 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750264477;
	bh=ZpjxbXJilygZEa1TmasV23ZFXaekM2vT4FxyFQzIqSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhljU//iM84aUdVU8yuWaVilgx676eJhlxkMjsp8ZvVPjIj7WnUaN6i85prBo4YTx
	 0KYOgkUCisvck2qI3pOpodE1buIr/eI9jDqIZBcLCHp1dI1vuFNMa7uNYBCZsWiuK6
	 hoRHmxH3bLyqdOcDjoDSld86OS3NtmVHFZHeUEFu60mOzVCYbwGMhOmnkUxJfkDQRH
	 B8MAd8VxIVuzhDMyJ+q0PO9wgeC3Sq4lsI2Y/0CRETbYYYb+re4CZpZmfc65yx//71
	 +k8EYCkImnaDRGNiuP6sq5vEpLXOV6QO518mY0nBGV972wP8xCU+37uYpGcaj5XrpJ
	 4Y2Z/Qqnoxoiw==
Date: Wed, 18 Jun 2025 17:34:33 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] net: airoha: Compute number of descriptors
 according to reserved memory size
Message-ID: <20250618163433.GR1699@horms.kernel.org>
References: <20250618-airoha-hw-num-desc-v3-0-18a6487cd75e@kernel.org>
 <20250618-airoha-hw-num-desc-v3-1-18a6487cd75e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-airoha-hw-num-desc-v3-1-18a6487cd75e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_173443_819566_E1DA9D5A 
X-CRM114-Status: UNSURE (   9.23  )
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

On Wed, Jun 18, 2025 at 09:48:04AM +0200, Lorenzo Bianconi wrote:
> In order to not exceed the reserved memory size for hwfd buffers,
> compute the number of hwfd buffers/descriptors according to the
> reserved memory size and the size of each hwfd buffer (2KB).
> 
> Fixes: 3a1ce9e3d01b ("net: airoha: Add the capability to allocate hwfd buffers via reserved-memory")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


