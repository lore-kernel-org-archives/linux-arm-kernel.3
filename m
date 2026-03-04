Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39A2EDEC1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9K8sSsBwwcLvEs7wOf/hXwjWc50YAm5KMbkrqi9YLU=; b=K+IlufcN1LP2vkFuSz9O+s4dbG
	SIVB5MNZb42m3TXyY3pmNIQxoHr556Fk2Zr1MDxVffnRXxGeUKHpkyRwKTayziR6/7HqIAMZFY824
	d/3rpNXy4hldUkl+yFK5wAgw8EuJJiHHfjx84mpJflxxxd8RGAVsjUDs+oTnYHdmFZkFD0h50K+hs
	nGdoyP9dvUZ72lVkhJAItJt+g8wYsYUb+/P52ige1v3PsR2z6tSs2b8GP/D8KPAdH78QURfhC22Pu
	T5Exwa4I39rzgzMP5/fsolHIqmGspNIpu/C+dt/dQ293FVZ5yzgWC+0cL7PxomXsB93B4pWRxmUXF
	uxS8QWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgzU-0000000GexI-18D8;
	Wed, 04 Mar 2026 07:49:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgzS-0000000Gevb-24jt;
	Wed, 04 Mar 2026 07:49:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5EF343C83;
	Wed,  4 Mar 2026 07:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43877C19423;
	Wed,  4 Mar 2026 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772610593;
	bh=zt8UewFBZPFmZ67GCtz9W90a/Rhp8LEbLJxHG4ez43k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAnpwVgvwlMdV8PZQsxUblMYk/Qqgh9JvpaIqSusEujNfRMiWCza7rWYMEUWchiqT
	 Xi4mxH+0U6HF0YScleuhLiiAeX/kbTwOwZmrQBjU4hs7dzgZq6O7TqdL3aydQ2ND+5
	 ecjpnT37HQBryhCweVys5Xk8R+uhcVDilEWB0MoQoLquGDWDB3NICWStnoJdYNTUq7
	 q2ZZvDGxNCn+84HNZ68sOMqg1qsKWcGQACwqwhx7fmbP0PIsVdSdvssG2RiDC82cBS
	 Rubhwah0mPp9GqtO9dCXxnFALx6AgrrFy4qmKiioPR2bkKTe6VN59LRWWGgKVS86v/
	 E52kGknhyDIjQ==
Date: Wed, 4 Mar 2026 08:49:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, atenart@kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: crypto: inside-secure,safexcel: add
 compatible for MT7981
Message-ID: <20260304-uptight-mongrel-of-endurance-9567f7@quoll>
References: <20260303185451.70794-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303185451.70794-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_234954_552762_F3918C1B 
X-CRM114-Status: UNSURE (   8.00  )
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

On Tue, Mar 03, 2026 at 07:53:49PM +0100, Aleksander Jan Bajkowski wrote:
> The MT7981 as well as the MT7986 have a built-in EIP-97 crypto accelerator.
> This commit adds a compatible string for MT7981.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


