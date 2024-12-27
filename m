Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0BDE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6w62DRSoxMCZYahBr5rLn6p0U5TK/DRfeYkNRALZ0ak=; b=UDXeujFulN3bA4cVzXSwgLnSLD
	tyF9PFUER10SMBQX8ckmuMQQIjT4hu6CxfFOsBVfLrpZfvtUL14S4MyoIANZt2WI0qYKrNs/ES8ub
	TO4LJmxXlmh8yb/b5hff7+vJyDz7G8gFmm7Fk5YHKBLd6wEk5pVdpyYLV7PuuCLy8H9VkvPeGF4RB
	qkA55py8urozYnG2mKhNkQfzlpYB4DnyXOpZO3JdwRuW7Dh1Jj9GWx/pWySv50a0RVGEUXxACXFPz
	gUYVZolammcNuS4Id/Pz0FqoAjVujde+oEE1YOa8VRx/DuAxl2kH8BrKIcZGwOuqJxvzhaz0a62/e
	QDhrmQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5ai-0000000HM8X-3URb;
	Fri, 27 Dec 2024 08:21:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5ZX-0000000HLx1-2nIj;
	Fri, 27 Dec 2024 08:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 654EA5C5789;
	Fri, 27 Dec 2024 08:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53F3C4CED0;
	Fri, 27 Dec 2024 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735287590;
	bh=0agEqi+5wy6dQCun+Z5776mCYbsO105lHFh4cC3fVss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unro+TWKsFjwnlQEzLbzqHKh4IKhT5lvQIxljrTMtuGSHUKqkeGeCxI46CyB+GhxS
	 8dQntWzKEYLpIWgSXajYEG9fL8OIQQAGekOZ1jGGdg1T8I7llCLXLgrLua9kXVZwAx
	 jtpRGh281Ru3iIFANmHpk9vNI1uE+9SagfYWQXKTYECYyDmtI7Rc4EwJl4ZlWU/usM
	 b8luzAhs7czcnDVzMJ9My1zG3d3UeRb1uIJIh5/bWLCpKTzSukENqnfJ69EFVEM63s
	 iMuMWepmOufWdhKrpsaxZLNbkIvst7gAHUp6sbfask0q7pVv6Bgl4vFAODnz0xpkOa
	 5DPbSP4V+8pcA==
Date: Fri, 27 Dec 2024 09:19:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivan Sergeev <ivan8215145640@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add BigTreeTech CB2
 and Pi2
Message-ID: <rchtzv3pkzef4jznrxnqwws5cexdsheccsu2jpu2p65zkdeya5@tnlps3gs35sb>
References: <20241227-bigtreetech-cb2-v3-0-91c556adcffe@gmail.com>
 <20241227-bigtreetech-cb2-v3-1-91c556adcffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241227-bigtreetech-cb2-v3-1-91c556adcffe@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_001951_750902_D66AF44C 
X-CRM114-Status: GOOD (  12.55  )
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

On Fri, Dec 27, 2024 at 06:10:13AM +0300, Ivan Sergeev wrote:
> BigTreeTech CB2 and Pi2 are Rockchip RK3566 based boards
> 
> Signed-off-by: Ivan Sergeev <ivan8215145640@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


