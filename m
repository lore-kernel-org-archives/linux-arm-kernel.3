Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFC5E66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXz9ecXDGoY3Ij9UsFvKe+68rCEtyWHVO9uzTqcabAc=; b=M/7STQ2xFwRAK75zSzRIgsSA+7
	nf8Kn46m+kYIzrz1Y5IUIsrycDrn0oetsEVwU9X6yQaQPXsoqOBsVz4zcAXh5EfsQmQ6tiyDo1zjd
	LcIfKqZgE09Q3c078iPZ/+1RqhfMOzN6BX4C0fSkQd+PF7MuCnYes8+pBqyh7ptxbwmDnhupdI32Y
	0yiOL5dna10jLjrKzHXe+3UvSAp59IrY+2nCz3r8pefrVU8j6b+f5FJKUzTLCYyD4NetpWkMx1YpS
	Gidzi6J4+UW+kv750A/EhYgWOgrnzp7+VdPt0nSj5A2tu/iXevJukAso1+IN5Y4o+k0bKTEt432rf
	GLn2Eyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXKs7-0000000CWnR-2OGv;
	Sun, 21 Dec 2025 14:57:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXKs5-0000000CWn5-01HK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 14:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 334634407E;
	Sun, 21 Dec 2025 14:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE92C4CEFB;
	Sun, 21 Dec 2025 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766329040;
	bh=gXezM1bnjGNNpxw6I9viVcMTnNHHDgBxUYAlExvm5zU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMbZENqP187mdl0rMzLH4pjuik3cpqVZSnjRoWQkN9nvhRh47aH6Z4yLmw9Rzgf+2
	 1LYieuF7cJ/N2eDV1C6u3fzHwD+h/Er8kAlmPFzrc02iVpvEvVdueaACHS0f0zuVXv
	 4rulFJ9RVi/7Dg74W0X1lxPVTa7mFqEk8eqyPjcW7z5z+LnlV9D1spVJkbQW0/EYMF
	 IaIvFhLSxooM1/MYKshxAE4yCSL760t9gODL+xhWPG/Qff5u7zpVBof47/iGgQaVYt
	 pOe4LmAuPA0gu/Ts1UIvAo3CPN0SBjmYZJmNBqzeDxu0LPyMhJQE4jbzWasHldL7BG
	 QGSgTNmpCKipw==
Date: Sun, 21 Dec 2025 15:57:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-cix-kernel-upstream@cixtech.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: cix: add OrangePi 6 Plus board
Message-ID: <20251221-conscious-apricot-crayfish-8df20b@quoll>
References: <20251219133553.1440970-1-gary.yang@cixtech.com>
 <20251219133553.1440970-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219133553.1440970-2-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_065721_066483_E72809CF 
X-CRM114-Status: UNSURE (   7.72  )
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

On Fri, Dec 19, 2025 at 09:35:52PM +0800, Gary Yang wrote:
> OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC,
> built-in 12-core 64-bit processor + NPU processor,
> integrated graphics processor, equipped with 16GB/32GB/64GB

If there is going to be resend/new version, please re-wrap it.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

No need to resend just for this.

> LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe SSD,
> as well as SPI FLASH and TF slots to meet the needs of fast
> read/write and high-capacity storage;
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


